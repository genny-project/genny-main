#!/bin/bash

function java_project {
 project=$1
 pushd .
 cd ../$project 
 echo "Synching in project ${project}"
 if cd ${project}; then git pull; else git clone https://github.com/genny-project/${project} ${project}; fi
 mvn clean package -DskipTests=true
 ./build-docker.sh 
 popd
}

function lib_project {
 project=$1
 pushd .
 cd ../$project 
 echo "Synching in project ${project}"
 if cd ${project}; then git pull; else git clone https://github.com/genny-project/${project} ${project}; fi
 mvn clean install -DskipTests=true 
 popd
}

function react_project {
 project=$1
 pushd .
 cd ../$project 
 echo "Synching in project ${project}"
 if cd ${project}; then git pull; else git clone https://github.com/genny-project/${project} ${project}; fi
 ./build-docker.sh 
 popd
}
echo "Git pull all Genny projects!"

lib_project qwanda
lib_project qwanda-utils
java_project scoring
java_project bridge
java_project rulesservice
java_project social
java_project kie-client
java_project wildfly-qwanda-service
react_project alyson-v2



echo "Finished loading and building all the projects"
