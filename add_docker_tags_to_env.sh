#!/bin/bash

ENV_FILE=$1

# Check if env file is specified
if [ -z $ENV_FILE ]; then
  echo "ENV_FILE NOT SPECIFIED"
  echo "Usage: ./add_docker_tags_to_env.sh <ENV_FILE>"
  exit 1
fi

source docker_tags.env

add_tag_to_env() {
  while IFS= read -r line
  do
    line=$(echo $line | xargs)
    if [ -z "$line" ]; then
      continue
    fi
    [[ $line =~ ^#.* ]] && continue
    env_var_name=$(echo $line | awk -F "=" '{print $1}')
    env_var="$env_var_name="
    env_var_val=${!env_var_name}
    env_var+=$env_var_val
    echo $env_var >> $ENV_FILE
  done < $1
}

echo "Adding all tags from docker_tags.env..."
add_tag_to_env docker_tags.env
echo "Completed adding all tags from docker_tags.env."

if [[ -n "$PRODUCT_CODES" ]]
then
  if [ -d "../products" ];
  then
    products=($(echo $PRODUCT_CODES | tr ":" "\n"))
    for p in "${products[@]}"
    do
      #copy the product ports into .env
      source ../products/prd_${p}/docker_tags.env
      echo "Adding all ports from docker_tags.env of prd_${p}..."
      add_tag_to_env ../products/prd_${p}/docker_tags.env
      echo "Completed adding all ports from docker_tags.env of prd_${p}."
   done
  fi
fi


