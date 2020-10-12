#!/bin/bash

for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules bridge media-proxy messages alyson gennyteer 
do
    echo $value
    cd ../${value} 
    git stash
    git pull
    cd ../genny-main
done

for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   cd ../$i
   git stash;git pull
   cd ../genny-main 
   echo $i
done



