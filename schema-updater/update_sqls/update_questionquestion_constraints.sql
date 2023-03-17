ALTER TABLE question_question DROP CONSTRAINT FK9nex8vynu3g1w30v78he4kpwd;
ALTER TABLE question_question DROP PRIMARY KEY;
ALTER TABLE question_question ADD CONSTRAINT pri_key PRIMARY KEY (realm,sourceCode,targetCode);
ALTER TABLE question_question DROP COLUMN source_id;
