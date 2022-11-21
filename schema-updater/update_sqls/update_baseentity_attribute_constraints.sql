ALTER TABLE baseentity_attribute ADD CONSTRAINT unique_key UNIQUE KEY (ATTRIBUTE_ID,BASEENTITY_ID);
ALTER TABLE baseentity_attribute DROP PRIMARY KEY;
ALTER TABLE baseentity_attribute ADD CONSTRAINT pri_key PRIMARY KEY (realm,baseEntityCode,attributeCode);
