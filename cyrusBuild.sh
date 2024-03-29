#!/bin/bash
set -e
clean=$1
parentdir="$(dirname `pwd`)"

# clean and build package
for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services    
do
    echo $value
    cd $parentdir/$value
    mvn $clean install -DskipTests=true
done

# build rulesservice
for value in wildfly-rulesservice 
do
    echo $value
    cd $parentdir/$value
    mvn $clean package -DskipTests=true
    ./build-docker.sh
done

# Build Genny Services
cd $parentdir/gennyq
./build.sh
./build-docker.sh

# build package build docker image
for value in checkrules bootq genny-proxy api2email 
do
    echo $value
    cd $parentdir/$value
    mvn  $clean  package -DskipTests=true
    ./build-docker.sh
done

cd $parentdir/gennyq/kogitoq/gadaq
./build.sh && ./build-docker.sh
cd $parentdir/genny-main

./cyrusBuildProducts.sh

cd $parentdir/genny-main
echo "Finished Building all"
./say.sh "Completed Building  all"

