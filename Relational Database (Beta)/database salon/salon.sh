#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICES=$($PSQL "SELECT * FROM services")
  echo -e "\nWelcome to My Salon, how can I help you?"
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in 
    1) SET_APPOITMENT ;;
    2) SET_APPOITMENT ;;
    3) SET_APPOITMENT ;;
    *) MAIN_MENU 'Sorry, we not have services you want.' ;;
  esac
}


SET_APPOITMENT(){
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  NUMBER_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $NUMBER_PHONE ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_TIME_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  APPOINTMENT=$($PSQL "select * from customers inner join appointments using(customer_id) inner join services using(service_id) where customer_id=$CUSTOMER_ID and service_id=$SERVICE_ID_SELECTED")
  echo "$APPOINTMENT" | while read SER_ID BAR  CUS_ID BAR PHONE BAR NAME BAR APPOINTMENT_ID BAR TIME BAR SERVICE
  do
    echo -e "\nI have put you down for a $SERVICE at $TIME, $NAME"
  done
  
}

MAIN_MENU