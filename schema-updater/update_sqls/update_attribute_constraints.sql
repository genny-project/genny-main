ALTER TABLE attribute ADD CONSTRAINT unique_key UNIQUE KEY(id);
ALTER TABLE attribute DROP PRIMARY KEY;
ALTER TABLE attribute ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);
ALTER TABLE attribute MODIFY dtype VARCHAR(31);
