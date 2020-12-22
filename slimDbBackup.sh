#!/bin/bash
if [[ -z $1 ]];then
    me=`basename "$0"`
    echo "You need pass db backup path as argument, usage ./$me SQL_FILE_PATH"
    exit 1
fi

path=$1
DATE=`date +%Y_%m_%d-%H_%M`

sed '/INSERT INTO `NodeInstanceLog`/d' $path | sed '/INSERT INTO `ProcessInstanceInfo`/d' |sed '/INSERT INTO `WorkItemInfo`/d' |sed '/INSERT INTO `VariableInstanceLog`/d' > reduced_${DATE}.sql
