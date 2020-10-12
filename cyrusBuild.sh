#!/bin/bash
clean=$1
for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services    
do
    echo $value
    sudo rm -Rf  ../$value/target/*
    cd ../$value
    mvn $clean install -DskipTests=true
    cd genny-main
done

for value in wildfly-qwanda-service/qwanda-service-war wildfly-qwanda-service/qwanda-service-ear wildfly-ruleservice/rulesservice-war wildfly-ruleservice/rulesservice-ear 
do
    echo $value
    cd ../$value
    sudo rm -Rf  ../$value/target/*
    cd genny-main
done

for value in wildfly-qwanda-service wildfly-ruleservice bridge checkrules media-proxy messages 
do
    echo $value
    sudo rm -Rf  ../$value/target/*
    cd ../$value
    mvn $clean package -DskipTests=true
    ./build-docker.sh
    cd genny-main
done

