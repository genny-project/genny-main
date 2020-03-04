#!/bin/bash
dt="2020-03-01 23:30"
ver=v3.1.0
cd ../qwanda
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
cd ../qwanda-utils
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
cd ../genny-verticle-rules
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
cd ../genny-rules
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
cd ../bootxport
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
cd ../qwanda-services
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
cd ../wildfly-qwanda-service
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
cd ../wildfly-rulesservice
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
cd ../bridge
git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
#cd ../media-proxy
#git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
#mvn package -DskipTests=true
#./build-docker.sh
cd ../genny-main

for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   cd ../$i
   git stash;git checkout `git rev-list -n 1 --first-parent --before="${dt}" ${ver}`
   cd ../genny-main
   echo $i
done

