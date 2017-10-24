#!/bin/bash

ENV_FILE=genny.env
LOCAL_ENV_FILE=$2

./create_genny_env.sh ${ENV_FILE} $1

#Add any dev env file if exists
if [ $LOCAL_ENV_FILE ]; then
   cat ${LOCAL_ENV_FILE} >> $ENV_FILE
fi

echo "HAZELCAST_XML=-Dvertx.hazelcast.config=./cluster.xml" >> ${ENV_FILE}

ENV_FILE=$ENV_FILE docker-compose up -d
ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice
#ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice social kie-client
