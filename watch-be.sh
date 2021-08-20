#!/bin/bash
becode=$1

watch -n 1 "echo $becode;mysql -P 3310 -h 127.0.0.1 -u genny --password=password --table gennydb -e \"select attributecode,ATTRIBUTE_ID,created,IF(updated IS NULL,' ',updated) as updated,IF(valueBoolean = 0,'FALSE',IF(valueBoolean IS NULL,' ','TRUE')) as vBool,IF(valueDouble IS NULL,' ',valueDouble) as vDouble,IF (valueInteger IS NULL,' ',valueInteger) as vInteger ,IF(valueDate IS NULL,' ',valueDate) as vDate ,IF(valueDateTime IS NULL,' ',valueDateTime) as vDateTime,SUBSTRING(valueString,1,70)  from baseentity_attribute where baseentitycode = '${becode}';\""

