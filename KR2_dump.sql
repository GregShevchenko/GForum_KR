-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: KR2_DB
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add forum',8,'add_forum'),(23,'Can change forum',8,'change_forum'),(24,'Can delete forum',8,'delete_forum'),(25,'Can add topic',9,'add_topic'),(26,'Can change topic',9,'change_topic'),(27,'Can delete topic',9,'delete_topic'),(28,'Can add post',10,'add_post'),(29,'Can change post',10,'change_post'),(30,'Can delete post',10,'delete_post');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$1gYVegXcz7r7$f1tKs6Wf2IDKGCNJQIygL8bKrz37o+iUpl0H/w7TYBY=','2018-04-01 05:45:25',1,'admin','','','',1,1,'2018-02-13 20:53:51');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-02-13 20:54:46','1','Общий раздел',1,'Добавлено.',7,1),(2,'2018-02-13 20:54:53','2','Юмор',1,'Добавлено.',7,1),(3,'2018-02-13 20:55:04','3','Новости Украины',1,'Добавлено.',7,1),(4,'2018-02-13 20:55:56','1','ИТ юмор',1,'Добавлено.',8,1),(5,'2018-02-13 20:56:17','2','Анекдоты',1,'Добавлено.',8,1),(6,'2018-02-13 20:56:36','3','Перемога',1,'Добавлено.',8,1),(7,'2018-02-13 20:56:50','4','Зрада',1,'Добавлено.',8,1),(8,'2018-02-13 20:57:51','5','Дно или WTF',1,'Добавлено.',8,1),(9,'2018-02-13 20:58:51','6','Объявления',1,'Добавлено.',8,1),(10,'2018-02-13 20:59:20','7','Новичкам',1,'Добавлено.',8,1),(11,'2018-02-17 18:04:29','3','Новости Украины',2,'Изменен description.',7,1),(12,'2018-02-17 18:05:12','1','Общий раздел',2,'Изменен description.',7,1),(13,'2018-02-17 18:09:46','2','Юмор',2,'Изменен description.',7,1),(14,'2018-02-17 18:12:14','5','Дно или WTF',2,'Изменен description.',8,1),(15,'2018-02-17 18:13:21','4','Зрада',2,'Изменен description.',8,1),(16,'2018-02-17 18:13:44','3','Перемога',2,'Изменен description.',8,1),(17,'2018-02-17 18:14:00','2','Анекдоты',2,'Изменен description.',8,1),(18,'2018-02-17 18:14:24','1','ИТ юмор',2,'Изменен description.',8,1),(19,'2018-02-17 18:14:49','7','Новичкам',2,'Изменен description.',8,1),(20,'2018-02-17 18:15:08','6','Объявления',2,'Изменен description.',8,1),(21,'2018-02-23 04:54:09','4','Технологии',1,'Добавлено.',7,1),(22,'2018-02-23 04:54:45','5','Кино',1,'Добавлено.',7,1),(23,'2018-02-23 04:58:03','6','Музыка',1,'Добавлено.',7,1),(24,'2018-02-23 05:23:25','5','Кино',3,'',7,1),(25,'2018-02-23 05:23:25','6','Музыка',3,'',7,1),(26,'2018-02-23 05:23:55','7','Кино и музыка',1,'Добавлено.',7,1),(27,'2018-02-23 05:24:37','8','Кино',1,'Добавлено.',8,1),(28,'2018-02-23 05:25:16','7','Кино и музыка',3,'',7,1),(29,'2018-02-23 05:25:44','8','Кино',1,'Добавлено.',7,1),(30,'2018-02-23 05:26:02','9','Музыка',1,'Добавлено.',7,1),(31,'2018-02-23 05:26:32','8','Сериалы',2,'Изменен category и title.',8,1),(32,'2018-02-23 05:26:46','9','Фильмы',1,'Добавлено.',8,1),(33,'2018-02-23 05:27:40','10','Документальное',1,'Добавлено.',8,1),(34,'2018-02-23 05:28:13','11','Ремонт РС',1,'Добавлено.',8,1),(35,'2018-02-23 05:28:43','12','Ремонт Смартфонов',1,'Добавлено.',8,1),(36,'2018-02-23 05:29:17','13','Фотоаппараты',1,'Добавлено.',8,1),(37,'2018-02-23 19:27:23','1','ЧАВО, або дещо про терміни...',1,'Добавлено.',9,1),(38,'2018-02-23 19:46:08','1','ЧАВО, або дещо про терміни...',1,'Добавлено.',10,1),(39,'2018-02-23 19:46:52','1','ЧАВО, або дещо про терміни...',2,'Ни одно поле не изменено.',10,1),(40,'2018-02-23 19:47:23','2','Смайлики',1,'Добавлено.',10,1),(41,'2018-02-23 19:48:43','3','Кросспостинг',1,'Добавлено.',10,1),(42,'2018-02-23 19:49:15','4','Что такое FTP?',1,'Добавлено.',10,1),(43,'2018-02-23 19:50:43','5','Словарь аббревиатур',1,'Добавлено.',10,1),(44,'2018-02-23 19:57:37','6','Модератор',1,'Добавлено.',10,1),(45,'2018-02-23 20:01:34','2','Из Одессы',1,'Добавлено.',9,1),(46,'2018-02-23 20:06:52','7','№ 1',1,'Добавлено.',10,1),(47,'2018-02-23 20:11:38','8','№ 2',1,'Добавлено.',10,1),(48,'2018-02-23 20:12:47','9','№ 3',1,'Добавлено.',10,1),(49,'2018-03-21 20:24:40','4','Анекдоты из политики',3,'',9,1),(50,'2018-03-21 20:24:40','3','Анекдоты из политики',3,'',9,1),(51,'2018-03-21 23:48:10','6','Бородатый анекдот',2,'Изменен forum.',9,1),(52,'2018-03-30 04:07:42','30','* * *',2,'Изменен forum.',10,1),(53,'2018-03-30 19:19:52','33','* * *1',2,'Ни одно поле не изменено.',10,1),(54,'2018-03-30 19:58:28','35','Test_Peremoga1',3,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'forum','category'),(8,'forum','forum'),(9,'forum','topic'),(10,'forum','post');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-02-13 20:52:57'),(2,'auth','0001_initial','2018-02-13 20:52:57'),(3,'admin','0001_initial','2018-02-13 20:52:57'),(4,'admin','0002_logentry_remove_auto_add','2018-02-13 20:52:57'),(5,'contenttypes','0002_remove_content_type_name','2018-02-13 20:52:57'),(6,'auth','0002_alter_permission_name_max_length','2018-02-13 20:52:57'),(7,'auth','0003_alter_user_email_max_length','2018-02-13 20:52:57'),(8,'auth','0004_alter_user_username_opts','2018-02-13 20:52:57'),(9,'auth','0005_alter_user_last_login_null','2018-02-13 20:52:57'),(10,'auth','0006_require_contenttypes_0002','2018-02-13 20:52:57'),(11,'auth','0007_alter_validators_add_error_messages','2018-02-13 20:52:57'),(12,'forum','0001_initial','2018-02-13 20:52:57'),(13,'sessions','0001_initial','2018-02-13 20:52:57'),(14,'forum','0002_category_description','2018-02-15 21:21:52'),(15,'forum','0003_topic','2018-02-23 06:01:26'),(16,'forum','0004_auto_20180223_2110','2018-02-23 19:10:54'),(17,'forum','0005_auto_20180223_2131','2018-02-23 19:31:44'),(18,'forum','0006_auto_20180223_2144','2018-02-23 19:44:07'),(19,'forum','0007_remove_topic_description','2018-02-23 20:00:56'),(20,'forum','0008_auto_20180224_1122','2018-02-24 09:22:53'),(21,'forum','0009_topic_description','2018-03-21 20:21:43');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6ta05osiz3kudzzrqp5l6j43xmdts4jj','NmZjY2I3NzdhMDRjYWZhZjg0MmNhODgwZWZiNjdmMmIyNzVmZjZhZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImRiYmYwYmU1YjZmZDg2OTEyOTc5NjRlOWIzZWJiNDhjNzJlZDBmNTEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-02-27 20:54:13'),('gc8cmtohqdfq00e3l6d2b0kn1ai8duf3','ZDE1MTJhZDViOWI1MGM3MmMyYjcyZmY1Y2M1ZTdjZTdkZjE0YzYxMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGJiZjBiZTViNmZkODY5MTI5Nzk2NGU5YjNlYmI0OGM3MmVkMGY1MSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-13 21:50:31'),('at5sf44eiix86vtv5cqoojoud01vm9u5','MzgyZGM0NGNjOGU3MGFiZjVmMGY0YTc4YmZjY2U4YzhkOGVkOWMzMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmJmMGJlNWI2ZmQ4NjkxMjk3OTY0ZTliM2ViYjQ4YzcyZWQwZjUxIn0=','2018-04-01 21:14:26'),('glmsevway0d6zc24pyyuwnw677q92yyw','M2YzZjMzZmQzOGJhN2E0NzBkYmQ2NGI2OGExYTdlZGViNWMwZjY0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJkYmJmMGJlNWI2ZmQ4NjkxMjk3OTY0ZTliM2ViYjQ4YzcyZWQwZjUxIn0=','2018-04-15 05:45:25');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_category`
--

DROP TABLE IF EXISTS `forum_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_category`
--

LOCK TABLES `forum_category` WRITE;
/*!40000 ALTER TABLE `forum_category` DISABLE KEYS */;
INSERT INTO `forum_category` VALUES (1,'Общий раздел','В этом разделе создаются форумы посвященные события на сайте, объявлениям, руководствам новичков и прочим подобным вещам'),(2,'Юмор','В этом разделе создаются форумы посвященны юмору во всех проявлениях, например анекдоты, байки, фотожабы, смешные истории'),(3,'Новости Украины','В этом разделе создаются форумы посвященные событиям в Украине'),(4,'Технологии','В этом разделе создаются форумы посвященные технологиям (новинки компьютерного рынка, ремонт PC, ремонт телефонов и т.д.)'),(8,'Кино','В этом разделе создаются форумы посвященные кино'),(9,'Музыка','В этом разделе создаются форумы посвященные музыке');
/*!40000 ALTER TABLE `forum_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_forum`
--

DROP TABLE IF EXISTS `forum_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `description` longtext NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_forum_b583a629` (`category_id`),
  KEY `forum_forum_3700153c` (`creator_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_forum`
--

LOCK TABLES `forum_forum` WRITE;
/*!40000 ALTER TABLE `forum_forum` DISABLE KEYS */;
INSERT INTO `forum_forum` VALUES (1,'ИТ юмор','Для размещения топиков, посвященных различным анекдотам и историям из жизни ИТ','2018-02-17 18:14:24','2018-02-13 20:55:56',2,1),(2,'Анекдоты','Для размещения топиков, посвященных анекдотам','2018-02-17 18:14:00','2018-02-13 20:56:17',2,1),(3,'Перемога','Для размещения топиков, посвященных обсуждению событий положительно сказывающихся на рейтингах нашей страны','2018-02-17 18:13:44','2018-02-13 20:56:36',3,1),(4,'Зрада','Для размещения топиков, посвященных обсуждению событий отрицательно сказывающихся на рейтингах нашей страны','2018-02-17 18:13:21','2018-02-13 20:56:50',3,1),(5,'Дно или WTF','Для размещения топиков, посвященных обсуждению странных, необъяснимых в своей тупости и дебилизме событий нашей страны','2018-02-17 18:12:14','2018-02-13 20:57:51',3,1),(6,'Объявления','Для размещения топиков, посвященных объявлениям для форумчан','2018-02-17 18:15:08','2018-02-13 20:58:51',1,1),(7,'Новичкам','Для размещения топиков, посвященных обсуждению вопросов могущих вызвать трудности у новичков','2018-02-17 18:14:49','2018-02-13 20:59:20',1,1),(8,'Сериалы','','2018-02-23 05:26:32','2018-02-23 05:24:37',8,1),(9,'Фильмы','','2018-02-23 05:26:46','2018-02-23 05:26:46',8,1),(10,'Документальное','','2018-02-23 05:27:40','2018-02-23 05:27:40',8,1),(11,'Ремонт РС','','2018-02-23 05:28:13','2018-02-23 05:28:13',4,1),(12,'Ремонт Смартфонов','','2018-02-23 05:28:43','2018-02-23 05:28:43',4,1),(13,'Фотоаппараты','','2018-02-23 05:29:17','2018-02-23 05:29:17',4,1);
/*!40000 ALTER TABLE `forum_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_post`
--

DROP TABLE IF EXISTS `forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `creator_id` int(11) NOT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_post_3700153c` (`creator_id`),
  KEY `forum_post_19bc3ff1` (`forum_id`),
  KEY `forum_post_19b4d727` (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_post`
--

LOCK TABLES `forum_post` WRITE;
/*!40000 ALTER TABLE `forum_post` DISABLE KEYS */;
INSERT INTO `forum_post` VALUES (1,'ЧАВО, або дещо про терміни...','Что такое сетевой этикет?\r\nЭто несложные правила, которые придумали люди, много общающиеся друг с другом через интернет. Сетевой этикет нужен для того, чтобы всем - и опытным пользователям, и новичкам было в равной мере комфортно общаться между собой. Эти правила хорошего тона - всего лишь пожелания. Никто не собирается учить вас жить и ограничивать вашу свободу. Но поскольку мы все - сообщество, соблюдение этих правил поднимет ваш авторитет, и вы привлечете к себе внимание как приятный и интересный собеседник.\r\n\r\nЧто такое оффтоп?\r\nОффтоп - сообщение . В определённой ветке форума следует придерживаться тематики именно этой ветки. Если вы хотите высказать свою идею или мысль, не относящуюся к теме, то лучше создайте новую тему и там начните обсуждение своей идеи. \r\nВ редких случаях можно воспользоваться специальными тегами , которые менее заметны и не отвлекают от смысловой части сообщения. \r\n\r\nЧто такое флуд?\r\nФлуд (с англ. Flood - наводнение) - это поток сообщений, не несущих почти никакой смысловой нагрузки. Это такие сообщения, которые можно было бы безболезненно удалить (а точнее, не писать) без всякого ущерба для собщества и обычно выглядят как короткие однострочные сообщения: «Точно!», «Согласен!», «Подпишусь под каждым словом!», «Я тоже так думаю!», «Ух, ты!» и так далее. \r\nТак же к флуду приравнивается длительный диалог двух человек на манер чата и несколько сообщений подряд от одного человека (помните, что вы можете отредактировать и дополнить своё текущее сообщение и создание нового, ради ещё одной строчки нецелесообразно). \r\nФлуда следует избегать. Он замедляет загрузку страниц, увеличивает количество ненужной информации, раздражает других пользователей, создает бессмысленный трафик и увеличивает затраты. \r\nНа Форуме флуд строго пресекается, а авторы флуда (в народе - флудеры) наказываются.\r\n\r\nЧто такое флейм?\r\nФлейм - это «спор ради спора». Когда все забывают, из-за чего начался разговор и начинают ожесточенно ругаться друг с другом - вот тогда и начинается флейм. Мы говорим про человека, что он разжигает флейм, если он: \r\n-переходит по ходу разговора на личности \r\n- допускает оскорбления личного, национального, религиозного, полового или профессионального характера \r\n- ведет дискуссию неуравновешенно \r\n- провоцирует скандал \r\nЕсть простое правило - никогда не стоит поддерживать флейм. Да, именно так - личные «наезды» следует оставлять без ответа. Игнорируйте скандалистов и «флеймеров» - и тогда вас, несомненно, начнут уважать все остальные. \r\n\r\nЧто такое оверквотинг?\r\nКак правило, когда в форуме пользователь отвечает на чье-либо письмо, \r\nисходный текст письма сначала цитируется (при этом он визуально выделяется \r\nотступом или другим шрифтом), а затем уже идет сам ответ. Это делается для того, чтобы остальные присутствующие поняли, что, собственно, комментируется. Самой распространенной ошибкой в этом случае является так называемый оверквотинг - избыточное цитирование. Потому что для того, чтобы был понятен ответ, почти всегда вовсе ни к чему цитировать все исходное письмо. Достаточно процитировать только ту часть, которая необходима для понимания ответа. Но нередко бывает так, что пользователь цитирует огромное письмо только для того, чтобы написать «Согласен» или «Подпишусь под каждым словом». Оверквотинг вреден, и его следует по возможности избегать. \r\n\r\nСокращения\r\nМногие \"матерые жители интернета\" активно пользуются в своих сообщениях странными буквосочетаниями: имхо, asap и что-то еще в таком роде. Если вы встретите нечто подобное, не пугайтесь - это устойчивые сокращения, пришедшие из английской части интернета. И они всегда что-то означают. Список наиболее частых сокращений: \r\n• IMHO, имхо - \"In My Humble Opinion\" - \"по моему скромному мнению\" \r\n• LOL - \"Laugh Out Loud\" - \"я громко смеюсь\" \r\n• BTW - \"By The Way\" - \"кстати\" \r\n• AFAIK - \"As Far As I Know\" - \"Насколько я знаю\" \r\n• NFC - \"No Further Comments\" - \"Я все сказал\" \r\n• WBR - \"With Best Regards\" - \"С наилучшими пожеланиями\" \r\n• ASAP - \"As Soon As Possible\" - \"Как можно скорее \r\n• AKA - \"Also Known As\" - \"Известный также как:\" \r\n\r\nЧто такое Бан?\r\nБан - это наказание за нарушение правил форума (как правило неоднократное или особенно грубое), когда по решению администрации виновный лишается на определенное время возможности оставлять сообщения и заводить темы. \r\n\r\nПочему мне нельзя удалить свою тему, если она мне уже не нужна?\r\nУдалять тему невежливо по отношению к другим участникам дискуссии. Для удаления пустой темы следует обратиться к модератору раздела. \r\n\r\nПочему я сам не могу переименовать свою тему?\r\nВо избежание потери ориентиров читателями форума. Если вам крайне необходимо это сделать, обратитесь к модератору соответствующего раздела.\r\n\r\nНапоминание\r\nВеб - это публичное место. В нем \"ходят\" разные люди, в том числе и дети. Уважайте окружающих. Если вы новичок, ведите себя как в гостях - будьте готовы изучить и понять чужие правила и принципы, прежде чем устанавливать свои. \r\nКогда пользователь сталкивается с ненужной ему и не имеющей отношения к делу информацией, она \"ворует\" внимание, время, а часто и непосредственно деньги (например, если вы платите за доступ в интернет).','2018-02-23 19:46:52','2018-02-23 19:46:08',1,7,1),(11,'* * *','Как говорит тётя Фира: \r\n— Хорошо всё уметь. Но не дай Бог всё самой делать.','2018-04-01 07:14:16','2018-04-01 07:14:16',1,2,2),(47,'* * *','— Моня, шо ви имеете сказать за Рабиновича?\r\n— Ой, я Рабиновича плохо знаю с хорошей стороны.','2018-04-01 07:14:33','2018-04-01 07:14:33',1,2,2),(3,'Кросспостинг','Кросспостинг\r\n\r\nМатериал из Википедии — свободной энциклопедии\r\n\r\nКросспостинг — умышленное помещение одной и той же темы, либо очень похожих, затрагивающих одну и ту же проблему тем, в несколько разных разделов форума или блога.','2018-02-23 19:48:43','2018-02-23 19:48:43',1,7,1),(4,'Что такое FTP?','Что такое FTP?\r\n\r\n\r\nАббревиатура FTP расшифровывается как File Transfer Protocol (протокол передачи файлов). Протокол FTP оптимизирован для передачи файлов, это и послужило причиной того, что программы использующие этот протокол стали частью отдельного сервиса Интернет. Сервис обеспечивающий доступ к файлам других компьютеров сети по протоколу FTP носит одноименное название.\r\n\r\nЧтобы воспользоваться протоколом FTP, понадобится специальная программа, так называемый FTP-клиент. FTP-клиентом может служить интернет-броузер (MS Internet Explorer, Netscape Navigator, Opera), программа управления файлами FAR, специализированная программа CuteFTP и другие.','2018-02-23 19:49:15','2018-02-23 19:49:15',1,7,1),(34,'* * *2','- Я был у нескольких врачей и ни один не согласен с Вашим\r\nдиагнозом.\r\n- Ну что ж, подождем вскрытия.','2018-03-30 19:21:29','2018-03-30 19:21:29',1,2,7),(6,'Модератор','Модератор\r\n\r\nМатериал из Википедии — свободной энциклопедии\r\n\r\n\r\nМодера́тор (от лат. moderātor - возглавляющий группу) — человек, имеющий более широкие права по сравнению с обыкновенными пользователями на общественных сетевых ресурсах (чатах, форумах, эхоконференциях), в частности, хотя бы одно из двух прав:\r\nправо стирать чужие сообщения\r\nправо банить пользователей\r\nТеоретически, модератор отвечает за соблюдение установленных норм поведения. Однако некоторые модераторы стирают сообщения или банят пользователей по своему произволу; термин «модератор» отражает права, а не поведение.\r\n\r\nТочное определение понятия «модератор» и список его прав зависит от сетевого ресурса.','2018-02-23 19:57:37','2018-02-23 19:57:37',1,7,1),(2,'* * *1','Одесса. На балкон выходит мама и кричит:\r\n— Аркаша! Домой!\r\nМальчик поднимает голову и кричит в ответ:\r\n— Я замёрз?\r\n— Нет! Ты хочешь кушать!','2018-04-01 07:04:13','2018-04-01 07:04:13',1,2,2),(5,'* * *','Скажите пожалуйста, который час?\r\nА скоко вам надо?\r\nМне надо три часа.\r\nГлядя на часы: — Так чего вы переживаете, вы ещё успеете!','2018-04-01 07:04:41','2018-04-01 07:04:41',1,2,2),(7,'* * *','Циля, а шо это у нас сегодня на обед?\r\nКартошка в депрессии.\r\nШооо?\r\nНу, пюре. Вроде картошка, как картошка, но такая подаааавленная…','2018-04-01 07:05:03','2018-04-01 07:05:03',1,2,2),(8,'* * *','Сара я тебя умоляю, давай разведёмся!!! Моня шаа! Даже не думай за варианты -вдовой взял, вдовой и оставишь!!!','2018-04-01 07:05:26','2018-04-01 07:05:26',1,2,2),(9,'* * *','Телеграмма: «»Москва, Кремль, Ленину. Товарищ Ленин, помогите бедному еврею. Рабинович»».\r\nНа следующий день Рабиновича вызывают куда надо:\r\n— Вы в своем уме? Вы что, не знаете, что Ленин давно умер?\r\n— Ну да, у вас всегда так: если вам нужно, так он вечно живой, а если\r\nнужно бедному еврею, так от давно умер!','2018-04-01 07:05:45','2018-04-01 07:05:45',1,2,2),(10,'* * *','— Скажите, где тут поезд на Одессу? - Уже ушёл! - Наше Вам здрасьте! А куда?','2018-04-01 07:13:29','2018-04-01 07:13:29',1,2,2),(12,'#5','- Циля Лазаревна, здравствуйте! Как там ваш Яша?\r\n- Ушёл в мир иной!\r\n- Шо, умер?\r\n- Типун вам на язык! К Интернету подключился!','2018-02-27 22:03:08','2018-02-27 22:03:08',1,NULL,2),(13,'Aвтopизaция','Aвтopизaция – пpoцeдypa пpoвepки нa пoдлиннocть coчeтaния лoгичecкoгo идeнтификaциoннoгo имeни и пapoля (или только пapoля), ввeдeнныx пoльзoвaтeлeм в кaкyю-либo интepaктивнyю фopмy.','2018-02-27 22:06:46','2018-02-27 22:06:46',1,NULL,1),(14,'№6','- Семён Маркович, вы слышали?\r\n- Нет, Роза Моисеевна.\r\n- А я слышала, шо вы таки слышали...','2018-02-28 04:33:53','2018-02-28 04:33:53',1,NULL,2),(15,'№7','- Сёмочка, не пей сегодня кофе!\r\n- Мама, это таки почему?\r\n- Ой вэй! Потому шо его нет!','2018-02-28 04:34:27','2018-02-28 04:34:27',1,NULL,2),(16,'№8','- Софа, экономь деньги! Таки думай за завтрашний день...\r\n- Моня, а почему я должна думать за завтрашний день плохо?','2018-02-28 04:35:13','2018-02-28 04:35:13',1,NULL,2),(17,'An1','Как начинается радиовещание в разных городах:\r\n— Внимание! Говорит Москва.\r\n— Уваха! Ховорыт Кыйыв.\r\n— Ахтунг! Хир шприхт Берлин.\r\n— Ша! Одесса имеет сказать пару слов.','2018-03-02 20:56:56','2018-03-02 20:56:56',1,NULL,2),(18,'An2','Учительница:\r\n— Циля Израилевна, Сему надо мыть. От Семы плохо пахнет!\r\nРодительница:\r\n— Марья Никитична, Сёму надо не нюхать. Сёму надо учить!','2018-03-02 21:01:32','2018-03-02 21:01:32',1,NULL,2),(21,'№1','Порой складывается впечатление, что уроки истории наша власть прогуляла.','2018-03-19 23:00:21','2018-03-19 23:00:21',1,NULL,5),(22,'* * *','Заблудился мужик в лесу. Идет по лесу и орет во все горло: \r\n-Ауууууу! \r\nВыходит на встречу медведь и спрашивает: \r\n-Чего орешь? \r\n-Да вот заблудился, думаю может кто услышит. \r\n- Ну я услышал, легче стало?','2018-03-27 18:09:41','2018-03-27 18:09:41',1,NULL,6),(23,'* * *','Заблудился мужик в лесу. Идет по лесу и орет во все горло: \r\n-Ауууууу! \r\nВыходит на встречу медведь и спрашивает: \r\n-Чего орешь? \r\n-Да вот заблудился, думаю может кто услышит. \r\n- Ну я услышал, легче стало?','2018-03-28 04:15:40','2018-03-28 04:15:40',1,NULL,6),(24,'* * *','Прораб дает малярам задание покрасить стену и два бидона краски. \r\nОбед. Мужикам работать лень и выпить хочется. Решили один бак пропить. Чтобы отмазаться, намазали морду стоящему неподалеку коню краской. \r\nПриходит прораб в конце дня: все пьяные и стена не докрашена. \r\n- Почему не докрасили? \r\n- Краски не хватило. \r\n- Я ж вам лишнего даже на забор выдавал. \r\n- Так конь выпил, вон стоит – вся морда в краске. \r\n- Не сдох еще, сволочь, неделю назад поддон кирпича сожрал…','2018-03-28 04:57:29','2018-03-28 04:57:29',1,NULL,6),(25,'* * *','Прораб дает малярам задание покрасить стену и два бидона краски. \r\nОбед. Мужикам работать лень и выпить хочется. Решили один бак пропить. Чтобы отмазаться, намазали морду стоящему неподалеку коню краской. \r\nПриходит прораб в конце дня: все пьяные и стена не докрашена. \r\n- Почему не докрасили? \r\n- Краски не хватило. \r\n- Я ж вам лишнего даже на забор выдавал. \r\n- Так конь выпил, вон стоит – вся морда в краске. \r\n- Не сдох еще, сволочь, неделю назад поддон кирпича сожрал…','2018-03-28 04:59:19','2018-03-28 04:59:19',1,NULL,6),(26,'* * *','Прораб дает малярам задание покрасить стену и два бидона краски. \r\nОбед. Мужикам работать лень и выпить хочется. Решили один бак пропить. Чтобы отмазаться, намазали морду стоящему неподалеку коню краской. \r\nПриходит прораб в конце дня: все пьяные и стена не докрашена. \r\n- Почему не докрасили? \r\n- Краски не хватило. \r\n- Я ж вам лишнего даже на забор выдавал. \r\n- Так конь выпил, вон стоит – вся морда в краске. \r\n- Не сдох еще, сволочь, неделю назад поддон кирпича сожрал…','2018-03-28 05:00:31','2018-03-28 05:00:31',1,NULL,6),(27,'* * *','Прораб дает малярам задание покрасить стену и два бидона краски. \r\nОбед. Мужикам работать лень и выпить хочется. Решили один бак пропить. Чтобы отмазаться, намазали морду стоящему неподалеку коню краской. \r\nПриходит прораб в конце дня: все пьяные и стена не докрашена. \r\n- Почему не докрасили? \r\n- Краски не хватило. \r\n- Я ж вам лишнего даже на забор выдавал. \r\n- Так конь выпил, вон стоит – вся морда в краске. \r\n- Не сдох еще, сволочь, неделю назад поддон кирпича сожрал…','2018-03-28 05:01:02','2018-03-28 05:01:02',1,NULL,6),(28,'* * *','Прораб дает малярам задание покрасить стену и два бидона краски. \r\nОбед. Мужикам работать лень и выпить хочется. Решили один бак пропить. Чтобы отмазаться, намазали морду стоящему неподалеку коню краской. \r\nПриходит прораб в конце дня: все пьяные и стена не докрашена. \r\n- Почему не докрасили? \r\n- Краски не хватило. \r\n- Я ж вам лишнего даже на забор выдавал. \r\n- Так конь выпил, вон стоит – вся морда в краске. \r\n- Не сдох еще, сволочь, неделю назад поддон кирпича сожрал…','2018-03-28 05:01:45','2018-03-28 05:01:45',1,NULL,6),(29,'* * *','Едет мужик на машине мимо дурдома, и тут у машины колесо отваливается...\r\nДва часа мужик пытается приладить его на место, а не получается, гаек нет.\r\nВсе эти ДВА ЧАСА за ним сквозь дыру в заборе наблюдает пациент.\r\nА потом говорит:\r\n- Да ты возьми, открути от каждого колеса по гайке и привинти четвертое, так потихоньку до дома и доедешь...\r\nМужик, обалдев:\r\n- А как вы догадались, вы же в таком заведении...\r\nПациент:\r\n- Так мы же ПСИХИ, а не ДОЛБОЁБЫ.','2018-03-28 05:03:00','2018-03-28 05:03:00',1,NULL,6),(30,'* * *','Українська влада втратила довіру народу. Якась мінімальна надія на Луценка була. Думали, що посидів, подумав, переосмислив життя. Та де там. Мало мабуть сидів!','2018-03-30 04:07:42','2018-03-29 04:20:53',1,2,5),(31,'* * *','-Насиров заявил, что вернуться на работу - его долг.\r\n-Оказывается, под клетчатым одеялом скрывается сердце честного коррупционера.\r\n-Нет, просто Насиров хочет, чтобы его долг стал нашим.','2018-03-29 04:21:43','2018-03-29 04:21:43',1,NULL,5),(32,'* * *','В России на памятнике \"Неизвестному солдату\" изменяют надпись:\r\n\"Имя твое неизвестно, подвиг твой неизвестен, ты у нас не служил\"','2018-03-30 04:36:49','2018-03-30 04:36:49',1,2,5);
/*!40000 ALTER TABLE `forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_topic`
--

DROP TABLE IF EXISTS `forum_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `top_fix` tinyint(1) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `forum_topic_title_f9334dbe_uniq` (`title`,`created`),
  KEY `forum_topic_3700153c` (`creator_id`),
  KEY `forum_topic_19bc3ff1` (`forum_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_topic`
--

LOCK TABLES `forum_topic` WRITE;
/*!40000 ALTER TABLE `forum_topic` DISABLE KEYS */;
INSERT INTO `forum_topic` VALUES (1,'ЧАВО, або дещо про терміни...','2018-02-23 19:27:23','2018-02-23 19:27:23',0,1,7,1,NULL),(2,'Из Одессы','2018-04-01 07:03:22','2018-02-23 20:01:34',0,1,2,0,'Лучшие одесские анекдоты и чисто одесский юмор!\r\n\r\n*   *   *\r\n- А шо это за остановка? \r\n- Одесса. \r\n- А почему так долго стоим? \r\n- Паровоз меняют. \r\n- А на что? \r\n- Как на что?! Паровоз на паровоз. \r\n- Нет, тогда это не Одесса...'),(5,'Анекдоты из политики','2018-03-21 23:49:42','2018-03-19 04:55:07',0,1,2,0,'А вы догадывались, что Порошенко, Гройсман, Луценко, Яценюк, Аваков и вся приближенная к ним Ко - это \"ихтамнеты\" в украинской коррупции?'),(6,'Бородатый анекдот','2018-03-21 23:48:10','2018-03-19 22:57:08',0,1,2,0,'Бородатый анекдот — расхожее выражение, означающее старый, заезженный, проверенный временем анекдот. Рассказывать бородатые анекдоты считается дурным тоном, так как скорее всего в компании он известен практически всем.\r\n\r\nА так же: По одной из версий выражение «Баян» является сокращением фразы «Бородатый анекдот, явно надоевший».\r\n\r\nНо тем не менее:\r\nТелефонный опрос, проведённый утром 1 января, дал следующие результаты: \r\n2% опрошенных ответили \"Да?\" \r\n3% - \"Алло?\" \r\n95% затруднились ответить.'),(7,'Медицинский анекдот','2018-03-28 04:22:42','2018-03-28 04:22:42',0,1,2,0,'-  Я  был  у  нескольких  врачей и ни один не согласен с Вашим\r\nдиагнозом.\r\n - Ну что ж, подождем вскрытия.'),(8,'Test_Peremoga','2018-03-30 19:55:17','2018-03-30 19:55:17',0,1,3,0,'Test_peremoga'),(9,'1325451','2018-03-30 20:20:57','2018-03-30 20:20:57',0,1,3,0,'qweweqwe'),(10,'sefsefe','2018-03-30 20:43:51','2018-03-30 20:43:51',0,1,3,0,'sefef');
/*!40000 ALTER TABLE `forum_topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-01  0:34:35
