-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: system_git_one
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 预案编制',7,'add_planytype'),(26,'Can change 预案编制',7,'change_planytype'),(27,'Can delete 预案编制',7,'delete_planytype'),(28,'Can view 预案编制',7,'view_planytype'),(29,'Can add 预案模板',8,'add_planytemplate'),(30,'Can change 预案模板',8,'change_planytemplate'),(31,'Can delete 预案模板',8,'delete_planytemplate'),(32,'Can view 预案模板',8,'view_planytemplate'),(33,'Can add 预案管理',9,'add_plans'),(34,'Can change 预案管理',9,'change_plans'),(35,'Can delete 预案管理',9,'delete_plans'),(36,'Can view 预案管理',9,'view_plans'),(37,'Can add 城市录入',10,'add_city'),(38,'Can change 城市录入',10,'change_city'),(39,'Can delete 城市录入',10,'delete_city'),(40,'Can view 城市录入',10,'view_city'),(41,'Can add 方案评估',11,'add_assessment'),(42,'Can change 方案评估',11,'change_assessment'),(43,'Can delete 方案评估',11,'delete_assessment'),(44,'Can view 方案评估',11,'view_assessment'),(45,'Can add 系统帮助',12,'add_help'),(46,'Can change 系统帮助',12,'change_help'),(47,'Can delete 系统帮助',12,'delete_help'),(48,'Can view 系统帮助',12,'view_help'),(49,'Can add 事件类型',13,'add_eventtype'),(50,'Can change 事件类型',13,'change_eventtype'),(51,'Can delete 事件类型',13,'delete_eventtype'),(52,'Can view 事件类型',13,'view_eventtype'),(53,'Can add 信息管理',14,'add_message'),(54,'Can change 信息管理',14,'change_message'),(55,'Can delete 信息管理',14,'delete_message'),(56,'Can view 信息管理',14,'view_message'),(57,'Can add 突发事件管理',15,'add_events'),(58,'Can change 突发事件管理',15,'change_events'),(59,'Can delete 突发事件管理',15,'delete_events'),(60,'Can view 突发事件管理',15,'view_events');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$9RJJs3h6SBegLBAvGa9WRu$y9VCQ6BsIHAU74Tj01uLVNGODt1TpecWVVh+WZQNc7U=','2022-05-18 13:26:22.084709',1,'admin','','','admin@qq.com',1,1,'2022-05-18 13:25:58.356160');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-18 13:30:38.176320','1','火警',1,'[{\"added\": {}}]',13,1),(2,'2022-05-18 13:30:46.630378','2','水警',1,'[{\"added\": {}}]',13,1),(3,'2022-05-18 13:30:51.997972','3','山洪',1,'[{\"added\": {}}]',13,1),(4,'2022-05-18 13:30:59.775475','4','泥石流',1,'[{\"added\": {}}]',13,1),(5,'2022-05-18 13:31:07.021923','5','台风',1,'[{\"added\": {}}]',13,1),(6,'2022-05-18 13:31:18.698464','6','地震',1,'[{\"added\": {}}]',13,1),(7,'2022-05-18 13:34:14.919584','1','北京',1,'[{\"added\": {}}]',10,1),(8,'2022-05-18 13:34:22.549774','2','上海',1,'[{\"added\": {}}]',10,1),(9,'2022-05-18 13:34:27.229266','3','南京',1,'[{\"added\": {}}]',10,1),(10,'2022-05-18 13:34:30.946906','4','成都',1,'[{\"added\": {}}]',10,1),(11,'2022-05-18 13:34:37.114364','5','武汉',1,'[{\"added\": {}}]',10,1),(12,'2022-05-18 13:34:41.182033','6','西安',1,'[{\"added\": {}}]',10,1),(13,'2022-05-18 13:35:56.848739','1','应对火警的模板策略',1,'[{\"added\": {}}]',8,1),(14,'2022-05-18 13:38:32.871422','1','火警预案',1,'[{\"added\": {}}]',7,1),(15,'2022-05-18 13:44:20.911970','1','针对火警的预案处理',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'emergency_management','events'),(13,'emergency_management','eventtype'),(14,'emergency_management','message'),(12,'help','help'),(11,'home','assessment'),(10,'home','city'),(9,'home','plans'),(8,'home','planytemplate'),(7,'home','planytype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-18 13:25:19.718152'),(2,'auth','0001_initial','2022-05-18 13:25:20.011042'),(3,'admin','0001_initial','2022-05-18 13:25:20.079863'),(4,'admin','0002_logentry_remove_auto_add','2022-05-18 13:25:20.088899'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-18 13:25:20.096800'),(6,'contenttypes','0002_remove_content_type_name','2022-05-18 13:25:20.165577'),(7,'auth','0002_alter_permission_name_max_length','2022-05-18 13:25:20.198682'),(8,'auth','0003_alter_user_email_max_length','2022-05-18 13:25:20.235959'),(9,'auth','0004_alter_user_username_opts','2022-05-18 13:25:20.248786'),(10,'auth','0005_alter_user_last_login_null','2022-05-18 13:25:20.297966'),(11,'auth','0006_require_contenttypes_0002','2022-05-18 13:25:20.300348'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-18 13:25:20.311260'),(13,'auth','0008_alter_user_username_max_length','2022-05-18 13:25:20.358376'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-18 13:25:20.401329'),(15,'auth','0010_alter_group_name_max_length','2022-05-18 13:25:20.437226'),(16,'auth','0011_update_proxy_permissions','2022-05-18 13:25:20.455393'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-18 13:25:20.499559'),(18,'sessions','0001_initial','2022-05-18 13:25:20.519082'),(19,'emergency_management','0001_initial','2022-05-18 13:28:08.690796'),(20,'home','0001_initial','2022-05-18 13:28:19.123800'),(21,'help','0001_initial','2022-05-18 13:28:23.218887'),(22,'emergency_management','0002_alter_message_status','2022-05-18 13:40:32.437228'),(23,'home','0002_alter_plans_options_and_more','2022-05-18 13:42:06.443350'),(24,'home','0003_plans_plan_detail_and_more','2022-05-18 13:43:33.817996'),(25,'home','0004_alter_assessment_assessment_user_and_more','2022-05-18 13:45:25.166068');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('y8539vm6q6grqujama9r4ok11eqopfm6','.eJzNV0tv2zAM_iuFz23ih17ucfcdd1qKgJaoxJ3tFJY9ICjy3yc53ZpqCmK7AZqLaZMUpe8jTdOv0Rr6brvuDbbrUkWPURLdn-oKkL-wcQb1DM1mt5C7pmvLYuFcFm9Ws_i-U1h9e_P9EGALZmtXa1AxcI2plDmwDDJ7QwlmAFoJrQsCKdNEZCxWBeOMihxEnGGSWK3KdOGC1tj0xsb6-bqKGqhxFT3eraLVqqeYEytYnFIrCIpiEJpZwQtInCAxW0X31r-0CI4rNbR3Gh5k2coKj8ba4TDO_N8mXljJ3RPlVnk5bN9WR9sSa2w32Mj9uoYGNvax6Zb42167_Qsuj-6g1I-xK6zv26qiRVCy7esiDOA6LB3u767FzOHJmbFUzprEcRqKrTEZDs305GReYL1GY-z9aM7_-t8C4zNZ8RnPArE5CBeNZir55Ms0purNtJI3t8D-dRjyc0F8RRLaWmq3GUelB4QpOpFC_rnedhrIMkYFd0KwbFKWt1i9HC-BnL4bx2dwLtoAcXMR-klhvoIGNhMFkEHIoU6IkG6zTAgnOAnsadyeZltipR6g6i4mjNN0CJZm_AwA9_H1E-S-yktnCCXo3Tg-QVcAGirykeD8VIhQLJTkzClcEPMgd5sgTZt21wcL-cT65USNAufTlPsKHgidCzE0T0HENYcoyuXwGmKcOqGpa800YXRao9nVuJRltw82mn_G8emZizbUaGYi9JKShLo_o0X-fkxbTGSYBbJ4OntgjB1nhg_rOQ5PXL6EyblofSZDY-XHYzJIh3GKcz2dyZcKmn2HtZVdcJgMeH0Jn3Mx-3yGhkbvmDTRQwNPZlSmYyo4FZ5Yb4C_8Rh9_sjl2Dphw7CSTRuzTyrtzM-k53ELPI7G6vNIfUV8eIoOfwD_5jmw:1nrCUx:lLAKoer6MOJHVssp61djnxWdKdgb6dPggcXT_W4VArU','2022-06-01 13:45:27.813046');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_management_events`
--

DROP TABLE IF EXISTS `emergency_management_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_management_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(30) NOT NULL,
  `befor_event_name` varchar(30) DEFAULT NULL,
  `keyword` varchar(30) DEFAULT NULL,
  `people_number` int NOT NULL,
  `die_number` int NOT NULL,
  `hurt_number` int NOT NULL,
  `level` int NOT NULL,
  `event_desc` longtext,
  `processing_results` longtext,
  `create_time` datetime(6) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_name` (`event_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_management_events`
--

LOCK TABLES `emergency_management_events` WRITE;
/*!40000 ALTER TABLE `emergency_management_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_management_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_management_events_event_type`
--

DROP TABLE IF EXISTS `emergency_management_events_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_management_events_event_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `events_id` int NOT NULL,
  `eventtype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emergency_management_eve_events_id_eventtype_id_e3ddc834_uniq` (`events_id`,`eventtype_id`),
  KEY `emergency_management_eventtype_id_19d9b909_fk_emergency` (`eventtype_id`),
  CONSTRAINT `emergency_management_events_id_8e921ec7_fk_emergency` FOREIGN KEY (`events_id`) REFERENCES `emergency_management_events` (`id`),
  CONSTRAINT `emergency_management_eventtype_id_19d9b909_fk_emergency` FOREIGN KEY (`eventtype_id`) REFERENCES `emergency_management_eventtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_management_events_event_type`
--

LOCK TABLES `emergency_management_events_event_type` WRITE;
/*!40000 ALTER TABLE `emergency_management_events_event_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_management_events_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_management_eventtype`
--

DROP TABLE IF EXISTS `emergency_management_eventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_management_eventtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_management_eventtype`
--

LOCK TABLES `emergency_management_eventtype` WRITE;
/*!40000 ALTER TABLE `emergency_management_eventtype` DISABLE KEYS */;
INSERT INTO `emergency_management_eventtype` VALUES (1,'火警','2022-05-18 13:30:38.175072','2022-05-18 13:30:38.175091'),(2,'水警','2022-05-18 13:30:46.629719','2022-05-18 13:30:46.629739'),(3,'山洪','2022-05-18 13:30:51.997164','2022-05-18 13:30:51.997185'),(4,'泥石流','2022-05-18 13:30:59.774890','2022-05-18 13:30:59.774912'),(5,'台风','2022-05-18 13:31:07.021085','2022-05-18 13:31:07.021106'),(6,'地震','2022-05-18 13:31:18.697682','2022-05-18 13:31:18.697703');
/*!40000 ALTER TABLE `emergency_management_eventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_management_message`
--

DROP TABLE IF EXISTS `emergency_management_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_management_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title_name` varchar(30) NOT NULL,
  `create_user` varchar(30) NOT NULL,
  `status` varchar(1) NOT NULL,
  `des` longtext,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_name` (`title_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_management_message`
--

LOCK TABLES `emergency_management_message` WRITE;
/*!40000 ALTER TABLE `emergency_management_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_management_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_help`
--

DROP TABLE IF EXISTS `help_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_help` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title_name` varchar(30) NOT NULL,
  `create_user` varchar(30) NOT NULL,
  `des` longtext,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_name` (`title_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_help`
--

LOCK TABLES `help_help` WRITE;
/*!40000 ALTER TABLE `help_help` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_assessment`
--

DROP TABLE IF EXISTS `home_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_assessment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assessment_name` varchar(30) NOT NULL,
  `assessment_description` longtext NOT NULL,
  `assessment_user` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `city_id` int NOT NULL,
  `plan_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assessment_name` (`assessment_name`),
  KEY `home_assessment_city_id_f70f05d8_fk_home_city_id` (`city_id`),
  KEY `home_assessment_plan_id_8dae6e6c_fk_home_plans_id` (`plan_id`),
  CONSTRAINT `home_assessment_city_id_f70f05d8_fk_home_city_id` FOREIGN KEY (`city_id`) REFERENCES `home_city` (`id`),
  CONSTRAINT `home_assessment_plan_id_8dae6e6c_fk_home_plans_id` FOREIGN KEY (`plan_id`) REFERENCES `home_plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_assessment`
--

LOCK TABLES `home_assessment` WRITE;
/*!40000 ALTER TABLE `home_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_city`
--

DROP TABLE IF EXISTS `home_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(30) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_name` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_city`
--

LOCK TABLES `home_city` WRITE;
/*!40000 ALTER TABLE `home_city` DISABLE KEYS */;
INSERT INTO `home_city` VALUES (1,'北京','2022-05-18 13:34:14.918918','2022-05-18 13:34:14.918938'),(2,'上海','2022-05-18 13:34:22.549083','2022-05-18 13:34:22.549104'),(3,'南京','2022-05-18 13:34:27.228691','2022-05-18 13:34:27.228711'),(4,'成都','2022-05-18 13:34:30.946279','2022-05-18 13:34:30.946298'),(5,'武汉','2022-05-18 13:34:37.113717','2022-05-18 13:34:37.113739'),(6,'西安','2022-05-18 13:34:41.181488','2022-05-18 13:34:41.181509');
/*!40000 ALTER TABLE `home_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_plans`
--

DROP TABLE IF EXISTS `home_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(100) NOT NULL,
  `plan_des` longtext,
  `dangerous_goods_name` varchar(100) DEFAULT NULL,
  `dangerous_goods_en_name` varchar(100) DEFAULT NULL,
  `implementation_objectives` varchar(100) DEFAULT NULL,
  `plan_implementer` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `plantype_id` int DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `plan_detail` longtext,
  PRIMARY KEY (`id`),
  KEY `home_plans_template_id_8a16c0c0_fk_home_planytemplate_id` (`template_id`),
  KEY `home_plans_plantype_id_d34cad14_fk_home_planytype_id` (`plantype_id`),
  CONSTRAINT `home_plans_plantype_id_d34cad14_fk_home_planytype_id` FOREIGN KEY (`plantype_id`) REFERENCES `home_planytype` (`id`),
  CONSTRAINT `home_plans_template_id_8a16c0c0_fk_home_planytemplate_id` FOREIGN KEY (`template_id`) REFERENCES `home_planytemplate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_plans`
--

LOCK TABLES `home_plans` WRITE;
/*!40000 ALTER TABLE `home_plans` DISABLE KEYS */;
INSERT INTO `home_plans` VALUES (1,'针对火警的预案处理','',NULL,NULL,NULL,NULL,'2022-05-18 13:44:20.911246','2022-05-18 13:44:20.911266',1,1,'细节');
/*!40000 ALTER TABLE `home_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_planytemplate`
--

DROP TABLE IF EXISTS `home_planytemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_planytemplate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(30) NOT NULL,
  `ersion_num` varchar(30) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `create_user` varchar(30) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `use_info` longtext,
  `description` longtext,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_name` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_planytemplate`
--

LOCK TABLES `home_planytemplate` WRITE;
/*!40000 ALTER TABLE `home_planytemplate` DISABLE KEYS */;
INSERT INTO `home_planytemplate` VALUES (1,'应对火警的模板策略','100001','北京市消防局','消防局一处处长','2022-05-18 13:35:56.848018','火警的处理说明','火警的应对模板','2022-05-18 13:35:56.848047','2022-05-18 13:35:56.848055');
/*!40000 ALTER TABLE `home_planytemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_planytype`
--

DROP TABLE IF EXISTS `home_planytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_planytype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL,
  `type_desc` longtext NOT NULL,
  `type_status` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_planytype`
--

LOCK TABLES `home_planytype` WRITE;
/*!40000 ALTER TABLE `home_planytype` DISABLE KEYS */;
INSERT INTO `home_planytype` VALUES (1,'火警预案','针对火警的预案编制',1,'2022-05-18 13:38:32.870658','2022-05-18 13:38:32.870679');
/*!40000 ALTER TABLE `home_planytype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-18 14:24:00
