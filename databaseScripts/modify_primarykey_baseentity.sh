#!/bin/bash

DB_SERVER=$1
DB=$2
USERNAME=$3
PASSWORD=$4

idColumns=$(mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "SELECT column_name FROM information_schema.columns WHERE table_schema='gennydb' AND table_name='baseentity' AND column_key='PRI'")
id=" id "

if [[ $idColumns == *"$id"* ]]; then
  echo 'id is the primary key. Running schema alteration...'
  be_att_constraint=$(mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = 'gennydb' AND REFERENCED_TABLE_NAME = 'baseentity' AND TABLE_NAME='baseentity_attribute';"
  IFS=' ' read -r -a arr <<< "$be_att_constraint"
  be_att_constraint_name=${arr[1]}
  be_be_constraint=$(mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = 'gennydb' AND REFERENCED_TABLE_NAME = 'baseentity' AND TABLE_NAME='baseentity_baseentity';"
  IFS=' ' read -r -a arr <<< "$be_be_constraint"
  be_be_constraint_name=${arr[1]}
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "DROP TABLE answerlinks;"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "DROP TABLE context;"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity_attribute DROP CONSTRAINT ${be_att_constraint_name};"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity_baseentity DROP CONSTRAINT ${be_be_constraint_name};"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity MODIFY COLUMN id BIGINT AUTO_INCREMENT;"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity ADD CONSTRAINT unique_id UNIQUE(id);"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity_attribute ADD CONSTRAINT FKmqrqcxsqu49b0cliy2tymjoae FOREIGN KEY (BASEENTITY_ID) REFERENCES baseentity(id);"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity_baseentity ADD CONSTRAINT FK5wx1avqnhbiguv2x4a2350hkj FOREIGN KEY (SOURCE_ID) REFERENCES baseentity(id);"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity DROP PRIMARY KEY;"
  mysql --host=$DB_SERVER --user=$USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);"
else
  echo 'id is not the primary key. Nothing to be done. Goodbye!'
fi
