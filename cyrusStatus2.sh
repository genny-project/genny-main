#!/bin/bash

ver=7.18.0

cd ../qwanda;echo $PWD;git branch;git status | grep '*'
cd ../qwanda-utils;echo $PWD;git branch;git status | grep '*'
cd ../genny-verticle-rules;echo $PWD;git branch;git status| grep '*'
cd ../bootxport;echo $PWD;git branch;git status| grep '*'
cd ../qwanda-services;echo $PWD;git branch;git status| grep '*'
cd ../genny-rules;echo $PWD;git branch;git status| grep '*'
cd ../wildfly-rulesservice;echo $PWD;git branch;git status| grep '*'
#cd ../rulesservice;echo $PWD;git branch;git status| grep '*'
cd ../wildfly-qwanda-service;echo $PWD;git branch;git status| grep '*'
cd ../checkrules;echo $PWD;git branch;git status| grep '*'
cd ../bridge;echo $PWD;git branch;git status| grep '*'
cd ../media-proxy;echo $PWD;git branch;git status| grep '*'
cd ../messages;echo $PWD;git branch;git status| grep '*'
cd ../prj_genny;echo $PWD;git branch;git status| grep '*'
cd ../genny-main
