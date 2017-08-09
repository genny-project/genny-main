#!/bin/bash

ENV_FILE=genny.env
./create_genny_env.sh ${ENV_FILE}
echo "HAZELCAST_XML=-Dvertx.hazelcast.config=./cluster.xml" >> ${ENV_FILE}
ENV_FILE=$ENV_FILE docker-compose up -d
ENV_FILE=$ENV_FILE docker-compose logs -f bridge
#ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice social kie-client
