#!/bin/bash

# define a newline char
NEWLINE=$'\n'

# define our colours
Color_Off='\033[0m'       # Text Reset
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White


# define our list of directories
folders=("qwanda" "qwanda-utils" "genny-verticle-rules" "bootxport" "qwanda-services" 
        "genny-rules" "wildfly-rulesservice" "wildfly-qwanda-service" "checkrules" "gennyq"  "qwandaq" "serviceq" "bridge" "fyodor" "dropkick" "lauchy" "messages" "adi" "notes" "shleemy" "bootq" "genny-proxy" "api2email"
        "media-proxy" "prj_genny" "prj_internmatch")


# begin iterating directories
for dirname in ${folders[@]};
do 
    if [[ -d ../$dirname ]]; then
        cd ../${dirname}; 

		# output the directory and the branch it is on in nice colours
		printf Project:\ ${Blue}$dirname${Color_Off}\ \ \ \ Branch:\ ${Green}`git rev-parse --abbrev-ref HEAD`${Color_Off}
        echo ${NEWLINE}

		# output the status, cutting the first 4 lines out
		git -c color.status=always status | tail +3
        echo ${NEWLINE}
    else
        echo "$dirname does not exist!!!" 
    fi
done

cd ../genny-main
