#!/bin/bash

ver=$1
if [ -z $ver ]; then
	echo "Usage ./cyrusClone.sh <ver>"
	echo "e.g   ./cyrusClone.sh 10.0.0"
	exit 1
fi

git pull
docker pull gennyproject/dummy:latest
docker pull gennyproject/rulesservice:dummy
docker pull gennyproject/wildfly:${ver}

cd ..

echo "Cloning from genny-project"

for value in qwanda  qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules  media-proxy messages  notes shleemy alyson prj_genny genny-proxy bootq   gennyq genny-test-service
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
