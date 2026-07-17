#! /bin/bash

PSQL_POSTGRES() {
	psql -X -qAt -v ON_ERROR_STOP=1 postgresql://postgres@localhost:5432/postgres "$@"
}

PSQL_SALON() {
	psql -X -qAt -v ON_ERROR_STOP=1 postgresql://postgres@localhost:5432/salon "$@"
}


show_services() {
	echo "~~~~~ MY SALON ~~~~~"
	echo
	echo "Welcome to My Salon, how can I help you?"

	while IFS='|' read -r SERVICE_ID SERVICE_NAME; do
		echo "${SERVICE_ID}) ${SERVICE_NAME}"
	done < <(PSQL_SALON -c "SELECT service_id, name FROM services ORDER BY service_id;")
}

get_service_name() {
	PSQL_SALON -c "SELECT name FROM services WHERE service_id = $1 LIMIT 1;"
}

get_customer_row() {
	PSQL_SALON -c "SELECT customer_id, name FROM customers WHERE phone = '$1' LIMIT 1;"
}


while true; do
	show_services
	read SERVICE_ID_SELECTED

	if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
		echo
		echo "I could not find that service. What would you like today?"
		continue
	fi

	service_name=$(get_service_name "$SERVICE_ID_SELECTED")
	service_name=${service_name//$'\n'/}
	service_name=${service_name//$'\r'/}

	if [[ -n "$service_name" ]]; then
		break
	fi

	echo
	echo "I could not find that service. What would you like today?"
done

echo
echo "What's your phone number?"
read CUSTOMER_PHONE

customer_row=$(get_customer_row "$CUSTOMER_PHONE")

if [[ -z "$customer_row" ]]; then
	echo
	echo "I don't have a record for that phone number, what's your name?"
	read CUSTOMER_NAME
	PSQL_SALON -c "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');" >/dev/null
	customer_row=$(get_customer_row "$CUSTOMER_PHONE")
fi

CUSTOMER_ID=$(echo "$customer_row" | cut -d'|' -f1)
CUSTOMER_NAME=$(echo "$customer_row" | cut -d'|' -f2)
CUSTOMER_ID=${CUSTOMER_ID//$'\r'/}
CUSTOMER_NAME=${CUSTOMER_NAME//$'\r'/}

echo
echo "What time would you like your $service_name, $CUSTOMER_NAME?"
read SERVICE_TIME

PSQL_SALON -c "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');" >/dev/null

echo
echo "I have put you down for a $service_name at $SERVICE_TIME, $CUSTOMER_NAME."
