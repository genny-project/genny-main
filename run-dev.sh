#!/bin/bash

ENV_FILE=genny.env
./create_genny_env.sh ${ENV_FILE} $1
echo "DEBUG=TRUE" >> ${ENV_FILE}
echo "DEBUG_SUSPEND=y" >> ${ENV_FILE}
echo "GENNYDEV=TRUE" >> ${ENV_FILE}
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-dev.yml up -d
