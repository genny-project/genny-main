#!/bin/bash
parentdir="$(dirname `pwd`)"
clean=$1

<<<<<<< HEAD
echo "Building qwandaq"
cd $parentdir/qwandaq
mvn $clean install -DskipTests=true

echo "Building serviceq"
cd $parentdir/serviceq
mvn $clean install -DskipTests=true

for service in fyodor lauchy messages dropkick kogitoq2 adi; do
        echo $service
        cd $parentdir/$service
        mvn $clean install -DskipTests=true
        ./build-docker.sh
=======
for service in serviceq fyodor lauchy messages dropkick kogitoq2 adi; do
	echo $service
	cd $parentdir/$service
	mvn $clean install -DskipTests=true
>>>>>>> 10.0.0
done
./say.sh "Completed Building Services"
