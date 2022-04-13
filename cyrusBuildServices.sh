#!/bin/bash
parentdir="$(dirname `pwd`)"
clean=$1

for service in serviceq fyodor lauchy messages dropkick kogitoq2 adi; do
	echo $service
	cd $parentdir/$service
	mvn $clean install -DskipTests=true
done
./say.sh "Completed Building Services"
