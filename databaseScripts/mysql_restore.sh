#!/bin/bash
filename=$1
if [[ -z $filename ]];
then
    echo `date`" - Missing mandatory restore filename bz (in the ../../ dir). "
    echo `date`" - Usage: ./mysql_restore.sh  [filename]  "
    echo `date`" - files available:  "`ls ../../genny*bz2`
    exit 1
fi
name=$(echo "$filename" | cut -f 1 -d '.')
#bunzip2 -d  ./genny-2019_11_11__14_26_22.bz2
bunzip2 -d ../../$filename 
mv ../../$name ../../restore.sql 
mysql  --default-character-set=utf8mb4  -P 3310 -h 127.0.0.1 -u genny --password=password  gennydb  <  ../../restore.sql 

