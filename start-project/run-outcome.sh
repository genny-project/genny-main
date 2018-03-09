#!/bin/bash
cd ../
ENV_FILE=genny.env
LOCAL_REALM_NAME="PROJECT_REALM=$2"

./create_genny_env.sh ${ENV_FILE} $1

CREDENTIALS="$HOME/.genny/credentials"
CREDENTIALS_GENNY="$CREDENTIALS/credentials-outcome"
if [ ! -d "$CREDENTIALS" ]; then
   mkdir -p $CREDENTIALS 
fi

#Add any dev env file if exists
if [ $LOCAL_REALM_NAME ]; then
    echo  $LOCAL_REALM_NAME  >> $ENV_FILE
fi

#./fetch_github_env.sh ${ENV_FILE}

if [ ! -d "$CREDENTIALS_GENNY" ]; then
        cd $CREDENTIALS
        git clone https://github.com/OutcomeLife/credentials-outcome.git
        cd -
        cat "$CREDENTIALS_GENNY/outcome_conf.env" >> $ENV_FILE
        cat "$CREDENTIALS_GENNY/StoredCredential" > google_credentials/StoredCredential
else
   cat "$CREDENTIALS_GENNY/outcome_conf.env" >> $ENV_FILE
   cat "$CREDENTIALS_GENNY/StoredCredential" > google_credentials/StoredCredential
fi

echo "HAZELCAST_XML=-Dvertx.hazelcast.config=./cluster.xml" >> ${ENV_FILE}

ENV_FILE=$ENV_FILE docker-compose up -d
ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice qwanda-service messages
#ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice social kie-client