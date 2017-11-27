#!/bin/bash

ENV_FILE=genny.env

./create_genny_env.sh ${ENV_FILE} 

OUTCOME="outcome"
GENNY="genny"

CREDENTIALS_GENNY="  ../credentials/credentials-genny"
CREDENTIALS_OUTCOME="../credentials/credentials-outcome"

CREDENTIALS="credentials"

if [ ! -d "$CREDENTIALS" ]; then
   mkdir ../$CREDENTIALS
fi

if [ "$1" == "${OUTCOME}" ]; then
   if [ ! -d "$CREDENTIALS_OUTCOME" ]; then
        cd ../$CREDENTIALS
        git clone https://github.com/OutcomeLife/credentials-outcome.git
        cd -
   fi
   cat "../credentials/credentials-outcome/outcome_conf.env" >> $ENV_FILE
   cat "../credentials/credentials-outcome/StoredCredential" > google_credentials/StoredCredential
elif [ "$1" == "${GENNY}" ]; then
   if [ ! -d "$CREDENTIALS_GENNY" ]; then
        cd ../$CREDENTIALS
        git clone https://github.com/OutcomeLife/credentials-genny.git 
        cd - 
   fi
   cat "../credentials/credentials-genny/genny_conf.env" >> $ENV_FILE
   cat "../credentials/credentials-genny/StoredCredential" > google_credentials/StoredCredential
else 
   echo "Nothing specified"
fi


./fetch_github_env.sh ${ENV_FILE}


ENV_FILE=$ENV_FILE docker-compose -f docker-compose.yml -f docker-compose.test.yml up -d 
ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice qwanda-service social
