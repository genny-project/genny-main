#!/bin/bash
clean=$1

sudo rm -Rf ../qwanda/target/*
sudo rm -Rf ../qwanda-utils/target/*
sudo rm -Rf ../bootxport/target/*
sudo rm -Rf ../genny-verticle-rules/target/*
sudo rm -Rf ../genny-rules/target/*
sudo rm -Rf ../qwanda-services/target/*
sudo rm -Rf ../wildfly-qwanda-service/qwanda-service.war/target/*
sudo rm -Rf ../wildfly-qwanda-service/qwanda-service.ear/target/*
sudo rm -Rf ../wildfly-ruleservice/ruleservice.war/target/*
sudo rm -Rf ../wildfly-ruleservice/ruleservice.ear/target/*

cd ../qwanda
mvn $clean install -DskipTests=true

cd ../qwanda-utils
mvn $clean install -DskipTests=true

cd ../bootxport
mvn $clean install -DskipTests=true

cd ../genny-verticle-rules
mvn $clean install -DskipTests=true

cd ../genny-rules
mvn $clean install -DskipTests=true

cd ../qwanda-services
mvn $clean install -DskipTests=true

cd ../wildfly-qwanda-service
mvn $clean package -DskipTests=true
./build-docker.sh

cd ../wildfly-rulesservice
mvn $clean package -DskipTests=true
./build-docker.sh

cd ../bridge
mvn $clean package -DskipTests=true
./build-docker.sh

#cd ../media-proxy
#mvn package -DskipTests=true
#./build-docker.sh
cd ../genny-main
