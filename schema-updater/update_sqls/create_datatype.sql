-- gennydb.`datatype` definition

DROP TABLE IF EXISTS datatype;

CREATE TABLE IF NOT EXISTS datatype (
  realm varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  dttcode varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  classname varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  typename varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  component varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  inputmask varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  validation_codes varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (realm,dttcode)
) ENGINE=InnoDB AUTO_INCREMENT=7092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Delete old attributes
DELETE FROM baseentity_attribute WHERE ATTRIBUTE_ID IN (SELECT id FROM attribute WHERE dttCode = "DTT_LEASE_TERM" AND component = 'text');
DELETE FROM attribute WHERE dttCode = "DTT_LEASE_TERM" AND component = 'text';
DELETE FROM attribute WHERE code = 'ATT_PRI_DEFAULT_REDIRECT';

INSERT INTO datatype (realm, dttcode, classname, typename, component, inputmask, validation_codes)
SELECT distinct realm, dttcode, classname, typename, component, inputmask, SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) AS validation_codes
FROM `attribute` WHERE dttcode IS NOT NULL AND component IS NOT NULL AND
SUBSTR(validation_list, 2, POSITION('"' IN SUBSTR(validation_list, 2, CHAR_LENGTH(validation_list)))-1) IS NOT NULL;
