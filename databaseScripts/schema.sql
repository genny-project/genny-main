-- MySQL dump 10.13  Distrib 5.7.37, for Linux (x86_64)
--
-- Host: internmatch-interns-db.ccbu50q8eoda.ap-southeast-2.rds.amazonaws.com    Database: gennydb
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `gennydb`
--


USE `gennydb`;

--
-- Table structure for table `ATTACHMENT_ID_SEQ`
--

DROP TABLE IF EXISTS `ATTACHMENT_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ATTACHMENT_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AUDIT_ID_SEQ`
--

DROP TABLE IF EXISTS `AUDIT_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUDIT_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Attachment`
--

DROP TABLE IF EXISTS `Attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attachment` (
  `id` bigint NOT NULL,
  `accessType` int DEFAULT NULL,
  `attachedAt` datetime(6) DEFAULT NULL,
  `attachmentContentId` bigint NOT NULL,
  `contentType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_size` int DEFAULT NULL,
  `attachedBy_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskData_Attachments_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_Attachment_Id` (`attachedBy_id`),
  KEY `IDX_Attachment_DataId` (`TaskData_Attachments_Id`),
  CONSTRAINT `FKd5xpm81gxg8n40167lbu5rbfb` FOREIGN KEY (`attachedBy_id`) REFERENCES `OrganizationalEntity` (`id`),
  CONSTRAINT `FKjj9psk52ifamilliyo16epwpc` FOREIGN KEY (`TaskData_Attachments_Id`) REFERENCES `Task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuditTaskImpl`
--

DROP TABLE IF EXISTS `AuditTaskImpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuditTaskImpl` (
  `id` bigint NOT NULL,
  `activationTime` datetime(6) DEFAULT NULL,
  `actualOwner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdOn` datetime(6) DEFAULT NULL,
  `deploymentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dueDate` datetime(6) DEFAULT NULL,
  `lastModificationDate` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` bigint NOT NULL,
  `priority` int NOT NULL,
  `processId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceId` bigint NOT NULL,
  `processSessionId` bigint NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taskId` bigint DEFAULT NULL,
  `workItemId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AuditTaskImpl_taskId` (`taskId`),
  KEY `IDX_AuditTaskImpl_pInstId` (`processInstanceId`),
  KEY `IDX_AuditTaskImpl_workItemId` (`workItemId`),
  KEY `IDX_AuditTaskImpl_name` (`name`),
  KEY `IDX_AuditTaskImpl_processId` (`processId`),
  KEY `IDX_AuditTaskImpl_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BAMTaskSummary`
--

DROP TABLE IF EXISTS `BAMTaskSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BAMTaskSummary` (
  `pk` bigint NOT NULL,
  `createdDate` datetime(6) DEFAULT NULL,
  `duration` bigint DEFAULT NULL,
  `endDate` datetime(6) DEFAULT NULL,
  `processInstanceId` bigint NOT NULL,
  `startDate` datetime(6) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taskId` bigint NOT NULL,
  `taskName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPTLOCK` int DEFAULT NULL,
  PRIMARY KEY (`pk`),
  KEY `IDX_BAMTaskSumm_createdDate` (`createdDate`),
  KEY `IDX_BAMTaskSumm_duration` (`duration`),
  KEY `IDX_BAMTaskSumm_endDate` (`endDate`),
  KEY `IDX_BAMTaskSumm_pInstId` (`processInstanceId`),
  KEY `IDX_BAMTaskSumm_startDate` (`startDate`),
  KEY `IDX_BAMTaskSumm_status` (`status`),
  KEY `IDX_BAMTaskSumm_taskId` (`taskId`),
  KEY `IDX_BAMTaskSumm_taskName` (`taskName`),
  KEY `IDX_BAMTaskSumm_userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BAM_TASK_ID_SEQ`
--

DROP TABLE IF EXISTS `BAM_TASK_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BAM_TASK_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BOOLEANEXPR_ID_SEQ`
--

DROP TABLE IF EXISTS `BOOLEANEXPR_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOOLEANEXPR_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BooleanExpression`
--

DROP TABLE IF EXISTS `BooleanExpression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BooleanExpression` (
  `id` bigint NOT NULL,
  `expression` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Escalation_Constraints_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BoolExpr_Id` (`Escalation_Constraints_Id`),
  CONSTRAINT `FKqth56a8k6d8pv6ngsu2vjp4kj` FOREIGN KEY (`Escalation_Constraints_Id`) REFERENCES `Escalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `COMMENT_ID_SEQ`
--

DROP TABLE IF EXISTS `COMMENT_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMENT_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONTENT_ID_SEQ`
--

DROP TABLE IF EXISTS `CONTENT_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTENT_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONTEXT_MAPPING_INFO_ID_SEQ`
--

DROP TABLE IF EXISTS `CONTEXT_MAPPING_INFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTEXT_MAPPING_INFO_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CORRELATION_KEY_ID_SEQ`
--

DROP TABLE IF EXISTS `CORRELATION_KEY_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CORRELATION_KEY_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CORRELATION_PROP_ID_SEQ`
--

DROP TABLE IF EXISTS `CORRELATION_PROP_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CORRELATION_PROP_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Content`
--

DROP TABLE IF EXISTS `Content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Content` (
  `id` bigint NOT NULL,
  `content` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContextMappingInfo`
--

DROP TABLE IF EXISTS `ContextMappingInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContextMappingInfo` (
  `mappingId` bigint NOT NULL,
  `CONTEXT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `KSESSION_ID` bigint NOT NULL,
  `OWNER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPTLOCK` int DEFAULT NULL,
  PRIMARY KEY (`mappingId`),
  KEY `IDX_CMI_Context` (`CONTEXT_ID`),
  KEY `IDX_CMI_KSession` (`KSESSION_ID`),
  KEY `IDX_CMI_Owner` (`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CorrelationKeyInfo`
--

DROP TABLE IF EXISTS `CorrelationKeyInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CorrelationKeyInfo` (
  `keyId` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceId` bigint NOT NULL,
  `OPTLOCK` int DEFAULT NULL,
  PRIMARY KEY (`keyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CorrelationPropertyInfo`
--

DROP TABLE IF EXISTS `CorrelationPropertyInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CorrelationPropertyInfo` (
  `propertyId` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPTLOCK` int DEFAULT NULL,
  `correlationKey_keyId` bigint DEFAULT NULL,
  PRIMARY KEY (`propertyId`),
  KEY `IDX_CorrPropInfo_Id` (`correlationKey_keyId`),
  CONSTRAINT `FKbchyl7kb8i6ghvi3dbr86bgo0` FOREIGN KEY (`correlationKey_keyId`) REFERENCES `CorrelationKeyInfo` (`keyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEADLINE_ID_SEQ`
--

DROP TABLE IF EXISTS `DEADLINE_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEADLINE_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEPLOY_STORE_ID_SEQ`
--

DROP TABLE IF EXISTS `DEPLOY_STORE_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPLOY_STORE_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Deadline`
--

DROP TABLE IF EXISTS `Deadline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Deadline` (
  `id` bigint NOT NULL,
  `deadline_date` datetime(6) DEFAULT NULL,
  `escalated` smallint DEFAULT NULL,
  `Deadlines_StartDeadLine_Id` bigint DEFAULT NULL,
  `Deadlines_EndDeadLine_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_Deadline_StartId` (`Deadlines_StartDeadLine_Id`),
  KEY `IDX_Deadline_EndId` (`Deadlines_EndDeadLine_Id`),
  CONSTRAINT `FK361ggw230po88svgfasg36i2w` FOREIGN KEY (`Deadlines_StartDeadLine_Id`) REFERENCES `Task` (`id`),
  CONSTRAINT `FKpeiadnoy228t35213t63c3imm` FOREIGN KEY (`Deadlines_EndDeadLine_Id`) REFERENCES `Task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Delegation_delegates`
--

DROP TABLE IF EXISTS `Delegation_delegates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Delegation_delegates` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_Delegation_EntityId` (`entity_id`),
  KEY `IDX_Delegation_TaskId` (`task_id`),
  CONSTRAINT `FK85x3trafk3wfbrv719cafr591` FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`),
  CONSTRAINT `FKewkdyi0wrgy9byp6abyglpcxq` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DeploymentStore`
--

DROP TABLE IF EXISTS `DeploymentStore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeploymentStore` (
  `id` bigint NOT NULL,
  `attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deploymentUnit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `state` int DEFAULT NULL,
  `updateDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK85rgskt09thd8mkkfl3tb0y81` (`DEPLOYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMAILNOTIFHEAD_ID_SEQ`
--

DROP TABLE IF EXISTS `EMAILNOTIFHEAD_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMAILNOTIFHEAD_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ERROR_INFO_ID_SEQ`
--

DROP TABLE IF EXISTS `ERROR_INFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ERROR_INFO_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESCALATION_ID_SEQ`
--

DROP TABLE IF EXISTS `ESCALATION_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESCALATION_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EXEC_ERROR_INFO_ID_SEQ`
--

DROP TABLE IF EXISTS `EXEC_ERROR_INFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXEC_ERROR_INFO_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ErrorInfo`
--

DROP TABLE IF EXISTS `ErrorInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ErrorInfo` (
  `id` bigint NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stacktrace` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `REQUEST_ID` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ErrorInfo_Id` (`REQUEST_ID`),
  CONSTRAINT `FKdarp6ushq06q39jmij3fdpdbs` FOREIGN KEY (`REQUEST_ID`) REFERENCES `RequestInfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Escalation`
--

DROP TABLE IF EXISTS `Escalation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Escalation` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Deadline_Escalation_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_Escalation_Id` (`Deadline_Escalation_Id`),
  CONSTRAINT `FK37v8ova8ti6jiblda7n6j298e` FOREIGN KEY (`Deadline_Escalation_Id`) REFERENCES `Deadline` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EventTypes`
--

DROP TABLE IF EXISTS `EventTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventTypes` (
  `InstanceId` bigint NOT NULL,
  `element` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `IDX_EventTypes_Id` (`InstanceId`),
  KEY `IDX_EventTypes_element` (`element`),
  CONSTRAINT `FKj0o3uve2nqo5yrjwrkc9jfttq` FOREIGN KEY (`InstanceId`) REFERENCES `ProcessInstanceInfo` (`InstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ExecutionErrorInfo`
--

DROP TABLE IF EXISTS `ExecutionErrorInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExecutionErrorInfo` (
  `id` bigint NOT NULL,
  `ERROR_ACK` smallint DEFAULT NULL,
  `ERROR_ACK_AT` datetime(6) DEFAULT NULL,
  `ERROR_ACK_BY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACTIVITY_ID` bigint DEFAULT NULL,
  `ACTIVITY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ERROR_INFO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ERROR_DATE` datetime(6) DEFAULT NULL,
  `ERROR_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ERROR_MSG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INIT_ACTIVITY_ID` bigint DEFAULT NULL,
  `JOB_ID` bigint DEFAULT NULL,
  `PROCESS_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROCESS_INST_ID` bigint DEFAULT NULL,
  `ERROR_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ErrorInfo_pInstId` (`PROCESS_INST_ID`),
  KEY `IDX_ErrorInfo_errorAck` (`ERROR_ACK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `I18NTEXT_ID_SEQ`
--

DROP TABLE IF EXISTS `I18NTEXT_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `I18NTEXT_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `I18NText`
--

DROP TABLE IF EXISTS `I18NText`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `I18NText` (
  `id` bigint NOT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Task_Subjects_Id` bigint DEFAULT NULL,
  `Task_Names_Id` bigint DEFAULT NULL,
  `Task_Descriptions_Id` bigint DEFAULT NULL,
  `Reassignment_Documentation_Id` bigint DEFAULT NULL,
  `Notification_Subjects_Id` bigint DEFAULT NULL,
  `Notification_Names_Id` bigint DEFAULT NULL,
  `Notification_Documentation_Id` bigint DEFAULT NULL,
  `Notification_Descriptions_Id` bigint DEFAULT NULL,
  `Deadline_Documentation_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_I18NText_SubjId` (`Task_Subjects_Id`),
  KEY `IDX_I18NText_NameId` (`Task_Names_Id`),
  KEY `IDX_I18NText_DescrId` (`Task_Descriptions_Id`),
  KEY `IDX_I18NText_ReassignId` (`Reassignment_Documentation_Id`),
  KEY `IDX_I18NText_NotSubjId` (`Notification_Subjects_Id`),
  KEY `IDX_I18NText_NotNamId` (`Notification_Names_Id`),
  KEY `IDX_I18NText_NotDocId` (`Notification_Documentation_Id`),
  KEY `IDX_I18NText_NotDescrId` (`Notification_Descriptions_Id`),
  KEY `IDX_I18NText_DeadDocId` (`Deadline_Documentation_Id`),
  CONSTRAINT `FK6k8hmfvhko069970eghiy2ifp` FOREIGN KEY (`Notification_Descriptions_Id`) REFERENCES `Notification` (`id`),
  CONSTRAINT `FK8wn7sw34q6bifsi1pvl2b1yyb` FOREIGN KEY (`Deadline_Documentation_Id`) REFERENCES `Deadline` (`id`),
  CONSTRAINT `FKcd6eb4q62d9ab8p0di8pb99ch` FOREIGN KEY (`Task_Subjects_Id`) REFERENCES `Task` (`id`),
  CONSTRAINT `FKg2jsybeuc8pbj8ek8xwxutuyo` FOREIGN KEY (`Notification_Names_Id`) REFERENCES `Notification` (`id`),
  CONSTRAINT `FKiogka67sji8fk4cp7a369895i` FOREIGN KEY (`Task_Names_Id`) REFERENCES `Task` (`id`),
  CONSTRAINT `FKp0m7uhipskrljktvfeubdgfid` FOREIGN KEY (`Notification_Documentation_Id`) REFERENCES `Notification` (`id`),
  CONSTRAINT `FKqxgws3fnukyqlaet11tivqg5u` FOREIGN KEY (`Reassignment_Documentation_Id`) REFERENCES `Reassignment` (`id`),
  CONSTRAINT `FKrisdlmalotmk64mdeqpo4s5m0` FOREIGN KEY (`Task_Descriptions_Id`) REFERENCES `Task` (`id`),
  CONSTRAINT `FKthf8ix3t3opf9hya1s04hwsx8` FOREIGN KEY (`Notification_Subjects_Id`) REFERENCES `Notification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NODE_INST_LOG_ID_SEQ`
--

DROP TABLE IF EXISTS `NODE_INST_LOG_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NODE_INST_LOG_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NOTIFICATION_ID_SEQ`
--

DROP TABLE IF EXISTS `NOTIFICATION_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICATION_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Notification`
--

DROP TABLE IF EXISTS `Notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification` (
  `DTYPE` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL,
  `priority` int NOT NULL,
  `Escalation_Notifications_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_Not_EscId` (`Escalation_Notifications_Id`),
  CONSTRAINT `FKoxq5uqfg4ylwyijsg2ubyflna` FOREIGN KEY (`Escalation_Notifications_Id`) REFERENCES `Escalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Notification_BAs`
--

DROP TABLE IF EXISTS `Notification_BAs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification_BAs` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_NotBAs_Entity` (`entity_id`),
  KEY `IDX_NotBAs_Task` (`task_id`),
  CONSTRAINT `FK378pb1cvjv54w4ljqpw99s3wr` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`),
  CONSTRAINT `FKb123fgeomc741s9yc014421yy` FOREIGN KEY (`task_id`) REFERENCES `Notification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Notification_Recipients`
--

DROP TABLE IF EXISTS `Notification_Recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification_Recipients` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_NotRec_Entity` (`entity_id`),
  KEY `IDX_NotRec_Task` (`task_id`),
  CONSTRAINT `FKn7v944d0hw37bh0auv4gr3hsf` FOREIGN KEY (`task_id`) REFERENCES `Notification` (`id`),
  CONSTRAINT `FKot769nimyq1jvw0m61pgsq5g3` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Notification_email_header`
--

DROP TABLE IF EXISTS `Notification_email_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification_email_header` (
  `Notification_id` bigint NOT NULL,
  `emailHeaders_id` bigint NOT NULL,
  `mapkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Notification_id`,`mapkey`),
  UNIQUE KEY `UK_ptaka5kost68h7l3wflv7w6y8` (`emailHeaders_id`),
  CONSTRAINT `FKd74pdu41avy2f7a8qyp7wn2n` FOREIGN KEY (`emailHeaders_id`) REFERENCES `email_header` (`id`),
  CONSTRAINT `FKfdnoyp8rl0kxu29l4pyaa5566` FOREIGN KEY (`Notification_id`) REFERENCES `Notification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrganizationalEntity`
--

DROP TABLE IF EXISTS `OrganizationalEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationalEntity` (
  `DTYPE` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROCESS_INSTANCE_INFO_ID_SEQ`
--

DROP TABLE IF EXISTS `PROCESS_INSTANCE_INFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS_INSTANCE_INFO_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC_INST_LOG_ID_SEQ`
--

DROP TABLE IF EXISTS `PROC_INST_LOG_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROC_INST_LOG_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeopleAssignments_BAs`
--

DROP TABLE IF EXISTS `PeopleAssignments_BAs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeopleAssignments_BAs` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_PAsBAs_Entity` (`entity_id`),
  KEY `IDX_PAsBAs_Task` (`task_id`),
  CONSTRAINT `FKa90cdfgc4km384n1ataqigq67` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`),
  CONSTRAINT `FKt4xs0glwhbsa0xwg69r6xduv9` FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeopleAssignments_ExclOwners`
--

DROP TABLE IF EXISTS `PeopleAssignments_ExclOwners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeopleAssignments_ExclOwners` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_PAsExcl_Entity` (`entity_id`),
  KEY `IDX_PAsExcl_Task` (`task_id`),
  CONSTRAINT `FK5ituvd6t8uvp63hsx6282xo6h` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`),
  CONSTRAINT `FKqxbjm1b3dl7w8w2f2y6sk0fv8` FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeopleAssignments_PotOwners`
--

DROP TABLE IF EXISTS `PeopleAssignments_PotOwners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeopleAssignments_PotOwners` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_PAsPot_Entity` (`entity_id`),
  KEY `IDX_PAsPot_Task` (`task_id`),
  CONSTRAINT `FKh8oqmk4iuh2pmpgby6g8r3jd1` FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`),
  CONSTRAINT `FKsa3rrrjsm1qw98ajbbu2s7cjr` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeopleAssignments_Recipients`
--

DROP TABLE IF EXISTS `PeopleAssignments_Recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeopleAssignments_Recipients` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_PAsRecip_Entity` (`entity_id`),
  KEY `IDX_PAsRecip_Task` (`task_id`),
  CONSTRAINT `FK9gnbv6bplxkxoedj35vg8n7ir` FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`),
  CONSTRAINT `FKrd0h9ud1bhs9waf2mdmiv6j2r` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PeopleAssignments_Stakeholders`
--

DROP TABLE IF EXISTS `PeopleAssignments_Stakeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PeopleAssignments_Stakeholders` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_PAsStake_Entity` (`entity_id`),
  KEY `IDX_PAsStake_Task` (`task_id`),
  CONSTRAINT `FK9uy76cu650rg1nnkrtjwj1e9t` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`),
  CONSTRAINT `FKaeyk4nwslvx0jywjomjq7083i` FOREIGN KEY (`task_id`) REFERENCES `Task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ProcessInstanceLog`
--

DROP TABLE IF EXISTS `ProcessInstanceLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProcessInstanceLog` (
  `id` bigint NOT NULL,
  `correlationKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` bigint DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `externalId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_identity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outcome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentProcessInstanceId` bigint DEFAULT NULL,
  `processId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceId` bigint NOT NULL,
  `processName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processType` int DEFAULT NULL,
  `processVersion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slaCompliance` int DEFAULT NULL,
  `sla_due_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_PInstLog_duration` (`duration`),
  KEY `IDX_PInstLog_end_date` (`end_date`),
  KEY `IDX_PInstLog_extId` (`externalId`),
  KEY `IDX_PInstLog_user_identity` (`user_identity`),
  KEY `IDX_PInstLog_outcome` (`outcome`),
  KEY `IDX_PInstLog_parentPInstId` (`parentProcessInstanceId`),
  KEY `IDX_PInstLog_pId` (`processId`),
  KEY `IDX_PInstLog_pInsteDescr` (`processInstanceDescription`),
  KEY `IDX_PInstLog_pInstId` (`processInstanceId`),
  KEY `IDX_PInstLog_pName` (`processName`),
  KEY `IDX_PInstLog_pVersion` (`processVersion`),
  KEY `IDX_PInstLog_start_date` (`start_date`),
  KEY `IDX_PInstLog_status` (`status`),
  KEY `IDX_PInstLog_correlation` (`correlationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QTASKS2`
--

DROP TABLE IF EXISTS `QTASKS2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QTASKS2` (
  `id` bigint NOT NULL,
  `createdAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QTASKS3`
--

DROP TABLE IF EXISTS `QTASKS3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QTASKS3` (
  `id` bigint NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QUERY_DEF_ID_SEQ`
--

DROP TABLE IF EXISTS `QUERY_DEF_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUERY_DEF_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QueryDefinitionStore`
--

DROP TABLE IF EXISTS `QueryDefinitionStore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QueryDefinitionStore` (
  `id` bigint NOT NULL,
  `qExpression` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qSource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qTarget` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1dmy087nhbykucpgjipcnyluv` (`qName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REASSIGNMENT_ID_SEQ`
--

DROP TABLE IF EXISTS `REASSIGNMENT_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REASSIGNMENT_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REQUEST_INFO_ID_SEQ`
--

DROP TABLE IF EXISTS `REQUEST_INFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUEST_INFO_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reassignment`
--

DROP TABLE IF EXISTS `Reassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reassignment` (
  `id` bigint NOT NULL,
  `Escalation_Reassignments_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_Reassign_Esc` (`Escalation_Reassignments_Id`),
  CONSTRAINT `FKessy30safh44b30f1cfoujv2k` FOREIGN KEY (`Escalation_Reassignments_Id`) REFERENCES `Escalation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Reassignment_potentialOwners`
--

DROP TABLE IF EXISTS `Reassignment_potentialOwners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reassignment_potentialOwners` (
  `task_id` bigint NOT NULL,
  `entity_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `IDX_ReassignPO_Entity` (`entity_id`),
  KEY `IDX_ReassignPO_Task` (`task_id`),
  CONSTRAINT `FKftegfexshix752bh2jfxf6bnh` FOREIGN KEY (`task_id`) REFERENCES `Reassignment` (`id`),
  CONSTRAINT `FKsqrmpvehlc4qe9i0km22nmkjl` FOREIGN KEY (`entity_id`) REFERENCES `OrganizationalEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RequestInfo`
--

DROP TABLE IF EXISTS `RequestInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestInfo` (
  `id` bigint NOT NULL,
  `commandName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deploymentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `executions` int NOT NULL,
  `businessKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int NOT NULL,
  `processInstanceId` bigint DEFAULT NULL,
  `requestData` longblob,
  `responseData` longblob,
  `retries` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_RequestInfo_status` (`status`),
  KEY `IDX_RequestInfo_owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SESSIONINFO_ID_SEQ`
--

DROP TABLE IF EXISTS `SESSIONINFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SESSIONINFO_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SessionInfo`
--

DROP TABLE IF EXISTS `SessionInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionInfo` (
  `id` bigint NOT NULL,
  `lastModificationDate` datetime(6) DEFAULT NULL,
  `rulesByteArray` longblob,
  `startDate` datetime(6) DEFAULT NULL,
  `OPTLOCK` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TASK_DEF_ID_SEQ`
--

DROP TABLE IF EXISTS `TASK_DEF_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_DEF_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TASK_EVENT_ID_SEQ`
--

DROP TABLE IF EXISTS `TASK_EVENT_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_EVENT_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TASK_ID_SEQ`
--

DROP TABLE IF EXISTS `TASK_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TASK_VAR_ID_SEQ`
--

DROP TABLE IF EXISTS `TASK_VAR_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_VAR_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Task` (
  `id` bigint NOT NULL,
  `archived` smallint DEFAULT NULL,
  `allowedToDelegate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int NOT NULL,
  `subTaskStrategy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activationTime` datetime(6) DEFAULT NULL,
  `createdOn` datetime(6) DEFAULT NULL,
  `deploymentId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documentAccessType` int DEFAULT NULL,
  `documentContentId` bigint NOT NULL,
  `documentType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expirationTime` datetime(6) DEFAULT NULL,
  `faultAccessType` int DEFAULT NULL,
  `faultContentId` bigint NOT NULL,
  `faultName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faultType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outputAccessType` int DEFAULT NULL,
  `outputContentId` bigint NOT NULL,
  `outputType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` bigint NOT NULL,
  `previousStatus` int DEFAULT NULL,
  `processId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceId` bigint NOT NULL,
  `processSessionId` bigint NOT NULL,
  `skipable` bit(1) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workItemId` bigint NOT NULL,
  `taskType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPTLOCK` int DEFAULT NULL,
  `taskInitiator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actualOwner_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_Task_Initiator` (`taskInitiator_id`),
  KEY `IDX_Task_ActualOwner` (`actualOwner_id`),
  KEY `IDX_Task_CreatedBy` (`createdBy_id`),
  KEY `IDX_Task_processInstanceId` (`processInstanceId`),
  KEY `IDX_Task_processId` (`processId`),
  KEY `IDX_Task_status` (`status`),
  KEY `IDX_Task_archived` (`archived`),
  KEY `IDX_Task_workItemId` (`workItemId`),
  CONSTRAINT `FK48d1bfgwf0jqow1yk8ku4xcpi` FOREIGN KEY (`taskInitiator_id`) REFERENCES `OrganizationalEntity` (`id`),
  CONSTRAINT `FKexuboqnbla7jfyyesyo61ucmb` FOREIGN KEY (`createdBy_id`) REFERENCES `OrganizationalEntity` (`id`),
  CONSTRAINT `FKpmkxvqq63aed2y2boruu53a0s` FOREIGN KEY (`actualOwner_id`) REFERENCES `OrganizationalEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TaskDef`
--

DROP TABLE IF EXISTS `TaskDef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskDef` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TaskEvent`
--

DROP TABLE IF EXISTS `TaskEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskEvent` (
  `id` bigint NOT NULL,
  `logTime` datetime(6) DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceId` bigint DEFAULT NULL,
  `taskId` bigint DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPTLOCK` int DEFAULT NULL,
  `workItemId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TaskVariableImpl`
--

DROP TABLE IF EXISTS `TaskVariableImpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TaskVariableImpl` (
  `id` bigint NOT NULL,
  `modificationDate` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceId` bigint DEFAULT NULL,
  `taskId` bigint DEFAULT NULL,
  `type` int DEFAULT NULL,
  `value` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TaskVariableImpl_taskId` (`taskId`),
  KEY `IDX_TaskVariableImpl_pInstId` (`processInstanceId`),
  KEY `IDX_TaskVariableImpl_processId` (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VAR_INST_LOG_ID_SEQ`
--

DROP TABLE IF EXISTS `VAR_INST_LOG_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VAR_INST_LOG_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WORKITEMINFO_ID_SEQ`
--

DROP TABLE IF EXISTS `WORKITEMINFO_ID_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKITEMINFO_ID_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `askId` bigint DEFAULT NULL,
  `attributecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `changeEvent` bit(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `expired` bit(1) DEFAULT NULL,
  `inferred` bit(1) DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refused` bit(1) DEFAULT NULL,
  `sourcecode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double DEFAULT NULL,
  `attribute_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code_idx` (`targetcode`,`attributecode`,`realm`),
  KEY `FKs5doqavr9yy08b1rqe4ndnt4n` (`attribute_id`),
  CONSTRAINT `FKs5doqavr9yy08b1rqe4ndnt4n` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answerlinks`
--

DROP TABLE IF EXISTS `answerlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answerlinks` (
  `be_list` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `askId` bigint DEFAULT NULL,
  `attributeCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `expired` bit(1) DEFAULT NULL,
  `inferred` bit(1) DEFAULT NULL,
  `refused` bit(1) DEFAULT NULL,
  `sourceCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `valueBoolean` bit(1) DEFAULT NULL,
  `valueDate` date DEFAULT NULL,
  `valueDateTime` datetime(6) DEFAULT NULL,
  `valueDouble` double DEFAULT NULL,
  `valueInteger` int DEFAULT NULL,
  `valueLong` bigint DEFAULT NULL,
  `money` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valueString` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `valueTime` time DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `attribute_id` bigint NOT NULL,
  `TARGET_ID` bigint NOT NULL,
  `SOURCE_ID` bigint NOT NULL,
  PRIMARY KEY (`attribute_id`,`SOURCE_ID`,`TARGET_ID`),
  KEY `FK9d7jg67ojpi3vtxsmt0iutr8b` (`TARGET_ID`),
  KEY `FKqd07ywjch02ubs8q5wmhn2jps` (`SOURCE_ID`),
  CONSTRAINT `FK9d7jg67ojpi3vtxsmt0iutr8b` FOREIGN KEY (`TARGET_ID`) REFERENCES `baseentity` (`id`),
  CONSTRAINT `FKkogssga01sxqugj97qmo71ced` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  CONSTRAINT `FKqd07ywjch02ubs8q5wmhn2jps` FOREIGN KEY (`SOURCE_ID`) REFERENCES `baseentity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ask`
--

DROP TABLE IF EXISTS `ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ask` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `attributeCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createOnTrigger` bit(1) DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `formTrigger` bit(1) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `mandatory` bit(1) DEFAULT NULL,
  `oneshot` bit(1) DEFAULT NULL,
  `parentId` bigint DEFAULT NULL,
  `questionCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `readonly` bit(1) DEFAULT NULL,
  `sourceCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `question_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7dauhkpaqlmghu6gl8tn9k8wh` (`id`,`realm`),
  KEY `code_idx` (`id`,`realm`),
  KEY `FK3gb9ght32cv27ajqs6yticbmi` (`question_id`),
  CONSTRAINT `FK3gb9ght32cv27ajqs6yticbmi` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `className` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dttCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inputmask` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `typeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation_list` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defaultPrivacyFlag` bit(1) DEFAULT NULL,
  `defaultValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKete7vddcnryn6csasljummesn` (`code`,`realm`),
  KEY `code_idx` (`code`,`realm`)
) ENGINE=InnoDB AUTO_INCREMENT=4543 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseentity`
--

DROP TABLE IF EXISTS `baseentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseentity` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKb4u1syrco33nx6qj3a96xyihb` (`code`,`realm`),
  KEY `code_idx` (`code`,`realm`),
  KEY `r_s_c` (`realm`,`status`,`code`),
  KEY `r_s_n` (`realm`,`status`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=74730 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseentity_attribute`
--

DROP TABLE IF EXISTS `baseentity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseentity_attribute` (
  `attributeCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `baseEntityCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `inferred` bit(1) DEFAULT NULL,
  `privacyFlag` bit(1) DEFAULT NULL,
  `readonly` bit(1) DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `valueBoolean` bit(1) DEFAULT NULL,
  `valueDate` date DEFAULT NULL,
  `valueDateRange` tinyblob,
  `valueDateTime` datetime(6) DEFAULT NULL,
  `valueDouble` double DEFAULT NULL,
  `valueInteger` int DEFAULT NULL,
  `valueLong` bigint DEFAULT NULL,
  `money` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valueString` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `valueTime` time DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `ATTRIBUTE_ID` bigint NOT NULL,
  `BASEENTITY_ID` bigint NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmationFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ATTRIBUTE_ID`,`BASEENTITY_ID`),
  UNIQUE KEY `UKfhe6ytcnf3pqww35brvtadvta` (`attributeCode`,`baseEntityCode`,`realm`),
  KEY `FKmqrqcxsqu49b0cliy2tymjoae` (`BASEENTITY_ID`),
  KEY `id_search` (`baseEntityCode`,`attributeCode`,`valueString`(20)),
  KEY `ba_idx` (`attributeCode`,`baseEntityCode`,`realm`),
  KEY `rvsvb2` (`realm`,`valueString`(25),`valueBoolean`),
  KEY `beid_attrcode_valStr_valBool_idx` (`BASEENTITY_ID`,`attributeCode`,`valueString`(20),`valueBoolean`),
  CONSTRAINT `FKaedpn6csuwk6uwm5kqh73tiwd` FOREIGN KEY (`ATTRIBUTE_ID`) REFERENCES `attribute` (`id`),
  CONSTRAINT `FKmqrqcxsqu49b0cliy2tymjoae` FOREIGN KEY (`BASEENTITY_ID`) REFERENCES `baseentity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baseentity_baseentity`
--

DROP TABLE IF EXISTS `baseentity_baseentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseentity_baseentity` (
  `targetCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `LINK_CODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `childColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SOURCE_CODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TARGET_CODE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LINK_WEIGHT` double NOT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `valueBoolean` bit(1) DEFAULT NULL,
  `valueDate` date DEFAULT NULL,
  `valueDateTime` datetime(6) DEFAULT NULL,
  `valueDouble` double DEFAULT NULL,
  `valueInteger` int DEFAULT NULL,
  `valueLong` bigint DEFAULT NULL,
  `money` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valueString` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `valueTime` time DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `attribute_id` bigint NOT NULL,
  `SOURCE_ID` bigint NOT NULL,
  PRIMARY KEY (`attribute_id`,`SOURCE_ID`,`targetCode`),
  KEY `FK5wx1avqnhbiguv2x4a2350hkj` (`SOURCE_ID`),
  CONSTRAINT `FK5wx1avqnhbiguv2x4a2350hkj` FOREIGN KEY (`SOURCE_ID`) REFERENCES `baseentity` (`id`),
  CONSTRAINT `FKgspd8ijkxtsn0roh902vvpqlc` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `context`
--

DROP TABLE IF EXISTS `context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `context` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `contextCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dttCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visualControlType` int DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `attribute_id` bigint NOT NULL,
  `list_id` bigint DEFAULT NULL,
  `baseentity_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK28yl1tttqr07of34mkpggsa8x` (`id`,`realm`),
  KEY `code_idx` (`id`,`realm`),
  KEY `FKcm47nxemlmm987fu8a6iw64aa` (`attribute_id`),
  KEY `FKldpyd6jx52jnidtl6yx2oas8` (`list_id`),
  KEY `FKh9q923xlgy3r6it67488hwasg` (`baseentity_id`),
  CONSTRAINT `FKcm47nxemlmm987fu8a6iw64aa` FOREIGN KEY (`attribute_id`) REFERENCES `baseentity` (`id`),
  CONSTRAINT `FKh9q923xlgy3r6it67488hwasg` FOREIGN KEY (`baseentity_id`) REFERENCES `baseentity` (`id`),
  CONSTRAINT `FKldpyd6jx52jnidtl6yx2oas8` FOREIGN KEY (`list_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_header`
--

DROP TABLE IF EXISTS `email_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_header` (
  `id` bigint NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fromAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replyToAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flyway_quarkus_history`
--

DROP TABLE IF EXISTS `flyway_quarkus_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flyway_quarkus_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_quarkus_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gps`
--

DROP TABLE IF EXISTS `gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gps` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `accuracy` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `altitude_accuracy` double DEFAULT NULL,
  `bearing` double DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `speed` double DEFAULT NULL,
  `targetcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetid` bigint DEFAULT NULL,
  `timestamp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nodestatus`
--

DROP TABLE IF EXISTS `nodestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodestatus` (
  `id` bigint NOT NULL,
  `log_date` datetime(6) DEFAULT NULL,
  `nodeId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nodeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processInstanceId` bigint DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workflowBeCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workflowStage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_NStat_nodeId` (`nodeId`),
  KEY `IDX_NStat_realm` (`realm`),
  KEY `IDX_NStat_wfs` (`workflowStage`),
  KEY `IDX_NStat_wfc` (`workflowBeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `id` bigint NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourceCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `targetCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `note_reg_users`
--

DROP TABLE IF EXISTS `note_reg_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_reg_users` (
  `ParentNote_id` bigint NOT NULL,
  `note_users` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `FK5xlbdwej54t3bwdna96046o2a` (`ParentNote_id`),
  CONSTRAINT `FK5xlbdwej54t3bwdna96046o2a` FOREIGN KEY (`ParentNote_id`) REFERENCES `parentnote` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parentnote`
--

DROP TABLE IF EXISTS `parentnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentnote` (
  `id` bigint NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributeCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mandatory` bit(1) DEFAULT NULL,
  `oneshot` bit(1) DEFAULT NULL,
  `placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `readonly` bit(1) DEFAULT NULL,
  `attribute_id` bigint DEFAULT NULL,
  `directions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK16nj8uf29opo911shmqjhheju` (`code`,`realm`),
  KEY `code_idx` (`code`,`realm`),
  KEY `FKc8891u9mg0doemnwfxov4e1w1` (`attribute_id`),
  CONSTRAINT `FKc8891u9mg0doemnwfxov4e1w1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1553 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question_question`
--

DROP TABLE IF EXISTS `question_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_question` (
  `sourceCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `targetCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createOnTrigger` bit(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `formTrigger` bit(1) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `mandatory` bit(1) DEFAULT NULL,
  `oneshot` bit(1) DEFAULT NULL,
  `readonly` bit(1) DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `SOURCE_ID` bigint NOT NULL,
  `dependency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SOURCE_ID`,`sourceCode`,`targetCode`),
  UNIQUE KEY `UKt3y489620scaykkmge2e4po9p` (`sourceCode`,`targetCode`,`realm`),
  KEY `source_idx` (`sourceCode`),
  KEY `code_idx` (`realm`),
  CONSTRAINT `FK9nex8vynu3g1w30v78he4kpwd` FOREIGN KEY (`SOURCE_ID`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKjtumkuxygwbgsuggjl85sip5x` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedulemessage`
--

DROP TABLE IF EXISTS `schedulemessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulemessage` (
  `id` bigint NOT NULL,
  `channel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jsonMessage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourceCode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `triggertime` datetime(6) DEFAULT NULL,
  `updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session_pid`
--

DROP TABLE IF EXISTS `session_pid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_pid` (
  `id` bigint NOT NULL,
  `log_date` datetime(6) DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sessioncode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_NStat_SessionCode` (`sessioncode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `Note_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` int DEFAULT NULL,
  KEY `FKhxvw4f755tct22hd0wasmx8uy` (`Note_id`),
  CONSTRAINT `FKhxvw4f755tct22hd0wasmx8uy` FOREIGN KEY (`Note_id`) REFERENCES `note` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_comment`
--

DROP TABLE IF EXISTS `task_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_comment` (
  `id` bigint NOT NULL,
  `addedAt` datetime(6) DEFAULT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `addedBy_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaskData_Comments_Id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TaskComments_CreatedBy` (`addedBy_id`),
  KEY `IDX_TaskComments_Id` (`TaskData_Comments_Id`),
  CONSTRAINT `FKm2mwc1ukcpdsiqwgkoroy6ise` FOREIGN KEY (`TaskData_Comments_Id`) REFERENCES `Task` (`id`),
  CONSTRAINT `FKqb4mkarf209y9546w7n75lb7a` FOREIGN KEY (`addedBy_id`) REFERENCES `OrganizationalEntity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `toast` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7q65l1bgnolmh8b5df8e393vj` (`code`,`realm`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `validation`
--

DROP TABLE IF EXISTS `validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `validation` (
  `dtype` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `multiAllowed` bit(1) DEFAULT NULL,
  `options` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recursiveGroup` bit(1) DEFAULT NULL,
  `regex` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `selection_grp` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `errormsg` varchar(280) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7wip0jvj11abgit25o6m7l83j` (`code`,`realm`),
  KEY `code_idx` (`code`,`realm`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- GTID state at the end of the backup 
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


create table `hibernate_sequences` (
    `sequence_name` VARCHAR(255) NOT NULL,
    `next_val` bigint  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump completed on 2022-04-20 12:15:11
