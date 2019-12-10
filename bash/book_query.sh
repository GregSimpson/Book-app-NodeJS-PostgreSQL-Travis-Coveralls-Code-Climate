#!/bin/bash

#psql_str="postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops"

username="gsimpson"
hostaddr="127.0.0.1"
database="books"
password="gsimpson"

export PGUSER=${username}
export PGPASSWORD=${password}
export PGHOSTADDR=${hostaddr}
export PGDATABASE=${database}


####  functions
#############################################################
function get_all_book_data() {

  echo start with cust name ... ${customer_name}
  echo ...

  psql ${psql_str} <<EOF
    SELECT *
      --id
      --,title
      --,price
      --,description
      ----,createdAt
      ----,updatedAt
    FROM public."Books" as BOOKS
        ORDER BY
      1 ASC
EOF
}


#### Main - run these functions ####

## show the table data
get_all_book_data


