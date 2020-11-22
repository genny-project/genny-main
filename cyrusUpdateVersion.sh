#!/bin/bash

ver=7.6.0


git pull
docker pull gennyproject/dummy:latest
docker pull gennyproject/rulesservice:dummy
docker pull gennyproject/wildfly:${ver}


for value in qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly-rulesservice wildfly-qwanda-service checkrules bridge media-proxy messages alyson gennyteer prj_genny   
do
    echo $value
    cd ../$value;git checkout -b ${ver} https://github.com/genny-project/$value
    cd genny-main
done

for value in prj_internmatch prj_stt   
do
    echo $value
    cd ../$value;git checkout -b ${ver} https://github.com/OutcomeLife/$value
    cd genny-main
done

