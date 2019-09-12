#!/bin/bash

ver=v3.0.0


git pull
docker pull gennyproject/dummy:latest
docker pull gennyproject/rulesservice:dummy
docker pull gennyproject/wildfly-rulesservice:dummy
docker pull gennyproject/wildfly:${ver}

cd ..
git clone -b ${ver} https://github.com/genny-project/qwanda
git clone -b ${ver} https://github.com/genny-project/qwanda-utils
git clone -b ${ver} https://github.com/genny-project/genny-verticle-rules
git clone -b ${ver} https://github.com/genny-project/genny-rules
git clone -b ${ver} https://github.com/genny-project/qwanda-services
git clone -b ${ver} https://github.com/genny-project/wildfly-rulesservice
git clone -b ${ver} https://github.com/genny-project/wildfly-qwanda-service
git clone -b ${ver} https://github.com/genny-project/prj_genny
git clone -b ${ver} https://github.com/genny-project/checkrules
git clone -b ${ver} https://github.com/genny-project/rulesservice
git clone -b ${ver} https://github.com/genny-project/bridge
git clone -b ${ver} https://github.com/genny-project/media-proxy
git clone -b ${ver} https://github.com/genny-project/messages
git clone -b ${ver} https://github.com/genny-project/media-proxy
git clone -b ${ver} https://github.com/genny-project/alyson-v7
git clone -b ${ver} https://github.com/genny-project/gennyteer

cd genny-main

