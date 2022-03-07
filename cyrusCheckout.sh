#!/bin/bash

parentdir="$(dirname `pwd`)"
VER=$1

for value in qwanda qwandaq serviceq qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules lauchy dropkick bridge media-proxy messages fyodor notes shleemy  alyson gennyteer bootq kogitoq kogitoq2
do
    echo $value
    cd $parentdir/${value}
    git stash
    git checkout $VER
done

for i in ` find .. -mindepth 1 -maxdepth 1 -type d | grep prj  | awk -F "/" '{ print $2 }'`;do
   echo $i
   cd $parentdir/$i
   git stash
   git checkout $VER
done
