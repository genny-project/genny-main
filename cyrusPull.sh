#!/bin/bash

parentdir="$(dirname `pwd`)"

for value in qwanda qwandaq qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules lauchy dropkick bridge media-proxy messages fyodor notes shleemy  alyson  bootq kogitoq
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
