#!/bin/bash

ENV_FILE=genny.env
./create_genny_env.sh ${ENV_FILE} $1
echo "DEBUG=true" >> ${ENV_FILE}
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-dev.yml up -d
