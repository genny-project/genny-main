ALTER TABLE question_question ADD CONSTRAINT unique_key UNIQUE KEY(`SOURCE_ID`,`sourceCode`,`targetCode`);
ALTER TABLE question_question DROP PRIMARY KEY;
ALTER TABLE question_question ADD CONSTRAINT pri_key PRIMARY KEY (realm,sourceCode,targetCode);
ALTER TABLE question_question MODIFY SOURCE_ID bigint;
