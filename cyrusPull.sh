#!/bin/bash
cd ../qwanda
git stash;git pull
cd ../qwanda-utils
git stash;git pull
cd ../genny-verticle-rules
git stash;git pull
cd ../genny-rules
git stash;git pull
cd ../bootxport
git stash;git pull
cd ../qwanda-services
git stash;git pull
cd ../wildfly-qwanda-service
git stash;git pull
cd ../wildfly-rulesservice
git stash;git pull
cd ../bridge
git stash;git pull
#cd ../media-proxy
#mvn package -DskipTests=true
#./build-docker.sh
cd ../genny-main

for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   cd ../$i
   git stash;git pull
   cd ../genny-main 
   echo $i
done



