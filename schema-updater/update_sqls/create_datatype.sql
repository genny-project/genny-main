-- gennydb.`datatype` definition

CREATE TABLE IF NOT EXISTS datatype (
  realm varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  dttcode varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  classname varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  component varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  inputmask varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  validation_codes varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (realm,dttcode)
) ENGINE=InnoDB AUTO_INCREMENT=7092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO datatype (realm, dttcode, classname, component, inputmask, validation_codes)
SELECT distinct realm, dttcode, classname, component, inputmask, SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) AS validation_codes  
FROM `attribute` WHERE dttcode IS NOT NULL AND component IS NOT NULL AND 
SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) IS NOT NULL;

INSERT INTO datatype (realm, dttcode, classname, component, inputmask, validation_codes)
SELECT distinct realm, dttcode, classname, 'text', inputmask, SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) AS validation_codes 
FROM `attribute` WHERE dttcode IS NOT NULL AND component IS NULL AND 
SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) IS NOT NULL;

