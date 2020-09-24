#!/bin/bash

DATE=$(date +%Y_%m_%d)
latestBackup=$(aws s3 ls s3://internmatch-backups/interns-backup/$DATE/  | tail -1 | awk '{print $4}')
aws s3 cp s3://internmatch-backups/interns-backup/$DATE/$latestBackup .

tar xvf $latestBackup

rm $latestBackup
