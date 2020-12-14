#!/bin/bash
#find all the projects
rm -Rf ./rules/prj_*
#cp -rp ../prj_genny/rules/rulesCurrent ./rules/
mkdir rules
for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   mkdir ./rules/$i
   cp -rp ../$i/rules ./rules/$i/
  echo $i
done

ENV_FILE=genny.env
ENV_FILE=$ENV_FILE docker-compose stop wildfly-rulesservice qwanda-service 
ENV_FILE=$ENV_FILE docker-compose rm -f  wildfly-rulesservice qwanda-service
ENV_FILE=$ENV_FILE docker-compose up -d wildfly-rulesservice qwanda-service 
./cyrusSyncCache.sh
ENV_FILE=$ENV_FILE docker-compose logs -f $@ 
