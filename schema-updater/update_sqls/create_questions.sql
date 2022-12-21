INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "attributeCode");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "directions");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "helper");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "html");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "icon");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "mandatory");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "oneshot");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "placeholder");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "readonly");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "attribute_id");


INSERT INTO baseentity (dtype, realm, code, name, created, updated, status, capreqs) 
SELECT dtype, realm, code, name, created, updated, status, capreqs from question;

INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs) 
SELECT 'attributeCode',q.code,q.created,q.realm,q.updated,null,null,null,null,null,null,null,q.attributeCode,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "attributeCode";
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'directions',q.code,q.created,q.realm,q.updated,null,null,null,null,null,null,null,q.directions,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "directions";
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'helper',q.code,q.created,q.realm,q.updated,null,null,null,null,null,null,null,q.helper,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "helper";
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'html',q.code,q.created,q.realm,q.updated,null,null,null,null,null,null,null,q.html,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "html";
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'icon',q.code,q.created,q.realm,q.updated,null,null,null,null,null,null,null,q.icon,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "icon"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'mandatory',q.code,q.created,q.realm,q.updated,mandatory,null,null,null,null,null,null,null,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "mandatory"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'oneshot',q.code,q.created,q.realm,q.updated,oneshot,null,null,null,null,null,null,null,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "oneshot"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'placeholder',q.code,q.created,q.realm,q.updated,null,null,null,null,null,null,null,q.placeholder,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "placeholder"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'readonly',q.code,q.created,q.realm,q.updated,readonly,null,null,null,null,null,null,null,null,null, a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "readonly"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'attribute_id',q.code,q.created,q.realm,q.updated,null,null,null,null,null,attribute_id,null,null,null,null,a.id,b.id,q.capreqs from question q, baseentity b, attribute a where q.realm = b.realm and q.code = b.code and a.realm = q.realm and a.code = "attribute_id";  

INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "parentCode");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "childCode");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "createOnTrigger");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "dependency");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "disabled");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "formTrigger");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "hidden");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "version");
INSERT INTO attribute (dType, realm, code) VALUES ("Attribute", "lojing", "weight");

INSERT INTO baseentity (dtype, realm, code, name, created, updated, status, capreqs)
SELECT 'QuestionQuestion', realm, concat(sourceCode,'|',targetCode), concat(sourceCode,'|',targetCode), created, updated, 0, capreqs from question_question;

INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'parentCode',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,null,null,null,null,null,null,null,sourceCode,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "parentCode";
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'childCode',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,null,null,null,null,null,null,null,targetCode,null,null, a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "childCode";
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'createOnTrigger',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,createOnTrigger,null,null,null,null,null,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "createOnTrigger"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID, capreqs)
SELECT 'dependency',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,null,null,null,null,null,null,null,dependency,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "dependency"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'disabled',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,disabled,null,null,null,null,null,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "disabled"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'formTrigger',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,formTrigger,null,null,null,null,null,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "formTrigger"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'hidden',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,hidden,null,null,null,null,null,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "hidden"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'icon',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,null,null,null,null,null,null,null,qq.icon,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "icon"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'mandatory',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,qq.mandatory,null,null,null,null,null,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "mandatory"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'oneshot',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,qq.oneshot,null,null,null,null,null,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "oneshot"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'readonly',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,qq.readonly,null,null,null,null,null,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "readonly"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'version',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,null,null,null,null,null,`version`,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "version"; 
INSERT INTO baseentity_attribute (attributeCode, baseEntityCode, created, realm, updated, valueBoolean, valueDate, valueDateTime, valueDouble, valueInteger, valueLong, money, valueString, valueTime, weight,ATTRIBUTE_ID,BASEENTITY_ID,capreqs)
SELECT 'weight',CONCAT(sourceCode,'|',targetCode),qq.created,qq.realm,qq.updated,null,null,null,weight,null,null,null,null,null,null,a.id,b.id,qq.capreqs from question_question qq, question q, baseentity b, attribute a where qq.SOURCE_ID = q.id and b.code = CONCAT(qq.sourceCode, '|', qq.targetCode) and q.realm = b.realm and a.code = "weight"; 
