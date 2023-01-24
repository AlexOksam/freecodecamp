#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  # get teams
  TEAMS=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
  
  if [[ $WINNER != "winner" ]]
  then
    # if not found
    if [[ -z $TEAMS ]]
    then
      # insert team
      INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
    fi
  fi
TEAMSTWO=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
  if [[ $OPPONENT != "opponent" ]]
  then
      # if not found
    if [[ -z $TEAMSTWO ]]
    then
      # insert team
      INSERT_TEAM_TWO=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_TWO == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $OPPONENT"
      fi
    fi
  fi

  TEAM_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  TEAM_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  if [[ -n $TEAM_ID_WINNER || -n $TEAM_ID_OPPONENT ]]
  then
    if [[ $YEAR != "year" ]]
    then
      INSERT_GAMES=$($PSQL "INSERT INTO games(round, year, winner_goals, winner_id, opponent_id, opponent_goals ) VALUES('$ROUND', '$YEAR', '$WINNER_GOALS', '$TEAM_ID_WINNER', '$TEAM_ID_OPPONENT', '$OPPONENT_GOALS')")
      if [[ $INSERT_GAMES == "INSERT 0 1" ]]
      then
        echo "Inserted into games, $YEAR"
      fi
    fi
  fi

done
