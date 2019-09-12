#!/bin/bash
git pull
docker pull gennyproject/dummy:latest
docker pull gennyproject/rulesservice:dummy
docker pull gennyproject/wildfly-rulesservice:dummy
docker pull gennyproject/wildfly:v3.0.0


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

cd ../wildfly-rulesservice
git pull;mvn package -DskipTests=true
./build-docker.sh

cd ../bridge
git pull;mvn package -DskipTests=true
./build-docker.sh

cd ../media-proxy
git pull;mvn package -DskipTests=true
./build-docker.sh

cd ../messages
git pull;mvn package -DskipTests=true
./build-docker.sh

cd ../media-proxy
git pull;mvn package -DskipTests=true
./build-docker.sh

cd ../rulesservice
git pull;mvn package -DskipTests=true
./build-docker.sh

cd ../prj_genny
git pull

cd ../genny-main

