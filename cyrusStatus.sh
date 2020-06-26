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

cd ../genny-main
