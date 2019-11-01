#!/bin/bash
today=`date '+%Y_%m_%d__%H_%M_%S'`;
filename="genny-$today.bz2"
echo $filename;
mysqldump  --single-transaction --order-by-primary --tz-utc --opt  -P 3310 -h 127.0.0.1 -u genny --password=password --databases gennydb  -r  ../backup.sql 
tar cvfj  ../$filename  ../backup.sql

