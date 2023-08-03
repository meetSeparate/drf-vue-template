-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: drf_vue_mysql
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `announcement_announcement`
--

DROP TABLE IF EXISTS `announcement_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_announcement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `color` varchar(64) NOT NULL,
  `size` varchar(64) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcement_announcement_user_id_ab5d0e36_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `announcement_announcement_user_id_ab5d0e36_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_announcement`
--

LOCK TABLES `announcement_announcement` WRITE;
/*!40000 ALTER TABLE `announcement_announcement` DISABLE KEYS */;
INSERT INTO `announcement_announcement` VALUES (1,'测试系统第一条公告','2023-08-03 01:40:30.613501','#409eff','large',1),(2,'测试数据库迁移','2023-08-03 01:41:35.658041','rgba(158, 9, 232, 1)','large',1),(3,'遵纪守法，做守法公民','2023-08-03 01:43:04.727517','rgba(221, 8, 232, 1)','large',1),(4,'测试刷新页面增加公告','2023-08-03 01:43:50.269039','rgba(18, 218, 171, 1)','large',1),(5,'好好学习，天天向上','2023-08-03 01:44:19.121171','rgba(235, 18, 83, 1)','large',1);
/*!40000 ALTER TABLE `announcement_announcement` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add menu',6,'add_menu'),(22,'Can change menu',6,'change_menu'),(23,'Can delete menu',6,'delete_menu'),(24,'Can view menu',6,'view_menu'),(25,'Can add characters',7,'add_characters'),(26,'Can change characters',7,'change_characters'),(27,'Can delete characters',7,'delete_characters'),(28,'Can view characters',7,'view_characters'),(29,'Can add user info',8,'add_userinfo'),(30,'Can change user info',8,'change_userinfo'),(31,'Can delete user info',8,'delete_userinfo'),(32,'Can view user info',8,'view_userinfo'),(33,'Can add announcement',9,'add_announcement'),(34,'Can change announcement',9,'change_announcement'),(35,'Can delete announcement',9,'delete_announcement'),(36,'Can view announcement',9,'view_announcement');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'announcement','announcement'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(7,'user','characters'),(6,'user','menu'),(8,'user','userinfo');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-03 01:29:45.946799'),(2,'contenttypes','0002_remove_content_type_name','2023-08-03 01:29:45.996665'),(3,'auth','0001_initial','2023-08-03 01:29:46.148871'),(4,'auth','0002_alter_permission_name_max_length','2023-08-03 01:29:46.185298'),(5,'auth','0003_alter_user_email_max_length','2023-08-03 01:29:46.190284'),(6,'auth','0004_alter_user_username_opts','2023-08-03 01:29:46.196268'),(7,'auth','0005_alter_user_last_login_null','2023-08-03 01:29:46.202252'),(8,'auth','0006_require_contenttypes_0002','2023-08-03 01:29:46.204247'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-03 01:29:46.209233'),(10,'auth','0008_alter_user_username_max_length','2023-08-03 01:29:46.215218'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-03 01:29:46.220207'),(12,'auth','0010_alter_group_name_max_length','2023-08-03 01:29:46.232172'),(13,'auth','0011_update_proxy_permissions','2023-08-03 01:29:46.237160'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-03 01:29:46.243143'),(15,'user','0001_initial','2023-08-03 01:29:46.607561'),(16,'admin','0001_initial','2023-08-03 01:29:46.691336'),(17,'admin','0002_logentry_remove_auto_add','2023-08-03 01:29:46.699315'),(18,'admin','0003_logentry_add_action_flag_choices','2023-08-03 01:29:46.708475'),(19,'announcement','0001_initial','2023-08-03 01:29:46.723145'),(20,'announcement','0002_initial','2023-08-03 01:29:46.763038'),(21,'sessions','0001_initial','2023-08-03 01:29:46.788970');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_characters`
--

DROP TABLE IF EXISTS `user_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_characters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `note` longtext,
  `create_date` datetime(6) DEFAULT NULL,
  `change_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_characters`
--

LOCK TABLES `user_characters` WRITE;
/*!40000 ALTER TABLE `user_characters` DISABLE KEYS */;
INSERT INTO `user_characters` VALUES (3,'管理员','超级管理员，拥有系统所有权限','2023-08-03 02:05:35.984001','2023-08-03 02:05:35.984001'),(4,'普通用户','','2023-08-03 02:05:51.044869','2023-08-03 02:05:51.044869');
/*!40000 ALTER TABLE `user_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_characters_menu`
--

DROP TABLE IF EXISTS `user_characters_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_characters_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `characters_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_characters_menu_characters_id_menu_id_16a93f51_uniq` (`characters_id`,`menu_id`),
  KEY `user_characters_menu_menu_id_e25445e8_fk_user_menu_id` (`menu_id`),
  CONSTRAINT `user_characters_menu_characters_id_257c4019_fk_user_char` FOREIGN KEY (`characters_id`) REFERENCES `user_characters` (`id`),
  CONSTRAINT `user_characters_menu_menu_id_e25445e8_fk_user_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `user_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_characters_menu`
--

LOCK TABLES `user_characters_menu` WRITE;
/*!40000 ALTER TABLE `user_characters_menu` DISABLE KEYS */;
INSERT INTO `user_characters_menu` VALUES (4,3,1),(5,3,2),(6,3,3),(7,3,4),(8,3,5),(9,3,6),(10,3,7),(11,3,8),(12,3,9),(13,3,10);
/*!40000 ALTER TABLE `user_characters_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_menu`
--

DROP TABLE IF EXISTS `user_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `another_name` varchar(64) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `reveal` varchar(64) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `menu_name` varchar(128) DEFAULT NULL,
  `component_address` varchar(128) DEFAULT NULL,
  `sequence` varchar(128) DEFAULT NULL,
  `redirect` varchar(128) DEFAULT NULL,
  `menu_icon` varchar(64) DEFAULT NULL,
  `status` varchar(64) NOT NULL,
  `parent_menu_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_menu_parent_menu_id_35dc55e4_fk_user_menu_id` (`parent_menu_id`),
  CONSTRAINT `user_menu_parent_menu_id_35dc55e4_fk_user_menu_id` FOREIGN KEY (`parent_menu_id`) REFERENCES `user_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu`
--

LOCK TABLES `user_menu` WRITE;
/*!40000 ALTER TABLE `user_menu` DISABLE KEYS */;
INSERT INTO `user_menu` VALUES (1,'根节点','根节点','根节点','是','',NULL,NULL,NULL,NULL,'','正常',NULL),(2,'权限管理',NULL,'目录','是','/permission','permission','Layout/index.vue','3','/permission/menu','Lollipop','正常',1),(3,'菜单管理',NULL,'菜单','是','/permission/menu','menu','Permission/Menu.vue','1',NULL,NULL,'正常',2),(4,'角色管理','','菜单','是','/permission/role','role','Permission/Role.vue','2','','','正常',2),(5,'异常页面','','目录','是','/error','error','Layout/index.vue','2','/error/403','Warning','正常',1),(6,'403','','菜单','是','/error/403','403','Error/403.vue','1','','','',5),(7,'404','','菜单','','/error/404','404','Error/404.vue','2','','','',5),(8,'500','','菜单','是','/error/500','500','Error/500.vue','3','','','',5),(9,'用户管理','','目录','是','/user','user','Layout/index.vue','1','/user/account','User','',1),(10,'用户管理','','菜单','','/user/account','account','User/Account.vue','1','','User','',9);
/*!40000 ALTER TABLE `user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo`
--

DROP TABLE IF EXISTS `user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_userinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `name` varchar(32) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_userinfo_role_id_e5218572_fk_user_characters_id` (`role_id`),
  KEY `user_userinfo_username_phone_90e3b8e8_idx` (`username`,`phone`),
  CONSTRAINT `user_userinfo_role_id_e5218572_fk_user_characters_id` FOREIGN KEY (`role_id`) REFERENCES `user_characters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo`
--

LOCK TABLES `user_userinfo` WRITE;
/*!40000 ALTER TABLE `user_userinfo` DISABLE KEYS */;
INSERT INTO `user_userinfo` VALUES (1,'pbkdf2_sha256$600000$0ntE8ODW8gD66hHUOUWW5s$i26oAEI050sQZsXGJq/hXOnrlQbHah/OOuJSgtT1Uyw=',NULL,1,'admin','','','',1,1,'2023-08-03 01:30:08.985710','张恩宇','男',21,'15566666666',3);
/*!40000 ALTER TABLE `user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo_groups`
--

DROP TABLE IF EXISTS `user_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_userinfo_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userinfo_groups_userinfo_id_group_id_427ab23f_uniq` (`userinfo_id`,`group_id`),
  KEY `user_userinfo_groups_group_id_660e8d76_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_userinfo_groups_group_id_660e8d76_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_userinfo_groups_userinfo_id_80ed863e_fk_user_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo_groups`
--

LOCK TABLES `user_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `user_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `user_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_userinfo_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userinfo_user_permi_userinfo_id_permission_i_8245f325_uniq` (`userinfo_id`,`permission_id`),
  KEY `user_userinfo_user_p_permission_id_a994ee6a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_userinfo_user_p_permission_id_a994ee6a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_userinfo_user_p_userinfo_id_76f2e887_fk_user_user` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo_user_permissions`
--

LOCK TABLES `user_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-03 10:30:00
