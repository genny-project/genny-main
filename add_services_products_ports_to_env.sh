#!/bin/bash

ENV_FILE=$1

# Check if env file is specified
if [ -z $ENV_FILE ]; then
  echo "ENV_FILE NOT SPECIFIED"
  echo "Usage: ./add_services_products_ports_to_env.sh <ENV_FILE>"
  exit 1
fi

source services_ports.env

add_var_to_env() {
  while IFS= read -r line
  do
    line=$(echo $line | xargs)
    if [ -z "$line" ]; then
      continue
    fi
    [[ $line =~ ^#.* ]] && continue
    env_var_name=$(echo $line | awk -F "=" '{print $1}')
    if [[ $env_var_name == *PORT ]]
    then
      env_var="$env_var_name="
      env_var_val=${!env_var_name}
      env_var+=$env_var_val
      echo $env_var >> $ENV_FILE
    fi
  done < $1
}

echo "Adding all ports from services_ports.env..."
add_var_to_env services_ports.env
echo "Completed adding all ports from services_ports.env."

if [[ -n "$PRODUCT_CODES" ]]
then
  if [ -d "../products" ];
  then
    products=($(echo $PRODUCT_CODES | tr ":" "\n"))
    files="-f docker-compose.yml"
    for p in "${products[@]}"
    do
      #copy the product ports into .env
      source ${HOME}/projects/genny/products/prd_${p}/product_ports.env
      echo "Adding all ports from product_ports.env of prd_${p}..."
      add_var_to_env ${HOME}/projects/genny/products/prd_${p}/product_ports.env
      echo "Completed adding all ports from product_ports.env of prd_${p}."
   done
  fi
fi


