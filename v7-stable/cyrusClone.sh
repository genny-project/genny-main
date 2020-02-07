#!/bin/bash

ver=v7-stable


git pull

cd ..
git clone -b ${ver} https://github.com/genny-project/qwanda
git clone -b ${ver} https://github.com/genny-project/qwanda-utils
git clone -b ${ver} https://github.com/genny-project/genny-verticle-rules
git clone -b ${ver} https://github.com/genny-project/genny-rules 
git clone -b ${ver} https://github.com/genny-project/qwanda-services 
git clone -b ${ver} https://github.com/genny-project/bootxport 
git clone -b ${ver} https://github.com/genny-project/wildfly-rulesservice 
git clone -b ${ver} https://github.com/genny-project/wildfly-qwanda-service 
git clone -b ${ver} https://github.com/genny-project/prj_genny 
git clone -b ${ver} https://github.com/genny-project/rulesservice
git clone -b ${ver} https://github.com/genny-project/bridge
git clone -b ${ver} https://github.com/genny-project/media-proxy
git clone -b ${ver} https://github.com/genny-project/messages
git clone -b ${ver} https://github.com/genny-project/alyson-v7

cd genny-main

