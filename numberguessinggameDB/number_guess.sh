#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1))

echo "Enter your username:"
read USERNAME



AVAIL_USER=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

if [[ -z $AVAIL_USER ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else
  GAMES_PLAYED=$($PSQL "
  SELECT COUNT(*) 
  FROM games AS g 
  INNER JOIN users AS u on g.user_id = u.user_id 
  WHERE u.username = '$USERNAME'")

  BEST_GAME=$($PSQL "
  SELECT MIN(count_guesses) 
  FROM games AS g 
  INNER JOIN users AS u on g.user_id = u.user_id 
  WHERE u.username = '$USERNAME'")

  echo GAMES_PLAYED
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# get user_id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

#echo "secret: $SECRET_NUMBER"

echo -n "Guess the secret number between 1 and 1000:"
read GUESS
COUNTER=1


while [[ ! $GUESS -eq $SECRET_NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then

    echo -n "That is not an integer, guess again:"
    read GUESS
    COUNTER=$((COUNTER + 1))

  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then

    echo -n "It's lower than that, guess again:"
    read GUESS
    COUNTER=$((COUNTER + 1))

  elif [[ $GUESS -lt  $SECRET_NUMBER ]]
  then

    echo -n "It's higher than that, guess again:"
    read GUESS
    COUNTER=$((COUNTER + 1))

  fi
done

INSERT_GAME=$($PSQL "INSERT INTO games(count_guesses, user_id) VALUES ($COUNTER, $USER_ID)")
echo "You guessed it in $COUNTER tries. The secret number was $SECRET_NUMBER. Nice job!"
