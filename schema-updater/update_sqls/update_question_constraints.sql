ALTER TABLE question DROP PRIMARY KEY;
ALTER TABLE question DROP CONSTRAINT FKc8891u9mg0doemnwfxov4e1w2; 
ALTER TABLE question ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);
ALTER TABLE question DROP COLUMN dtype;
ALTER TABLE question DROP COLUMN id;
ALTER TABLE question DROP COLUMN attribute_id;
