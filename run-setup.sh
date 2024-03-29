#!/bin/bash

os_type=""
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    os_type="ubuntu"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    os_type="mac"
fi

echo "OS Type is ${os_type}"

if [[ "${os_type}" == "mac" ]]; then
    IP=$(ifconfig | grep 10.123.123.123)
elif [[ "${os_type}" == "ubuntu" ]]; then
    IP=$(ip a | grep 10.123.123.123)
fi
echo $IP

#if ping -c 1 10.123.123.123 &> /dev/null
if [[ -z "$IP" ]]; then
    if [[ ${os_type} == "mac" ]]; then
        echo "OS TYPE: macOS"
        sudo ifconfig lo0 alias 10.123.123.123
    elif [[ ${os_type} == "ubuntu" ]]; then
        echo "OS TYPE: Linux"
        sudo ip address add 10.123.123.123 dev lo
    else
        echo "Can't detect OS type, neither Linux nor macOS!"
        exit -1
    fi
else
    echo "10.123.123.123 exists"
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

#chown root:admin ~/.genny/.secrets/passwords/passwords.txt && chmod 700 ~/.genny/.secrets/passwords/passwords.txt

GENNY_ENV_DIR="$HOME/.genny"
cd ..
GENNY_DIR=$PWD
cd genny-main
#GENNY_DIR="~/projects/genny"
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

echo "PROJECT_REALM=${2}" >> ./.env

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

            export AWS_ACCESS_KEY_ID=$(cat ~/.genny/credentials/credentials-$project/conf.env |  awk -F"=" '/AWS_ACCESS_KEY_ID=/ { print $2}' | sed -e 's/"/\\"/g' | sed -e 's/\\\//\\\\\//g')
            export AWS_SECRET_ACCESS_KEY=$(cat ~/.genny/credentials/credentials-$project/conf.env |  awk -F"=" '/AWS_SECRET_ACCESS_KEY=/ { print $2}' | sed -e 's/"/\\"/g' | sed -e 's/\\\//\\\\\//g')
            export AWS_SECRET_ACCESS_KEY=$(cat ~/.genny/credentials/credentials-$project/conf.env |  awk -F"=" '/AWS_SECRET_ACCESS_KEY=/ { print $2}' | sed -e 's/"/\\"/g' | sed -e 's/\\\//\\\\\//g')
            export $(cat ~/.genny/credentials/credentials-$project/conf.env |  awk -F"=" '/SSH_PRIVATE_KEY=/')
            export $(cat ~/.genny/credentials/credentials-$project/conf.env |  awk -F"=" '/GIT_SSH=/')
            echo $SSH_PRIVATE_KEY
            echo $GIT_SSH
            #rm -rf rules/*
            if [ ! -d "$GENNY_DIR/prj_$project" ]; then
                git -C "$GENNY_DIR" clone $(cat ~/.genny/credentials/credentials-$project/conf.env |  awk -F"=" '/RULES_REPO_URL=/ { print $2}' | sed -e 's/"/\\"/g' | sed -e 's/\\\//\\\\\//g')
            else
                echo "project rules already in file system"
            fi
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
	    ./create_genny_env.sh .env $ip >& /dev/null

		#Start up zookeeper and kafka to force a single partition
		ENV_FILE=genny.env docker-compose   up -d  --remove-orphans zookeeper  
                ENV_FILE=genny.env docker-compose   up -d  --remove-orphans  kafka
                sleep 5
                ./force_kafka_to_1.sh


	echo "GOT TO HERE"
            if [ -n $project_realm ]; then
                echo  "PROJECT_REALM=$project_realm" >> $ENV_FILE
                UPPER_REALM=`echo $project_realm | tr '[:lower:]' '[:upper:]'`
                echo  "UPPER_REALM=$UPPER_REALM"
                #   echo  "$UPPER_REALM""_ENV_SIGNATURE_URL=http://signature.genny.life" >> $ENV_FILE
                #   echo  "$UPPER_REALM""_ENV_UPPY_URL=http://uppy.genny.life" >> $ENV_FILE
                #  echo  "$UPPER_REALM""_ENV_LAYOUT_PUBLICURL=http://layout-cache.genny.life" >> $ENV_FILE
            fi
	echo "GOT TO HERE2"
            cat "$CREDENTIALS_PROJECT-$project/conf.env" >> $ENV_FILE
            cat "$CREDENTIALS_PROJECT-$project/StoredCredential" > google_credentials/StoredCredential

            echo "DEBUG=TRUE" >> ${ENV_FILE}
            echo "DEBUG_SUSPEND=n" >> ${ENV_FILE}
            # echo "XMX=3048m" >> ${ENV_FILE}

		cat $ENV_FILE >> ./.env
	echo "GOT TO HERE3B"
			source $ENV_FILE

			# Create alyson.conf for nginx
			echo "********************************"
			export $(grep --regexp ^[A-Z] $ENV_FILE | cut -d= -f1)
			envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < nginx/conf.d/alyson.conf.template > nginx/conf.d/alyson.conf
			echo "********************************"

			if [[ -n "$PRODUCT_CODES" ]] 
			then
				if [ -d "../products" ];
				then
					products=($(echo $PRODUCT_CODES | tr ":" "\n"))
					files="-f docker-compose.yml"
					for p in "${products[@]}"
					do
                                                #copy across SVG and protos
						#PERSISTENCE_FOLDER=target/protobuf2
						PERSISTENCE_FOLDER=target/protobuf
						SVG_FOLDER=svg
                                                PRODUCT_PERSISTENCE=../products/prd_${p}/target/classes/META-INF/resources/persistence/protobuf
                                                PRODUCT_PROTO=../products/prd_${p}/target/classes/META-INF
                                                PRODUCT_CLASSES=../products/prd_${p}/target/classes
                                                PRODUCT_SVG_FOLDER=../products/prd_${p}/target/classes/META-INF/processSVG
						files="${files} -f ../products/prd_${p}/docker-compose.yml"
                                                if [ -d "$PRODUCT_SVG_FOLDER" ]
                                                then
                                                   cp $PRODUCT_SVG_FOLDER/*.svg $SVG_FOLDER
                                                else
                                                   echo "$PRODUCT_SVG_FOLDER does not exist. Have you compiled ${p} project?"
                                                #exit 1
                                                fi
                                                if [ -d "$PRODUCT_PERSISTENCE" ]
                                                then
                                                   cp $PRODUCT_PERSISTENCE/* $PERSISTENCE_FOLDER
                                                else
                                                   echo "$PRODUCT_PERSISTENCE does not exist. Have you compiled ${p} project?"
                                                #exit 1
                                                fi
                                                #if [ -d "$PRODUCT_PROTO" ]
                                                #then
                                                #   cp $PRODUCT_PROTO/*.proto $PERSISTENCE_FOLDER
                                                #else
                                                #   echo "$PRODUCT_PROTO does not exist. Have you compiled ${p} project?"
                                                #exit 1
                                                #fi
                                                #if [ -d "$PRODUCT_CLASSES" ]
                                                #then
                                                #   cp $PRODUCT_CLASSES/*.proto $PERSISTENCE_FOLDER
                                                #else
                                                #   echo "$PRODUCT_CLASSES does not exist. Have you compiled ${p} project?"
                                                #exit 1
                                                #fi
					done
					echo "The docker-compose product files are ${files}"
					ENV_FILE=$ENV_FILE docker-compose ${files}  up  --remove-orphans -d
				else 
					ENV_FILE=$ENV_FILE docker-compose   up  --remove-orphans -d
				fi
			else
				ENV_FILE=$ENV_FILE docker-compose    up  --remove-orphans -d
			fi
            ;;
        mysql )
            echo "mysql  started"
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
	    ./create_genny_env.sh .env $ip >& /dev/null

            if [ -n $project_realm ]; then
                echo  "PROJECT_REALM=$project_realm" >> $ENV_FILE
            fi
            cat "$CREDENTIALS_PROJECT-$project/conf.env" >> $ENV_FILE
            cat "$CREDENTIALS_PROJECT-$project/StoredCredential" > google_credentials/StoredCredential



            ENV_FILE=$ENV_FILE docker-compose -f docker-compose-mysql.yml up -d
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
