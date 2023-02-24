ALTER TABLE baseentity_attribute RENAME baseentity_attribute_bkp;

CREATE TABLE `baseentity_attribute` (
  `attributeCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `baseEntityCode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `confirmationFlag` bit(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `inferred` bit(1) DEFAULT NULL,
  `privacyFlag` bit(1) DEFAULT NULL,
  `readonly` bit(1) DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `valueBoolean` bit(1) DEFAULT NULL,
  `valueDate` date DEFAULT NULL,
  `valueDateTime` datetime(6) DEFAULT NULL,
  `valueDouble` double DEFAULT NULL,
  `valueInteger` int DEFAULT NULL,
  `valueLong` bigint DEFAULT NULL,
  `money` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `valueString` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `valueTime` time DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `ATTRIBUTE_ID` bigint NOT NULL,
  `BASEENTITY_ID` bigint NOT NULL,
  `capreqs` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`realm`,`baseEntityCode`,`attributeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO baseentity_attribute (ATTRIBUTE_ID,attributeCode,BASEENTITY_ID,baseEntityCode,capreqs,confirmationFlag,created,icon,inferred,money,privacyFlag,readonly,realm,updated,valueBoolean,valueDate,valueDateTime,valueDouble,valueInteger,valueLong,valueString,valueTime,weight)
SELECT ATTRIBUTE_ID,attributeCode,BASEENTITY_ID,baseEntityCode,capreqs,confirmationFlag,created,icon,inferred,money,privacyFlag,readonly,realm,updated,valueBoolean,valueDate,valueDateTime,valueDouble,valueInteger,valueLong,valueString,valueTime,weight FROM baseentity_attribute_bkp;

