#!/bin/bash

parentdir="$(dirname `pwd`)"
for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules bridge media-proxy messages notes shleemy prj_genny genny-proxy
do
    echo $value
    cd $parentdir/$value
    mvn clean
done

cd $parentdir/genny-main
