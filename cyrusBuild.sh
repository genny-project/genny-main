#!/bin/bash
cd ../qwanda
mvn install -DskipTests=true

cd ../qwanda-utils
mvn install -DskipTests=true

cd ../bootxport
mvn install -DskipTests=true

cd ../genny-verticle-rules
mvn install -DskipTests=true

cd ../genny-rules
mvn install -DskipTests=true

cd ../qwanda-services
mvn install -DskipTests=true

cd ../wildfly-qwanda-service
mvn package -DskipTests=true
./build-docker.sh

cd ../wildfly-rulesservice
mvn package -DskipTests=true
./build-docker.sh

cd ../bridge
mvn package -DskipTests=true
./build-docker.sh

#cd ../media-proxy
#mvn package -DskipTests=true
#./build-docker.sh
cd ../genny-main
