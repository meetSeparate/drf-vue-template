-- MySQL dump 10.13  Distrib 8.2.0, for macos13 (arm64)
--
-- Host: localhost    Database: drf_vue_system
-- ------------------------------------------------------
-- Server version	8.2.0

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_announcement`
--

LOCK TABLES `announcement_announcement` WRITE;
/*!40000 ALTER TABLE `announcement_announcement` DISABLE KEYS */;
INSERT INTO `announcement_announcement` VALUES (6,'图像修复系统简介','2023-11-23 13:34:15.071471','#409eff','large',1),(7,'图像修复系统简介','2023-11-23 13:34:29.557971','rgba(40, 38, 164, 1)','large',1),(8,'图像修复系统简介','2023-11-23 13:34:39.661891','#409eff','large',1),(9,'图像修复系统简介','2023-11-23 13:34:49.443046','rgba(255, 64, 121, 1)','large',1),(10,'图像修复系统简介123','2023-11-23 13:35:31.010478','rgba(255, 64, 252, 1)','large',1),(11,'图像修复系统简介678','2023-11-23 13:35:43.610595','rgba(64, 255, 80, 1)','large',1),(12,'123','2023-11-23 13:40:02.944382','rgba(255, 64, 207, 1)','large',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add menu',6,'add_menu'),(22,'Can change menu',6,'change_menu'),(23,'Can delete menu',6,'delete_menu'),(24,'Can view menu',6,'view_menu'),(25,'Can add characters',7,'add_characters'),(26,'Can change characters',7,'change_characters'),(27,'Can delete characters',7,'delete_characters'),(28,'Can view characters',7,'view_characters'),(29,'Can add user info',8,'add_userinfo'),(30,'Can change user info',8,'change_userinfo'),(31,'Can delete user info',8,'delete_userinfo'),(32,'Can view user info',8,'view_userinfo'),(33,'Can add announcement',9,'add_announcement'),(34,'Can change announcement',9,'change_announcement'),(35,'Can delete announcement',9,'delete_announcement'),(36,'Can view announcement',9,'view_announcement'),(37,'Can add notice',10,'add_notice'),(38,'Can change notice',10,'change_notice'),(39,'Can delete notice',10,'delete_notice'),(40,'Can view notice',10,'view_notice'),(41,'Can add category',11,'add_category'),(42,'Can change category',11,'change_category'),(43,'Can delete category',11,'delete_category'),(44,'Can view category',11,'view_category'),(45,'Can add goods',12,'add_goods'),(46,'Can change goods',12,'change_goods'),(47,'Can delete goods',12,'delete_goods'),(48,'Can view goods',12,'view_goods'),(49,'Can add banner',13,'add_banner'),(50,'Can change banner',13,'change_banner'),(51,'Can delete banner',13,'delete_banner'),(52,'Can view banner',13,'view_banner'),(53,'Can add recommend',14,'add_recommend'),(54,'Can change recommend',14,'change_recommend'),(55,'Can delete recommend',14,'delete_recommend'),(56,'Can view recommend',14,'view_recommend'),(57,'Can add goods specs',15,'add_goodsspecs'),(58,'Can change goods specs',15,'change_goodsspecs'),(59,'Can delete goods specs',15,'delete_goodsspecs'),(60,'Can view goods specs',15,'view_goodsspecs'),(61,'Can add shop detail image',16,'add_shopdetailimage'),(62,'Can change shop detail image',16,'change_shopdetailimage'),(63,'Can delete shop detail image',16,'delete_shopdetailimage'),(64,'Can view shop detail image',16,'view_shopdetailimage'),(65,'Can add goods skus',17,'add_goodsskus'),(66,'Can change goods skus',17,'change_goodsskus'),(67,'Can delete goods skus',17,'delete_goodsskus'),(68,'Can view goods skus',17,'view_goodsskus'),(69,'Can add car info',18,'add_carinfo'),(70,'Can change car info',18,'change_carinfo'),(71,'Can delete car info',18,'delete_carinfo'),(72,'Can view car info',18,'view_carinfo'),(73,'Can add order',19,'add_order'),(74,'Can change order',19,'change_order'),(75,'Can delete order',19,'delete_order'),(76,'Can view order',19,'view_order'),(77,'Can add comment',20,'add_comment'),(78,'Can change comment',20,'change_comment'),(79,'Can delete comment',20,'delete_comment'),(80,'Can view comment',20,'view_comment'),(81,'Can add image',21,'add_image'),(82,'Can change image',21,'change_image'),(83,'Can delete image',21,'delete_image'),(84,'Can view image',21,'view_image'),(85,'Can add strategy',22,'add_strategy'),(86,'Can change strategy',22,'change_strategy'),(87,'Can delete strategy',22,'delete_strategy'),(88,'Can view strategy',22,'view_strategy'),(89,'Can add comment',23,'add_comment'),(90,'Can change comment',23,'change_comment'),(91,'Can delete comment',23,'delete_comment'),(92,'Can view comment',23,'view_comment'),(93,'Can add image',24,'add_image'),(94,'Can change image',24,'change_image'),(95,'Can delete image',24,'delete_image'),(96,'Can view image',24,'view_image'),(97,'Can add student evaluate',25,'add_studentevaluate'),(98,'Can change student evaluate',25,'change_studentevaluate'),(99,'Can delete student evaluate',25,'delete_studentevaluate'),(100,'Can view student evaluate',25,'view_studentevaluate'),(101,'Can add teacher evaluate',26,'add_teacherevaluate'),(102,'Can change teacher evaluate',26,'change_teacherevaluate'),(103,'Can delete teacher evaluate',26,'delete_teacherevaluate'),(104,'Can view teacher evaluate',26,'view_teacherevaluate'),(105,'Can add com evaluation',27,'add_comevaluation'),(106,'Can change com evaluation',27,'change_comevaluation'),(107,'Can delete com evaluation',27,'delete_comevaluation'),(108,'Can view com evaluation',27,'view_comevaluation'),(109,'Can add section',28,'add_section'),(110,'Can change section',28,'change_section'),(111,'Can delete section',28,'delete_section'),(112,'Can view section',28,'view_section'),(113,'Can add detection record',29,'add_detectionrecord'),(114,'Can change detection record',29,'change_detectionrecord'),(115,'Can delete detection record',29,'delete_detectionrecord'),(116,'Can view detection record',29,'view_detectionrecord'),(117,'Can add image drawing',30,'add_imagedrawing'),(118,'Can change image drawing',30,'change_imagedrawing'),(119,'Can delete image drawing',30,'delete_imagedrawing'),(120,'Can view image drawing',30,'view_imagedrawing'),(121,'Can add mask drawing',31,'add_maskdrawing'),(122,'Can change mask drawing',31,'change_maskdrawing'),(123,'Can delete mask drawing',31,'delete_maskdrawing'),(124,'Can view mask drawing',31,'view_maskdrawing'),(125,'Can add goods property',32,'add_goodsproperty'),(126,'Can change goods property',32,'change_goodsproperty'),(127,'Can delete goods property',32,'delete_goodsproperty'),(128,'Can view goods property',32,'view_goodsproperty'),(129,'Can add user cart',33,'add_usercart'),(130,'Can change user cart',33,'change_usercart'),(131,'Can delete user cart',33,'delete_usercart'),(132,'Can view user cart',33,'view_usercart'),(133,'Can add order pre',34,'add_orderpre'),(134,'Can change order pre',34,'change_orderpre'),(135,'Can delete order pre',34,'delete_orderpre'),(136,'Can view order pre',34,'view_orderpre'),(137,'Can add address',35,'add_address'),(138,'Can change address',35,'change_address'),(139,'Can delete address',35,'delete_address'),(140,'Can view address',35,'view_address'),(141,'Can add order',36,'add_order'),(142,'Can change order',36,'change_order'),(143,'Can delete order',36,'delete_order'),(144,'Can view order',36,'view_order'),(145,'Can add order middle',37,'add_ordermiddle'),(146,'Can change order middle',37,'change_ordermiddle'),(147,'Can delete order middle',37,'delete_ordermiddle'),(148,'Can view order middle',37,'view_ordermiddle');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_banner`
--

DROP TABLE IF EXISTS `banner_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `banner_url` varchar(100) NOT NULL,
  `type` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`),
  CONSTRAINT `banner_banner_category_id_46d9241c_fk_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_banner`
--

LOCK TABLES `banner_banner` WRITE;
/*!40000 ALTER TABLE `banner_banner` DISABLE KEYS */;
INSERT INTO `banner_banner` VALUES (1,'banner/1ba86bcc-ae71-42a3-bc3e-37b662f7f07e.jpg',1,8),(2,'banner/dfc11bb0-4af5-4e9b-9458-99f615cc685a.jpg',1,1),(3,'banner/6d202d8e-bb47-4f92-9523-f32ab65754f4.jpg',1,6),(4,'banner/4a79180a-1a5a-4042-8a77-4db0b9c800a8.jpg',1,7),(5,'banner/e83efb1b-309c-46f7-98a3-f1fefa694338.jpg',1,9);
/*!40000 ALTER TABLE `banner_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_category`
--

DROP TABLE IF EXISTS `category_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  `saleInfo` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_category_parent_category_id_15ef278a_fk_category_` (`parent_category_id`),
  CONSTRAINT `category_category_parent_category_id_15ef278a_fk_category_` FOREIGN KEY (`parent_category_id`) REFERENCES `category_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_category`
--

LOCK TABLES `category_category` WRITE;
/*!40000 ALTER TABLE `category_category` DISABLE KEYS */;
INSERT INTO `category_category` VALUES (1,'单车','category/201516e3-25d0-48f5-bcee-7f0cafb14176.png',NULL,'大额优惠 等你来拿'),(6,'性能车','category/4b02f01f-a365-4b6c-9f7a-8b0f591dda02.png',NULL,NULL),(7,'速度车','category/9660870d-6a59-4624-8064-b3a8cbf50d5c.png',NULL,NULL),(8,'山地车','category/7d19752c-baff-49b6-bd02-5ece1d729214.png',NULL,NULL),(9,'脚踏车','category/4ff20b9e-8150-4bd3-87a3-0cd6766938dd.png',NULL,NULL);
/*!40000 ALTER TABLE `category_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_category_goods`
--

DROP TABLE IF EXISTS `category_category_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_category_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_category_goods_category_id_goods_id_af374ac4_uniq` (`category_id`,`goods_id`),
  KEY `category_category_goods_goods_id_82871782_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `category_category_go_category_id_d67d02f2_fk_category_` FOREIGN KEY (`category_id`) REFERENCES `category_category` (`id`),
  CONSTRAINT `category_category_goods_goods_id_82871782_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_category_goods`
--

LOCK TABLES `category_category_goods` WRITE;
/*!40000 ALTER TABLE `category_category_goods` DISABLE KEYS */;
INSERT INTO `category_category_goods` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(19,1,18),(20,1,19),(21,1,20),(22,1,21),(23,1,22),(24,1,23),(25,1,24),(26,1,25),(192,6,1),(193,6,2),(194,6,3),(195,6,4),(196,6,5),(197,6,6),(198,6,7),(199,6,8),(200,6,9),(201,6,10),(202,6,11),(203,6,12),(204,6,13),(15,6,14),(205,6,15),(206,6,16),(207,6,17),(208,6,18),(209,6,19),(210,6,20),(211,6,21),(212,6,22),(213,6,23),(214,6,24),(215,6,25),(216,6,26),(217,6,27),(218,6,28),(219,6,29),(220,6,30),(221,6,31),(222,6,32),(223,6,33),(224,6,34),(225,6,35),(226,6,36),(227,6,37),(228,6,38),(229,6,39),(230,6,40),(231,6,41),(232,6,42),(233,6,43),(234,6,44),(235,6,45),(236,6,46),(147,7,1),(148,7,2),(149,7,3),(150,7,4),(151,7,5),(152,7,6),(153,7,7),(154,7,8),(155,7,9),(156,7,10),(157,7,11),(158,7,12),(159,7,13),(160,7,14),(16,7,15),(161,7,16),(162,7,17),(163,7,18),(164,7,19),(165,7,20),(166,7,21),(167,7,22),(168,7,23),(169,7,24),(170,7,25),(171,7,26),(172,7,27),(173,7,28),(174,7,29),(175,7,30),(176,7,31),(177,7,32),(178,7,33),(179,7,34),(180,7,35),(181,7,36),(182,7,37),(183,7,38),(184,7,39),(185,7,40),(186,7,41),(187,7,42),(188,7,43),(189,7,44),(190,7,45),(191,7,46),(102,8,1),(103,8,2),(104,8,3),(105,8,4),(106,8,5),(107,8,6),(108,8,7),(109,8,8),(110,8,9),(111,8,10),(112,8,11),(113,8,12),(114,8,13),(115,8,14),(116,8,15),(17,8,16),(117,8,17),(118,8,18),(119,8,19),(120,8,20),(121,8,21),(122,8,22),(123,8,23),(124,8,24),(125,8,25),(126,8,26),(127,8,27),(128,8,28),(129,8,29),(130,8,30),(131,8,31),(132,8,32),(133,8,33),(134,8,34),(135,8,35),(136,8,36),(137,8,37),(138,8,38),(139,8,39),(140,8,40),(141,8,41),(142,8,42),(143,8,43),(144,8,44),(145,8,45),(146,8,46),(57,9,1),(58,9,2),(59,9,3),(60,9,4),(61,9,5),(62,9,6),(63,9,7),(64,9,8),(65,9,9),(66,9,10),(67,9,11),(68,9,12),(69,9,13),(70,9,14),(71,9,15),(72,9,16),(18,9,17),(73,9,18),(74,9,19),(75,9,20),(76,9,21),(77,9,22),(78,9,23),(79,9,24),(80,9,25),(81,9,26),(82,9,27),(83,9,28),(84,9,29),(85,9,30),(86,9,31),(87,9,32),(88,9,33),(89,9,34),(90,9,35),(91,9,36),(92,9,37),(93,9,38),(94,9,39),(95,9,40),(96,9,41),(97,9,42),(98,9,43),(99,9,44),(100,9,45),(101,9,46);
/*!40000 ALTER TABLE `category_category_goods` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-31 02:16:07.918208','1','暖腰暖腹暖胃，蕲艾暖宫腰带',1,'[{\"added\": {}}]',12,1),(2,'2023-08-31 02:17:08.418490','2','新年佳礼，家用SPA多功能按摩床垫',1,'[{\"added\": {}}]',12,1),(3,'2023-08-31 02:18:11.465221','3','七夕礼物·姐姐同款，穿出自信体态矫姿带',1,'[{\"added\": {}}]',12,1),(4,'2023-08-31 02:19:08.829350','4','带提手可站立炫彩硅胶热水袋',1,'[{\"added\": {}}]',12,1),(5,'2023-08-31 02:20:18.215327','5','七夕礼物·挺拔身姿，隐形内穿矫姿带',1,'[{\"added\": {}}]',12,1),(6,'2023-08-31 02:21:10.672116','6','消炎镇痛一贴灵医用冷敷贴60贴/盒',1,'[{\"added\": {}}]',12,1),(7,'2023-08-31 02:22:04.919021','7','真空拔罐器',1,'[{\"added\": {}}]',12,1),(8,'2023-08-31 02:22:42.275797','8','艾灸理疗随时随地，灸疗装置8头/12头',1,'[{\"added\": {}}]',12,1),(9,'2023-08-31 02:23:24.528702','9','入门首选，语音播报电子血压计',1,'[{\"added\": {}}]',12,1),(10,'2023-08-31 02:24:10.029686','1','居家',1,'[{\"added\": {}}]',11,1),(11,'2023-08-31 02:54:00.934548','10','黄金玉粟粥米500克',1,'[{\"added\": {}}]',12,1),(12,'2023-08-31 02:54:59.274486','2','美食',1,'[{\"added\": {}}]',11,1),(13,'2023-08-31 02:56:23.105475','3','服饰',1,'[{\"added\": {}}]',11,1),(14,'2023-08-31 02:57:00.361329','11','懒人瘦出好身材，多功能甩脂塑形机',1,'[{\"added\": {}}]',12,1),(15,'2023-08-31 02:57:08.245868','3','服饰',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(16,'2023-08-31 02:58:56.179573','12','新款LOGO印花时尚学步叫叫鞋',1,'[{\"added\": {}}]',12,1),(17,'2023-08-31 02:59:27.365208','4','母婴',1,'[{\"added\": {}}]',11,1),(18,'2023-08-31 03:00:42.113426','13','【新疆棉】简约山形纹全棉提花毛巾',1,'[{\"added\": {}}]',12,1),(19,'2023-08-31 03:01:25.085168','5','个护',1,'[{\"added\": {}}]',11,1),(20,'2023-08-31 03:03:07.182412','14','医美级冰脱韩国Ulike蓝宝石脉冲光脱毛仪',1,'[{\"added\": {}}]',12,1),(21,'2023-08-31 03:03:30.663143','6','严选',1,'[{\"added\": {}}]',11,1),(22,'2023-08-31 03:05:09.218858','15','书源彩色按动中性笔',1,'[{\"added\": {}}]',12,1),(23,'2023-08-31 03:05:48.239376','7','数码',1,'[{\"added\": {}}]',11,1),(24,'2023-08-31 03:22:25.502154','16','运动健身跑步腰包',1,'[{\"added\": {}}]',12,1),(25,'2023-08-31 03:23:26.729698','8','运动',1,'[{\"added\": {}}]',11,1),(26,'2023-08-31 03:24:22.508667','17','分场景使用不污染，超细纤维抹布分类5件套',1,'[{\"added\": {}}]',12,1),(27,'2023-08-31 03:25:18.898848','9','杂项',1,'[{\"added\": {}}]',11,1),(28,'2023-08-31 03:35:54.485442','10','居家生活用品',1,'[{\"added\": {}}]',11,1),(29,'2023-08-31 03:37:28.125496','11','收纳',1,'[{\"added\": {}}]',11,1),(30,'2023-08-31 03:54:33.504621','12','宠物食品',1,'[{\"added\": {}}]',11,1),(31,'2023-08-31 03:54:56.064393','13','艺术藏品',1,'[{\"added\": {}}]',11,1),(32,'2023-08-31 03:55:07.969659','14','宠物用品',1,'[{\"added\": {}}]',11,1),(33,'2023-08-31 03:55:21.267711','15','家庭医疗',1,'[{\"added\": {}}]',11,1),(34,'2023-08-31 03:55:37.020864','16','中医保健',1,'[{\"added\": {}}]',11,1),(35,'2023-08-31 05:17:45.610638','17','南北干货',1,'[{\"added\": {}}]',11,1),(36,'2023-08-31 05:18:06.501383','18','调味酱菜',1,'[{\"added\": {}}]',11,1),(37,'2023-08-31 05:18:27.534193','19','方便食品',1,'[{\"added\": {}}]',11,1),(38,'2023-08-31 05:18:48.141011','20','米面粮油',1,'[{\"added\": {}}]',11,1),(39,'2023-08-31 05:19:09.931668','21','名酒馆',1,'[{\"added\": {}}]',11,1),(40,'2023-08-31 05:19:25.208714','22','进口酒',1,'[{\"added\": {}}]',11,1),(41,'2023-08-31 05:23:02.825157','23','钱包/胸包',1,'[{\"added\": {}}]',11,1),(42,'2023-08-31 05:23:34.739023','24','女士靴子',1,'[{\"added\": {}}]',11,1),(43,'2023-08-31 05:24:06.279870','25','休闲鞋',1,'[{\"added\": {}}]',11,1),(44,'2023-08-31 05:24:29.435264','26','运动鞋',1,'[{\"added\": {}}]',11,1),(45,'2023-08-31 05:24:55.192255','27','11.11购物狂欢',1,'[{\"added\": {}}]',11,1),(46,'2023-08-31 05:25:20.620446','28','【年末狂欢季】',1,'[{\"added\": {}}]',11,1),(47,'2023-08-31 05:42:41.706179','29','儿童上衣',1,'[{\"added\": {}}]',11,1),(48,'2023-08-31 05:43:03.280925','30','儿童鞋',1,'[{\"added\": {}}]',11,1),(49,'2023-08-31 05:43:27.942598','31','儿童外套',1,'[{\"added\": {}}]',11,1),(50,'2023-08-31 05:45:11.997236','32','儿童下衣',1,'[{\"added\": {}}]',11,1),(51,'2023-08-31 05:46:09.530759','33','连体衣',1,'[{\"added\": {}}]',11,1),(52,'2023-08-31 05:46:31.350515','34','学步鞋',1,'[{\"added\": {}}]',11,1),(53,'2023-08-31 05:54:55.559090','35','家庭清洁',1,'[{\"added\": {}}]',11,1),(54,'2023-08-31 05:55:16.761810','36','浴室用品',1,'[{\"added\": {}}]',11,1),(55,'2023-08-31 05:55:21.816807','35','家庭清洁',2,'[{\"changed\": {\"fields\": [\"\\u7236\\u5206\\u7c7b\"]}}]',11,1),(56,'2023-08-31 05:55:52.791827','37','餐厨清洁',1,'[{\"added\": {}}]',11,1),(57,'2023-08-31 05:56:10.489716','38','纸品',1,'[{\"added\": {}}]',11,1),(58,'2023-08-31 05:56:27.561945','39','干湿巾',1,'[{\"added\": {}}]',11,1),(59,'2023-08-31 05:56:42.250618','40','毛巾浴巾',1,'[{\"added\": {}}]',11,1),(60,'2023-08-31 07:06:44.890701','41','滋补保健',1,'[{\"added\": {}}]',11,1),(61,'2023-08-31 07:07:26.406887','42','床品家纺',1,'[{\"added\": {}}]',11,1),(62,'2023-08-31 07:07:46.198993','43','钢具配件',1,'[{\"added\": {}}]',11,1),(63,'2023-08-31 07:08:05.737331','44','清洁用品',1,'[{\"added\": {}}]',11,1),(64,'2023-08-31 07:08:17.180953','45','个护电器',1,'[{\"added\": {}}]',11,1),(65,'2023-08-31 07:12:09.121336','46','影音娱乐',1,'[{\"added\": {}}]',11,1),(66,'2023-08-31 07:12:48.656720','47','3C数码',1,'[{\"added\": {}}]',11,1),(67,'2023-08-31 07:12:57.290377','48','乐器',1,'[{\"added\": {}}]',11,1),(68,'2023-08-31 07:13:13.717240','49','手机配件',1,'[{\"added\": {}}]',11,1),(69,'2023-08-31 07:13:38.937071','50','车载用品',1,'[{\"added\": {}}]',11,1),(70,'2023-08-31 07:13:57.486260','51','办公文具',1,'[{\"added\": {}}]',11,1),(71,'2023-08-31 07:18:01.778945','52','健身器械(大)',1,'[{\"added\": {}}]',11,1),(72,'2023-08-31 07:18:18.405736','53','健身器械(小)',1,'[{\"added\": {}}]',11,1),(73,'2023-08-31 07:18:47.834766','54','城市出行',1,'[{\"added\": {}}]',11,1),(74,'2023-08-31 07:19:06.542050','55','运动护具',1,'[{\"added\": {}}]',11,1),(75,'2023-08-31 07:19:26.782490','56','垂钓工具',1,'[{\"added\": {}}]',11,1),(76,'2023-08-31 07:19:44.578541','57','户外装备',1,'[{\"added\": {}}]',11,1),(77,'2023-08-31 07:20:35.902726','58','家庭清洁',1,'[{\"added\": {}}]',11,1),(78,'2023-09-01 01:30:47.166984','1','轮播图',1,'[{\"added\": {}}]',13,1),(79,'2023-09-01 01:31:18.761581','2','轮播图',1,'[{\"added\": {}}]',13,1),(80,'2023-09-01 01:32:25.702536','3','轮播图',1,'[{\"added\": {}}]',13,1),(81,'2023-09-01 01:33:16.722112','4','轮播图',1,'[{\"added\": {}}]',13,1),(82,'2023-09-01 01:34:05.907927','5','轮播图',1,'[{\"added\": {}}]',13,1),(83,'2023-09-01 03:28:04.701674','1','特惠推荐',1,'[{\"added\": {}}]',14,1),(84,'2023-09-01 03:28:23.197061','2','爆款推荐',1,'[{\"added\": {}}]',14,1),(85,'2023-09-01 03:28:59.671057','3','一站买全',1,'[{\"added\": {}}]',14,1),(86,'2023-09-01 03:29:19.088726','4','领券中心',1,'[{\"added\": {}}]',14,1),(87,'2023-09-01 05:30:52.808405','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(88,'2023-09-01 05:30:59.580472','2','美食',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(89,'2023-09-01 05:31:07.999148','3','服饰',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(90,'2023-09-01 05:31:16.286050','4','母婴',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(91,'2023-09-01 05:33:47.055647','18','3秒快速拆琴轻松保养odin奥丁12半音阶口琴',1,'[{\"added\": {}}]',12,1),(92,'2023-09-01 05:34:22.759072','19','善谋者得天下，三国杀桌游',1,'[{\"added\": {}}]',12,1),(93,'2023-09-01 05:35:00.931121','20','飞天53%vol500ml贵州茅台酒（带杯）',1,'[{\"added\": {}}]',12,1),(94,'2023-09-01 05:35:58.712474','21','一吸即净，车家多用，车载无线吸尘器',1,'[{\"added\": {}}]',12,1),(95,'2023-09-01 05:36:39.386159','22','办公居家必备，3A3U智能插线板',1,'[{\"added\": {}}]',12,1),(96,'2023-09-01 05:37:34.733549','23','地道卤香好味道，桂林鲜米粉245克*6盒',1,'[{\"added\": {}}]',12,1),(97,'2023-09-01 05:38:21.616317','24','玛歌正牌干红750毫升2017年',1,'[{\"added\": {}}]',12,1),(98,'2023-09-01 05:38:59.549777','25','下饭神器酸豆角50克*10袋',1,'[{\"added\": {}}]',12,1),(99,'2023-09-01 05:39:16.308467','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(100,'2023-09-01 05:43:50.703896','26','朱炳仁铜·猫型吉祥物装饰工艺摆件',1,'[{\"added\": {}}]',12,1),(101,'2023-09-01 05:44:35.862239','27','星云吉彩系列花器新年创意花瓶摆件朱炳仁',1,'[{\"added\": {}}]',12,1),(102,'2023-09-01 05:46:14.259885','28','苏格兰陈年单一麦芽威士忌700毫升',1,'[{\"added\": {}}]',12,1),(103,'2023-09-01 05:46:59.983328','29','大丈夫方便面轻巧款私房牛肉味64克*6杯',1,'[{\"added\": {}}]',12,1),(104,'2023-09-01 05:47:59.736689','2','美食',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(105,'2023-09-01 05:50:35.098321','30','别致优雅男式新潮头层牛皮钥匙包',1,'[{\"added\": {}}]',12,1),(106,'2023-09-01 05:51:12.256902','31','雨天有情调，英伦风设计，给你好品味',1,'[{\"added\": {}}]',12,1),(107,'2023-09-01 05:51:55.849194','32','复古经典女式休闲鞋小白鞋',1,'[{\"added\": {}}]',12,1),(108,'2023-09-01 05:52:42.904206','33','保暖系列-女式饼干板鞋加毛款',1,'[{\"added\": {}}]',12,1),(109,'2023-09-01 05:53:21.955078','34','「一件三穿好过冬」男中长款鹅绒防水外套',1,'[{\"added\": {}}]',12,1),(110,'2023-09-01 05:54:03.146942','35','男式零感无压加厚保暖羽绒服',1,'[{\"added\": {}}]',12,1),(111,'2023-09-01 05:54:39.167204','36','女式优雅蝴蝶结饰带浅口穆勒鞋',1,'[{\"added\": {}}]',12,1),(112,'2023-09-01 05:55:19.542630','37','鸣夏女式运动休闲凉鞋',1,'[{\"added\": {}}]',12,1),(113,'2023-09-01 05:55:42.124538','3','服饰',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(114,'2023-09-01 06:08:50.552876','38','儿童亚麻夏凉宽松萝卜裤防蚊裤66-130cm',1,'[{\"added\": {}}]',12,1),(115,'2023-09-01 06:10:57.449483','39','舒适软弹，糖果色儿童网孔透气运动鞋',1,'[{\"added\": {}}]',12,1),(116,'2023-09-01 06:11:34.217626','40','新疆棉宝宝时尚涂鸦短袖连体衣59-90cm',1,'[{\"added\": {}}]',12,1),(117,'2023-09-01 06:27:10.488190','41','ins风小碎花泡泡袖衬110-160cm',1,'[{\"added\": {}}]',12,1),(118,'2023-09-01 06:27:49.206468','42','90%白鸭绒，儿童轻羽绒马甲73-130cm',1,'[{\"added\": {}}]',12,1),(119,'2023-09-01 06:28:24.351189','43','甜酷运动风，儿童卫衣运动套装73-130cm',1,'[{\"added\": {}}]',12,1),(120,'2023-09-01 06:29:02.432806','44','儿童网眼运动凉鞋（宽松版）25-32码',1,'[{\"added\": {}}]',12,1),(121,'2023-09-01 06:29:42.999624','45','防踢鞋头，儿童学步健康机能鞋21-30',1,'[{\"added\": {}}]',12,1),(122,'2023-09-01 06:32:35.921571','4','母婴',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(123,'2023-09-01 08:23:17.156581','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(124,'2023-09-01 08:23:35.548791','2','美食',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(125,'2023-09-01 08:24:01.297202','3','服饰',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(126,'2023-09-01 08:24:16.548202','4','母婴',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(127,'2023-09-01 08:26:51.240073','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(128,'2023-09-01 08:44:59.753357','43','甜酷运动风，儿童卫衣运动套装73-130cm',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u5c01\\u9762\"]}}]',12,1),(129,'2023-09-01 08:46:22.716660','10','居家生活用品',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\", \"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(130,'2023-09-01 08:47:41.079431','10','居家生活用品',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(131,'2023-09-07 07:45:59.649037','46','抑菌保鲜黑科技泰国可微波冷冻食物保鲜盒',1,'[{\"added\": {}}]',12,1),(132,'2023-09-07 07:46:21.309429','1','抑菌保鲜黑科技泰国可微波冷冻食物保鲜盒',1,'[{\"added\": {}}]',16,1),(133,'2023-09-07 07:46:30.220251','2','抑菌保鲜黑科技泰国可微波冷冻食物保鲜盒',1,'[{\"added\": {}}]',16,1),(134,'2023-09-07 07:46:38.967647','3','抑菌保鲜黑科技泰国可微波冷冻食物保鲜盒',1,'[{\"added\": {}}]',16,1),(135,'2023-09-07 07:46:46.711582','4','抑菌保鲜黑科技泰国可微波冷冻食物保鲜盒',1,'[{\"added\": {}}]',16,1),(136,'2023-09-07 07:46:54.731725','5','抑菌保鲜黑科技泰国可微波冷冻食物保鲜盒',1,'[{\"added\": {}}]',16,1),(137,'2023-09-07 08:39:37.849761','1','玻璃材质-方形【890ml】',1,'[{\"added\": {}}]',15,1),(138,'2023-09-07 08:40:32.955581','2','玻璃材质-圆形【800ml】',1,'[{\"added\": {}}]',15,1),(139,'2023-09-07 08:41:48.038641','3','PP材质-圆形【1300ml】',1,'[{\"added\": {}}]',15,1),(140,'2023-09-07 08:42:36.022601','4','PP材质-圆形【600ml】',1,'[{\"added\": {}}]',15,1),(141,'2023-09-07 08:43:30.951242','5','PP材质-长方形【1000ml】',1,'[{\"added\": {}}]',15,1),(142,'2023-09-07 09:05:23.659775','1','GoodsSkus object (1)',1,'[{\"added\": {}}]',17,1),(143,'2023-09-07 09:05:53.726650','2','GoodsSkus object (2)',1,'[{\"added\": {}}]',17,1),(144,'2023-09-07 09:06:08.060354','3','GoodsSkus object (3)',1,'[{\"added\": {}}]',17,1),(145,'2023-09-07 09:06:22.468812','4','GoodsSkus object (4)',1,'[{\"added\": {}}]',17,1),(146,'2023-09-07 09:06:35.720482','5','GoodsSkus object (5)',1,'[{\"added\": {}}]',17,1),(147,'2023-10-13 03:42:17.368169','1','奔驰e300',1,'[{\"added\": {}}]',18,1),(148,'2023-10-13 06:22:04.382549','1','奔驰e300',2,'[{\"changed\": {\"fields\": [\"\\u4ef7\\u683c\"]}}]',18,1),(149,'2023-10-13 06:55:27.142318','1','奔驰e300',2,'[{\"changed\": {\"fields\": [\"\\u8bc4\\u8bba\\u6570\"]}}]',18,1),(150,'2023-11-04 13:28:46.834947','1','image/1.jpg',1,'[{\"added\": {}}]',24,1),(151,'2023-11-04 13:28:54.586485','2','image/9.jpg',1,'[{\"added\": {}}]',24,1),(152,'2023-11-04 13:29:02.388725','3','image/13.jpg',1,'[{\"added\": {}}]',24,1),(153,'2023-11-04 13:29:07.050422','1','测试攻略1',1,'[{\"added\": {}}]',22,1),(154,'2023-11-05 13:32:39.624874','1','测试攻略1',2,'[{\"changed\": {\"fields\": [\"\\u4f4d\\u7f6e\"]}}]',22,1),(155,'2023-11-05 13:44:21.795921','1','测试攻略1',2,'[{\"changed\": {\"fields\": [\"\\u4f4d\\u7f6e\"]}}]',22,1),(156,'2023-11-06 02:33:24.410262','1','测试攻略1',2,'[{\"changed\": {\"fields\": [\"\\u4f4d\\u7f6e\"]}}]',22,1),(157,'2023-11-06 03:22:07.754366','2','test456',2,'[{\"changed\": {\"fields\": [\"User permissions\", \"Staff status\"]}}]',8,1),(158,'2023-11-07 02:07:15.398324','2','test456',2,'[{\"changed\": {\"fields\": [\"Last login\", \"User permissions\"]}}]',8,1),(159,'2023-11-07 02:08:53.641738','2','test456',2,'[{\"changed\": {\"fields\": [\"Last login\", \"User permissions\"]}}]',8,1),(160,'2023-11-07 02:09:28.581599','2','test456',2,'[{\"changed\": {\"fields\": [\"Last login\", \"User permissions\"]}}]',8,1),(161,'2023-11-07 02:10:27.269549','2','test456',2,'[{\"changed\": {\"fields\": [\"Last login\", \"User permissions\"]}}]',8,1),(162,'2023-11-07 02:12:59.234405','2','test456',2,'[{\"changed\": {\"fields\": [\"Last login\", \"User permissions\"]}}]',8,1),(164,'2023-11-19 06:06:10.765006','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(165,'2023-11-19 06:09:21.913231','58','家庭清洁',3,'',11,1),(166,'2023-11-19 06:09:21.915226','57','户外装备',3,'',11,1),(167,'2023-11-19 06:09:21.917220','56','垂钓工具',3,'',11,1),(168,'2023-11-19 06:09:21.919216','55','运动护具',3,'',11,1),(169,'2023-11-19 06:09:21.921210','54','城市出行',3,'',11,1),(170,'2023-11-19 06:09:21.923204','53','健身器械(小)',3,'',11,1),(171,'2023-11-19 06:09:21.924202','52','健身器械(大)',3,'',11,1),(172,'2023-11-19 06:09:21.926196','51','办公文具',3,'',11,1),(173,'2023-11-19 06:09:21.928191','50','车载用品',3,'',11,1),(174,'2023-11-19 06:09:21.929188','49','手机配件',3,'',11,1),(175,'2023-11-19 06:09:21.931183','48','乐器',3,'',11,1),(176,'2023-11-19 06:09:21.932180','47','3C数码',3,'',11,1),(177,'2023-11-19 06:09:21.934175','46','影音娱乐',3,'',11,1),(178,'2023-11-19 06:09:21.936171','45','个护电器',3,'',11,1),(179,'2023-11-19 06:09:21.937167','44','清洁用品',3,'',11,1),(180,'2023-11-19 06:09:21.939162','43','钢具配件',3,'',11,1),(181,'2023-11-19 06:09:21.941156','42','床品家纺',3,'',11,1),(182,'2023-11-19 06:09:21.943151','41','滋补保健',3,'',11,1),(183,'2023-11-19 06:09:21.944149','40','毛巾浴巾',3,'',11,1),(184,'2023-11-19 06:09:21.946143','39','干湿巾',3,'',11,1),(185,'2023-11-19 06:09:21.947140','38','纸品',3,'',11,1),(186,'2023-11-19 06:09:21.949135','37','餐厨清洁',3,'',11,1),(187,'2023-11-19 06:09:21.951130','36','浴室用品',3,'',11,1),(188,'2023-11-19 06:09:21.953125','35','家庭清洁',3,'',11,1),(189,'2023-11-19 06:09:21.954122','34','学步鞋',3,'',11,1),(190,'2023-11-19 06:09:21.956116','33','连体衣',3,'',11,1),(191,'2023-11-19 06:09:21.958111','32','儿童下衣',3,'',11,1),(192,'2023-11-19 06:09:21.959109','31','儿童外套',3,'',11,1),(193,'2023-11-19 06:09:21.961103','30','儿童鞋',3,'',11,1),(194,'2023-11-19 06:09:21.963098','29','儿童上衣',3,'',11,1),(195,'2023-11-19 06:09:21.964095','28','【年末狂欢季】',3,'',11,1),(196,'2023-11-19 06:09:21.966090','27','11.11购物狂欢',3,'',11,1),(197,'2023-11-19 06:09:21.968084','26','运动鞋',3,'',11,1),(198,'2023-11-19 06:09:21.970079','25','休闲鞋',3,'',11,1),(199,'2023-11-19 06:09:21.971076','24','女士靴子',3,'',11,1),(200,'2023-11-19 06:09:21.973070','23','钱包/胸包',3,'',11,1),(201,'2023-11-19 06:09:21.975066','22','进口酒',3,'',11,1),(202,'2023-11-19 06:09:21.977061','21','名酒馆',3,'',11,1),(203,'2023-11-19 06:09:21.978057','20','米面粮油',3,'',11,1),(204,'2023-11-19 06:09:21.980053','19','方便食品',3,'',11,1),(205,'2023-11-19 06:09:21.982047','18','调味酱菜',3,'',11,1),(206,'2023-11-19 06:09:21.983044','17','南北干货',3,'',11,1),(207,'2023-11-19 06:09:21.985039','16','中医保健',3,'',11,1),(208,'2023-11-19 06:09:21.987033','15','家庭医疗',3,'',11,1),(209,'2023-11-19 06:09:21.989028','14','宠物用品',3,'',11,1),(210,'2023-11-19 06:09:21.991023','13','艺术藏品',3,'',11,1),(211,'2023-11-19 06:09:21.993018','12','宠物食品',3,'',11,1),(212,'2023-11-19 06:09:21.994015','11','收纳',3,'',11,1),(213,'2023-11-19 06:09:21.996010','10','居家生活用品',3,'',11,1),(214,'2023-11-19 06:09:21.997007','4','母婴',3,'',11,1),(215,'2023-11-19 06:09:21.999002','3','服饰',3,'',11,1),(216,'2023-11-19 06:09:22.000996','2','美食',3,'',11,1),(217,'2023-11-19 06:10:06.560315','5','个护',3,'',11,1),(218,'2023-11-19 06:10:30.509500','1','单车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u540d\\u79f0\"]}}]',11,1),(219,'2023-11-19 06:10:41.786447','6','性能车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u540d\\u79f0\"]}}]',11,1),(220,'2023-11-19 06:10:59.834137','7','速度车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u540d\\u79f0\"]}}]',11,1),(221,'2023-11-19 06:11:07.203524','8','山地车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u540d\\u79f0\"]}}]',11,1),(222,'2023-11-19 06:11:34.346178','9','脚踏车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u540d\\u79f0\"]}}]',11,1),(223,'2023-11-19 12:41:15.780243','1','总经办',1,'[{\"added\": {}}]',28,1),(224,'2023-11-19 12:41:22.228682','2','行政部',1,'[{\"added\": {}}]',28,1),(225,'2023-11-19 12:41:30.535224','3','财务部',1,'[{\"added\": {}}]',28,1),(226,'2023-11-19 12:41:37.132459','4','销售部',1,'[{\"added\": {}}]',28,1),(227,'2023-11-19 12:41:45.527233','5','采购部',1,'[{\"added\": {}}]',28,1),(228,'2023-11-19 12:41:52.695433','6','仓储部',1,'[{\"added\": {}}]',28,1),(229,'2023-11-24 03:22:51.366728','9','脚踏车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(230,'2023-11-24 03:22:59.730956','8','山地车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(231,'2023-11-24 03:24:40.138114','7','速度车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(232,'2023-11-24 03:24:48.327872','6','性能车',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(233,'2023-11-24 03:24:55.593315','1','单车',2,'[]',11,1),(234,'2023-11-24 06:00:48.844113','1','善谋者得天下，三国杀桌游',1,'[{\"added\": {}}]',32,1),(235,'2023-11-24 06:01:29.729256','2','带提手可站立炫彩硅胶热水袋',1,'[{\"added\": {}}]',32,1),(236,'2023-11-24 06:01:52.862449','3','暖腰暖腹暖胃，蕲艾暖宫腰带',1,'[{\"added\": {}}]',32,1),(237,'2023-11-24 06:02:18.424303','4','暖腰暖腹暖胃，蕲艾暖宫腰带',1,'[{\"added\": {}}]',32,1),(238,'2023-11-24 06:03:30.196109','5','暖腰暖腹暖胃，蕲艾暖宫腰带',1,'[{\"added\": {}}]',32,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'announcement','announcement'),(3,'auth','group'),(2,'auth','permission'),(13,'banner','banner'),(18,'car','carinfo'),(20,'car','comment'),(19,'car','order'),(11,'category','category'),(4,'contenttypes','contenttype'),(27,'evaluate','comevaluation'),(25,'evaluate','studentevaluate'),(26,'evaluate','teacherevaluate'),(35,'goods','address'),(12,'goods','goods'),(32,'goods','goodsproperty'),(17,'goods','goodsskus'),(15,'goods','goodsspecs'),(36,'goods','order'),(37,'goods','ordermiddle'),(34,'goods','orderpre'),(14,'goods','recommend'),(16,'goods','shopdetailimage'),(33,'goods','usercart'),(21,'notice','image'),(10,'notice','notice'),(5,'sessions','session'),(23,'travel','comment'),(24,'travel','image'),(22,'travel','strategy'),(7,'user','characters'),(29,'user','detectionrecord'),(30,'user','imagedrawing'),(31,'user','maskdrawing'),(6,'user','menu'),(28,'user','section'),(8,'user','userinfo');
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-03 01:29:45.946799'),(2,'contenttypes','0002_remove_content_type_name','2023-08-03 01:29:45.996665'),(3,'auth','0001_initial','2023-08-03 01:29:46.148871'),(4,'auth','0002_alter_permission_name_max_length','2023-08-03 01:29:46.185298'),(5,'auth','0003_alter_user_email_max_length','2023-08-03 01:29:46.190284'),(6,'auth','0004_alter_user_username_opts','2023-08-03 01:29:46.196268'),(7,'auth','0005_alter_user_last_login_null','2023-08-03 01:29:46.202252'),(8,'auth','0006_require_contenttypes_0002','2023-08-03 01:29:46.204247'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-03 01:29:46.209233'),(10,'auth','0008_alter_user_username_max_length','2023-08-03 01:29:46.215218'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-03 01:29:46.220207'),(12,'auth','0010_alter_group_name_max_length','2023-08-03 01:29:46.232172'),(13,'auth','0011_update_proxy_permissions','2023-08-03 01:29:46.237160'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-03 01:29:46.243143'),(15,'user','0001_initial','2023-08-03 01:29:46.607561'),(16,'admin','0001_initial','2023-08-03 01:29:46.691336'),(17,'admin','0002_logentry_remove_auto_add','2023-08-03 01:29:46.699315'),(18,'admin','0003_logentry_add_action_flag_choices','2023-08-03 01:29:46.708475'),(19,'announcement','0001_initial','2023-08-03 01:29:46.723145'),(20,'announcement','0002_initial','2023-08-03 01:29:46.763038'),(21,'sessions','0001_initial','2023-08-03 01:29:46.788970'),(22,'notice','0001_initial','2023-08-07 03:14:15.754697'),(23,'notice','0002_alter_notice_avatar','2023-08-07 05:16:02.168829'),(24,'notice','0003_notice_user','2023-08-07 07:04:19.416523'),(25,'notice','0004_alter_notice_user','2023-08-07 12:43:42.839107'),(26,'user','0002_alter_characters_menu','2023-08-07 12:43:42.856061'),(27,'goods','0001_initial','2023-08-30 03:59:07.870749'),(28,'category','0001_initial','2023-08-30 03:59:08.001830'),(29,'goods','0002_alter_goods_ordernum','2023-08-31 02:15:16.599904'),(30,'category','0002_alter_category_goods','2023-08-31 02:58:02.702204'),(31,'banner','0001_initial','2023-09-01 01:28:10.214106'),(32,'goods','0003_goods_create_date','2023-09-01 02:41:25.200948'),(33,'goods','0004_recommend','2023-09-01 03:23:00.445159'),(34,'category','0003_category_saleinfo','2023-09-01 08:22:42.813078'),(35,'category','0004_alter_category_saleinfo','2023-09-01 08:46:41.398246'),(36,'goods','0005_goods_brand_goods_collectioncount_goods_commentcount_and_more','2023-09-04 02:31:10.546579'),(37,'goods','0006_goodsspecs','2023-09-04 05:36:12.879278'),(38,'goods','0007_goodsspecs_shop','2023-09-04 05:45:48.919553'),(39,'goods','0008_goodsspecs_spec_type_shopdetailimage','2023-09-06 06:24:09.605346'),(40,'goods','0009_goodsskus','2023-09-07 08:26:44.259420'),(41,'goods','0010_alter_goodsspecs_spec_type','2023-09-07 08:36:39.670250'),(42,'goods','0011_remove_goodsspecs_selected','2023-09-07 08:40:54.556719'),(43,'goods','0012_goodsskus_shop','2023-09-07 08:44:40.256894'),(44,'car','0001_initial','2023-10-13 01:25:25.381168'),(45,'goods','0013_alter_goodsskus_price','2023-10-13 01:25:25.389874'),(46,'car','0002_carinfo_brand_carinfo_price','2023-10-13 02:10:06.478592'),(47,'car','0003_order_comment','2023-10-13 05:47:07.150030'),(48,'notice','0005_image','2023-10-31 02:24:02.556363'),(49,'travel','0001_initial','2023-11-04 13:07:22.318300'),(50,'travel','0002_comment_parent_comment','2023-11-04 14:15:45.342821'),(51,'travel','0003_strategy_location','2023-11-05 13:29:42.130399'),(52,'evaluate','0001_initial','2023-11-13 13:21:35.699274'),(53,'evaluate','0002_alter_studentevaluate_options_and_more','2023-11-16 00:44:21.053987'),(54,'user','0003_userinfo_department_userinfo_profession','2023-11-16 00:44:21.165688'),(55,'user','0004_section_alter_characters_options_and_more','2023-11-19 12:32:45.037204'),(56,'salary','0001_initial','2023-11-19 14:11:55.816381'),(57,'salary','0002_vacate','2023-11-20 02:23:03.186753'),(58,'salary','0003_remove_vacate_user_delete_salarymodel_delete_vacate','2023-11-23 04:24:23.997502'),(59,'user','0002_imagedrawing_maskdrawing_alter_characters_menu_and_more','2023-11-23 06:23:58.059791'),(60,'goods','0014_goodsproperty','2023-11-24 05:56:36.241353'),(61,'goods','0015_usercart','2023-11-24 10:02:30.939419'),(62,'goods','0016_usercart_selected','2023-11-24 13:18:26.377144'),(63,'goods','0017_orderpre','2023-11-25 05:44:51.934003'),(64,'goods','0018_orderpre_create_date','2023-11-25 05:54:54.145961'),(65,'goods','0019_address','2023-11-25 06:49:31.491554'),(66,'goods','0020_ordermiddle_order','2023-11-27 03:53:48.905981'),(67,'goods','0021_alter_order_order_middle','2023-11-27 04:42:41.499480'),(68,'goods','0022_alter_order_buyermessage_alter_order_paymoney_and_more','2023-11-27 06:29:32.264930');
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
INSERT INTO `django_session` VALUES ('0zhsbkki6v0rn5hkjxuistr2gsexidh0','.eJy1kMFOwzAQRH-l8rkkdmwnTo_cucGJVNXa3rSGJJWcBAlV-XdsUiFaVVChclpr33g0OweygXHYbcYe_cZZsiIZWX7faTCv2EVgX6Db7hOz7wbvdBIlyZH2ycPeYnN_1J4Y7KDfhd8KylplNS2VtFkpWYmccjSGC4GWacORSsugpCCFMUpRJgUTTKJWheCFiaYtdmMfvJ4PFemgxYqsFhV59PCGTUWW4e1Cunlbg1_UcGecNw3OsI0Z-4hPDapqlHmNYRSZKMJQVogwcizpFbajb2aWgm1dlw6feVLXwhbTWQLWPv2kCvyo1B7BGj-2-kLQqy6dlotbXTetI0ZnI2WUZhe8c8l19Ja5_HtXfZgDbt9_retL-M-NXX_VeUf8fMGmNZk-APkREVo:1r0Bjt:8c_DbG0oNA0ZoyHKjV0-SifyoyTSzzhtBV60sQMM4KI','2023-11-21 02:22:49.912767'),('1xd3ys3mbx5eyv475qzpdz8htymhlxrc','.eJy9VkuPmzAQ_isR5zxsHrbZY6see9xTWUV-jAMtj8pApWqV_14bULtxQWGTtJcMzIxnvgcJeQ2OvO_yY9-CORYqeApwsH2bE1x-g9oV1Fden5q9bOrOFGLvWvZTtd1_bhSUH6beiwE5b3N7Gnia8kgkDIFQMhUsBh2SFKNIAEZY45QjnFCqaSoTQlgEOoojjBXCSqF4QFVB3bd21pfXLKh5BVnwtMmCj7yDU2N-ZsHW3hUW35jX3Gw038nCyBLGYuVQtq58OSLL-iRExAYqqXBBcOxCbJPXx_amHGsHrqqiPsgJ0Z-LsY8r9Xy11TZN7cIAV9L0lZiBvJL1ebt5FNPziytDoVwVIxT6Cewv-_SDl73FeaczQqdDIAPsBGsbmJCxDfYhojcYBBOwQ9v1Curu9_2iT4snVtq1Uoo5u-6j75sUL68gSTJsAsQep3AHXOZg3qGwf-J_KXwrfV_hZGYFBS3d7PiR0sqmmq6Lpl4h7GX_P5f1Vs6-nsRPRP6yZ_ueue83hiahA0nCiDqsjLAbjHGvu-GjqHWz7Mdl20obVlCcs-C9tHypmZ-gM1uY4PHoMB78Zs52ErFhNY2jv3e2bmebF1CqHS-76_aAfXjmpzgh251sTvOeuP8hh5Np-u_LhrzpWenGY0jPfmfWEPVMwch3KT2_BOdfoJwdQw:1r4auh:JSWUKszDkEvBQ3AaMZb5yp8lqFudjMzzKJDQPb5oQ4U','2023-12-03 06:04:11.081245'),('3xyom9g8i92piji3ti4css3i8qgrx9al','.eJy9Vclu2zAQ_RVDZy-kKZFUjgV67DGnKDC4DC21WgpSyiXwv5eUhSJmZVRxnFw85mxv5j2Jek0OYujLw-DAHiqdPCQ4Wb_1SaF-QRsC-qdoj91WdW1vK7kNKdsp6rY_Og31tyn3okEpXOmrQeS5IDLjCKRWueQpmD3NMSISMMIG5wLhjDHDcpVRygkYkhKMNcJao3ScqoF2cL7X02uRtKKBInlYFcn3F1EPoventT9Vfr6z3wi7MmKjKqvqKdiEKV0IX7YoiiGTJh8Npd6wDBtvuFSpN35UtqD7YOtzbCd0U7U7mAbbuX7Q0PZ_z-d0ofXj0gqfO1VJC0IrOzRyZo-FVJzWqzuvf3oOYah0iGKE9tchaJaNSID4_RjuQagS7DsYjiu-iuFb148ZJjMQDIwKvdN7Uqu6Zvpfde0CYi_zP53WW3eO-UxjB47BHv1t9rE7hmX7MCTdExZm5ZTfIEy4VMefqjXddT0u0xbKsGDFOQneu1ZMNY0d2QwKlyI9K4xHvXmQnRI-QrOU_IvpAqYrK6j1RtT9_-UB__DMdwlEuo3qjvOahK_d7mi74fd1Qd7kLFTjPkvPvjNLFo1F4bGDnZ6T0x_9epzB:1r3FAW:iYNBat6kDfflxeTk7_iRjhOV8ZkX-sTGpzICd0u1Jgc','2023-11-29 12:38:56.069921'),('44h5fpnksb6vm4azi027fsshktdk2bc6','.eJy9Vclu2zAQ_RVDZy-kKZFUjgV67DGnKDC4DC21WgpSyiXwv5eUhSJmZVRxnFw85mxv5j2Jek0OYujLw-DAHiqdPCQ4Wb_1SaF-QRsC-qdoj91WdW1vK7kNKdsp6rY_Og31tyn3okEpXOmrQeS5IDLjCKRWueQpmD3NMSISMMIG5wLhjDHDcpVRygkYkhKMNcJao3ScqoF2cL7X02uRtKKBInlYFcn3F1EPoventT9Vfr6z3wi7MmKjKqvqKdiEKV0IX7YoiiGTJh8Npd6wDBtvuFSpN35UtqD7YOtzbCd0U7U7mAbbuX7Q0PZ_z-d0ofXj0gqfO1VJC0IrOzRyZo-FVJzWqzuvf3oOYah0iGKE9tchaJaNSID4_RjuQagS7DsYjiu-iuFb148ZJjMQDIwKvdN7Uqu6Zvpfde0CYi_zP53WW3eO-UxjB47BHv1t9rE7hmX7MCTdExZm5ZTfIEy4VMefqjXddT0u0xbKsGDFOQneu1ZMNY0d2QwKlyI9K4xHvXmQnRI-QrOU_IvpAqYrK6j1RtT9_-UB__DMdwlEuo3qjvOahK_d7mi74fd1Qd7kLFTjPkvPvjNLFo1F4bGDnZ6T0x_9epzB:1r35GC:OJOJiCoIXx_4ZmsSIbuJg374LviugWfbTo_djohE9Eg','2023-11-29 02:04:08.576181'),('erzegxol4w1rsnv8kx7x07fbqjuxenpr','.eJytUstugzAQ_JXI5wRsbMDk2HuPOZUoWj8IbnlUdjhF_HttyCFJkxapvXitnfHODsMZHWA41YfBaXswCm0RQevrngD5obsAqHfojn0k--5kjYgCJbqgLnrtlW5eLtybATW42r_WUBRARcqxFkoWgjNdJVlBMBWaYFKRAjBJ87zKC5lmGae6oowSojBRCrNpq1Z3g_Oz3s4l6qDVJdquSrTzKiVa-5vxu829Cuyqgo00VjZ6BtuwoQvw7fOyHPI04b5kCc194TzjC-YNtpmxGFRrujiYnQ7TVX08c0Cp3Y80T7hQhdWgpB1a8WDHBRbH9erPtsZ9gLVRASUYJ_cN8kCFC2BTkcSXlHEZNCmfpHNGv2u6oOlqoxu1geb0ezxasidTwod0G9kfH2cS_sL4aPvh83kgV5yFafyP6UeBLTJ6Hwq7b9Bxj8YvI-Uyzw:1r4jP5:ZEYwSm23R3VSc7OjxY7hdO-PjqoxhHvuJGHWkNkAoQ4','2023-12-03 15:08:07.456093'),('fusvfx32fl44aix5c9yc9dvdh42pcrov','.eJy1VMtugzAQ_JXI5zzsGAzk2J577KlE0dpeB1oelYFTlH-vHXJIKE1QlRzQop1hvDu7-EB20LXZrmvQ7nJNNoSR-WVOgvrCygP6E6p9vVR11dpcLj1leUab5VutsXg5c68EMmgy9zVCkgCXYUxRapXIOECzFgmjXCKjzLAEKAujyESJCoWIORoecMY0ZVrT4FRViVXXOK2PQ0oqKDElm1lKXsGmZO5ecldanzJgZwYWKreqwB4sfYGNh6-_TtNOqEi7EBshXAgMMp-kwkyQ7WzRYyvQZV6tFFj_5JWpVz0DtH6_QXLwmSgtgla2K-VImfebPM5nj2rsuPUw5tqjjNL1iHYsYe1CyMPwnzbVVqO9bVJPeaZF09sYmsJH1VRwChL-uzt16ba8vbM7Z9JzjZnaytCYYJhg47738srvZBjEyq8mj2MfooD_PrPxZzZZjoVeQNHe_asjdA2Mq_h7qVmoej8-B393rfa27r7_HsMFZ-IUHtP0iJXTGh0ORQwT4XFLjj-ijeLY:1qrI1y:l3l8VvFncuVXk66VQSoHRUSUwNr8YMisZt_kXH0p7oo','2023-10-27 13:16:42.289001'),('k4zp83nfy7do6ltkn0laxqbaxsfr57f0','.eJytUrtywjAQ_BVGNdgSkl-USZ0yVcwwJ-mElfiRkXDF-N9jYQogJlCk8Jxnd3V7p9WR7KA_VLveo9tZTTaEkeUlJkF9YRsI_QntvotU1x6clVGQRGfWR2-dxvrlrL1qUIGvxtMIRQFcJjlFqVUhc4FmnRaMcomMMsMKoCzJMpMVKknTnKPhgjOmKdOaitNUDba9H3t9HEvSQoMl2SxK8gquJMvxx46jTZABtzCwUtapGieyCQP6QF-fLss-VZkeS27SdCzCIAsgTc0TbXtXT1wMurFtrMCFz7amiycFaP3-h2ikz0LpELRyfSNnxny85LBc_NdiwzbQaHVgGaXrW4DNmOUSxKmo4JKIXAUznuehZIL_9vTB01cWa72C-vAwpwyVuNMlvDS_Ut1-PpXwGuO96_rv-6FcaJ7M5H-WnrnK5xa9DUXcAnzYkuEHy2k1xw:1qr922:lP8Iy6Ge7EqCF41gZieD7zWVygcgv2R3vzdE3k6YtVg','2023-10-27 03:40:10.295486'),('rnjgq2wwy0hegww13v4mv8ukrj2r2ypw','.eJy1VMtu2zAQ_BWDZ9sizYekHHvPrT1VgbEkV7JaPQJSKlAE_veSllskqloLRnIaYWc8uzsL84UcYRxOx9GjO9aWPBBGtq9rGsx37CJhv0FX9XvTd4Or9T5K9lfW7x97i82nq_aNwQn8KfwaIc-Ba5lR1NbkOhNYHlTOKNfIKCtZDpTJNC3T3EilMo4lF5wxS5m1VFymarEbffD6-lKQDlosyMOmIJ8d_MCmINvwXYfppmoJblPCztTONDiRbZzRR_qtQVGMUpUYID2INEBmhQigMKcrbEfXTFwCtq27ZLjMk9QtVJhMErD2y_9Ugb8qtUOwxo2tXhh01abn7ea9tjs_RRprG1lG6WHBW0muo7dU8v6sfMABq5834_oj_ODE1m81z4gvuGXaiAtoiKYaWARB1f2Jmb4N_4bhZmC_dR-c170bztMT8wJbbAZTMxO7SJGZeDGeZRFSwf_u6WNPf6qxsTtohpvPQYphnWWX-Kb5nemr5fPEdy-pXD8-__s0rzQrz_I-Sy9EuW7R-VHUvCDPT-T8C9f8-Ng:1qzGgU:B14YxWsaF7WwIoK2x7_jYlu1Z8Vv5U1eUinOULuhuwg','2023-11-18 13:27:30.925664'),('te4hpb8je0ga75oz1i40ez7d534hs8oo','.eJytU8tugzAQ_JXI5yTgGIPJsffemlOJIj8WQsujsqFSFfHvtSGHhBKFpr2w0c5kdncGTujA2-Z4aA3oQ67QFmG0vOwJLt-hcoB641VWr2VdNToXa0dZn1Gzfq4VFE9n7pXAkZuj_TfwOOZEUOaDUDIWLIB0E8bYJwKwj1Mccx_TKEqjWNIwZARSEhCMlY-V8oN-qxKq1lit11OCKl5CgraLBL1o_glFgpb2d263G7op14uUr2SuZQEDWLodjYOvBZKkDSkRtkQ0pDOEWl0MmMdVmVde02_gGVsbyL68gcWV2t0hWsqZLDRwJXVbiokFZ13YLRePX9XtHQy5cij2_c24gcfyO5vt3zyP6Ia5JTcksoWxkD1gvXvF-kdepfVt469pM22fceKE6b8-a2x1MG6QiSlM8KAvEttCAybdTML60VFAfs40bqY55lCoFS-a-_GADG6oOCPNStbZdCbu2_cyXbcftwO54MxM43-Ongps1qHjUMJxg3Z71H0DZ16nLw:1qzqCS:N1anjPEN9n2_PYvbY-1CcmmUBL55eQissCLHp7pAvbw','2023-11-20 03:22:52.053972'),('v9xlcpqefiahznrfxwqn49roty2je4eo','.eJy1VMtu2zAQ_BWDZ9sizYekHHvPrT1VgbEkV7JaPQJSKlAE_veSllskqloLRnIaYWc8uzsL84UcYRxOx9GjO9aWPBBGtq9rGsx37CJhv0FX9XvTd4Or9T5K9lfW7x97i82nq_aNwQn8KfwaIc-Ba5lR1NbkOhNYHlTOKNfIKCtZDpTJNC3T3EilMo4lF5wxS5m1VFymarEbffD6-lKQDlosyMOmIJ8d_MCmINvwXYfppmoJblPCztTONDiRbZzRR_qtQVGMUpUYID2INEBmhQigMKcrbEfXTFwCtq27ZLjMk9QtVJhMErD2y_9Ugb8qtUOwxo2tXhh01abn7ea9tjs_RRprG1lG6WHBW0muo7dU8v6sfMABq5834_oj_ODE1m81z4gvuGXaiAtoiKYaWARB1f2Jmb4N_4bhZmC_dR-c170bztMT8wJbbAZTMxO7SJGZeDGeZRFSwf_u6WNPf6qxsTtohpvPQYphnWWX-Kb5nemr5fPEdy-pXD8-__s0rzQrz_I-Sy9EuW7R-VHUvCDPT-T8C9f8-Ng:1qzdPx:-v8mwG07oJMI6sp9TdbvR0snMaGuamGVi3uwlEp1KZo','2023-11-19 13:43:57.971423'),('vgjsaudtd595zqixh6epb2tauiya8gwt','.eJzFVk1zmzAQ_Ssezv6QjMRHjskhpx57KhnPSlowDR8eYQ6djP97JXCmiYJjDG16YUH7vLvvPRn04u2gPe53bYN6lyvvzqPe8u2aAPmMlU2on1Bl9VrW1VHnYm0h63O2WX-rFRb3Z-y7Anto9ubXCHEMvuARQaFkLCKG6TaIKfEFUkJTGgOhPAzTMJY8CCIfU5_5lCpClSKsm6rEqm1MrR8viVdBiYl3t0i8e6gq1Im3NPe5ma5fTUEvUljJXMsC-2RpZ2xs-n2BJGmjNEATAgbKBB6kOKJeq4s-twFV5tVGdIO8hh4DSn3_FGYAZ6jQCErqthQDM44ieVouZhM7Pdk05spmKSFbd4G6XR7giFmtf81zgG9JYEIoQ2GDAGoDM4u3GyHPE_25uWjGR-hIQ0ayHrBkKlPXCOYu-G6zx7pWzTxbGAqw-0dSZoMPkd1UPicTbMnsOBuNsi7NP1ldNsUFjrRkDN0BP6ZSdOUPhrzmzHrNmaSzd3WvSn-9Il1__beyTaXmyhZerR3FsnMm8uU82ZoDynHa9civFHA8SVfA6KbaxiPsnjgj0Uw5n9uRalrg_xLzFsKutPH1TgLtU0Akf_2-moZbFk6WttnXB4VHyIu8hAyvCezCv1TmieQdmSlxdedDJxkBrAtda84i2b2tI_u2DkLmf-zZ2J7NPsdCraA4Xv3WdftkuIo9yTYrWWfDztnT7ibTdXu4bNcbzEiP_g7pASnHEXVdck-ClJ6evNNvvlPVuA:1qeAe2:ZCsn6J9TGrjHw25kA9B-PcRm_xBv6m7qAtjfzzzF9Ao','2023-09-21 08:45:46.991759'),('wjdy7q34yaw610dujimncx91ls0m3fda','.eJzFV8uSmzAQ_BUXZz8kkATsMTnklOOeQsqlF5gsD5eAQ2rL_x4NdiW2ggOGze4FWTPtmenuwpJfvT3v2sO-a7TZ58p78rC3vo4JLl90BQn1g1dZvZV11ZpcbAGyvWSb7dda6eLTBXtT4MCbg_225nHMA0EjpIWSsYiITn0WYxQIjRFOccwRpmGYhrGkjEWBTgMSYKwQVgqRfqpSV11ja317TbyKlzrxnlaJ95m3OqvNz8Rb211u5zvHU25WKd_I3MhCn5MlTNlA-rZEknTUR8wuoQwFLIJjWIgNjpftTHHO7bgq82onLxP9-XDGcaWeR6EWdIELo7mSpivFwMgTWZ_Wq7dievoOaZ0ryGKEfDeA3WZf6lo1C22hBIalROLFtmQwzuV515Br0EQrptAc8mEmNVd2Mlo7iiWxi32p5DLZmqOW07Q7I99TwOkkXQHpQ7WtR7rfUYKihXK-dBPVBOBHifkIYVdaNt5JaNgxJCkEWaqhoU_C2dI2h_qodMvzIi95pscEduHvKvNM8q7M4aOdJNX9zp8vc_88mvqoTfuPA24I_IESTybuShwNdAqpH0E1Pwihk_JVbx-LYZey-WcUXJwkN-2YrL9x_1fRhTxdKWM3ELg9ny2vZfcGZ-SIzfmpBnn7R16l9X0vbmETrZhAcdyJcVqO1Bi7ATTQJRKc9Ev_BlESwSHAgqhvHZLg754N9GwOuS7UhhftuD1wogxXASGbjayzYU_gj8UuM3V3vG_IFWaiG29DesiwSURdUwI3YO_a3ukXMgxFzg:1r751w:ltYxooX0egX-dB-9d1mfNgmO-DszxTN37F-WH3BvU9c','2023-12-10 02:37:56.336696'),('yv21fq70lhnlnzb05h2jgekwggto2ubb','.eJzFV8uSmzAQ_BUXZz8kkATsMTnklOOeQsqlF5gsD5eAQ2rL_x4NdiW2ggOGze4FWTPtmenuwpJfvT3v2sO-a7TZ58p78rC3vo4JLl90BQn1g1dZvZV11ZpcbAGyvWSb7dda6eLTBXtT4MCbg_225nHMA0EjpIWSsYiITn0WYxQIjRFOccwRpmGYhrGkjEWBTgMSYKwQVgqRfqpSV11ja317TbyKlzrxnlaJ95m3OqvNz8Rb211u5zvHU25WKd_I3MhCn5MlTNlA-rZEknTUR8wuoQwFLIJjWIgNjpftTHHO7bgq82onLxP9-XDGcaWeR6EWdIELo7mSpivFwMgTWZ_Wq7dievoOaZ0ryGKEfDeA3WZf6lo1C22hBIalROLFtmQwzuV515Br0EQrptAc8mEmNVd2Mlo7iiWxi32p5DLZmqOW07Q7I99TwOkkXQHpQ7WtR7rfUYKihXK-dBPVBOBHifkIYVdaNt5JaNgxJCkEWaqhoU_C2dI2h_qodMvzIi95pscEduHvKvNM8q7M4aOdJNX9zp8vc_88mvqoTfuPA24I_IESTybuShwNdAqpH0E1Pwihk_JVbx-LYZey-WcUXJwkN-2YrL9x_1fRhTxdKWM3ELg9ny2vZfcGZ-SIzfmpBnn7R16l9X0vbmETrZhAcdyJcVqO1Bi7ATTQJRKc9Ev_BlESwSHAgqhvHZLg754N9GwOuS7UhhftuD1wogxXASGbjayzYU_gj8UuM3V3vG_IFWaiG29DesiwSURdUwI3YO_a3ukXMgxFzg:1r6WH4:f-vEEn0wbVFJKVG13UlTfZne9L9MHsUKXecJ6_jPSO0','2023-12-08 13:31:14.562143');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_address`
--

DROP TABLE IF EXISTS `goods_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver` varchar(256) NOT NULL,
  `concat` varchar(256) NOT NULL,
  `provinceCode` varchar(256) NOT NULL,
  `cityCode` varchar(256) NOT NULL,
  `countyCode` varchar(256) NOT NULL,
  `address` varchar(256) NOT NULL,
  `isDefault` int NOT NULL,
  `fullLocation` varchar(256) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_address_user_id_f98a2118_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `goods_address_user_id_f98a2118_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_address`
--

LOCK TABLES `goods_address` WRITE;
/*!40000 ALTER TABLE `goods_address` DISABLE KEYS */;
INSERT INTO `goods_address` VALUES (1,'张恩宇','15564356312','370000','370100','370102','齐鲁软件园',1,'山东省 济南市 历下区',1);
/*!40000 ALTER TABLE `goods_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goods`
--

DROP TABLE IF EXISTS `goods_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `desc` longtext,
  `picture` varchar(100) NOT NULL,
  `orderNum` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `brand` varchar(128) DEFAULT NULL,
  `collectionCount` int NOT NULL,
  `commentCount` int NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `salesCount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goods`
--

LOCK TABLES `goods_goods` WRITE;
/*!40000 ALTER TABLE `goods_goods` DISABLE KEYS */;
INSERT INTO `goods_goods` VALUES (1,'暖腰暖腹暖胃，蕲艾暖宫腰带','暖宫暖腰暖胃，大面积热敷≈3片暖宝宝','goods/9892cc73945da1591fa5259ad076b23c.jpg',NULL,49.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(2,'新年佳礼，家用SPA多功能按摩床垫','坐卧两用，随时随地做spa，多个场合随你心意','goods/c41003c6df90d7673195dcc2482e13f3.jpg',NULL,599.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(3,'七夕礼物·姐姐同款，穿出自信体态矫姿带','背薄一寸，年轻十岁，时尚百搭，约会职场小心机','goods/a6939f41c48fa9e9c8f7a7ed855351f1.jpg',NULL,159.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(4,'带提手可站立炫彩硅胶热水袋','杯型式设计，轻松注水防烫伤','goods/0b120e1c37f312981f4f2242997cc862.png',NULL,35.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(5,'七夕礼物·挺拔身姿，隐形内穿矫姿带','众筹爆品回归，专注矫姿20年，轻松矫正身姿','goods/7d1bc78607a08c088b2a7cdbe88c05af.png',NULL,149.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(6,'消炎镇痛一贴灵医用冷敷贴60贴/盒','mini型尺寸设计性价比更高','goods/d3807695c7d42a0247e308a936201d7c.jpg',NULL,79.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(7,'真空拔罐器','居家养生必备超简便拔罐套装','goods/16222847be7d090eb538a944a7e0b01b.jpg',NULL,49.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(8,'艾灸理疗随时随地，灸疗装置8头/12头','哪里不适灸哪里，全身都可灸','goods/941abaee58a88cb104228fe2c4cfdeb1.png',NULL,99.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(9,'入门首选，语音播报电子血压计','全程语音指导，一键测量，监测心率，贴心守护爸妈健康','goods/8f0c15f981c5cbcb1aa17215a259fa62.png',NULL,109.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(10,'黄金玉粟粥米500克','谷物缤纷，香甜软糯','goods/5f62c7ab543b1152383a0e9941c09bfd.png',NULL,9.90,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(11,'懒人瘦出好身材，多功能甩脂塑形机','懒人福音居家轻松塑身','goods/540f84174dbf9b98d4072abbd886819e.png',NULL,589.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(12,'新款LOGO印花时尚学步叫叫鞋','软底包头叫叫鞋','goods/841d7669e6cc23cb249f47d8d39fc17c.jpg',NULL,259.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(13,'【新疆棉】简约山形纹全棉提花毛巾','新疆长绒棉毛巾，吸水好颜值高','goods/e0cea368f41da1587b3b7fc523f169d7.png',NULL,18.50,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(14,'医美级冰脱韩国Ulike蓝宝石脉冲光脱毛仪','蓝宝石冰点脱毛，高效更持久','goods/3567b2ac2526e6b89124f3fb62fd09d3.png',NULL,1599.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(15,'书源彩色按动中性笔','化繁为简，书写本源','goods/21216556e7d47a4e4277dcb36a16a486.png',NULL,13.90,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(16,'运动健身跑步腰包','防水反光设计，大容量双口袋收纳，运动跑步更时尚','goods/610a693cfd6f01adc6923dc1c0ec91aa.jpg',NULL,40.00,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(17,'分场景使用不污染，超细纤维抹布分类5件套','精细分工，洁净家居','goods/c520bba8209bae877158e8810d889aca.png',NULL,14.90,'2023-09-01 02:41:25.168991',NULL,0,0,NULL,0),(18,'3秒快速拆琴轻松保养odin奥丁12半音阶口琴','易吹性好按键灵敏音色优美全黑琴身','goods/937a8e46a9284e8f7e00e13911ecfbe7.png',3029,329.00,'2023-09-01 05:33:47.054642',NULL,0,0,NULL,0),(19,'善谋者得天下，三国杀桌游','宅家娱乐神器，竞技社交合一','goods/b4960b7e7d9dd98c83ec1ec350f4f39c.png',185,157.00,'2023-09-01 05:34:22.758075',NULL,0,0,NULL,0),(20,'飞天53%vol500ml贵州茅台酒（带杯）','茅台飘香，正品溯源','goods/d46e005025a5d3b73c4781d31b327558.jpg',22,1499.00,'2023-09-01 05:35:00.930123',NULL,0,0,NULL,0),(21,'一吸即净，车家多用，车载无线吸尘器','5分钟搞定车内清洁','goods/02dcab8b641999d575a18546851e8013.png',177,199.00,'2023-09-01 05:35:58.712474',NULL,0,0,NULL,0),(22,'办公居家必备，3A3U智能插线板','高颜值插线板，办公居家必备','goods/b9e65109ee77e9a78f57ce3fef97c793.png',174,29.00,'2023-09-01 05:36:39.385162',NULL,0,0,NULL,0),(23,'地道卤香好味道，桂林鲜米粉245克*6盒','无人工添加防腐剂，鲜嫩爽滑','goods/26d71d6eb4c00ed727ad9f54ae4ce553.png',267,69.00,'2023-09-01 05:37:34.732568',NULL,0,0,NULL,0),(24,'玛歌正牌干红750毫升2017年','波尔多五大名庄玛歌正牌','goods/9e915c0a8839fa72b6ee1f9600289b62.png',355,6699.00,'2023-09-01 05:38:21.616317',NULL,0,0,NULL,0),(25,'下饭神器酸豆角50克*10袋','180天土窖腌制，酸爽脆嫩','goods/b7808ed03474fa33626571cdbd7f0ae6.jpg',370,16.00,'2023-09-01 05:38:59.548779',NULL,0,0,NULL,0),(26,'朱炳仁铜·猫型吉祥物装饰工艺摆件','灵性十足的黑色招财猫，周而复始，财源不断','goods/6e38fc94a8fe72c9d139bc48ba6d9814.jpg',761,1888.00,'2023-09-01 05:43:50.702899',NULL,0,0,NULL,0),(27,'星云吉彩系列花器新年创意花瓶摆件朱炳仁','星云吉彩，一路繁花。花瓶造型挺秀、俏丽，更为丰满圆润；五彩斑斓色彩，莹润光泽的质感，又显娇嫩。置于台前感受花与花器的和谐之美，获得精神的美感和愉悦。采用国家非遗百年传统工艺及国艺釉彩铜独创工艺，简约时尚的设计，雅致意趣。','goods/2dd8fe9b59774c7ca160bb2d5741c763.jpg',268,442.00,'2023-09-01 05:44:35.861241',NULL,0,0,NULL,0),(28,'苏格兰陈年单一麦芽威士忌700毫升','蒸馏大师监制','goods/a0a334a93e3d2bba7592ac692e045a48.png',338,318.00,'2023-09-01 05:46:14.259885',NULL,0,0,NULL,0),(29,'大丈夫方便面轻巧款私房牛肉味64克*6杯','非油炸，好吃不上火','goods/38e41a417612d3a419ab6fc6183593b2.jpg',187,28.50,'2023-09-01 05:46:59.982332',NULL,0,0,NULL,0),(30,'别致优雅男式新潮头层牛皮钥匙包','可旋转五金挂钩，悬挂方便','goods/72f50e8d10cf3c6a040c2f800774b007.jpg',750,106.00,'2023-09-01 05:50:35.097323',NULL,0,0,NULL,0),(31,'雨天有情调，英伦风设计，给你好品味','英伦长柄自动晴雨伞','goods/e77b8f4a8ddd1e777394d84347859f7c.png',217,40.90,'2023-09-01 05:51:12.255905',NULL,0,0,NULL,0),(32,'复古经典女式休闲鞋小白鞋','超高性价比的真皮小白鞋','goods/ebf52f79b473b7839bcef1568975a179.png',400,172.00,'2023-09-01 05:51:55.849194',NULL,0,0,NULL,0),(33,'保暖系列-女式饼干板鞋加毛款','简约纹理时尚“潮&#34;”你而来','goods/01f0260802ef8bba164e7c8e1ba8ae20.jpg',202,174.00,'2023-09-01 05:52:42.903210',NULL,0,0,NULL,0),(34,'「一件三穿好过冬」男中长款鹅绒防水外套','一件衣服三种穿法，应对多变天气','goods/aa9e03278e3274a2a83f3f8e7df5ee6f.png',246,659.00,'2023-09-01 05:53:21.954081',NULL,0,0,NULL,0),(35,'男式零感无压加厚保暖羽绒服','为「轻暖」而生','goods/0ff69c2099d98aa3cdddcb0edb9108a0.png',169,409.00,'2023-09-01 05:54:03.145944',NULL,0,0,NULL,0),(36,'女式优雅蝴蝶结饰带浅口穆勒鞋','浪漫演绎，法式复古方头','goods/36cf7f601519a1c0f545d9e2a6123154.png',144,178.00,'2023-09-01 05:54:39.166205',NULL,0,0,NULL,0),(37,'鸣夏女式运动休闲凉鞋','凉鞋也有运动鞋的舒适度','goods/da7629edd21bebe5cd26adbbbf5817ac.png',174,145.00,'2023-09-01 05:55:19.541633',NULL,0,0,NULL,0),(38,'儿童亚麻夏凉宽松萝卜裤防蚊裤66-130cm','100%天然亚麻面料，凉爽舒适，透气不闷热','goods/da7629edd21bebe5cd26adbbbf5817ac_jpTrmx0.png',864,95.00,'2023-09-01 06:08:50.551878',NULL,0,0,NULL,0),(39,'舒适软弹，糖果色儿童网孔透气运动鞋','防踢鞋头，透气网孔更舒适','goods/c437179bc1d0d5ad77a79f15a5c6f166.png',2271,139.00,'2023-09-01 06:10:57.447472',NULL,0,0,NULL,0),(40,'新疆棉宝宝时尚涂鸦短袖连体衣59-90cm','创意手绘图案，透气纯棉面料，3色可选','goods/a8b170b3114d33dae0ae98cddb5fb3f6.jpg',792,69.00,'2023-09-01 06:11:34.216628',NULL,0,0,NULL,0),(41,'ins风小碎花泡泡袖衬110-160cm','全棉面料，高支高密底布，手感柔软舒适，贴身穿着亲肤透气；经典娃娃衫，泡泡袖设计，增添可爱蓬松感；后背全开门襟，方便穿脱。','goods/c07edde1047fa1bd0b795bed136c2bb2.jpg',1643,99.00,'2023-09-01 06:27:10.486189',NULL,0,0,NULL,0),(42,'90%白鸭绒，儿童轻羽绒马甲73-130cm','儿童轻羽绒马甲，保暖常备单品','goods/f73b2672f87b2e336d206c56d4ea7d0f.png',185,99.00,'2023-09-01 06:27:49.205469',NULL,0,0,NULL,0),(43,'甜酷运动风，儿童卫衣运动套装73-130cm','轻松搭配，一套活力尽显','goods/767fc11b88b1e7b795319cd78c65f72f.png',224,179.00,'2023-09-01 06:28:24.350192',NULL,0,0,NULL,0),(44,'儿童网眼运动凉鞋（宽松版）25-32码','加大空间鞋头，码数无需拍大一码','goods/66072109da4f1e6ec56ea5eacaf3471c.png',176,127.00,'2023-09-01 06:29:02.431810',NULL,0,0,NULL,0),(45,'防踢鞋头，儿童学步健康机能鞋21-30','包头防踢用心呵护','goods/33ba674fbb13e2380ee8a74371eacf43.jpg',888,129.00,'2023-09-01 06:29:42.998627',NULL,0,0,NULL,0),(46,'抑菌保鲜黑科技泰国可微波冷冻食物保鲜盒','玻璃黑科技耐热耐寒微生物屏障抑菌更保鲜','goods/1.jpg',128,16.90,'2023-09-07 07:45:59.644821','苏宁电器',66,11,16.90,218);
/*!40000 ALTER TABLE `goods_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsproperty`
--

DROP TABLE IF EXISTS `goods_goodsproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goodsproperty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `shop_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsproperty_shop_id_58d515b9_fk_goods_goods_id` (`shop_id`),
  CONSTRAINT `goods_goodsproperty_shop_id_58d515b9_fk_goods_goods_id` FOREIGN KEY (`shop_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsproperty`
--

LOCK TABLES `goods_goodsproperty` WRITE;
/*!40000 ALTER TABLE `goods_goodsproperty` DISABLE KEYS */;
INSERT INTO `goods_goodsproperty` VALUES (1,'规格','自行车',46),(2,'材质','金属，可再生铝合金',46),(3,'速度','百公里加速2.7s',46),(4,'品牌属性','\"网易严选推荐此品，本产品为梅乃宿品牌，由梅乃宿酒造株式会社生产制造\"',46),(5,'温馨提示','\"1、网易严选出售的食品，除明确质量问题外均不接受退换货。\r\n2、请将产品保存于阴凉、通风、干燥处，开启后请密封冷藏保存，并尽快饮用。\r\n3、适度饮酒怡情，过度饮酒伤身。\r\n4、注意：饮酒后禁止驾驶机动车。\r\n5、本品不对未成年人出售。\"',46);
/*!40000 ALTER TABLE `goods_goodsproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsskus`
--

DROP TABLE IF EXISTS `goods_goodsskus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goodsskus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `old_price` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `inventory` int NOT NULL,
  `shop_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsskus_shop_id_ce2096fc_fk_goods_goods_id` (`shop_id`),
  CONSTRAINT `goods_goodsskus_shop_id_ce2096fc_fk_goods_goods_id` FOREIGN KEY (`shop_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsskus`
--

LOCK TABLES `goods_goodsskus` WRITE;
/*!40000 ALTER TABLE `goods_goodsskus` DISABLE KEYS */;
INSERT INTO `goods_goodsskus` VALUES (1,22.90,22.90,8040,46),(2,39.00,39.00,8040,46),(3,28.90,28.90,1123,46),(4,45.00,45.00,7778,46),(5,21.00,21.00,5566,46);
/*!40000 ALTER TABLE `goods_goodsskus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsskus_specs`
--

DROP TABLE IF EXISTS `goods_goodsskus_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goodsskus_specs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goodsskus_id` bigint NOT NULL,
  `goodsspecs_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_goodsskus_specs_goodsskus_id_goodsspecs_id_8dfa49e8_uniq` (`goodsskus_id`,`goodsspecs_id`),
  KEY `goods_goodsskus_spec_goodsspecs_id_280a728e_fk_goods_goo` (`goodsspecs_id`),
  CONSTRAINT `goods_goodsskus_spec_goodsskus_id_ac6c2aa4_fk_goods_goo` FOREIGN KEY (`goodsskus_id`) REFERENCES `goods_goodsskus` (`id`),
  CONSTRAINT `goods_goodsskus_spec_goodsspecs_id_280a728e_fk_goods_goo` FOREIGN KEY (`goodsspecs_id`) REFERENCES `goods_goodsspecs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsskus_specs`
--

LOCK TABLES `goods_goodsskus_specs` WRITE;
/*!40000 ALTER TABLE `goods_goodsskus_specs` DISABLE KEYS */;
INSERT INTO `goods_goodsskus_specs` VALUES (1,1,5),(2,2,1),(3,3,2),(4,4,3),(5,5,4);
/*!40000 ALTER TABLE `goods_goodsskus_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsspecs`
--

DROP TABLE IF EXISTS `goods_goodsspecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goodsspecs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `desc` varchar(256) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL,
  `shop_id` bigint DEFAULT NULL,
  `spec_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsspecs_shop_id_e6285a14_fk_goods_goods_id` (`shop_id`),
  CONSTRAINT `goods_goodsspecs_shop_id_e6285a14_fk_goods_goods_id` FOREIGN KEY (`shop_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsspecs`
--

LOCK TABLES `goods_goodsspecs` WRITE;
/*!40000 ALTER TABLE `goods_goodsspecs` DISABLE KEYS */;
INSERT INTO `goods_goodsspecs` VALUES (1,'玻璃材质-方形【890ml】','锅具配件-销售属性规格-玻璃材质-方形【890ml】-规格属性图片','good_color/f3c4bf148041427f12e34075c72a95be.png',1,46,3),(2,'玻璃材质-圆形【800ml】','锅具配件-销售属性规格-玻璃材质-圆形【800ml】-规格属性图片','good_color/e648a83c2d3dd3558085d58d8db4b729.png',1,46,3),(3,'PP材质-圆形【1300ml】','锅具配件-销售属性规格-PP材质-圆形【1300ml】-规格属性图片','good_color/a71256e45955957223b11431eece97ad.png',1,46,3),(4,'PP材质-圆形【600ml】','锅具配件-销售属性规格-PP材质-圆形【600ml】-规格属性图片','good_color/0a21675fe53f99ab3ea022bdab74e252.png',1,46,3),(5,'PP材质-长方形【1000ml】','锅具配件-销售属性规格-PP材质-长方形【1000ml】-规格属性图片','good_color/0a21675fe53f99ab3ea022bdab74e252.png',1,46,3);
/*!40000 ALTER TABLE `goods_goodsspecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_order`
--

DROP TABLE IF EXISTS `goods_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `state` int NOT NULL,
  `countdown` int NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `totalMoney` int DEFAULT NULL,
  `postFee` int NOT NULL,
  `payMoney` int DEFAULT NULL,
  `payChannel` varchar(256) NOT NULL,
  `buyerMessage` varchar(256) DEFAULT NULL,
  `deliverTime` varchar(256) NOT NULL,
  `address_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_order_address_id_7adace68_fk_goods_address_id` (`address_id`),
  KEY `goods_order_user_id_bd5a6274_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `goods_order_address_id_7adace68_fk_goods_address_id` FOREIGN KEY (`address_id`) REFERENCES `goods_address` (`id`),
  CONSTRAINT `goods_order_user_id_bd5a6274_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_order`
--

LOCK TABLES `goods_order` WRITE;
/*!40000 ALTER TABLE `goods_order` DISABLE KEYS */;
INSERT INTO `goods_order` VALUES (2,2,3600,'2023-11-27 06:52:03.112604',39,10,49,'在线支付微信支付','','1',1,1),(5,1,3600,'2023-11-27 09:12:46.956983',61,10,71,'在线支付微信支付','','1',1,1);
/*!40000 ALTER TABLE `goods_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_order_order_middle`
--

DROP TABLE IF EXISTS `goods_order_order_middle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_order_order_middle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `ordermiddle_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_order_order_middle_order_id_ordermiddle_id_6463dcab_uniq` (`order_id`,`ordermiddle_id`),
  KEY `goods_order_order_mi_ordermiddle_id_ba637835_fk_goods_ord` (`ordermiddle_id`),
  CONSTRAINT `goods_order_order_mi_ordermiddle_id_ba637835_fk_goods_ord` FOREIGN KEY (`ordermiddle_id`) REFERENCES `goods_ordermiddle` (`id`),
  CONSTRAINT `goods_order_order_middle_order_id_09e42c3d_fk_goods_order_id` FOREIGN KEY (`order_id`) REFERENCES `goods_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_order_order_middle`
--

LOCK TABLES `goods_order_order_middle` WRITE;
/*!40000 ALTER TABLE `goods_order_order_middle` DISABLE KEYS */;
INSERT INTO `goods_order_order_middle` VALUES (2,2,2),(6,5,6),(7,5,7);
/*!40000 ALTER TABLE `goods_order_order_middle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_ordermiddle`
--

DROP TABLE IF EXISTS `goods_ordermiddle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_ordermiddle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `buy_num` int NOT NULL,
  `skus_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_ordermiddle_skus_id_16e049c5_fk_goods_goodsskus_id` (`skus_id`),
  CONSTRAINT `goods_ordermiddle_skus_id_16e049c5_fk_goods_goodsskus_id` FOREIGN KEY (`skus_id`) REFERENCES `goods_goodsskus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_ordermiddle`
--

LOCK TABLES `goods_ordermiddle` WRITE;
/*!40000 ALTER TABLE `goods_ordermiddle` DISABLE KEYS */;
INSERT INTO `goods_ordermiddle` VALUES (1,1,2),(2,1,2),(3,1,2),(4,1,2),(5,1,1),(6,1,2),(7,1,1);
/*!40000 ALTER TABLE `goods_ordermiddle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_orderpre`
--

DROP TABLE IF EXISTS `goods_orderpre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_orderpre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_orderpre_cart_id_82ae2e9a_fk_goods_usercart_id` (`cart_id`),
  KEY `goods_orderpre_user_id_5ac9914e_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `goods_orderpre_cart_id_82ae2e9a_fk_goods_usercart_id` FOREIGN KEY (`cart_id`) REFERENCES `goods_usercart` (`id`),
  CONSTRAINT `goods_orderpre_user_id_5ac9914e_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_orderpre`
--

LOCK TABLES `goods_orderpre` WRITE;
/*!40000 ALTER TABLE `goods_orderpre` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_orderpre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_recommend`
--

DROP TABLE IF EXISTS `goods_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_recommend` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `alt` varchar(128) NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_recommend`
--

LOCK TABLES `goods_recommend` WRITE;
/*!40000 ALTER TABLE `goods_recommend` DISABLE KEYS */;
INSERT INTO `goods_recommend` VALUES (1,'特惠推荐','它们最实惠','recommend/popular_1.jpg'),(2,'爆款推荐','它们最受欢迎','recommend/popular_2.jpg'),(3,'一站买全','为您精心优选','recommend/popular_3.jpg'),(4,'领券中心','更多超值优惠券','recommend/popular_4.jpg');
/*!40000 ALTER TABLE `goods_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_shopdetailimage`
--

DROP TABLE IF EXISTS `goods_shopdetailimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_shopdetailimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `shop_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_shopdetailimage_shop_id_874e5610_fk_goods_goods_id` (`shop_id`),
  CONSTRAINT `goods_shopdetailimage_shop_id_874e5610_fk_goods_goods_id` FOREIGN KEY (`shop_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_shopdetailimage`
--

LOCK TABLES `goods_shopdetailimage` WRITE;
/*!40000 ALTER TABLE `goods_shopdetailimage` DISABLE KEYS */;
INSERT INTO `goods_shopdetailimage` VALUES (1,'shop_detail/1.jpg',46),(2,'shop_detail/2.jpg',46),(3,'shop_detail/3.jpg',46),(4,'shop_detail/4.jpg',46),(5,'shop_detail/5.jpg',46);
/*!40000 ALTER TABLE `goods_shopdetailimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_usercart`
--

DROP TABLE IF EXISTS `goods_usercart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_usercart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `buy_num` int NOT NULL,
  `sku_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `selected` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_usercart_sku_id_fd0b5ddf_fk_goods_goodsskus_id` (`sku_id`),
  KEY `goods_usercart_user_id_4dfcadd2_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `goods_usercart_sku_id_fd0b5ddf_fk_goods_goodsskus_id` FOREIGN KEY (`sku_id`) REFERENCES `goods_goodsskus` (`id`),
  CONSTRAINT `goods_usercart_user_id_4dfcadd2_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_usercart`
--

LOCK TABLES `goods_usercart` WRITE;
/*!40000 ALTER TABLE `goods_usercart` DISABLE KEYS */;
INSERT INTO `goods_usercart` VALUES (10,1,2,1,1),(11,1,1,1,1);
/*!40000 ALTER TABLE `goods_usercart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_image`
--

DROP TABLE IF EXISTS `notice_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_image`
--

LOCK TABLES `notice_image` WRITE;
/*!40000 ALTER TABLE `notice_image` DISABLE KEYS */;
INSERT INTO `notice_image` VALUES (1,'recognize/505.jpg','2023-10-31 02:37:30.870819'),(2,'recognize/505_5PedxH9.jpg','2023-10-31 02:40:30.230290'),(3,'recognize/505_D4zpOam.jpg','2023-10-31 02:42:39.494644');
/*!40000 ALTER TABLE `notice_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_notice`
--

DROP TABLE IF EXISTS `notice_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(256) DEFAULT NULL,
  `title` varchar(64) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_notice`
--

LOCK TABLES `notice_notice` WRITE;
/*!40000 ALTER TABLE `notice_notice` DISABLE KEYS */;
INSERT INTO `notice_notice` VALUES (2,'https://gw.alipayobjects.com/zos/rmsportal/kISTdvpyTAhtGxpovNWd.png','测试消息','2023-08-07 07:04:26.368287','',2),(4,'https://gw.alipayobjects.com/zos/rmsportal/OKJXDXrmkNshAMvwtvhu.png','恭喜你抽中一辆太阳神','2023-08-07 12:54:57.545906','',1),(10,'https://gw.alipayobjects.com/zos/rmsportal/GvqBnKhFgObvnSGkDsje.png','你好好你好','2023-08-11 01:16:06.671974','',1),(11,'https://gw.alipayobjects.com/zos/rmsportal/OKJXDXrmkNshAMvwtvhu.png','你好啊你好','2023-08-11 01:24:31.807194','123',1),(12,'https://gw.alipayobjects.com/zos/rmsportal/GvqBnKhFgObvnSGkDsje.png','112332','2023-08-11 01:36:47.996821','',1),(13,'https://gw.alipayobjects.com/zos/rmsportal/kISTdvpyTAhtGxpovNWd.png','消息消息','2023-08-11 01:46:18.034171','',2),(14,'','请赶紧评价','2023-11-15 12:31:23.075238','1',3);
/*!40000 ALTER TABLE `notice_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_notice_user`
--

DROP TABLE IF EXISTS `notice_notice_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_notice_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notice_id` bigint NOT NULL,
  `userinfo_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_notice_user_notice_id_userinfo_id_97619f29_uniq` (`notice_id`,`userinfo_id`),
  KEY `notice_notice_user_userinfo_id_57dbeca1_fk_user_userinfo_id` (`userinfo_id`),
  CONSTRAINT `notice_notice_user_notice_id_e4199be9_fk_notice_notice_id` FOREIGN KEY (`notice_id`) REFERENCES `notice_notice` (`id`),
  CONSTRAINT `notice_notice_user_userinfo_id_57dbeca1_fk_user_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_notice_user`
--

LOCK TABLES `notice_notice_user` WRITE;
/*!40000 ALTER TABLE `notice_notice_user` DISABLE KEYS */;
INSERT INTO `notice_notice_user` VALUES (1,2,1),(2,4,1),(5,10,1),(6,11,1),(7,12,1),(8,13,1);
/*!40000 ALTER TABLE `notice_notice_user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_characters_menu`
--

LOCK TABLES `user_characters_menu` WRITE;
/*!40000 ALTER TABLE `user_characters_menu` DISABLE KEYS */;
INSERT INTO `user_characters_menu` VALUES (4,3,1),(5,3,2),(6,3,3),(7,3,4),(8,3,5),(9,3,6),(10,3,7),(11,3,8),(12,3,9),(13,3,10),(14,3,11),(15,3,12),(16,3,13),(17,3,14),(18,3,15),(19,3,16),(20,3,17),(21,3,18),(22,3,19),(23,3,20),(24,3,21),(25,3,22),(26,3,23),(28,3,24),(29,3,25),(27,4,23),(54,4,24),(55,4,25);
/*!40000 ALTER TABLE `user_characters_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_detectionrecord`
--

DROP TABLE IF EXISTS `user_detectionrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_detectionrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `image_id` bigint DEFAULT NULL,
  `mask_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_detectionrecord_image_id_0ce4972b_fk_user_imagedrawing_id` (`image_id`),
  KEY `user_detectionrecord_mask_id_ae98fe12_fk_user_maskdrawing_id` (`mask_id`),
  CONSTRAINT `user_detectionrecord_image_id_0ce4972b_fk_user_imagedrawing_id` FOREIGN KEY (`image_id`) REFERENCES `user_imagedrawing` (`id`),
  CONSTRAINT `user_detectionrecord_mask_id_ae98fe12_fk_user_maskdrawing_id` FOREIGN KEY (`mask_id`) REFERENCES `user_maskdrawing` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detectionrecord`
--

LOCK TABLES `user_detectionrecord` WRITE;
/*!40000 ALTER TABLE `user_detectionrecord` DISABLE KEYS */;
INSERT INTO `user_detectionrecord` VALUES (1,'2023-11-23 07:09:02.077675',2,2);
/*!40000 ALTER TABLE `user_detectionrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_imagedrawing`
--

DROP TABLE IF EXISTS `user_imagedrawing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_imagedrawing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_imagedrawing`
--

LOCK TABLES `user_imagedrawing` WRITE;
/*!40000 ALTER TABLE `user_imagedrawing` DISABLE KEYS */;
INSERT INTO `user_imagedrawing` VALUES (1,'image_drawing/IMG_3810_9kwInmN.jpeg'),(2,'image_drawing/IMG_3810_g9K9KZl.jpeg'),(3,'image_drawing/bach.mp3'),(4,'image_drawing/bach_LqxCpQ4.mp3'),(5,'image_drawing/bach_ipTX0DE.mp3'),(6,'image_drawing/bach_TrPYbjW.mp3');
/*!40000 ALTER TABLE `user_imagedrawing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_maskdrawing`
--

DROP TABLE IF EXISTS `user_maskdrawing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_maskdrawing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_maskdrawing`
--

LOCK TABLES `user_maskdrawing` WRITE;
/*!40000 ALTER TABLE `user_maskdrawing` DISABLE KEYS */;
INSERT INTO `user_maskdrawing` VALUES (1,'mask_drawing/IMG_3809.jpeg'),(2,'mask_drawing/IMG_3809_XUGI5z0.jpeg');
/*!40000 ALTER TABLE `user_maskdrawing` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu`
--

LOCK TABLES `user_menu` WRITE;
/*!40000 ALTER TABLE `user_menu` DISABLE KEYS */;
INSERT INTO `user_menu` VALUES (1,'根节点','根节点','根节点','是','',NULL,NULL,NULL,NULL,'','正常',NULL),(2,'权限管理',NULL,'目录','是','/permission','permission','Layout/index.vue','5','/permission/menu','Lock','正常',1),(3,'菜单管理',NULL,'菜单','是','/permission/menu','menu','Permission/Menu.vue','1',NULL,NULL,'正常',2),(4,'角色管理','','菜单','是','/permission/role','role','Permission/Role.vue','2','','','正常',2),(5,'异常页面','','目录','是','/error','error','Layout/index.vue','4','/error/403','WarningFilled','正常',1),(6,'403','','菜单','是','/error/403','403','Error/403.vue','1','','','',5),(7,'404','','菜单','','/error/404','404','Error/404.vue','2','','','',5),(8,'500','','菜单','是','/error/500','500','Error/500.vue','3','','','',5),(9,'用户管理','','目录','是','/user','user','Layout/index.vue','2','/user/account','UserFilled','',1),(10,'用户管理','','菜单','','/user/account','account','User/Account.vue','1','','UserFilled','',9),(11,'新增','','按钮','','','','','2','','','',3),(12,'修改','','按钮','','','','','2','','','',3),(13,'删除','','按钮','','','','','2','','','',3),(14,'新增','','按钮','','','','','2','','','',4),(15,'修改','','按钮','','','','','2','','','',4),(16,'删除','','按钮','','','','','2','','','',4),(17,'新增','','按钮','','','','','2','','','',10),(18,'修改','','按钮','','','','','2','','','',10),(19,'删除','','按钮','','','','','2','','','',10),(20,'消息管理','','目录','是','/message','message','Layout/index.vue','3','/message/notice','Comment','正常',1),(21,'消息管理','','菜单','是','/message/notice','notice','Notice/index.vue','1','','Comment','正常',20),(22,'删除','','按钮','','','','','2','','','',21),(23,'数据大屏','','菜单','是','/screen','screen','Screen/index.vue','1','','Histogram','',1),(24,'引导页','','目录','是','/guide','guide','Layout/index.vue','6','/guide/intro','Promotion','正常',1),(25,'引导页','','菜单','是','/guide/intro','intro','Guide/index.vue','1','','Promotion','正常',24);
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
  `avatar_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_userinfo_role_id_e5218572_fk_user_characters_id` (`role_id`),
  KEY `user_userinfo_username_phone_90e3b8e8_idx` (`username`,`phone`),
  CONSTRAINT `user_userinfo_role_id_e5218572_fk_user_characters_id` FOREIGN KEY (`role_id`) REFERENCES `user_characters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo`
--

LOCK TABLES `user_userinfo` WRITE;
/*!40000 ALTER TABLE `user_userinfo` DISABLE KEYS */;
INSERT INTO `user_userinfo` VALUES (1,'pbkdf2_sha256$600000$0ntE8ODW8gD66hHUOUWW5s$i26oAEI050sQZsXGJq/hXOnrlQbHah/OOuJSgtT1Uyw=','2023-11-26 02:37:56.315657',1,'admin','','','',1,1,'2023-08-02 16:00:00.000000','张恩宇','男',21,'15566666666',3,NULL),(8,'pbkdf2_sha256$600000$P8crVDytQGzonYZZZUDamS$3o2emF8uEyz6x8vDUHSs8DcHYCg6b4nV6MIP8EBtkiI=',NULL,0,'test1','','','',0,1,'2023-11-18 16:00:00.000000','测试姓名','男',22,'15566666666',4,''),(9,'pbkdf2_sha256$600000$sR7R2hd356OtnJ7J9Yyrnk$iNRnEL0u3Fu/E6hPGHnt6/HixDv+08U7clnqUWRoQC8=',NULL,0,'test2','','','',0,1,'2023-11-23 13:38:17.810594','test2','女',21,'15566666666',4,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2023-12-02 17:53:00
