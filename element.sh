#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
echo "Please provide an element as an argument."

if [[ $1 ]]
then
  # get columns that matches argument
  if [[ SELECT IsNumeric($1) ]]
  then
    echo its int!
  fi

  # select all properties
  SELECT_ALL_PROPERTIES=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number=$1")
  echo $SELECT_ALL_PROPERTIES
  # read into variables
  #echo $SELECT_ALL_PROPERTIES while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
  
  # output element properties
  #echo -e "\nThe element with atomic number $"

  # if $1 doesn't match any data
  # display message
fi
