#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username:"
read usernames
usernames_upper=$(echo $usernames | tr '[:lower:]' '[:upper:]')
users=$($PSQL "SELECT usernames FROM number_guess where usernames='$usernames_upper'")
secret_number=$((RANDOM % 1000 + 1))
#echo $secret_number  
if [[ $users ]]
then
  VAR=$($PSQL "SELECT * FROM number_guess where usernames='$usernames_upper'")
  echo "$VAR" | while IFS='|' read USER_ID USERNAME PLAY BEST
  do
    echo -e "Welcome back, $USERNAME! You have played $PLAY games, and your best game took $BEST guesses."
  done
  echo -e "Guess the secret number between 1 and 1000"
elif [[ -z $users ]]
then
  echo -e "Welcome, $usernames_upper! It looks like this is your first time here."
  INSERT=$($PSQL "INSERT INTO number_guess(usernames) VALUES('$usernames_upper')")
  echo -e "Guess the secret number between 1 and 1000"
fi
users=$($PSQL "SELECT usernames FROM number_guess where usernames='$usernames_upper'")

MAIN(){
  PLAYGAMES=$($PSQL "SELECT games_playes FROM number_guess WHERE usernames='$users'")
  read input_number
  if [[ $input_number =~ ^[0-9]+$ ]]
  then
    if [[ $input_number < $secret_number ]]
    then
      echo -e "It's lower than that, guess again:"
      PLAYGAMES=$((PLAYGAMES+1))
      INSERT_PLAY=$($PSQL "UPDATE number_guess SET games_playes=$PLAYGAMES where usernames='$users'")
      count=$((count+1))
      MAIN
    elif [[ $input_number > $secret_number ]]
    then
      echo -e "It's higher than that, guess again:"
      PLAYGAMES=$((PLAYGAMES+1))
      INSERT_PLAY=$($PSQL "UPDATE number_guess SET games_playes=$PLAYGAMES where usernames='$users'")
      count=$((count+1))
      MAIN
    else
      echo -e "You guessed it in $count tries. The secret number was $secret_number. Nice job!"
      PLAYGAMES=$((PLAYGAMES+1))
      INSERT_PLAY=$($PSQL "UPDATE number_guess SET games_playes=$PLAYGAMES where usernames='$users'")
      count=$((count+1))
      BEST_COUNT=$($PSQL "SELECT best_game FROM number_guess WHERE usernames='$users'")
      if [[ -z $BEST_COUNT ]]
      then
        INSERT_VAR=$($PSQL "UPDATE number_guess SET best_game=$count where usernames='$users'")
        exit
      elif [[ $BEST_COUNT > $count ]]
      then
        INSERT_VAR=$($PSQL "UPDATE number_guess SET best_game=$count where usernames='$users'")
        exit        
      fi
    fi
  elif [[ $input_number != ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
    MAIN
  fi
}

count=1
MAIN
