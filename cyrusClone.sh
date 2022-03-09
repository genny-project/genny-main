#!/bin/bash

ver=$1

git pull
docker pull gennyproject/dummy:latest
docker pull gennyproject/rulesservice:dummy
docker pull gennyproject/wildfly:${ver}

cd ..

echo "Cloning from genny-project"

for value in qwanda qwandaq serviceq qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules lauchy adi dropkick bridge media-proxy messages fyodor notes shleemy alyson prj_genny genny-proxy bootq  kogitoq kogitoq2
do
    echo $value
    git clone -b ${ver} git@github.com:genny-project/$value
done

echo "Cloning from OutcomeLife"

for value in prj_internmatch prj_mentormatch prj_stt prj_lojing gennyteer api2email
do
    echo $value
    git clone -b ${ver} git@github.com:OutcomeLife/$value
done


cd genny-main
