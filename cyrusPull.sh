#!/bin/bash

parentdir="$(dirname `pwd`)"

for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules lauchy bridge media-proxy messages notes shleemy  sienna alyson gennyteer bootq
do
    echo $value
    cd $parentdir/${value}
    git stash
    git pull
done

for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   echo $i
   cd $parentdir/$i
   git stash;git pull
done
