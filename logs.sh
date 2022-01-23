#!/bin/bash

ENV_FILE=genny.env
name=$(docker ps -a --format "table {{.Names}}" | grep $1)
echo "logging ${name}"
#ENV_FILE=$ENV_FILE docker-compose logs -f  ${name} 
ENV_FILE=$ENV_FILE docker-compose logs -f $@ 
