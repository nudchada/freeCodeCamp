#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")

if [[ -z $USER_ID ]]; then
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	USER_ID=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME') RETURNING user_id;" | tail -n 1 | xargs)
else
	games_played=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID;" | xargs)
	best_game=$($PSQL "SELECT COALESCE(MIN(guesses), 0) FROM games WHERE user_id = $USER_ID;" | xargs)
	echo "Welcome back, $USERNAME! You have played $games_played games, and your best game took $best_game guesses."
fi

number_of_guesses=0
echo "Guess the secret number between 1 and 1000:"

while true; do
	read GUESS
	((number_of_guesses++))

	if [[ ! $GUESS =~ ^-?[0-9]+$ ]]; then
		echo "That is not an integer, guess again:"
		continue
	fi


	if (( GUESS > SECRET_NUMBER )); then
		echo "It's lower than that, guess again:"
	elif (( GUESS < SECRET_NUMBER )); then
		echo "It's higher than that, guess again:"
	else
		echo "You guessed it in $number_of_guesses tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
	fi
done
$PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $number_of_guesses);"
