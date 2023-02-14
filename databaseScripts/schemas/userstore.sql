-- gennydb.`userstore` definition

CREATE TABLE IF NOT EXISTS userstore (
  realm varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  usercode varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  jti_access varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  last_active bigint,
  PRIMARY KEY (realm,usercode)
) ENGINE=InnoDB AUTO_INCREMENT=7092 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;