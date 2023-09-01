-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: drf_vue_system
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add menu',6,'add_menu'),(22,'Can change menu',6,'change_menu'),(23,'Can delete menu',6,'delete_menu'),(24,'Can view menu',6,'view_menu'),(25,'Can add characters',7,'add_characters'),(26,'Can change characters',7,'change_characters'),(27,'Can delete characters',7,'delete_characters'),(28,'Can view characters',7,'view_characters'),(29,'Can add user info',8,'add_userinfo'),(30,'Can change user info',8,'change_userinfo'),(31,'Can delete user info',8,'delete_userinfo'),(32,'Can view user info',8,'view_userinfo'),(33,'Can add announcement',9,'add_announcement'),(34,'Can change announcement',9,'change_announcement'),(35,'Can delete announcement',9,'delete_announcement'),(36,'Can view announcement',9,'view_announcement'),(37,'Can add notice',10,'add_notice'),(38,'Can change notice',10,'change_notice'),(39,'Can delete notice',10,'delete_notice'),(40,'Can view notice',10,'view_notice'),(41,'Can add category',11,'add_category'),(42,'Can change category',11,'change_category'),(43,'Can delete category',11,'delete_category'),(44,'Can view category',11,'view_category'),(45,'Can add goods',12,'add_goods'),(46,'Can change goods',12,'change_goods'),(47,'Can delete goods',12,'delete_goods'),(48,'Can view goods',12,'view_goods'),(49,'Can add banner',13,'add_banner'),(50,'Can change banner',13,'change_banner'),(51,'Can delete banner',13,'delete_banner'),(52,'Can view banner',13,'view_banner'),(53,'Can add recommend',14,'add_recommend'),(54,'Can change recommend',14,'change_recommend'),(55,'Can delete recommend',14,'delete_recommend'),(56,'Can view recommend',14,'view_recommend');
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
INSERT INTO `banner_banner` VALUES (1,'banner/1ba86bcc-ae71-42a3-bc3e-37b662f7f07e.jpg',1,5),(2,'banner/dfc11bb0-4af5-4e9b-9458-99f615cc685a.jpg',1,1),(3,'banner/6d202d8e-bb47-4f92-9523-f32ab65754f4.jpg',1,6),(4,'banner/4a79180a-1a5a-4042-8a77-4db0b9c800a8.jpg',1,7),(5,'banner/e83efb1b-309c-46f7-98a3-f1fefa694338.jpg',1,9);
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
INSERT INTO `category_category` VALUES (1,'居家','category/居家.jpg',NULL,'大额优惠 等你来拿'),(2,'美食','category/美食.png',NULL,'全场3件8折'),(3,'服饰','category/服饰.png',NULL,'全场3件8折'),(4,'母婴','category/美食.jpg',NULL,'3折起狂欢'),(5,'个护','category/d38a73b8-cd03-48aa-a60b-e7c4e16667ed.png',NULL,NULL),(6,'严选','category/4b02f01f-a365-4b6c-9f7a-8b0f591dda02.png',NULL,NULL),(7,'数码','category/9660870d-6a59-4624-8064-b3a8cbf50d5c.png',NULL,NULL),(8,'运动','category/7d19752c-baff-49b6-bd02-5ece1d729214.png',NULL,NULL),(9,'杂项','category/4ff20b9e-8150-4bd3-87a3-0cd6766938dd.png',NULL,NULL),(10,'居家生活用品','category/7f6a7b20-7902-4b43-b9c5-f33151ef1334.jpg',1,'123'),(11,'收纳','category/收纳.png',1,NULL),(12,'宠物食品','category/宠物食品.png',1,NULL),(13,'艺术藏品','category/艺术藏品.jpg',1,NULL),(14,'宠物用品','category/宠物用品.png',1,NULL),(15,'家庭医疗','category/家庭医疗.jpg',1,NULL),(16,'中医保健','category/中医保健.png',1,NULL),(17,'南北干货','category/南北干货.png',2,NULL),(18,'调味酱菜','category/调味酱菜.png',2,NULL),(19,'方便食品','category/方便食品.png',2,NULL),(20,'米面粮油','category/米面粮油.png',2,NULL),(21,'名酒馆','category/名酒馆.png',2,NULL),(22,'进口酒','category/进口酒.png',2,NULL),(23,'钱包/胸包','category/钱包胸包.png',3,NULL),(24,'女士靴子','category/女士靴子.png',3,NULL),(25,'休闲鞋','category/女士休闲鞋.png',3,NULL),(26,'运动鞋','category/运动鞋.png',3,NULL),(27,'11.11购物狂欢','category/11.11狂欢购.png',3,NULL),(28,'【年末狂欢季】','category/年末狂欢季.png',3,NULL),(29,'儿童上衣','category/儿童上衣.png',4,NULL),(30,'儿童鞋','category/儿童鞋.png',4,NULL),(31,'儿童外套','category/儿童外套.png',4,NULL),(32,'儿童下衣','category/儿童下衣.png',4,NULL),(33,'连体衣','category/连体衣.png',4,NULL),(34,'学步鞋','category/学步鞋.png',4,NULL),(35,'家庭清洁','category/家庭清洁.png',5,NULL),(36,'浴室用品','category/浴室用品.png',5,NULL),(37,'餐厨清洁','category/餐厨清洁.png',5,NULL),(38,'纸品','category/卫生纸.png',5,NULL),(39,'干湿巾','category/干湿巾.png',5,NULL),(40,'毛巾浴巾','category/毛巾浴巾.png',5,NULL),(41,'滋补保健','category/滋补保健.png',6,NULL),(42,'床品家纺','category/床品家纺.png',6,NULL),(43,'钢具配件','category/钢具备件.png',6,NULL),(44,'清洁用品','category/清洁用品.png',6,NULL),(45,'个护电器','category/个护电器.png',6,NULL),(46,'影音娱乐','category/影音娱乐.png',7,NULL),(47,'3C数码','category/3C数码.png',7,NULL),(48,'乐器','category/影音乐器.png',7,NULL),(49,'手机配件','category/手机配件.png',7,NULL),(50,'车载用品','category/车载用品.png',7,NULL),(51,'办公文具','category/办公文具.png',7,NULL),(52,'健身器械(大)','category/健身器械大.png',8,NULL),(53,'健身器械(小)','category/健身器械小.png',8,NULL),(54,'城市出行','category/城市出行.png',8,NULL),(55,'运动护具','category/运动护具.png',8,NULL),(56,'垂钓工具','category/垂钓工具.png',8,NULL),(57,'户外装备','category/户外装备.png',8,NULL),(58,'家庭清洁','category/家庭清洁_2iXK3lo.png',9,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_category_goods`
--

LOCK TABLES `category_category_goods` WRITE;
/*!40000 ALTER TABLE `category_category_goods` DISABLE KEYS */;
INSERT INTO `category_category_goods` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(19,1,18),(20,1,19),(21,1,20),(22,1,21),(23,1,22),(24,1,23),(25,1,24),(26,1,25),(10,2,10),(27,2,20),(28,2,23),(29,2,24),(30,2,25),(31,2,26),(32,2,27),(33,2,28),(34,2,29),(12,3,11),(41,3,30),(42,3,31),(35,3,32),(36,3,33),(37,3,34),(38,3,35),(39,3,36),(40,3,37),(13,4,12),(43,4,38),(44,4,39),(45,4,40),(46,4,41),(47,4,42),(48,4,43),(49,4,44),(50,4,45),(14,5,13),(15,6,14),(16,7,15),(17,8,16),(18,9,17),(55,10,11),(56,10,14),(51,10,17),(54,10,21),(52,10,26);
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-31 02:16:07.918208','1','暖腰暖腹暖胃，蕲艾暖宫腰带',1,'[{\"added\": {}}]',12,1),(2,'2023-08-31 02:17:08.418490','2','新年佳礼，家用SPA多功能按摩床垫',1,'[{\"added\": {}}]',12,1),(3,'2023-08-31 02:18:11.465221','3','七夕礼物·姐姐同款，穿出自信体态矫姿带',1,'[{\"added\": {}}]',12,1),(4,'2023-08-31 02:19:08.829350','4','带提手可站立炫彩硅胶热水袋',1,'[{\"added\": {}}]',12,1),(5,'2023-08-31 02:20:18.215327','5','七夕礼物·挺拔身姿，隐形内穿矫姿带',1,'[{\"added\": {}}]',12,1),(6,'2023-08-31 02:21:10.672116','6','消炎镇痛一贴灵医用冷敷贴60贴/盒',1,'[{\"added\": {}}]',12,1),(7,'2023-08-31 02:22:04.919021','7','真空拔罐器',1,'[{\"added\": {}}]',12,1),(8,'2023-08-31 02:22:42.275797','8','艾灸理疗随时随地，灸疗装置8头/12头',1,'[{\"added\": {}}]',12,1),(9,'2023-08-31 02:23:24.528702','9','入门首选，语音播报电子血压计',1,'[{\"added\": {}}]',12,1),(10,'2023-08-31 02:24:10.029686','1','居家',1,'[{\"added\": {}}]',11,1),(11,'2023-08-31 02:54:00.934548','10','黄金玉粟粥米500克',1,'[{\"added\": {}}]',12,1),(12,'2023-08-31 02:54:59.274486','2','美食',1,'[{\"added\": {}}]',11,1),(13,'2023-08-31 02:56:23.105475','3','服饰',1,'[{\"added\": {}}]',11,1),(14,'2023-08-31 02:57:00.361329','11','懒人瘦出好身材，多功能甩脂塑形机',1,'[{\"added\": {}}]',12,1),(15,'2023-08-31 02:57:08.245868','3','服饰',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(16,'2023-08-31 02:58:56.179573','12','新款LOGO印花时尚学步叫叫鞋',1,'[{\"added\": {}}]',12,1),(17,'2023-08-31 02:59:27.365208','4','母婴',1,'[{\"added\": {}}]',11,1),(18,'2023-08-31 03:00:42.113426','13','【新疆棉】简约山形纹全棉提花毛巾',1,'[{\"added\": {}}]',12,1),(19,'2023-08-31 03:01:25.085168','5','个护',1,'[{\"added\": {}}]',11,1),(20,'2023-08-31 03:03:07.182412','14','医美级冰脱韩国Ulike蓝宝石脉冲光脱毛仪',1,'[{\"added\": {}}]',12,1),(21,'2023-08-31 03:03:30.663143','6','严选',1,'[{\"added\": {}}]',11,1),(22,'2023-08-31 03:05:09.218858','15','书源彩色按动中性笔',1,'[{\"added\": {}}]',12,1),(23,'2023-08-31 03:05:48.239376','7','数码',1,'[{\"added\": {}}]',11,1),(24,'2023-08-31 03:22:25.502154','16','运动健身跑步腰包',1,'[{\"added\": {}}]',12,1),(25,'2023-08-31 03:23:26.729698','8','运动',1,'[{\"added\": {}}]',11,1),(26,'2023-08-31 03:24:22.508667','17','分场景使用不污染，超细纤维抹布分类5件套',1,'[{\"added\": {}}]',12,1),(27,'2023-08-31 03:25:18.898848','9','杂项',1,'[{\"added\": {}}]',11,1),(28,'2023-08-31 03:35:54.485442','10','居家生活用品',1,'[{\"added\": {}}]',11,1),(29,'2023-08-31 03:37:28.125496','11','收纳',1,'[{\"added\": {}}]',11,1),(30,'2023-08-31 03:54:33.504621','12','宠物食品',1,'[{\"added\": {}}]',11,1),(31,'2023-08-31 03:54:56.064393','13','艺术藏品',1,'[{\"added\": {}}]',11,1),(32,'2023-08-31 03:55:07.969659','14','宠物用品',1,'[{\"added\": {}}]',11,1),(33,'2023-08-31 03:55:21.267711','15','家庭医疗',1,'[{\"added\": {}}]',11,1),(34,'2023-08-31 03:55:37.020864','16','中医保健',1,'[{\"added\": {}}]',11,1),(35,'2023-08-31 05:17:45.610638','17','南北干货',1,'[{\"added\": {}}]',11,1),(36,'2023-08-31 05:18:06.501383','18','调味酱菜',1,'[{\"added\": {}}]',11,1),(37,'2023-08-31 05:18:27.534193','19','方便食品',1,'[{\"added\": {}}]',11,1),(38,'2023-08-31 05:18:48.141011','20','米面粮油',1,'[{\"added\": {}}]',11,1),(39,'2023-08-31 05:19:09.931668','21','名酒馆',1,'[{\"added\": {}}]',11,1),(40,'2023-08-31 05:19:25.208714','22','进口酒',1,'[{\"added\": {}}]',11,1),(41,'2023-08-31 05:23:02.825157','23','钱包/胸包',1,'[{\"added\": {}}]',11,1),(42,'2023-08-31 05:23:34.739023','24','女士靴子',1,'[{\"added\": {}}]',11,1),(43,'2023-08-31 05:24:06.279870','25','休闲鞋',1,'[{\"added\": {}}]',11,1),(44,'2023-08-31 05:24:29.435264','26','运动鞋',1,'[{\"added\": {}}]',11,1),(45,'2023-08-31 05:24:55.192255','27','11.11购物狂欢',1,'[{\"added\": {}}]',11,1),(46,'2023-08-31 05:25:20.620446','28','【年末狂欢季】',1,'[{\"added\": {}}]',11,1),(47,'2023-08-31 05:42:41.706179','29','儿童上衣',1,'[{\"added\": {}}]',11,1),(48,'2023-08-31 05:43:03.280925','30','儿童鞋',1,'[{\"added\": {}}]',11,1),(49,'2023-08-31 05:43:27.942598','31','儿童外套',1,'[{\"added\": {}}]',11,1),(50,'2023-08-31 05:45:11.997236','32','儿童下衣',1,'[{\"added\": {}}]',11,1),(51,'2023-08-31 05:46:09.530759','33','连体衣',1,'[{\"added\": {}}]',11,1),(52,'2023-08-31 05:46:31.350515','34','学步鞋',1,'[{\"added\": {}}]',11,1),(53,'2023-08-31 05:54:55.559090','35','家庭清洁',1,'[{\"added\": {}}]',11,1),(54,'2023-08-31 05:55:16.761810','36','浴室用品',1,'[{\"added\": {}}]',11,1),(55,'2023-08-31 05:55:21.816807','35','家庭清洁',2,'[{\"changed\": {\"fields\": [\"\\u7236\\u5206\\u7c7b\"]}}]',11,1),(56,'2023-08-31 05:55:52.791827','37','餐厨清洁',1,'[{\"added\": {}}]',11,1),(57,'2023-08-31 05:56:10.489716','38','纸品',1,'[{\"added\": {}}]',11,1),(58,'2023-08-31 05:56:27.561945','39','干湿巾',1,'[{\"added\": {}}]',11,1),(59,'2023-08-31 05:56:42.250618','40','毛巾浴巾',1,'[{\"added\": {}}]',11,1),(60,'2023-08-31 07:06:44.890701','41','滋补保健',1,'[{\"added\": {}}]',11,1),(61,'2023-08-31 07:07:26.406887','42','床品家纺',1,'[{\"added\": {}}]',11,1),(62,'2023-08-31 07:07:46.198993','43','钢具配件',1,'[{\"added\": {}}]',11,1),(63,'2023-08-31 07:08:05.737331','44','清洁用品',1,'[{\"added\": {}}]',11,1),(64,'2023-08-31 07:08:17.180953','45','个护电器',1,'[{\"added\": {}}]',11,1),(65,'2023-08-31 07:12:09.121336','46','影音娱乐',1,'[{\"added\": {}}]',11,1),(66,'2023-08-31 07:12:48.656720','47','3C数码',1,'[{\"added\": {}}]',11,1),(67,'2023-08-31 07:12:57.290377','48','乐器',1,'[{\"added\": {}}]',11,1),(68,'2023-08-31 07:13:13.717240','49','手机配件',1,'[{\"added\": {}}]',11,1),(69,'2023-08-31 07:13:38.937071','50','车载用品',1,'[{\"added\": {}}]',11,1),(70,'2023-08-31 07:13:57.486260','51','办公文具',1,'[{\"added\": {}}]',11,1),(71,'2023-08-31 07:18:01.778945','52','健身器械(大)',1,'[{\"added\": {}}]',11,1),(72,'2023-08-31 07:18:18.405736','53','健身器械(小)',1,'[{\"added\": {}}]',11,1),(73,'2023-08-31 07:18:47.834766','54','城市出行',1,'[{\"added\": {}}]',11,1),(74,'2023-08-31 07:19:06.542050','55','运动护具',1,'[{\"added\": {}}]',11,1),(75,'2023-08-31 07:19:26.782490','56','垂钓工具',1,'[{\"added\": {}}]',11,1),(76,'2023-08-31 07:19:44.578541','57','户外装备',1,'[{\"added\": {}}]',11,1),(77,'2023-08-31 07:20:35.902726','58','家庭清洁',1,'[{\"added\": {}}]',11,1),(78,'2023-09-01 01:30:47.166984','1','轮播图',1,'[{\"added\": {}}]',13,1),(79,'2023-09-01 01:31:18.761581','2','轮播图',1,'[{\"added\": {}}]',13,1),(80,'2023-09-01 01:32:25.702536','3','轮播图',1,'[{\"added\": {}}]',13,1),(81,'2023-09-01 01:33:16.722112','4','轮播图',1,'[{\"added\": {}}]',13,1),(82,'2023-09-01 01:34:05.907927','5','轮播图',1,'[{\"added\": {}}]',13,1),(83,'2023-09-01 03:28:04.701674','1','特惠推荐',1,'[{\"added\": {}}]',14,1),(84,'2023-09-01 03:28:23.197061','2','爆款推荐',1,'[{\"added\": {}}]',14,1),(85,'2023-09-01 03:28:59.671057','3','一站买全',1,'[{\"added\": {}}]',14,1),(86,'2023-09-01 03:29:19.088726','4','领券中心',1,'[{\"added\": {}}]',14,1),(87,'2023-09-01 05:30:52.808405','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(88,'2023-09-01 05:30:59.580472','2','美食',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(89,'2023-09-01 05:31:07.999148','3','服饰',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(90,'2023-09-01 05:31:16.286050','4','母婴',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u56fe\\u7247\"]}}]',11,1),(91,'2023-09-01 05:33:47.055647','18','3秒快速拆琴轻松保养odin奥丁12半音阶口琴',1,'[{\"added\": {}}]',12,1),(92,'2023-09-01 05:34:22.759072','19','善谋者得天下，三国杀桌游',1,'[{\"added\": {}}]',12,1),(93,'2023-09-01 05:35:00.931121','20','飞天53%vol500ml贵州茅台酒（带杯）',1,'[{\"added\": {}}]',12,1),(94,'2023-09-01 05:35:58.712474','21','一吸即净，车家多用，车载无线吸尘器',1,'[{\"added\": {}}]',12,1),(95,'2023-09-01 05:36:39.386159','22','办公居家必备，3A3U智能插线板',1,'[{\"added\": {}}]',12,1),(96,'2023-09-01 05:37:34.733549','23','地道卤香好味道，桂林鲜米粉245克*6盒',1,'[{\"added\": {}}]',12,1),(97,'2023-09-01 05:38:21.616317','24','玛歌正牌干红750毫升2017年',1,'[{\"added\": {}}]',12,1),(98,'2023-09-01 05:38:59.549777','25','下饭神器酸豆角50克*10袋',1,'[{\"added\": {}}]',12,1),(99,'2023-09-01 05:39:16.308467','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(100,'2023-09-01 05:43:50.703896','26','朱炳仁铜·猫型吉祥物装饰工艺摆件',1,'[{\"added\": {}}]',12,1),(101,'2023-09-01 05:44:35.862239','27','星云吉彩系列花器新年创意花瓶摆件朱炳仁',1,'[{\"added\": {}}]',12,1),(102,'2023-09-01 05:46:14.259885','28','苏格兰陈年单一麦芽威士忌700毫升',1,'[{\"added\": {}}]',12,1),(103,'2023-09-01 05:46:59.983328','29','大丈夫方便面轻巧款私房牛肉味64克*6杯',1,'[{\"added\": {}}]',12,1),(104,'2023-09-01 05:47:59.736689','2','美食',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(105,'2023-09-01 05:50:35.098321','30','别致优雅男式新潮头层牛皮钥匙包',1,'[{\"added\": {}}]',12,1),(106,'2023-09-01 05:51:12.256902','31','雨天有情调，英伦风设计，给你好品味',1,'[{\"added\": {}}]',12,1),(107,'2023-09-01 05:51:55.849194','32','复古经典女式休闲鞋小白鞋',1,'[{\"added\": {}}]',12,1),(108,'2023-09-01 05:52:42.904206','33','保暖系列-女式饼干板鞋加毛款',1,'[{\"added\": {}}]',12,1),(109,'2023-09-01 05:53:21.955078','34','「一件三穿好过冬」男中长款鹅绒防水外套',1,'[{\"added\": {}}]',12,1),(110,'2023-09-01 05:54:03.146942','35','男式零感无压加厚保暖羽绒服',1,'[{\"added\": {}}]',12,1),(111,'2023-09-01 05:54:39.167204','36','女式优雅蝴蝶结饰带浅口穆勒鞋',1,'[{\"added\": {}}]',12,1),(112,'2023-09-01 05:55:19.542630','37','鸣夏女式运动休闲凉鞋',1,'[{\"added\": {}}]',12,1),(113,'2023-09-01 05:55:42.124538','3','服饰',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(114,'2023-09-01 06:08:50.552876','38','儿童亚麻夏凉宽松萝卜裤防蚊裤66-130cm',1,'[{\"added\": {}}]',12,1),(115,'2023-09-01 06:10:57.449483','39','舒适软弹，糖果色儿童网孔透气运动鞋',1,'[{\"added\": {}}]',12,1),(116,'2023-09-01 06:11:34.217626','40','新疆棉宝宝时尚涂鸦短袖连体衣59-90cm',1,'[{\"added\": {}}]',12,1),(117,'2023-09-01 06:27:10.488190','41','ins风小碎花泡泡袖衬110-160cm',1,'[{\"added\": {}}]',12,1),(118,'2023-09-01 06:27:49.206468','42','90%白鸭绒，儿童轻羽绒马甲73-130cm',1,'[{\"added\": {}}]',12,1),(119,'2023-09-01 06:28:24.351189','43','甜酷运动风，儿童卫衣运动套装73-130cm',1,'[{\"added\": {}}]',12,1),(120,'2023-09-01 06:29:02.432806','44','儿童网眼运动凉鞋（宽松版）25-32码',1,'[{\"added\": {}}]',12,1),(121,'2023-09-01 06:29:42.999624','45','防踢鞋头，儿童学步健康机能鞋21-30',1,'[{\"added\": {}}]',12,1),(122,'2023-09-01 06:32:35.921571','4','母婴',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1),(123,'2023-09-01 08:23:17.156581','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(124,'2023-09-01 08:23:35.548791','2','美食',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(125,'2023-09-01 08:24:01.297202','3','服饰',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(126,'2023-09-01 08:24:16.548202','4','母婴',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(127,'2023-09-01 08:26:51.240073','1','居家',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(128,'2023-09-01 08:44:59.753357','43','甜酷运动风，儿童卫衣运动套装73-130cm',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u5c01\\u9762\"]}}]',12,1),(129,'2023-09-01 08:46:22.716660','10','居家生活用品',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\", \"\\u5206\\u7c7b\\u63cf\\u8ff0\"]}}]',11,1),(130,'2023-09-01 08:47:41.079431','10','居家生活用品',2,'[{\"changed\": {\"fields\": [\"\\u5206\\u7c7b\\u5546\\u54c1\"]}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'announcement','announcement'),(3,'auth','group'),(2,'auth','permission'),(13,'banner','banner'),(11,'category','category'),(4,'contenttypes','contenttype'),(12,'goods','goods'),(14,'goods','recommend'),(10,'notice','notice'),(5,'sessions','session'),(7,'user','characters'),(6,'user','menu'),(8,'user','userinfo');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-03 01:29:45.946799'),(2,'contenttypes','0002_remove_content_type_name','2023-08-03 01:29:45.996665'),(3,'auth','0001_initial','2023-08-03 01:29:46.148871'),(4,'auth','0002_alter_permission_name_max_length','2023-08-03 01:29:46.185298'),(5,'auth','0003_alter_user_email_max_length','2023-08-03 01:29:46.190284'),(6,'auth','0004_alter_user_username_opts','2023-08-03 01:29:46.196268'),(7,'auth','0005_alter_user_last_login_null','2023-08-03 01:29:46.202252'),(8,'auth','0006_require_contenttypes_0002','2023-08-03 01:29:46.204247'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-03 01:29:46.209233'),(10,'auth','0008_alter_user_username_max_length','2023-08-03 01:29:46.215218'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-03 01:29:46.220207'),(12,'auth','0010_alter_group_name_max_length','2023-08-03 01:29:46.232172'),(13,'auth','0011_update_proxy_permissions','2023-08-03 01:29:46.237160'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-03 01:29:46.243143'),(15,'user','0001_initial','2023-08-03 01:29:46.607561'),(16,'admin','0001_initial','2023-08-03 01:29:46.691336'),(17,'admin','0002_logentry_remove_auto_add','2023-08-03 01:29:46.699315'),(18,'admin','0003_logentry_add_action_flag_choices','2023-08-03 01:29:46.708475'),(19,'announcement','0001_initial','2023-08-03 01:29:46.723145'),(20,'announcement','0002_initial','2023-08-03 01:29:46.763038'),(21,'sessions','0001_initial','2023-08-03 01:29:46.788970'),(22,'notice','0001_initial','2023-08-07 03:14:15.754697'),(23,'notice','0002_alter_notice_avatar','2023-08-07 05:16:02.168829'),(24,'notice','0003_notice_user','2023-08-07 07:04:19.416523'),(25,'notice','0004_alter_notice_user','2023-08-07 12:43:42.839107'),(26,'user','0002_alter_characters_menu','2023-08-07 12:43:42.856061'),(27,'goods','0001_initial','2023-08-30 03:59:07.870749'),(28,'category','0001_initial','2023-08-30 03:59:08.001830'),(29,'goods','0002_alter_goods_ordernum','2023-08-31 02:15:16.599904'),(30,'category','0002_alter_category_goods','2023-08-31 02:58:02.702204'),(31,'banner','0001_initial','2023-09-01 01:28:10.214106'),(32,'goods','0003_goods_create_date','2023-09-01 02:41:25.200948'),(33,'goods','0004_recommend','2023-09-01 03:23:00.445159'),(34,'category','0003_category_saleinfo','2023-09-01 08:22:42.813078'),(35,'category','0004_alter_category_saleinfo','2023-09-01 08:46:41.398246');
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
INSERT INTO `django_session` VALUES ('vgjsaudtd595zqixh6epb2tauiya8gwt','.eJy1lUtzmzAQx7-KR2c_JCMJyDE99NRjTyXjWUkLpuXRkcyhk_F3rwTuNFFwQ-32wjK7f_b1E_BMDjCcjofBoT3UhjwQRtYvfQr0N-xCwHyFruq3uu9OtlbbINleom77qTfYPF60rxIcwR390wh5DokSGUVldK4yjuVe5owmChllJcuBMpGmZZprIWWWYJnwhDFDmTGUj1212A3O5_ryXJAOWizIw6ogj9B1aAuy9ve1727ylmBXJWx0bXWDU7ANPboQfp2gKIaslOiN5GC8EbLEBfkG20yxHZi27nZqbOSXmTRgzOc_yrzgIlUWwWg7tGqmx0VDnteruwc7P4Uw1iZEGaX72MHiKh_ghFVvf9xHQOyp9CbVqQpGAQuGe-ffg9CXjn7fXIXxVroQyMKpZ5DcOmkMgseOJC72se-Nuw8LRwXh_GjGg0kgC4cqEfQGLFVoZ2dR961_k811KLFwIZIl487wuHXEeP1yjrXggbXgmt19qqetTNd3Vjdd_-_abh0tXlsaO8TcZ0wBH81YTPBMj6iygEqmPHlb04Wa7lhjYzbQnN496ClqfiVL-I25je6reS7hV7erbD98v47lhWYhlX8z9Mwqlw0aQ8ljR3Z-IuefHt6TJA:1qbuoX:JKBL4CYveBQ-Xe7R8gX2u_j3282loDvxpWotux9eJrw','2023-09-15 03:27:17.689347');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goods`
--

LOCK TABLES `goods_goods` WRITE;
/*!40000 ALTER TABLE `goods_goods` DISABLE KEYS */;
INSERT INTO `goods_goods` VALUES (1,'暖腰暖腹暖胃，蕲艾暖宫腰带','暖宫暖腰暖胃，大面积热敷≈3片暖宝宝','goods/9892cc73945da1591fa5259ad076b23c.jpg',NULL,49.00,'2023-09-01 02:41:25.168991'),(2,'新年佳礼，家用SPA多功能按摩床垫','坐卧两用，随时随地做spa，多个场合随你心意','goods/c41003c6df90d7673195dcc2482e13f3.jpg',NULL,599.00,'2023-09-01 02:41:25.168991'),(3,'七夕礼物·姐姐同款，穿出自信体态矫姿带','背薄一寸，年轻十岁，时尚百搭，约会职场小心机','goods/a6939f41c48fa9e9c8f7a7ed855351f1.jpg',NULL,159.00,'2023-09-01 02:41:25.168991'),(4,'带提手可站立炫彩硅胶热水袋','杯型式设计，轻松注水防烫伤','goods/0b120e1c37f312981f4f2242997cc862.png',NULL,35.00,'2023-09-01 02:41:25.168991'),(5,'七夕礼物·挺拔身姿，隐形内穿矫姿带','众筹爆品回归，专注矫姿20年，轻松矫正身姿','goods/7d1bc78607a08c088b2a7cdbe88c05af.png',NULL,149.00,'2023-09-01 02:41:25.168991'),(6,'消炎镇痛一贴灵医用冷敷贴60贴/盒','mini型尺寸设计性价比更高','goods/d3807695c7d42a0247e308a936201d7c.jpg',NULL,79.00,'2023-09-01 02:41:25.168991'),(7,'真空拔罐器','居家养生必备超简便拔罐套装','goods/16222847be7d090eb538a944a7e0b01b.jpg',NULL,49.00,'2023-09-01 02:41:25.168991'),(8,'艾灸理疗随时随地，灸疗装置8头/12头','哪里不适灸哪里，全身都可灸','goods/941abaee58a88cb104228fe2c4cfdeb1.png',NULL,99.00,'2023-09-01 02:41:25.168991'),(9,'入门首选，语音播报电子血压计','全程语音指导，一键测量，监测心率，贴心守护爸妈健康','goods/8f0c15f981c5cbcb1aa17215a259fa62.png',NULL,109.00,'2023-09-01 02:41:25.168991'),(10,'黄金玉粟粥米500克','谷物缤纷，香甜软糯','goods/5f62c7ab543b1152383a0e9941c09bfd.png',NULL,9.90,'2023-09-01 02:41:25.168991'),(11,'懒人瘦出好身材，多功能甩脂塑形机','懒人福音居家轻松塑身','goods/540f84174dbf9b98d4072abbd886819e.png',NULL,589.00,'2023-09-01 02:41:25.168991'),(12,'新款LOGO印花时尚学步叫叫鞋','软底包头叫叫鞋','goods/841d7669e6cc23cb249f47d8d39fc17c.jpg',NULL,259.00,'2023-09-01 02:41:25.168991'),(13,'【新疆棉】简约山形纹全棉提花毛巾','新疆长绒棉毛巾，吸水好颜值高','goods/e0cea368f41da1587b3b7fc523f169d7.png',NULL,18.50,'2023-09-01 02:41:25.168991'),(14,'医美级冰脱韩国Ulike蓝宝石脉冲光脱毛仪','蓝宝石冰点脱毛，高效更持久','goods/3567b2ac2526e6b89124f3fb62fd09d3.png',NULL,1599.00,'2023-09-01 02:41:25.168991'),(15,'书源彩色按动中性笔','化繁为简，书写本源','goods/21216556e7d47a4e4277dcb36a16a486.png',NULL,13.90,'2023-09-01 02:41:25.168991'),(16,'运动健身跑步腰包','防水反光设计，大容量双口袋收纳，运动跑步更时尚','goods/610a693cfd6f01adc6923dc1c0ec91aa.jpg',NULL,40.00,'2023-09-01 02:41:25.168991'),(17,'分场景使用不污染，超细纤维抹布分类5件套','精细分工，洁净家居','goods/c520bba8209bae877158e8810d889aca.png',NULL,14.90,'2023-09-01 02:41:25.168991'),(18,'3秒快速拆琴轻松保养odin奥丁12半音阶口琴','易吹性好按键灵敏音色优美全黑琴身','goods/937a8e46a9284e8f7e00e13911ecfbe7.png',3029,329.00,'2023-09-01 05:33:47.054642'),(19,'善谋者得天下，三国杀桌游','宅家娱乐神器，竞技社交合一','goods/b4960b7e7d9dd98c83ec1ec350f4f39c.png',185,157.00,'2023-09-01 05:34:22.758075'),(20,'飞天53%vol500ml贵州茅台酒（带杯）','茅台飘香，正品溯源','goods/d46e005025a5d3b73c4781d31b327558.jpg',22,1499.00,'2023-09-01 05:35:00.930123'),(21,'一吸即净，车家多用，车载无线吸尘器','5分钟搞定车内清洁','goods/02dcab8b641999d575a18546851e8013.png',177,199.00,'2023-09-01 05:35:58.712474'),(22,'办公居家必备，3A3U智能插线板','高颜值插线板，办公居家必备','goods/b9e65109ee77e9a78f57ce3fef97c793.png',174,29.00,'2023-09-01 05:36:39.385162'),(23,'地道卤香好味道，桂林鲜米粉245克*6盒','无人工添加防腐剂，鲜嫩爽滑','goods/26d71d6eb4c00ed727ad9f54ae4ce553.png',267,69.00,'2023-09-01 05:37:34.732568'),(24,'玛歌正牌干红750毫升2017年','波尔多五大名庄玛歌正牌','goods/9e915c0a8839fa72b6ee1f9600289b62.png',355,6699.00,'2023-09-01 05:38:21.616317'),(25,'下饭神器酸豆角50克*10袋','180天土窖腌制，酸爽脆嫩','goods/b7808ed03474fa33626571cdbd7f0ae6.jpg',370,16.00,'2023-09-01 05:38:59.548779'),(26,'朱炳仁铜·猫型吉祥物装饰工艺摆件','灵性十足的黑色招财猫，周而复始，财源不断','goods/6e38fc94a8fe72c9d139bc48ba6d9814.jpg',761,1888.00,'2023-09-01 05:43:50.702899'),(27,'星云吉彩系列花器新年创意花瓶摆件朱炳仁','星云吉彩，一路繁花。花瓶造型挺秀、俏丽，更为丰满圆润；五彩斑斓色彩，莹润光泽的质感，又显娇嫩。置于台前感受花与花器的和谐之美，获得精神的美感和愉悦。采用国家非遗百年传统工艺及国艺釉彩铜独创工艺，简约时尚的设计，雅致意趣。','goods/2dd8fe9b59774c7ca160bb2d5741c763.jpg',268,442.00,'2023-09-01 05:44:35.861241'),(28,'苏格兰陈年单一麦芽威士忌700毫升','蒸馏大师监制','goods/a0a334a93e3d2bba7592ac692e045a48.png',338,318.00,'2023-09-01 05:46:14.259885'),(29,'大丈夫方便面轻巧款私房牛肉味64克*6杯','非油炸，好吃不上火','goods/38e41a417612d3a419ab6fc6183593b2.jpg',187,28.50,'2023-09-01 05:46:59.982332'),(30,'别致优雅男式新潮头层牛皮钥匙包','可旋转五金挂钩，悬挂方便','goods/72f50e8d10cf3c6a040c2f800774b007.jpg',750,106.00,'2023-09-01 05:50:35.097323'),(31,'雨天有情调，英伦风设计，给你好品味','英伦长柄自动晴雨伞','goods/e77b8f4a8ddd1e777394d84347859f7c.png',217,40.90,'2023-09-01 05:51:12.255905'),(32,'复古经典女式休闲鞋小白鞋','超高性价比的真皮小白鞋','goods/ebf52f79b473b7839bcef1568975a179.png',400,172.00,'2023-09-01 05:51:55.849194'),(33,'保暖系列-女式饼干板鞋加毛款','简约纹理时尚“潮&#34;”你而来','goods/01f0260802ef8bba164e7c8e1ba8ae20.jpg',202,174.00,'2023-09-01 05:52:42.903210'),(34,'「一件三穿好过冬」男中长款鹅绒防水外套','一件衣服三种穿法，应对多变天气','goods/aa9e03278e3274a2a83f3f8e7df5ee6f.png',246,659.00,'2023-09-01 05:53:21.954081'),(35,'男式零感无压加厚保暖羽绒服','为「轻暖」而生','goods/0ff69c2099d98aa3cdddcb0edb9108a0.png',169,409.00,'2023-09-01 05:54:03.145944'),(36,'女式优雅蝴蝶结饰带浅口穆勒鞋','浪漫演绎，法式复古方头','goods/36cf7f601519a1c0f545d9e2a6123154.png',144,178.00,'2023-09-01 05:54:39.166205'),(37,'鸣夏女式运动休闲凉鞋','凉鞋也有运动鞋的舒适度','goods/da7629edd21bebe5cd26adbbbf5817ac.png',174,145.00,'2023-09-01 05:55:19.541633'),(38,'儿童亚麻夏凉宽松萝卜裤防蚊裤66-130cm','100%天然亚麻面料，凉爽舒适，透气不闷热','goods/da7629edd21bebe5cd26adbbbf5817ac_jpTrmx0.png',864,95.00,'2023-09-01 06:08:50.551878'),(39,'舒适软弹，糖果色儿童网孔透气运动鞋','防踢鞋头，透气网孔更舒适','goods/c437179bc1d0d5ad77a79f15a5c6f166.png',2271,139.00,'2023-09-01 06:10:57.447472'),(40,'新疆棉宝宝时尚涂鸦短袖连体衣59-90cm','创意手绘图案，透气纯棉面料，3色可选','goods/a8b170b3114d33dae0ae98cddb5fb3f6.jpg',792,69.00,'2023-09-01 06:11:34.216628'),(41,'ins风小碎花泡泡袖衬110-160cm','全棉面料，高支高密底布，手感柔软舒适，贴身穿着亲肤透气；经典娃娃衫，泡泡袖设计，增添可爱蓬松感；后背全开门襟，方便穿脱。','goods/c07edde1047fa1bd0b795bed136c2bb2.jpg',1643,99.00,'2023-09-01 06:27:10.486189'),(42,'90%白鸭绒，儿童轻羽绒马甲73-130cm','儿童轻羽绒马甲，保暖常备单品','goods/f73b2672f87b2e336d206c56d4ea7d0f.png',185,99.00,'2023-09-01 06:27:49.205469'),(43,'甜酷运动风，儿童卫衣运动套装73-130cm','轻松搭配，一套活力尽显','goods/767fc11b88b1e7b795319cd78c65f72f.png',224,179.00,'2023-09-01 06:28:24.350192'),(44,'儿童网眼运动凉鞋（宽松版）25-32码','加大空间鞋头，码数无需拍大一码','goods/66072109da4f1e6ec56ea5eacaf3471c.png',176,127.00,'2023-09-01 06:29:02.431810'),(45,'防踢鞋头，儿童学步健康机能鞋21-30','包头防踢用心呵护','goods/33ba674fbb13e2380ee8a74371eacf43.jpg',888,129.00,'2023-09-01 06:29:42.998627');
/*!40000 ALTER TABLE `goods_goods` ENABLE KEYS */;
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
INSERT INTO `goods_recommend` VALUES (1,'特惠推荐','它们最实惠','recommend/popular_1.jpg'),(2,'爆款推荐','它们最受欢迎','recommend/popular_2.jpg'),(3,'一站买全','使用场景下精心优选','recommend/popular_3.jpg'),(4,'领券中心','更多超值优惠券','recommend/popular_4.jpg');
/*!40000 ALTER TABLE `goods_recommend` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_notice`
--

LOCK TABLES `notice_notice` WRITE;
/*!40000 ALTER TABLE `notice_notice` DISABLE KEYS */;
INSERT INTO `notice_notice` VALUES (2,'https://gw.alipayobjects.com/zos/rmsportal/kISTdvpyTAhtGxpovNWd.png','测试消息','2023-08-07 07:04:26.368287','',2),(4,'https://gw.alipayobjects.com/zos/rmsportal/OKJXDXrmkNshAMvwtvhu.png','恭喜你抽中一辆太阳神','2023-08-07 12:54:57.545906','',1),(10,'https://gw.alipayobjects.com/zos/rmsportal/GvqBnKhFgObvnSGkDsje.png','你好好你好','2023-08-11 01:16:06.671974','',1),(11,'https://gw.alipayobjects.com/zos/rmsportal/OKJXDXrmkNshAMvwtvhu.png','你好啊你好','2023-08-11 01:24:31.807194','123',1),(12,'https://gw.alipayobjects.com/zos/rmsportal/GvqBnKhFgObvnSGkDsje.png','112332','2023-08-11 01:36:47.996821','',1),(13,'https://gw.alipayobjects.com/zos/rmsportal/kISTdvpyTAhtGxpovNWd.png','消息消息','2023-08-11 01:46:18.034171','',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_characters_menu`
--

LOCK TABLES `user_characters_menu` WRITE;
/*!40000 ALTER TABLE `user_characters_menu` DISABLE KEYS */;
INSERT INTO `user_characters_menu` VALUES (4,3,1),(5,3,2),(6,3,3),(7,3,4),(8,3,5),(9,3,6),(10,3,7),(11,3,8),(12,3,9),(13,3,10),(14,3,11),(15,3,12),(16,3,13),(17,3,14),(18,3,15),(19,3,16),(20,3,17),(21,3,18),(22,3,19),(23,3,20),(24,3,21),(25,3,22),(26,3,23),(28,3,24),(29,3,25),(27,4,23),(30,4,24),(31,4,25);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_userinfo_role_id_e5218572_fk_user_characters_id` (`role_id`),
  KEY `user_userinfo_username_phone_90e3b8e8_idx` (`username`,`phone`),
  CONSTRAINT `user_userinfo_role_id_e5218572_fk_user_characters_id` FOREIGN KEY (`role_id`) REFERENCES `user_characters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo`
--

LOCK TABLES `user_userinfo` WRITE;
/*!40000 ALTER TABLE `user_userinfo` DISABLE KEYS */;
INSERT INTO `user_userinfo` VALUES (1,'pbkdf2_sha256$600000$0ntE8ODW8gD66hHUOUWW5s$i26oAEI050sQZsXGJq/hXOnrlQbHah/OOuJSgtT1Uyw=','2023-08-31 02:11:58.779164',1,'admin','','','',1,1,'2023-08-03 01:30:08.985710','张恩宇','男',21,'15566666666',3),(2,'pbkdf2_sha256$600000$ralHghev6BR2Q3oDWLxSQY$VWwMz4O3iRj1QfTo9RbDha22j7cfeejCXlQVOQ4cbRo=',NULL,0,'test456','','','',0,1,'2023-08-10 16:00:00.000000','xxx','男',22,'15566666666',4);
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

-- Dump completed on 2023-09-01 17:16:05
