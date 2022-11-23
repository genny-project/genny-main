ALTER TABLE baseentity ADD CONSTRAINT unique_key UNIQUE KEY(id);
ALTER TABLE baseentity DROP PRIMARY KEY;
ALTER TABLE baseentity ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);
