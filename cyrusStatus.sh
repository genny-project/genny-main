#!/bin/bash

folders=("qwanda" "qwanda-utils" "genny-verticle-rules" "bootxport" "qwanda-services" 
        "genny-rules" "wildfly-rulesservice" "wildfly-qwanda-service" "checkrules" "bridge"  "notes" "shleemy" "bootq" 
        "media-proxy" "messages" "prj_genny" "prj_internmatch")
NEWLINE=$'\n'

for dirname in ${folders[@]};
do 
    if [[ -d ../$dirname ]]; then
        #echo "Project:$dirname"
        cd ../${dirname}; 
        echo Project:$dirname,BRANCH:`git rev-parse --abbrev-ref HEAD`, STATUS:`git status`
        #echo CURRENTDIR:$PWD, BRANCH:`git rev-parse --abbrev-ref HEAD`, STATUS:`git status`
        #echo ${NEWLINE}
    else
        echo "$dirname does not exist!!!" 
    fi
done

cd ../genny-main
