#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
elif [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$1")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo -e "I could not find that element in the database." 
    else
      VAR=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$1")
      echo "$VAR" | while IFS='|' read TYPE_ID ATO_NUM SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo -e "The element with atomic number $ATO_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  elif [[ $1 =~ ^[A-Z][a-z]{0,2}$ ]]
  then
    SYMBOL=$($PSQL "select symbol from elements where symbol='$1'")
    if [[ -z $SYMBOL ]]
    then
      echo -e "I could not find that element in the database."
    else
      VAR=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol='$1'")
      echo "$VAR" | while IFS='|' read TYPE_ID ATO_NUM SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo -e "The element with atomic number $ATO_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  else
    NAME=$($PSQL "select name from elements where name='$1'")
    if [[ -z $NAME ]]
    then
      echo -e "I could not find that element in the database."
    else
      VAR=$($PSQL "select * from elements inner join properties using(atomic_number) inner join types using(type_id) where name='$1'")
      echo "$VAR" | while IFS='|' read TYPE_ID ATO_NUM SYMBOL NAME MASS MELTING BOILING TYPE
      do
        echo -e "The element with atomic number $ATO_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  fi
fi
