#!/bin/bash

ver=7.0.0
folders=("qwanda" "qwanda-utils" "genny-verticle-rules" "bootxport" "qwanda-services" 
        "genny-rules" "wildfly-rulesservice" "wildfly-qwanda-service" "checkrules" "bridge"  "notes" "shleemy" "bootq" 
        "media-proxy" "messages" "prj_genny" "prj_internmatch")
NEWLINE=$'\n'

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

for dirname in ${folders[@]};
do 
    if [[ -d ../$dirname ]]; then
        echo "Project: $dirname"
        cd ../${dirname}; 
		echo CURRENTDIR:\ $PWD
		printf BRANCH:\ ${Green}`git rev-parse --abbrev-ref HEAD`${Color_Off}
        echo ${NEWLINE}
		echo STATUS:
		git status
        echo ${NEWLINE}
    else
        echo "$dirname does not exist!!!" 
    fi
done

cd ../genny-main
