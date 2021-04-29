#!/bin/bash
port=3310
ip=127.0.0.1
json=`curl -s https://randomuser.me/api/`
echo $json

#mysql -P $port -h $ip -u genny --password=password gennydb -e "update baseentity_attribute set valueString = CONCAT('testuser+',substring(MD5(RAND()),1,20),'@gmail.com') where attributeCode='PRI_EMAIL';"
#mysql -P $port -h $ip -u genny --password=password gennydb -e "update baseentity_attribute set valueString = CONCAT('testuser+',substring(MD5(RAND()),1,20),' ') where attributeCode='PRI_NAME' and baseentitycode like 'CPY_%';"
