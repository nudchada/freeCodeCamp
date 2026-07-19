#!/bin/bash

if [ -z "$1" ]; then
	echo "Please provide an element as an argument."
	exit 0
fi

INPUT="$1"
ESCAPED_INPUT=${INPUT//\'/\'\'}

if [[ "$INPUT" =~ ^[0-9]+$ ]]; then
ELEMENT_INFO=$(psql -X -q -U postgres -d periodic_table -t -A -c "
SELECT CONCAT(
'The element with atomic number ', e.atomic_number,
' is ', e.name, ' (', e.symbol, '). It''s a ', t.type,
', with a mass of ',
TRIM(TRAILING '0' FROM TRIM(TRAILING '.' FROM p.atomic_mass::text)),
' amu. ', e.name,
' has a melting point of ', p.melting_point_celsius,
' celsius and a boiling point of ', p.boiling_point_celsius,
' celsius.'
)
FROM elements e
JOIN properties p USING (atomic_number)
JOIN types t USING (type_id)
WHERE e.atomic_number = $INPUT
")
else
ELEMENT_INFO=$(psql -X -q -U postgres -d periodic_table -t -A -c "
SELECT CONCAT(
'The element with atomic number ', e.atomic_number,
' is ', e.name, ' (', e.symbol, '). It''s a ', t.type,
', with a mass of ',
TRIM(TRAILING '0' FROM TRIM(TRAILING '.' FROM p.atomic_mass::text)),
' amu. ', e.name,
' has a melting point of ', p.melting_point_celsius,
' celsius and a boiling point of ', p.boiling_point_celsius,
' celsius.'
)
FROM elements e
JOIN properties p USING (atomic_number)
JOIN types t USING (type_id)
WHERE e.symbol = '$ESCAPED_INPUT' OR e.name = '$ESCAPED_INPUT'
")
fi

if [ -z "$ELEMENT_INFO" ]; then
echo "I could not find that element in the database."
else
echo "$ELEMENT_INFO"
fi
