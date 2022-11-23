#!/bin/bash
#
#
echo "The latest Genny Database backups:"
DATE=`date +"%Y_%m_%d"`
List=`aws s3 ls internmatch-backups/interns-backup/${DATE}/`
if [[ "X${List}" == "X" ]]; then
	DATE=`date --date="yesterday" +"%Y_%m_%d"`
	aws s3 ls internmatch-backups/interns-backup/${DATE}/
else
	aws s3 ls internmatch-backups/interns-backup/${DATE}/
fi
