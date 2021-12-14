#!/bin/bash

ver=$1

git pull
docker pull gennyproject/dummy:latest
docker pull gennyproject/rulesservice:dummy
docker pull gennyproject/wildfly:${ver}

cd ..

for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules lauchy dropkick bridge media-proxy messages fyodor notes shleemy alyson gennyteer prj_genny genny-proxy bootq  
do
    echo $value
    git clone -b ${ver} https://github.com/genny-project/$value
done

for value in prj_internmatch prj_mentormatch prj_stt
do
    echo $value
    git clone -b ${ver} git@github.com:OutcomeLife/$value
done


cd genny-main
