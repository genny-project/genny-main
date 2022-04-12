#!/bin/bash
parentdir="$(dirname `pwd`)"
clean=$1

echo "Building qwandaq"
cd $parentdir/qwandaq
mvn $clean install -DskipTests=true

echo "Building serviceq"
cd $parentdir/serviceq
mvn $clean install -DskipTests=true

for service in fyodor lauchy messages dropkick gennyq adi; do
        echo $service
        cd $parentdir/$service
        mvn $clean install -DskipTests=true
        ./build-docker.sh
done
./say.sh "Completed Building Services"
