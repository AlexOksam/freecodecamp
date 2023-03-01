#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU()
{
  ## variable for all available services
  AVAILABLE_SERVICES=$($PSQL "select service_id, name from services order by service_id")
  
  ## check, have salon any services
  if [[ -z $AVAILABLE_SERVICES ]]
  then
  ## if not have services (table services in databes is empty)
  echo "Sorry, we are closed and do not have any services"
  else
  ## if services ...
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
    echo "$SERVICE_ID) $NAME"
    done

    read SERVICE_ID_SELECTED
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      MAIN_MENU "Please, type a number from the list"
      else
      SERVICE_AVAILABLE=$($PSQL "select service_id from services WHERE service_id = '$SERVICE_ID_SELECTED'")
      SERVICE=$($PSQL "select name from services where service_id = '$SERVICE_ID_SELECTED'")
      if [[ -z $SERVICE_AVAILABLE ]]
      then
        MAIN_MENU "I could not find that service. What would you like today?" 
        else
        echo -e "\nWhat's your phone number?"
        # read input from the terminal 
        read CUSTOMER_PHONE

        CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
        
        if [[ -z $CUSTOMER_NAME ]]
        then
          echo -e "\nWhat is your name?"
          read CUSTOMER_NAME
          UPDATE_CUSTOMERS=$($PSQL "insert into customers(name, phone) values ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")  
        fi

        echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
        read SERVICE_TIME
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
        if [[ $SERVICE_TIME ]]
        then 
          INSERT_SERVICE_TIME=$($PSQL "insert into appointments(customer_id, service_id, time) values ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
          
          ## if service time inserted in the database 
          if [[ INSERT_SERVICE_TIME ]]
          then
            # get massage with service, service time and name of customer
            echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
          fi
        fi
      fi  
    fi
  fi
}

MAIN_MENU
