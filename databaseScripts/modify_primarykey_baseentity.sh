#!/bin/bash

DB=$1
USERNAME=$2
PASSWORD=$3

idColumns=$(mysql -u $USERNAME --password=$PASSWORD $DB -e "select column_name from information_schema.columns where table_schema='gennydb' and table_name='baseentity' and column_key='PRI'")
id=" id "

if [[ $idColumns == *"$id"* ]]; then
  echo 'id is the primary key. Running schema alteration...'
  mysql -u $USERNAME --password=$PASSWORD $DB -e "DROP TABLE answerlinks;"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "DROP TABLE context;"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity_attribute DROP CONSTRAINT FKmqrqcxsqu49b0cliy2tymjoae;"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity_baseentity DROP CONSTRAINT FK5wx1avqnhbiguv2x4a2350hkj;"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity MODIFY COLUMN id BIGINT AUTO_INCREMENT;"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity ADD CONSTRAINT unique_id UNIQUE(id);"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity_attribute ADD CONSTRAINT FKmqrqcxsqu49b0cliy2tymjoae FOREIGN KEY (BASEENTITY_ID) REFERENCES baseentity(id);"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity_baseentity ADD CONSTRAINT FK5wx1avqnhbiguv2x4a2350hkj FOREIGN KEY (SOURCE_ID) REFERENCES baseentity(id);"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity DROP PRIMARY KEY;"
  mysql -u $USERNAME --password=$PASSWORD $DB -e "ALTER TABLE baseentity ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);"
else
  echo 'id is not the primary key. Nothing to be done. Goodbye!'
fi
