#!/bin/bash

if [ $# -ne 2 ]
then
   echo "usage: ./watch-be.sh  <productCode> <target>"
   echo "Direct code : e.g. ./watch-be.sh gadatron PER_67537657365728 "
   echo "Email : e.g. ./watch-be.sh gadatron cyrus@frontend.com "
   echo "Simple search: e.g. ./watch-be.sh gadatron Cyrus "
   exit;
fi


productCode=${1:-gadatron}
becode=$2
ip='10.123.123.123'
underline='_'

echo $becode
strindex() {
  X="${1%%$2*}"
  [[ "$X" = "$1" ]] && echo -1 || echo "$[ ${#X} + 1 ]"
}

UNDERLINEPOSITION=`strindex "$becode" "$underline"`

if [[ $becode == *"@"* ]]; then
  echo "It's an email"
      becode=`mysql -P 3310 -h ${ip} -u genny --password=password -s  gennydb -e "select baseentitycode  from baseentity_attribute where realm='${productCode}' and attributeCode='PRI_EMAIL' and baseentitycode like 'PER_%' and  valueString like '%${becode}%' LIMIT 1;"`
else
  if  [[ $UNDERLINEPOSITION  == 4 ]]; then
       echo "It's a be code"
  else
       echo "It's a person lookup ${becode}"
      becode=`mysql -P 3310 -h ${ip} -u genny --password=password -s  gennydb -e "select baseentitycode  from baseentity_attribute where  realm='${productCode}' and attributeCode='PRI_NAME' and baseentitycode like 'PER_%' and  valueString like '%${becode}%' LIMIT 1;"`
  fi
fi

echo $becode
watch -n 1 "mysql  -P 3310 -h $ip --user=genny  --password=password --table gennydb -e \"select code,created,IF(updated IS NULL,' ',updated) as Updated,IF(name IS NULL,' ',name) as vName,ELT( status+1,'ACTIVE','TEMPORARY','TEST','PENDING','DISABLED','ARCHIVED','PENDING_DELETE','DELETED')  as Status   from  baseentity where   realm='${productCode}' and code = '${becode}';\";mysql  -P 3310 -h $ip --user=genny  --password=password --table gennydb -e \"select attributecode,ATTRIBUTE_ID,created,IF(updated IS NULL,' ',updated) as Updated,IF(valueBoolean = 0,'FALSE',IF(valueBoolean IS NULL,' ','TRUE')) as vBool,IF(valueDouble IS NULL,' ',valueDouble) as vDouble,IF (valueInteger IS NULL,' ',valueInteger) as vInteger ,IF(valueDate IS NULL,' ',valueDate) as vDate ,IF(valueDateTime IS NULL,' ',valueDateTime) as vDateTime,CONCAT('(',SUBSTRING(valueString,1,75),')') as vString  from baseentity_attribute where  realm='${productCode}' and baseentitycode = '${becode}';\"" 

