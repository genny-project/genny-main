ALTER TABLE validation ADD CONSTRAINT unique_key UNIQUE KEY(id);
ALTER TABLE validation DROP PRIMARY KEY;
ALTER TABLE validation ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);
ALTER TABLE validation DROP COLUMN dtype;
ALTER TABLE validation DROP COLUMN id;