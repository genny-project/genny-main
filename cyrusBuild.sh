#!/bin/bash
set -e

clean=$1
parentdir="$(dirname `pwd`)"
#sdk use java g21.0.0.r11-grl


# clean and build package
for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services    
do
    echo $value
#    rm -Rf $parentdir/$value/target/*
    cd $parentdir/$value
    mvn $clean install -DskipTests=true
done


#clean up package only
#for value in wildfly-qwanda-service/qwanda-service-war wildfly-qwanda-service/qwanda-service-ear wildfly-rulesservice/rulesservice-war wildfly-rulesservice/rulesservice-ear 
#do
#    echo $value
#    cd $parentdir/$value
##   rm -Rf  $parentdir/$value/target/*
#done

# build package build docker image
for value in    checkrules  messages notes shleemy bootq genny-proxy  
do
    echo $value
#    rm -Rf  $parentdir/$value/target/*
    cd $parentdir/$value
    ./mvnw  $clean  package -DskipTests=true
    ./build-docker.sh
done

#Quarkus 2.3.0 
for value in  bridge lauchy 
do
    echo $value
    cd $parentdir/$value
    ./build-docker.sh
done

# build package build docker image
for value in wildfly-qwanda-service wildfly-rulesservice 
do
    echo $value
#    sudo rm -Rf  $parentdir/$value/target/*
    cd $parentdir/$value
    mvn $clean package -DskipTests=true
    ./build-docker.sh
done

cd $parentdir/genny-main
echo "Finished Building all"

if [[ "$OSTYPE" == "darwin"* ]]; then
    os_type="mac"
    say "Completed building all"
fi
