#!/bin/bash

function git_project { 
 project=$1
 pushd .
 cd ..
 echo "Synching in project ${project}"
 if cd ${project}; then git pull; else git clone https://github.com/genny-project/${project} ${project}; fi
 popd
}

echo "Git pull all Genny projects!"

git_project scoring
git_project bridge 
git_project rulesservice 
git_project social 
git_project kie-client 
git_project qwanda 
git_project qwanda-service 
git_project wildfly-qwanda-service 
git_project qwanda-utils 
git_project alyson-v2



echo "Finished loading in all the projects"
