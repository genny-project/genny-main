-- gennydb.`datatype` definition

CREATE TABLE IF NOT EXISTS datatype (
  realm varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  dttcode varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  classname varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  component varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  inputmask varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (realm,dttcode)
) ENGINE=InnoDB AUTO_INCREMENT=7092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO datatype (realm, dttcode, classname, component, inputmask)
SELECT DISTINCT realm, dttcode, classname, component, inputmask FROM `attribute` WHERE dttcode IS NOT NULL AND component IS NOT NULL;

INSERT INTO datatype (realm, dttcode, classname, component, inputmask)
SELECT DISTINCT realm, dttcode, classname, 'text', inputmask FROM `attribute` WHERE dttcode IS NOT NULL AND component IS NULL;
