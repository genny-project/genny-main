#!/bin/bash
version=$1

cd ../qwanda
./build.sh $version 

cd ../qwanda-utils
./build.sh $version 

cd ../bootxport
./build.sh $version 

cd ../genny-verticle-rules
./build.sh $version 

cd ../genny-rules
./build.sh $version 

cd ../qwanda-services
./build.sh $version 

cd ../wildfly-qwanda-service
./build.sh $version 
./build-docker.sh

cd ../wildfly-rulesservice
./build.sh $version 
./build-docker.sh

cd ../bridge
./build.sh $version 
./build-docker.sh

#cd ../media-proxy
#./build-docker.sh
cd ../genny-main
