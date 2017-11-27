#!/bin/bash

ENV_FILE=genny.env
LOCAL_REALM_NAME="PROJECT_REALM=$2"

./create_genny_env.sh ${ENV_FILE} $1

if [ $2 ]; then  
   cat "${2}_conf.env" >> $ENV_FILE
   cat "${2}_credential" > google_credentials/StoredCredential 
fi

echo "HAZELCAST_XML=-Dvertx.hazelcast.config=./cluster.xml" >> ${ENV_FILE}
cat ${ENV_FILE}
ENV_FILE=$ENV_FILE docker-compose up -d
ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice qwanda-service
#ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice social kie-client
