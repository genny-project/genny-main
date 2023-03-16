-- gennydb.`datatype` definition

DROP TABLE IF EXISTS datatype;

CREATE TABLE datatype (
  realm varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  code varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  classname varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  typename varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  component varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  inputmask varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  validation_codes varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (realm,code)
) ENGINE=InnoDB AUTO_INCREMENT=7092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Delete old attributes
DELETE FROM baseentity_attribute WHERE ATTRIBUTE_ID IN (SELECT id FROM attribute WHERE code = "DTT_LEASE_TERM" AND component = 'text');
DELETE FROM attribute WHERE code = "DTT_LEASE_TERM" AND component = 'text';
DELETE FROM attribute WHERE code = 'ATT_PRI_DEFAULT_REDIRECT';

INSERT INTO datatype (realm, code, classname, typename, component, inputmask, validation_codes)
SELECT distinct realm, code, classname, typename, component, inputmask, SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) AS validation_codes
FROM `attribute` WHERE code IS NOT NULL AND component IS NOT NULL AND
SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) IS NOT NULL;

INSERT INTO datatype (realm, code, classname, typename, component, inputmask, validation_codes)
SELECT DISTINCT realm, code, classname, typename, 'text', inputmask, SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) AS validation_codes 
FROM `attribute` WHERE code IS NOT NULL AND component IS NULL AND 
SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) IS NOT NULL;

