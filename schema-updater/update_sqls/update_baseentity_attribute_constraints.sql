ALTER TABLE baseentity_attribute ADD CONSTRAINT UNIQUE KEY `unique_key` (`ATTRIBUTE_ID`,`BASEENTITY_ID`);
ALTER TABLE baseentity_attribute DROP PRIMARY KEY;
ALTER TABLE baseentity_attribute ADD CONSTRAINT pri_key PRIMARY KEY (`attributeCode`,`baseEntityCode`,`realm`);
