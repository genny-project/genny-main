#!/bin/bash

ip=$1
if [[ -z $ip ]];then
        echo "Please pass your ip as argument, e.g ./restore-latest-db.sh 192.168.1.2"
        exit 1
fi

DATE=$(date +%Y_%m_%d)
latestBackup=$(aws s3 ls s3://internmatch-backups/interns-backup/$DATE/  | tail -1 | awk '{print $4}')
aws s3 cp s3://internmatch-backups/interns-backup/$DATE/$latestBackup .

rm -rf tmp

tar xvf $latestBackup

db=$(ls tmp)
#sed -i '/@@GLOBAL.GTID_PURGED=/d'    tmp/$db
#sed -i '/@MYSQLDUMP_TEMP_LOG_BIN/d'   tmp/$db

mysql -h $ip -P 3310 -u genny --password=password  gennydb  -e "drop database gennydb;"
mysql -h $ip -P 3310 -u genny --password=password < tmp/$db

rm $latestBackup
