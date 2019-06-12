#!/bin/bash
cd ../qwanda;mvn install -DskipTests=true;
cd ../qwanda-utils;mvn install -DskipTests=true;
cd ../genny-verticle-rules;mvn install -DskipTests=true;
cd ../genny-rules;mvn install -DskipTests=true;
cd ../qwanda-services;mvn install -DskipTests=true;
cd ../wildfly-qwanda-service;./build.sh;./build-docker.sh
cd ../rulesservice;./build.sh;./build-docker.sh
cd ../genny-main;./restart.sh qwanda-service
