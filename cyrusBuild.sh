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

# build package build docker image
for value in wildfly-qwanda-service wildfly-rulesservice 
do
    echo $value
#    sudo rm -Rf  $parentdir/$value/target/*
    cd $parentdir/$value
    mvn $clean package -DskipTests=true
    ./build-docker.sh
done


# build package build docker image
for value in checkrules notes bootq genny-proxy api2email 
do
    echo $value
#    rm -Rf  $parentdir/$value/target/*
    cd $parentdir/$value
    mvn  $clean  package -DskipTests=true
#    ./build-docker.sh
done


for value in checkrules notes  bootq genny-proxy api2email
do
    echo $value
    cd $parentdir/$value
    ./build-docker.sh
done

# Build Genny Services
cd $parentdir/gennyq
./build-docker.sh

#cd $parentdir/gennyq/kogitoq/extended/travels
#./build.sh;./build-docker.sh

cd $parentdir/genny-main
echo "Finished Building all"
./say.sh "Completed Building All. Now building docker"
