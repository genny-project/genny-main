#!/bin/bash
git pull
docker pull gennyproject/dummy:latest
docker pull gennyproject/rulesservice:dummy
docker pull gennyproject/wildfly-rulesservice:dummy
docker pull gennyproject/wildfly:v2.4.0


cd ../qwanda
git pull;mvn install -DskipTests=true
cd ../qwanda-utils
git pull;mvn install -DskipTests=true
cd ../genny-verticle-rules
git pull;mvn install -DskipTests=true
cd ../genny-rules
git pull;mvn install -DskipTests=true
cd ../qwanda-services
git pull;mvn install -DskipTests=true
cd ../wildfly-qwanda-service
git pull;mvn package -DskipTests=true
./build-docker.sh
git pull;cd ../wildfly-rulesservice
mvn package -DskipTests=true
./build-docker.sh
cd ../bridge
git pull;mvn package -DskipTests=true
./build-docker.sh
cd ../prj_genny
git pull
cd ../genny-main

