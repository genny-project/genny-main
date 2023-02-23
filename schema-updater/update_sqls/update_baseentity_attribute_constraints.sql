ALTER TABLE baseentity_attribute ADD CONSTRAINT unique_key UNIQUE KEY (ATTRIBUTE_ID,BASEENTITY_ID);
ALTER TABLE baseentity_attribute DROP PRIMARY KEY;
ALTER TABLE baseentity_attribute ADD CONSTRAINT pri_key PRIMARY KEY (realm,baseEntityCode,attributeCode);

-- ALTER TABLE baseentity_attribute DROP CONSTRAINT unique_key;
-- ALTER TABLE baseentity_attribute DROP CONSTRAINT FKaedpn6csuwk6uwm5kqh73tiwd;
-- ALTER TABLE baseentity_attribute DROP COLUMN attribute_id;
-- ALTER TABLE baseentity_attribute DROP CONSTRAINT FKmqrqcxsqu49b0cliy2tymjoae;
-- ALTER TABLE baseentity_attribute DROP COLUMN BASEENTITY_ID;
