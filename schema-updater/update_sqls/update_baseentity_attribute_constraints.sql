ALTER TABLE baseentity_attribute DROP CONSTRAINT FKaedpn6csuwk6uwm5kqh73tiwd;
ALTER TABLE baseentity_attribute DROP CONSTRAINT FKmqrqcxsqu49b0cliy2tymjoae;
ALTER TABLE baseentity_attribute DROP CONSTRAINT UKfhe6ytcnf3pqww35brvtadvta;
ALTER TABLE baseentity_attribute DROP CONSTRAINT unique_key;
ALTER TABLE baseentity_attribute DROP COLUMN ATTRIBUTE_ID;
ALTER TABLE baseentity_attribute DROP COLUMN BASEENTITY_ID;
ALTER TABLE baseentity_attribute DROP PRIMARY KEY;
ALTER TABLE baseentity_attribute ADD CONSTRAINT pri_key PRIMARY KEY (attributeCode,baseEntityCode,realm);
ALTER TABLE baseentity_attribute ADD COLUMN status INT NOT NULL DEFAULT 0;
UPDATE baseentity_attribute bea JOIN (SELECT realm,code,status FROM baseentity) be ON bea.realm=be.realm AND bea.baseEntityCode=be.code SET bea.status=be.status;
-- Drop status column in baseentity table only after the above update statement is successful
ALTER TABLE baseentity DROP COLUMN status;
