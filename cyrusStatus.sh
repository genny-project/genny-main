#!/bin/bash

ver=v3.1.0
folders=("qwanda" "qwanda-utils" "genny-verticle-rules" "bootxport" "qwanda-services" 
        "genny-rules" "wildfly-rulesservice" "wildfly-qwanda-service" "checkrules" "bridge" 
        "media-proxy" "messages" "prj_genny" "prj_internmatch")
NEWLINE=$'\n'

for dirname in ${folders[@]};
do 
    if [[ -d ../$dirname ]]; then
        echo "Project:$dirname"
        cd ../${dirname}; echo CURRENTDIR:$PWD, BRANCH:`git rev-parse --abbrev-ref HEAD`, STATUS:`git status`
        echo ${NEWLINE}
    else
        echo "$dirname does not exist!!!" 
    fi
done

#cd ../qwanda;echo $PWD;echo BRANCH:`git rev-parse --abbrev-ref HEAD`;echo STATUS:`git status`
#cd ../qwanda-utils;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../genny-verticle-rules;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../bootxport;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../qwanda-services;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../genny-rules;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../wildfly-rulesservice;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
##cd ../rulesservice;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../wildfly-qwanda-service;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../checkrules;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../bridge;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../media-proxy;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../messages;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
#cd ../prj_genny;echo $PWD;git rev-parse --abbrev-ref HEAD;git status
cd ../genny-main

