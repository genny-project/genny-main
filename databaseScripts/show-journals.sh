#!/bin/bash


sql="select ea.baseentityCode,ea.attributeCode,IFNULL(ea.valueDate,'') as valueDate,IFNULL(ea.valueDouble,'') as valueDouble,IFNULL(ea.valueBoolean+0,'') as valueBoolean,SUBSTRING(REPLACE(ea.valueString,'\n',''),1,40) as ValueString,SUBSTRING(eb.valueString,3,LENGTH(eb.valueString)-4) as Intern,ec.valueString as Mobile from baseentity_attribute ea,baseentity_attribute eb,baseentity_attribute ec  where ea.baseentityCode like 'JNL_%20200504' and ea.baseentityCode=eb.baseentityCode and eb.attributeCode='LNK_INTERN' and ec.baseentityCode=SUBSTRING(eb.valueString,3,LENGTH(eb.valueString)-4) and ec.attributeCode='PRI_DEVICE_TYPE'  order by ea.baseentityCode ASC,ea.attributeCode ASC;"

echo $sql
mysql -P 3310 -h 127.0.0.1 -u genny --password=password gennydb -e "${sql}" 
