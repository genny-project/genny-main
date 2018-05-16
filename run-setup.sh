#!/bin/bash
if ping -c 1 10.123.123.123 &> /dev/null
then
  echo "10.123.123.123 exists" 
else
sudo ifconfig lo0 alias 10.123.123.123 
fi

DOCUMENTATION=\
"\nFor running a custom genny project please follow the commands below otherwise type './run-setup.sh up' for running the default configuration\n"\
\
"\n`basename ${0}`: usage:\t[-s --set] | [-g --github] | [-p --project] | [-n --net] | [-r --realm]"\
"\n\t\t\t[-l --list] | [del delete] | [up start] | [-u update ] | [-d doc]\n"\
"\n  Options:\n\n"\
"\tup, start \tRun project with specified arguments or default otherwise\n"\
"\tdel, delete \tDelete specified project\n"\
"\t-l, --list \tList projects that have been set up\n"\
"\t-r, --realm \tSet project's realm\n"\
"\t-d, --doc \tSheet id of hosting doc\n"\
"\t-m, --minimal \tMinimal set of services\n"\
"\t-n, --net \tSet Docker host ip address to set up env end points\n"\
"\t-p, --project \t Project to run\n"\
"\t-g, --github \tGithub repo URL\n"\
"\t-s, --setup \tSet project up from Github repo URL\n"\
"\t-u, --update \tUpdate project\n"


chown root:admin ~/.genny/.secrets/passwords/passwords.txt && chmod 700 ~/.genny/.secrets/passwords/passwords.txt

CREDENTIALS_DIR="$HOME/.genny/credentials"
CREDENTIALS="credentials"
CREDENTIALS_PROJECT="$CREDENTIALS_DIR/$CREDENTIALS"
ENV_FILE=genny.env
$repo_url
$project
$ip 
$project_realm

if [ ! -d "$CREDENTIALS_DIR" ]; then
   mkdir -p $CREDENTIALS_DIR
fi

while [ "$1" != "" ]; do
   case $1 in
      -u | --update ) PROJECT="${2}"
         if [ ! -d "$CREDENTIALS_PROJECT-${PROJECT}" ]; then 
            echo "Project $PROJECT does not exist"
            exit 1
         fi 
         echo "Updating project"
         cd "$CREDENTIALS_PROJECT-${PROJECT}"
         REMOTE_URL=$(git remote -v)
         REPO_TO_UPDATE=$(echo $REMOTE_URL | sed 's/.*\(htt.*\.git\).*/\1/')
         git pull $REPO_TO_UPDATE
         cd - &> /dev/null
         shift 
	 ;;
      -s | --setup ) PROJECT="${2}"
         cd $CREDENTIALS_DIR
         if [ -d "$CREDENTIALS_PROJECT-$PROJECT" ]; then
            echo "Replacing project by $PROJECT"
	    rm -Rf $CREDENTIALS_PROJECT-$PROJECT
            git_output=$(git clone $repo_url 2>&1)
            repo_name_quotes=$(echo $git_output | sed 's/.*\('\''.*'\''\).*/\1/' 2>&1)            
            repo_name_no_quotes=$(echo "$repo_name_quotes" | tr -d "'")
            echo "$CREDENTIALS-$PROJECT"
            if [ $repo_name_no_quotes != $CREDENTIALS-$PROJECT ]; then 
               mv $repo_name_no_quotes $CREDENTIALS-$PROJECT
               echo "changing project name to $CREDENTIALS-$PROJECT"
            fi 
         else
            echo "Seting up new project..."
            git_output=$(git clone $repo_url 2>&1)
            repo_name_quotes=$(echo $git_output | sed 's/.*\('\''.*'\''\).*/\1/' 2>&1)            
            repo_name_no_quotes=$(echo "$repo_name_quotes" | tr -d "'")
            if [ $repo_name_no_quotes != $CREDENTIALS-$PROJECT ]; then 
               mv $repo_name_no_quotes $CREDENTIALS-$PROJECT
               echo "changing project name to $CREDENTIALS-$PROJECT"
            fi 
         fi 
         cd - &> /dev/null
         shift
         ;;
      -g | --github ) REPO_URL="${2}" 
         repo_url=$REPO_URL
         echo "Fetching project conf from repository url $repo_url"
         shift
         ;;
      -p | --project ) PROJECT="${2}"
         project=$PROJECT
         shift
         ;;
      -n | --net ) IP="${2}"
         ip=$IP
         shift
         ;;
      -d | --doc ) SHEET_ID=${2}
         echo  "GOOGLE_HOSTING_SHEET_ID=$SHEET_ID" >> $ENV_FILE
         shift
         ;;
      -r | --realm ) REALM="${2}"
         echo "Realm set up"
         project_realm=$REALM
         shift
	 ;;
      -l | --list )
         cd $CREDENTIALS_DIR
         ls | sed 's/credentials-/''/g'
         cd - &> /dev/null
         ;;
      dev )
         echo "started"
         if [ -z "$project" ]; then 
            echo "Running genny as default"
            project="genny"
         fi 

         if [ $project == "genny" ] && [ ! -d "$CREDENTIALS_PROJECT-${project}" ]; then 
            cd $CREDENTIALS_DIR
            genny_repo_url="https://github.com/genny-project/credentials-genny.git"
            git_output=$(git clone $genny_repo_url 2>&1)
            repo_name_quotes=$(echo $git_output | sed 's/.*\('\''.*'\''\).*/\1/')            
            repo_name_no_quotes=$(echo "$repo_name_quotes" | tr -d "'")
            echo "Stored repo path $CREDENTIALS_PROJECT/$repo_name_no_quotes"
            if [ $repo_name_no_quotes != "$CREDENTIALS-$project" ]; then 
               mv "$repo_name_no_quotes" $CREDENTIALS-${project}
               echo "Changing project name to $CREDENTIALS-$project"
            fi  
            cd - &> /dev/null
	 fi 
         ./create_genny_env.sh ${ENV_FILE} $ip >& /dev/null
         
         if [ -n $project_realm ]; then 
            echo  "PROJECT_REALM=$project_realm" >> $ENV_FILE
         fi
         cat "$CREDENTIALS_PROJECT-$project/conf.env" >> $ENV_FILE
         cat "$CREDENTIALS_PROJECT-$project/StoredCredential" > google_credentials/StoredCredential
         echo "DEBUG=TRUE" >> ${ENV_FILE}
         echo "DEBUG_SUSPEND=y" >> ${ENV_FILE}
         echo "GENNYDEV=TRUE" >> ${ENV_FILE}
         
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-dev.yml up -d
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-dev.yml logs -f qwanda-service 
         ;;
      staging )
         echo "started"
         if [ -z "$project" ]; then 
            echo "Running genny as staging"
            project="genny"
         fi 

         if [ $project == "genny" ] && [ ! -d "$CREDENTIALS_PROJECT-${project}" ]; then 
            cd $CREDENTIALS_DIR
            genny_repo_url="https://github.com/genny-project/credentials-genny.git"
            git_output=$(git clone $genny_repo_url 2>&1)
            repo_name_quotes=$(echo $git_output | sed 's/.*\('\''.*'\''\).*/\1/')            
            repo_name_no_quotes=$(echo "$repo_name_quotes" | tr -d "'")
            echo "Stored repo path $CREDENTIALS_PROJECT/$repo_name_no_quotes"
            if [ $repo_name_no_quotes != "$CREDENTIALS-$project" ]; then 
               mv "$repo_name_no_quotes" $CREDENTIALS-${project}
               echo "Changing project name to $CREDENTIALS-$project"
            fi  
            cd - &> /dev/null
	 fi 
         ./create_genny_env.sh ${ENV_FILE} $ip >& /dev/null
         
         if [ -n $project_realm ]; then 
            echo  "PROJECT_REALM=$project_realm" >> $ENV_FILE
         fi
         cat "$CREDENTIALS_PROJECT-$project/conf.env" >> $ENV_FILE
         cat "$CREDENTIALS_PROJECT-$project/StoredCredential" > google_credentials/StoredCredential
         echo "DEBUG=TRUE" >> ${ENV_FILE}
         echo "DEBUG_SUSPEND=y" >> ${ENV_FILE}
         echo "GENNYDEV=TRUE" >> ${ENV_FILE}
         
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-staging.yml up -d
ENV_FILE=$ENV_FILE docker-compose -f docker-compose-staging.yml logs -f  rulesservice 
         ;;
      del | delete ) PROJECT="${2}"
         if [ ! -d "$CREDENTIALS_PROJECT-${PROJECT}" ]; then 
            echo "Project $PROJECT does not exist"
            exit 1
         fi 
         cd $CREDENTIALS_DIR
         rm -rf $CREDENTIALS_PROJECT-$PROJECT
         echo "Project $PROJECT deleted"
         cd - &> /dev/null
         shift
         ;;
      min | minimal )
         echo "started minimal"
         if [ -z "$project" ]; then 
            echo "Running genny as default"
            project="genny"
         fi 

         if [ $project == "genny" ] && [ ! -d "$CREDENTIALS_PROJECT-${project}" ]; then 
            cd $CREDENTIALS_DIR
            genny_repo_url="https://github.com/genny-project/credentials-genny.git"
            git_output=$(git clone $genny_repo_url 2>&1)
            repo_name_quotes=$(echo $git_output | sed 's/.*\('\''.*'\''\).*/\1/')            
            repo_name_no_quotes=$(echo "$repo_name_quotes" | tr -d "'")
            echo "Stored repo path $CREDENTIALS_PROJECT/$repo_name_no_quotes"
            if [ $repo_name_no_quotes != "$CREDENTIALS-$project" ]; then 
               mv "$repo_name_no_quotes" $CREDENTIALS-${project}
               echo "Changing project name to $CREDENTIALS-$project"
            fi  
            cd - &> /dev/null
	 fi 
         ./create_genny_env.sh ${ENV_FILE} $ip >& /dev/null
         
         if [ -n $project_realm ]; then 
            echo  "PROJECT_REALM=$project_realm" >> $ENV_FILE
         fi
         cat "$CREDENTIALS_PROJECT-$project/conf.env" >> $ENV_FILE
         cat "$CREDENTIALS_PROJECT-$project/StoredCredential" > google_credentials/StoredCredential
        
         
 
         ENV_FILE=$ENV_FILE docker-compose -f docker-compose-min.yml up -d
         ENV_FILE=$ENV_FILE docker-compose -f docker-compose-min.yml logs -f bridge rulesservice qwanda-service messages
#         ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice social kie-client
         ;;
      up | start )
         echo "started"
         if [ -z "$project" ]; then 
            echo "Running genny as default"
            project="genny"
         fi 

         if [ $project == "genny" ] && [ ! -d "$CREDENTIALS_PROJECT-${project}" ]; then 
            cd $CREDENTIALS_DIR
            genny_repo_url="https://github.com/genny-project/credentials-genny.git"
            git_output=$(git clone $genny_repo_url 2>&1)
            repo_name_quotes=$(echo $git_output | sed 's/.*\('\''.*'\''\).*/\1/')            
            repo_name_no_quotes=$(echo "$repo_name_quotes" | tr -d "'")
            echo "Stored repo path $CREDENTIALS_PROJECT/$repo_name_no_quotes"
            if [ $repo_name_no_quotes != "$CREDENTIALS-$project" ]; then 
               mv "$repo_name_no_quotes" $CREDENTIALS-${project}
               echo "Changing project name to $CREDENTIALS-$project"
            fi  
            cd - &> /dev/null
	 fi 
         ./create_genny_env.sh ${ENV_FILE} $ip >& /dev/null
         
         if [ -n $project_realm ]; then 
            echo  "PROJECT_REALM=$project_realm" >> $ENV_FILE
         fi
         cat "$CREDENTIALS_PROJECT-$project/conf.env" >> $ENV_FILE
         cat "$CREDENTIALS_PROJECT-$project/StoredCredential" > google_credentials/StoredCredential
        
         
 
         ENV_FILE=$ENV_FILE docker-compose up -d
         ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice qwanda-service messages
#         ENV_FILE=$ENV_FILE docker-compose logs -f bridge rulesservice social kie-client
         ;;
      -h | --help )
         #printf "\t 
         printf "${DOCUMENTATION}\n"
         shift 
         ;;
      *)
         echo "`basename ${0}`: usage: [-s --set] | [-g --github] | [-p --project] | [-n --net] | [-r --realm] | [-l --list] | [del delete] | [up start] | [-u update ] | [-d doc]"
         exit 1 
         ;;
   esac
   shift
done 






