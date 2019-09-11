#!/bin/bash
cd ../qwanda
mvn clean install -DskipTests=true
cd ../qwanda-utils
mvn clean install -DskipTests=true
cd ../genny-verticle-rules
mvn clean install -DskipTests=true
cd ../genny-rules
mvn clean install -DskipTests=true
cd ../qwanda-services
mvn clean install -DskipTests=true
cd ../wildfly-qwanda-service
mvn clean package -DskipTests=true
./build-docker.sh
cd ../wildfly-rulesservice
mvn clean package -DskipTests=true
./build-docker.sh
cd ../bridge
mvn clean package -DskipTests=true
./build-docker.sh

cd ../media-proxy
mvn clean package -DskipTests=true
./build-docker.sh
