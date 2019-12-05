#!/bin/bash
cd ..
docker-compose -f docker-compose-mysql.yml up -d
cd  databaseScripts
sleep 10
mysql  --default-character-set=utf8mb4  -P 3310 -h 127.0.0.1 -u genny --password=password  gennydb  <  ../../restore.sql 
cd ..
docker-compose -f docker-compose-mysql.yml down 
cd  databaseScripts

