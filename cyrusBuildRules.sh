#!/bin/bash
clean=$1
parentdir="$(dirname `pwd`)"


# clean and build package
for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules    
do
    echo $value
    cd $parentdir/$value
    mvn  install -DskipTests=true
done


#clean up package only
for value in  wildfly-rulesservice/rulesservice-war
do
    echo $value
    cd $parentdir/$value
    mvn install -DskipTests=true
done

# build package build docker image
for value in   checkrules 
do
    echo $value
    cd $parentdir/$value
    mvn $clean package -DskipTests=true
    ./build-docker.sh
done

# build package build docker image
for value in wildfly-rulesservice 
do
    echo $value
    cd $parentdir/$value
    mvn $clean package -DskipTests=true
    ./build-docker.sh
done

cd $parentdir/genny-main
echo "Finished Building Rules"
./say.sh "Completed Building Rules"
