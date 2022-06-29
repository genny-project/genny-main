#!/bin/bash

#ENV_FILE=genny.env
name=$(docker ps -a --format "table {{.Names}}" | grep $1)
#direct setting to avoid kafka being recognised as kafka-connect 
name=$1 
echo "logging ${name}"
#ENV_FILE=$ENV_FILE docker-compose logs -f  ${name} 
#ENV_FILE=$ENV_FILE docker-compose logs -f $name 
docker logs -f $name
