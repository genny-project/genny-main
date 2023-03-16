ALTER TABLE attribute DROP PRIMARY KEY;
ALTER TABLE attribute ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);
ALTER TABLE attribute DROP COLUMN dtype;
ALTER TABLE attribute DROP COLUMN id;
ALTER TABLE attribute DROP COLUMN className;
ALTER TABLE attribute DROP COLUMN inputmask;
ALTER TABLE attribute DROP COLUMN typeName;
ALTER TABLE attribute DROP COLUMN validation_list;
