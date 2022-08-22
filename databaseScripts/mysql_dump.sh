#!/bin/bash
today=`date '+%Y_%m_%d__%H_%M_%S'`;
filename="genny-$today.bz2"
echo $filename;
mysqldump  --default-character-set=utf8mb4   --single-transaction --order-by-primary --tz-utc --opt  -P 3310 -h 127.0.0.1 -u root --password=password --databases gennydb  -r  ../../backup.sql 
bzip2 -c ../../backup.sql > ../../$filename 
#tar cvfj  ../../$filename  ../../backup.sql

