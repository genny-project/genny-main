#!/bin/bash
today=`date '+%Y_%m_%d__%H_%M_%S'`;
filename="genny-$today.bz2"
echo $filename;
mysqldump  --single-transaction --order-by-primary --tz-utc --opt  -P 3311 -h 127.0.0.1 -u admin --password=password --databases keycloak  -r  ../keycloak-local.sql 
tar cvfj  ../$filename  ../backup.sql

