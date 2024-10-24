#!/bin/bash
####creating a program to randomly generate a number 
#Declare PSQL 
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#start code
#get user input for not more then 22 character
ASK_USER() {
  if [[ $1 ]]
  then
    echo $1
  fi

  read USER_INPUT
  if [[ $(echo $USER_INPUT | wc -c ) -lt 22 ]] 
  then
    #check in database if the name exist or not 
    USERNAME=$($PSQL "SELECT username FROM user_data WHERE username='$USER_INPUT'")
    if [[ -n $USERNAME ]] 
    then 
      USER_NAME_ID=$($PSQL "SELECT username_id from user_data WHERE username='$USERNAME'")
      NAME_FROM_ID=$($PSQL "SELECT username FROM user_data WHERE username_id=$USER_NAME_ID")
      BEST_GAME=$($PSQL "SELECT best_game from game_data WHERE username_id=$USER_NAME_ID")
      GAMES_PLAYED=$($PSQL "SELECT games_played FROM game_data WHERE username_id=$USER_NAME_ID")
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    else
    ##INSERT name into databse 
      USER_NAME_INPUT=$($PSQL "INSERT INTO user_data(username) values('$USER_INPUT')")
      USER_NAME=$($PSQL "SELECT username FROM user_data WHERE username='$USER_INPUT'")
      USER_NAME_ID=$($PSQL "SELECT username_id from user_data WHERE username='$USER_NAME'")
      echo  "Welcome, $USER_NAME! It looks like this is your first time here."
    fi
  else
      ASK_USER "Please Enter less then 22 character!"
  fi
}
#Random Number Generator
RANDOM_NUMBER=$(shuf -i 1-10 -n 1)
#Function for number guessing
ASK_NUMBER() {
echo "Guess the secret number between 1 and 1000:"
  #echo secret number: $RANDOM_NUMBER
  NUMBER_TRY=0
  until [[ $NUMBER_GUESS -eq $RANDOM_NUMBER ]] 
  do
      until [[ $NUMBER_GUESS =~ ^[0-9]+$ && $NUMBER_GUESS -ge 1 && $NUMBER_GUESS -le 1000 ]] 
      do
        read NUMBER_GUESS
        if ! [[ $NUMBER_GUESS =~ ^[0-9]+$ && $NUMBER_GUESS -ge 1 && $NUMBER_GUESS -le 1000 ]] 
        then
          echo "That is not an integer, guess again:"
          NUMBER_TRY=$((NUMBER_TRY+1))
        fi
      done
        NUMBER_TRY=$((NUMBER_TRY+1))
    if [[ $NUMBER_GUESS -gt $RANDOM_NUMBER ]] 
      then
        echo "It's lower than that, guess again:" 
        NUMBER_GUESS=0
        #NUMBER_TRY=$((NUMBER_TRY+1))
      elif [[ $NUMBER_GUESS -lt $RANDOM_NUMBER ]] 
      then
        echo "It's higher than that, guess again:" 
        NUMBER_GUESS=0
        #NUMBER_TRY=$((NUMBER_TRY+1))
    fi
  done
#get data from game_data if exist or not 
GET_GAME_USER_ID=$($PSQL "SELECT username_id FROM game_data WHERE username_id=$USER_NAME_ID")
GET_BEST_GAME=$($PSQL "SELECT best_game from game_data WHERE username_id=$USER_NAME_ID")
if [[ -n $GET_GAME_USER_ID ]] 
then 
 INSERT_GAMES_PLAYED=$($PSQL "UPDATE game_data SET games_played = games_played + 1 WHERE username_id=$USER_NAME_ID")
 if [[ $GET_BEST_GAME -gt $NUMBER_TRY ]]
 then
  #update best_game in database if the number try is less than previous
  UPDATE_BEST_GAME=$($PSQL "UPDATE game_data SET best_game=$NUMBER_TRY WHERE username_id=$USER_NAME_ID")
 fi
else
  #Insert data if not existed yet
  INSERT_USERNAME_ID=$($PSQL "INSERT INTO game_data(best_game,games_played,username_id) VALUES($NUMBER_TRY,1,$USER_NAME_ID)")
fi
  echo "You guessed it in $NUMBER_TRY tries. The secret number was $RANDOM_NUMBER. Nice job!"
  }
#ask for user input of number
echo "Enter your username:" 
ASK_USER
ASK_NUMBER
