#!/bin/bash

DATE=$(date +%Y_%m_%d)
latestBackup=$(aws s3 ls s3://mentormatch-backups/mentormatch-backup/$DATE/  | tail -1 | awk '{print $4}')
aws s3 cp s3://mentormatch-backups/mentormatch-backup/$DATE/$latestBackup .

tar xvf $latestBackup

db=$(ls tmp)
#rm $latestBackup
