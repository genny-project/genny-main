#!/bin/bash
set -e

clean=$1
parentdir="$(dirname `pwd`)"
#sdk use java g21.0.0.r11-grl


# clean and build package
for value in qwanda qwandaq serviceq qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services    
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

#Quarkus 2.3.0 
for value in bridge fyodor dropkick lauchy 
do
    echo $value
    cd $parentdir/$value
    ./build.sh
    ./build-docker.sh
done

#clean up package only
#for value in wildfly-qwanda-service/qwanda-service-war wildfly-qwanda-service/qwanda-service-ear wildfly-rulesservice/rulesservice-war wildfly-rulesservice/rulesservice-ear 
#do
#    echo $value
#    cd $parentdir/$value
##   rm -Rf  $parentdir/$value/target/*
#done

# build package build docker image
for value in checkrules notes shleemy bootq genny-proxy kogitoq2 api2email adi messages
do
    echo $value
#    rm -Rf  $parentdir/$value/target/*
    cd $parentdir/$value
    mvn  $clean  package -DskipTests=true
#    ./build-docker.sh
done

cd $parentdir/genny-main
echo "Finished Building all"
./say.sh "Completed Building All. Now building docker"

for value in checkrules notes shleemy bootq genny-proxy kogitoq2 api2email
do
    echo $value
    cd $parentdir/$value
    ./build-docker.sh
done
