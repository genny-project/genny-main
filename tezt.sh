#!/bin/bash

#LOCAL_REALM_NAME="PROJECT_REALM=$1"
#./create_genny_env.sh ${ENV_FILE} $1
#CREDENTIALS_GENNY="$CREDENTIALS_DIR/credentials-genny"
#CREDENTIALS_CHANNEL40="$CREDENTIALS_DIR/credentials-channel40"
#CREDENTIALS_OUTCOME="$CREDENTIALS_DIR/credentials_outcome"
#Add any dev env file if exists
#if [ $LOCAL_REALM_NAME ]; then
#    echo  $LOCAL_REALM_NAME  >> $ENV_FILE
#fi


CREDENTIALS_DIR="$HOME/.genny/credentials"
CREDENTIALS="credentials"
CREDENTIALS_PROJECT="$CREDENTIALS_DIR/$CREDENTIALS"
ENV_FILE=genny.env
$REPO_URL

if [ ! -d "$CREDENTIALS_DIR" ]; then
   mkdir -p $CREDENTIALS_DIR
fi

while [ "$1" != "" ]; do
   case $1 in
      -u | --update ) PROJECT="${2}"
         echo "Updating project"
         cd "$CREDENTIALS_PROJECT-${PROJECT}"
         REMOTE_URL=$(git remote -v)
         REPO_TO_UPDATE=$(echo $REMOTE_URL | sed 's/.*\(htt.*\.git\).*/\1/')
         git pull $REPO_TO_UPDATE
         shift 
	 ;;
      -s | --setup ) PROJECT="${2}"
         cd $CREDENTIALS_DIR
         if [ -d "$CREDENTIALS_PROJECT-$PROJECT" ]; then
            echo "Replacing project by $PROJECT"
	    rm -Rf $CREDENTIALS_PROJECT-$PROJECT
            git_output=$(git clone $REPO_URL 2>&1)
            repo_name_quotes=$(echo $git_output | sed 's/.*\('\''.*'\''\).*/\1/' 2>&1)            
            repo_name_no_quotes=$(echo "$repo_name_quotes" | tr -d "'")
            echo "$CREDENTIALS-$PROJECT"
            if [ $repo_name_no_quotes != $CREDENTIALS-$PROJECT ]; then 
               mv $repo_name_no_quotes $CREDENTIALS-$PROJECT
               echo "changing project name to $CREDENTIALS-$PROJECT"
            fi 
         else
            echo "Seting up new project..."
            git_output=$(git clone $REPO_URL 2>&1)
            repo_name_quotes=$(echo $git_output | sed 's/.*\('\''.*'\''\).*/\1/' 2>&1)            
            repo_name_no_quotes=$(echo "$repo_name_quotes" | tr -d "'")
            if [ $repo_name_no_quotes != $CREDENTIALS-$PROJECT ]; then 
               mv $repo_name_no_quotes $CREDENTIALS-$PROJECT
               echo "changing project name to $CREDENTIALS-$PROJECT"
            fi 
         fi 
         cd -
         cat "$CREDENTIALS_PROJECT-$PROJECT/conf.env" >> $ENV_FILE
         cat "$CREDENTIALS_PROJECT-$PROJECT/StoredCredential" > google_credentials/StoredCredential
         shift
         ;;
      -g | --github ) REPO_URL="${2}" 
         echo "Fetching project conf from repository url $REPO_URL"
         shift
         ;;
      -n | --net ) IP="{2}"
         ./create_genny_env.sh ${ENV_FILE} $IP
         shift
         ;;
      -r | --realm ) REALM="{2}"
         echo "Realm set up"
         echo  $REALM >> $ENV_FILE
         shift
	 ;;
      *)
         echo "`basename ${0}`: usage: [-f file] | [-d directory]"
         exit 1 # Command to come out of the program with status 1
         ;;
   esac
   shift
done 

ENV_FILE=$ENV_FILE docker-compose up -d
ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice qwanda-service messages
#ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice social kie-client





