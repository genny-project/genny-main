ALTER TABLE question DROP CONSTRAINT unique_key;
ALTER TABLE question DROP PRIMARY KEY;
ALTER TABLE question ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);
ALTER TABLE question MODIFY dtype VARCHAR(31);
ALTER TABLE question DROP COLUMN attribute_id;
