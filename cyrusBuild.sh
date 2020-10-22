#!/bin/bash
clean=$1
parentdir="$(dirname `pwd`)"

# switch to jdk 1.8
jdk 1.8

# clean and build package
for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services    
do
    echo $value
    sudo rm -Rf $parentdir/$value/target/*
    cd $parentdir/$value
    mvn $clean install -DskipTests=true
done


#clean up package only
for value in wildfly-qwanda-service/qwanda-service-war wildfly-qwanda-service/qwanda-service-ear wildfly-ruleservice/rulesservice-war wildfly-ruleservice/rulesservice-ear 
do
    echo $value
    cd $parentdir/$value
    sudo rm -Rf  $parentdir/$value/target/*
done

# build package build docker image
for value in wildfly-qwanda-service wildfly-ruleservice bridge checkrules media-proxy messages 
do
    echo $value
    sudo rm -Rf  $parentdir/$value/target/*
    cd $parentdir/$value
    mvn $clean package -DskipTests=true
    ./build-docker.sh
done


# build with jdk 11
# switch to jdk 11
#jdk 11
#for value in notes shleemy 
#do
#    echo $value
#    sudo rm -Rf  $parentdir/$value/target/*
#    cd $parentdir/$value
#    mvn $clean package -DskipTests=true
#    ./build-docker.sh
#done

# switch to jdk 1.8
jdk 1.8
cd $parentdir/genny-main
