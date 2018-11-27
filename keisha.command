#!/bin/bash
path=$1
if [ ! -z $path  ]; then
    current_dir=$1
    cd $current_dir
    echo "Kaisha will be run in 2 min from now please debug wildfly-qwanda-service in eclipse"
    sleep 120
fi


keisha_folder="../keisha"

if [ ! -d "$keisha_folder" ]; then
 echo "Git pulling keisha"
 git clone https://github.com/genny-project/keisha $keisha_folder
 cd $keisha_folder
 ./build.sh
 java -cp target/cache-server-fat.jar life.genny.map.main.ApplicationMain
else
 cd $keisha_folder
 ./build.sh
 java -cp $keisha_folder/target/cache-server-fat.jar life.genny.map.main.ApplicationMain
fi
