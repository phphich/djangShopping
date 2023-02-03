-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: dbtest
-- ------------------------------------------------------
-- Server version	8.0.28

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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add categories',7,'add_categories'),(26,'Can change categories',7,'change_categories'),(27,'Can delete categories',7,'delete_categories'),(28,'Can view categories',7,'view_categories'),(29,'Can add customers',8,'add_customers'),(30,'Can change customers',8,'change_customers'),(31,'Can delete customers',8,'delete_customers'),(32,'Can view customers',8,'view_customers'),(33,'Can add orders',9,'add_orders'),(34,'Can change orders',9,'change_orders'),(35,'Can delete orders',9,'delete_orders'),(36,'Can view orders',9,'view_orders'),(37,'Can add transfers',10,'add_transfers'),(38,'Can change transfers',10,'change_transfers'),(39,'Can delete transfers',10,'delete_transfers'),(40,'Can view transfers',10,'view_transfers'),(41,'Can add send',11,'add_send'),(42,'Can change send',11,'change_send'),(43,'Can delete send',11,'delete_send'),(44,'Can view send',11,'view_send'),(45,'Can add products',12,'add_products'),(46,'Can change products',12,'change_products'),(47,'Can delete products',12,'delete_products'),(48,'Can view products',12,'view_products'),(49,'Can add order details',13,'add_orderdetails'),(50,'Can change order details',13,'change_orderdetails'),(51,'Can delete order details',13,'delete_orderdetails'),(52,'Can view order details',13,'view_orderdetails'),(53,'Can add confirms',14,'add_confirms'),(54,'Can change confirms',14,'change_confirms'),(55,'Can delete confirms',14,'delete_confirms'),(56,'Can view confirms',14,'view_confirms'),(57,'Can add accepts',15,'add_accepts'),(58,'Can change accepts',15,'change_accepts'),(59,'Can delete accepts',15,'delete_accepts'),(60,'Can view accepts',15,'view_accepts'),(61,'Can add employees',16,'add_employees'),(62,'Can change employees',16,'change_employees'),(63,'Can delete employees',16,'delete_employees'),(64,'Can view employees',16,'view_employees'),(65,'Can add cancel',17,'add_cancel'),(66,'Can change cancel',17,'change_cancel'),(67,'Can delete cancel',17,'delete_cancel'),(68,'Can view cancel',17,'view_cancel'),(69,'Can add reject',18,'add_reject'),(70,'Can change reject',18,'change_reject'),(71,'Can delete reject',18,'delete_reject'),(72,'Can view reject',18,'view_reject');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$nQtpJs7GXzNi5fPSEy5y4W$8W+0ZcmzR4QxJ3PgGR+nUewW6AaNus6cPCJDn2YILYU=','2023-02-03 15:02:33.254420',1,'admin','','','admin@hotmail.com',1,1,'2022-10-10 10:48:41.685744');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-10-10 13:20:01.390131','1','1:Computer',1,'[{\"added\": {}}]',7,1),(2,'2022-10-10 13:22:35.396814','c001','c001:Keyboard',1,'[{\"added\": {}}]',12,1),(3,'2022-10-10 13:23:23.269343','c002','c002:Mouse',1,'[{\"added\": {}}]',12,1),(4,'2022-10-10 13:23:42.459765','c003','c003:Scanner',1,'[{\"added\": {}}]',12,1),(5,'2022-10-10 13:23:59.132374','c004','c004:Joystrick',1,'[{\"added\": {}}]',12,1),(6,'2022-10-10 13:24:34.939857','c005','c005:Printer',1,'[{\"added\": {}}]',12,1),(7,'2022-10-10 13:25:54.488767','c001','c001:Phitchayaphak, 0819745954',1,'[{\"added\": {}}]',8,1),(8,'2022-10-11 07:12:37.592114','2','2:Bomb',1,'[{\"added\": {}}]',7,1),(9,'2022-10-11 07:12:52.275374','3','3:Electric',1,'[{\"added\": {}}]',7,1),(10,'2022-10-11 07:13:57.666549','C008','C008:Telephone Samsung A3, 15000.0',1,'[{\"added\": {}}]',12,1),(11,'2022-10-11 07:14:26.842322','C009','C009:Long Gun, 25000.0',1,'[{\"added\": {}}]',12,1),(12,'2022-10-13 08:35:11.609092','C008','C008:Telephone Samsung A3, 15000.0',3,'',12,1),(13,'2022-10-15 05:36:11.279292','e001','e001:Phitchayaphak Phiphitphatphaisit, Manager',1,'[{\"added\": {}}]',16,1),(14,'2022-10-15 05:36:46.188960','e002','e002:Sukanya N. Nan, Manager',1,'[{\"added\": {}}]',16,1),(15,'2022-10-16 02:12:25.698944','e001','e001:Phitchayaphak Phiphitphatphaisit, Manager',2,'[]',16,1),(16,'2023-02-03 15:18:18.245618','admin','admin:Administrator, Administrator',3,'',16,1),(17,'2023-02-03 15:18:57.286521','e001','e001:นายทำดี ผู้จัดการเด่น, Manager',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',16,1),(18,'2023-02-03 15:19:15.749638','e003','e003:นายคลัง ควบคุมคล่อง, Store',2,'[{\"changed\": {\"fields\": [\"Name\", \"Password\"]}}]',16,1),(19,'2023-02-03 15:19:19.666504','e001','e001:นายทำดี ผู้จัดการเด่น, Manager',2,'[]',16,1),(20,'2023-02-03 15:19:29.973766','e002','e002:Sukanya N. Nan, Manager',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',16,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(15,'ShoppingApp','accepts'),(17,'ShoppingApp','cancel'),(7,'ShoppingApp','categories'),(14,'ShoppingApp','confirms'),(8,'ShoppingApp','customers'),(16,'ShoppingApp','employees'),(13,'ShoppingApp','orderdetails'),(9,'ShoppingApp','orders'),(12,'ShoppingApp','products'),(18,'ShoppingApp','reject'),(11,'ShoppingApp','send'),(10,'ShoppingApp','transfers');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'ShoppingApp','0001_initial','2022-10-10 10:22:45.842648'),(2,'contenttypes','0001_initial','2022-10-10 10:22:47.417221'),(3,'auth','0001_initial','2022-10-10 10:23:17.523066'),(4,'admin','0001_initial','2022-10-10 10:23:21.516600'),(5,'admin','0002_logentry_remove_auto_add','2022-10-10 10:23:21.579094'),(6,'admin','0003_logentry_add_action_flag_choices','2022-10-10 10:23:21.704087'),(7,'contenttypes','0002_remove_content_type_name','2022-10-10 10:23:28.385166'),(8,'auth','0002_alter_permission_name_max_length','2022-10-10 10:23:33.444728'),(9,'auth','0003_alter_user_email_max_length','2022-10-10 10:23:35.735043'),(10,'auth','0004_alter_user_username_opts','2022-10-10 10:23:35.797503'),(11,'auth','0005_alter_user_last_login_null','2022-10-10 10:23:37.375419'),(12,'auth','0006_require_contenttypes_0002','2022-10-10 10:23:37.531700'),(13,'auth','0007_alter_validators_add_error_messages','2022-10-10 10:23:37.594133'),(14,'auth','0008_alter_user_username_max_length','2022-10-10 10:23:39.148264'),(15,'auth','0009_alter_user_last_name_max_length','2022-10-10 10:23:42.266966'),(16,'auth','0010_alter_group_name_max_length','2022-10-10 10:23:46.809825'),(17,'auth','0011_update_proxy_permissions','2022-10-10 10:23:46.903554'),(18,'auth','0012_alter_user_first_name_max_length','2022-10-10 10:23:50.954130'),(19,'sessions','0001_initial','2022-10-10 10:23:52.115546'),(20,'ShoppingApp','0002_rename_amount_orderdetails_quantity_products_picture_and_more','2022-10-10 13:17:37.491255'),(21,'ShoppingApp','0002_rename_amount_orderdetails_quantity_and_more','2022-10-13 04:55:51.989495'),(22,'ShoppingApp','0003_employees_rename_amount_orderdetails_quantity_and_more','2022-10-15 05:34:26.085158'),(23,'ShoppingApp','0004_customers_password_orderdetails_price_and_more','2022-10-15 15:07:39.028038'),(24,'ShoppingApp','0005_rename_price_orderdetails_oprice_customers_password_and_more','2022-10-15 15:14:30.147533'),(25,'ShoppingApp','0006_remove_transfers_employee_accepts_employee_and_more','2022-10-16 03:01:11.097320'),(26,'ShoppingApp','0007_customers_password_products_picture_and_more','2022-10-16 08:33:09.916541'),(27,'ShoppingApp','0008_customers_password_products_picture_and_more','2022-10-16 08:48:51.274787'),(28,'ShoppingApp','0009_customers_password_products_picture_reject_employee_and_more','2022-10-16 08:51:02.248315'),(29,'ShoppingApp','0010_customers_password_employees_birthdate_and_more','2022-10-17 09:56:46.052681');
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
INSERT INTO `django_session` VALUES ('tp6j19jyv8yqg4x9hzrm9p9djbm1rkkr','.eJxVjEEOwiAQRe_C2hDKtB106b5nIMwwSNVAUtqV8e7apAvd_vfefykftjX7rcni56guqlOn340CP6TsIN5DuVXNtazLTHpX9EGbnmqU5_Vw_w5yaPlbE4DjAcWE2I-uC4BnStGN4gCQgY3tyBrkgXoSoZj6lNiSWEyGAVG9P-zNOI0:1ohqNK:7WMH3kp-TMx1ZeyPTRcvlK5d_M8kqJNjDMwwF_yAK4U','2022-10-24 10:51:10.457582');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_accepts`
--

DROP TABLE IF EXISTS `shoppingapp_accepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_accepts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adate` datetime(6) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `order_id` varchar(13) NOT NULL,
  `employee_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ShoppingApp_accepts_order_id_8301cbcd_fk_ShoppingApp_orders_oid` (`order_id`),
  KEY `ShoppingApp_accepts_employee_id_6f1f943a_fk_ShoppingA` (`employee_id`),
  CONSTRAINT `ShoppingApp_accepts_employee_id_6f1f943a_fk_ShoppingA` FOREIGN KEY (`employee_id`) REFERENCES `shoppingapp_employees` (`eid`),
  CONSTRAINT `ShoppingApp_accepts_order_id_8301cbcd_fk_ShoppingApp_orders_oid` FOREIGN KEY (`order_id`) REFERENCES `shoppingapp_orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_accepts`
--

LOCK TABLES `shoppingapp_accepts` WRITE;
/*!40000 ALTER TABLE `shoppingapp_accepts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingapp_accepts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_cancel`
--

DROP TABLE IF EXISTS `shoppingapp_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_cancel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cdate` datetime(6) NOT NULL,
  `reason` varchar(200) NOT NULL,
  `order_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ShoppingApp_cancel_order_id_809e483f_fk_ShoppingApp_orders_oid` (`order_id`),
  CONSTRAINT `ShoppingApp_cancel_order_id_809e483f_fk_ShoppingApp_orders_oid` FOREIGN KEY (`order_id`) REFERENCES `shoppingapp_orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_cancel`
--

LOCK TABLES `shoppingapp_cancel` WRITE;
/*!40000 ALTER TABLE `shoppingapp_cancel` DISABLE KEYS */;
INSERT INTO `shoppingapp_cancel` VALUES (2,'2022-10-17 00:05:59.134325','เงินหมด','OD-2210000001');
/*!40000 ALTER TABLE `shoppingapp_cancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_categories`
--

DROP TABLE IF EXISTS `shoppingapp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_categories`
--

LOCK TABLES `shoppingapp_categories` WRITE;
/*!40000 ALTER TABLE `shoppingapp_categories` DISABLE KEYS */;
INSERT INTO `shoppingapp_categories` VALUES (1,'คอมพิวเตอร์','คอมพิวเตอร์และอุปกรณ์ต่อพ่วง เทคโนโลยีสารสนเทศ และระบบเครือข่าย'),(2,'Bomb','ลูกระเบิด'),(3,'เครื่องใช้ไฟฟ้า','เครื่องใช้ไฟฟ้าและอุปกรณ์ทางอิเล็กทรอนิกส์ต่างๆ ที่ใช้กระแสไฟฟ้าในการทำงาน'),(4,'เครื่องสำอาง','สินค้าสำหรับดูแลเรือนร่างชายหญิงต่าง ๆ'),(5,'เครื่องดื่มแอลกอฮอล์','เหล้ายาปลาปิ้ง สำหรับผ่อนคลาย');
/*!40000 ALTER TABLE `shoppingapp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_confirms`
--

DROP TABLE IF EXISTS `shoppingapp_confirms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_confirms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cdate` datetime(6) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `order_id` varchar(13) NOT NULL,
  `employee_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ShoppingApp_confirms_order_id_2619308d_fk_ShoppingApp_orders_oid` (`order_id`),
  KEY `ShoppingApp_confirms_employee_id_9030e70c_fk_ShoppingA` (`employee_id`),
  CONSTRAINT `ShoppingApp_confirms_employee_id_9030e70c_fk_ShoppingA` FOREIGN KEY (`employee_id`) REFERENCES `shoppingapp_employees` (`eid`),
  CONSTRAINT `ShoppingApp_confirms_order_id_2619308d_fk_ShoppingApp_orders_oid` FOREIGN KEY (`order_id`) REFERENCES `shoppingapp_orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_confirms`
--

LOCK TABLES `shoppingapp_confirms` WRITE;
/*!40000 ALTER TABLE `shoppingapp_confirms` DISABLE KEYS */;
INSERT INTO `shoppingapp_confirms` VALUES (4,'2022-10-16 17:02:02.207421','','OD-2210000002','e001'),(5,'2022-10-18 06:08:04.969803','','OD-2210000003','e001');
/*!40000 ALTER TABLE `shoppingapp_confirms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_customers`
--

DROP TABLE IF EXISTS `shoppingapp_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_customers` (
  `cid` varchar(13) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `tel` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_customers`
--

LOCK TABLES `shoppingapp_customers` WRITE;
/*!40000 ALTER TABLE `shoppingapp_customers` DISABLE KEYS */;
INSERT INTO `shoppingapp_customers` VALUES ('c001','Phitchayaphak','Khonkean','0819745954','12345678'),('c002','Jojo','Namo','0819745954','12345'),('c003','TESTER','aaaa\r\nbbbbbb','0821521544','12345'),('c004','Sam','Khonkean','081254226','11111');
/*!40000 ALTER TABLE `shoppingapp_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_employees`
--

DROP TABLE IF EXISTS `shoppingapp_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_employees` (
  `eid` varchar(13) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_employees`
--

LOCK TABLES `shoppingapp_employees` WRITE;
/*!40000 ALTER TABLE `shoppingapp_employees` DISABLE KEYS */;
INSERT INTO `shoppingapp_employees` VALUES ('e001','นายทำดี ผู้จัดการเด่น','Manager','12345678','2022-10-17'),('e002','Sukanya N. Nan','Manager','12345678','2022-10-06'),('e003','นายคลัง ควบคุมคล่อง','Store','12345678','2022-10-17');
/*!40000 ALTER TABLE `shoppingapp_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_orderdetails`
--

DROP TABLE IF EXISTS `shoppingapp_orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_orderdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `order_id` varchar(13) NOT NULL,
  `product_id` varchar(13) NOT NULL,
  `oprice` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ShoppingApp_orderdet_order_id_af624171_fk_ShoppingA` (`order_id`),
  KEY `ShoppingApp_orderdet_product_id_b97a6699_fk_ShoppingA` (`product_id`),
  CONSTRAINT `ShoppingApp_orderdet_order_id_af624171_fk_ShoppingA` FOREIGN KEY (`order_id`) REFERENCES `shoppingapp_orders` (`oid`),
  CONSTRAINT `ShoppingApp_orderdet_product_id_b97a6699_fk_ShoppingA` FOREIGN KEY (`product_id`) REFERENCES `shoppingapp_products` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_orderdetails`
--

LOCK TABLES `shoppingapp_orderdetails` WRITE;
/*!40000 ALTER TABLE `shoppingapp_orderdetails` DISABLE KEYS */;
INSERT INTO `shoppingapp_orderdetails` VALUES (111,2,'OD-2210000001','c002',1200),(112,1,'OD-2210000001','c001',1500),(113,6,'OD-2210000002','c002',1200),(114,5,'OD-2210000002','c004',3000),(115,5,'OD-2210000002','c003',2000),(116,3,'OD-2210000003','c003',2000),(117,2,'OD-2210000003','c004',3000),(118,3,'OD-2210000004','c001',1500),(119,3,'OD-2210000004','c002',1200);
/*!40000 ALTER TABLE `shoppingapp_orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_orders`
--

DROP TABLE IF EXISTS `shoppingapp_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_orders` (
  `oid` varchar(13) NOT NULL,
  `odate` datetime(6) NOT NULL,
  `status` varchar(1) NOT NULL,
  `customer_id` varchar(13) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `ShoppingApp_orders_customer_id_24e39cc2_fk_ShoppingA` (`customer_id`),
  CONSTRAINT `ShoppingApp_orders_customer_id_24e39cc2_fk_ShoppingA` FOREIGN KEY (`customer_id`) REFERENCES `shoppingapp_customers` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_orders`
--

LOCK TABLES `shoppingapp_orders` WRITE;
/*!40000 ALTER TABLE `shoppingapp_orders` DISABLE KEYS */;
INSERT INTO `shoppingapp_orders` VALUES ('OD-2210000001','2022-10-16 16:59:43.354499','6','c002'),('OD-2210000002','2022-10-16 16:59:56.386741','3','c002'),('OD-2210000003','2022-10-17 06:05:39.959496','3','c002'),('OD-2210000004','2022-10-18 10:41:48.382911','7','c002'),('OD-2210000005','2022-10-24 04:29:10.645295','1','c002');
/*!40000 ALTER TABLE `shoppingapp_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_products`
--

DROP TABLE IF EXISTS `shoppingapp_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_products` (
  `pid` varchar(13) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `net` int NOT NULL,
  `category_id` bigint NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `ShoppingApp_products_category_id_0bad03b8_fk_ShoppingA` (`category_id`),
  CONSTRAINT `ShoppingApp_products_category_id_0bad03b8_fk_ShoppingA` FOREIGN KEY (`category_id`) REFERENCES `shoppingapp_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_products`
--

LOCK TABLES `shoppingapp_products` WRITE;
/*!40000 ALTER TABLE `shoppingapp_products` DISABLE KEYS */;
INSERT INTO `shoppingapp_products` VALUES ('c001','Keyboard',1500,100,1,'/products/c001.jpg'),('c002','Mouse',1200,500,1,'/products/c002.jpg'),('c003','Scanner',2000,100,1,'/products/c003.jpg'),('c004','Joy Strick',3000,100,1,'/products/c004.jpg'),('c005','Printer',5500,100,1,'/products/c005.jpg'),('c007','bbb',100,100,1,'/products/c007.jpg'),('C009','Long Gun',25000,10,2,'/products/C009.jpg');
/*!40000 ALTER TABLE `shoppingapp_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_reject`
--

DROP TABLE IF EXISTS `shoppingapp_reject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_reject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rdate` datetime(6) NOT NULL,
  `reason` varchar(200) NOT NULL,
  `order_id` varchar(13) NOT NULL,
  `employee_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ShoppingApp_reject_order_id_4b7e8954_fk_ShoppingApp_orders_oid` (`order_id`),
  KEY `ShoppingApp_reject_employee_id_b05c8981_fk_ShoppingA` (`employee_id`),
  CONSTRAINT `ShoppingApp_reject_employee_id_b05c8981_fk_ShoppingA` FOREIGN KEY (`employee_id`) REFERENCES `shoppingapp_employees` (`eid`),
  CONSTRAINT `ShoppingApp_reject_order_id_4b7e8954_fk_ShoppingApp_orders_oid` FOREIGN KEY (`order_id`) REFERENCES `shoppingapp_orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_reject`
--

LOCK TABLES `shoppingapp_reject` WRITE;
/*!40000 ALTER TABLE `shoppingapp_reject` DISABLE KEYS */;
INSERT INTO `shoppingapp_reject` VALUES (2,'2022-10-18 10:42:28.471491','Product Lost','OD-2210000004','e001');
/*!40000 ALTER TABLE `shoppingapp_reject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_send`
--

DROP TABLE IF EXISTS `shoppingapp_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_send` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sdate` datetime(6) NOT NULL,
  `company` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `order_id` varchar(13) NOT NULL,
  `employee_id` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ShoppingApp_send_order_id_65c07328_fk_ShoppingApp_orders_oid` (`order_id`),
  KEY `ShoppingApp_send_employee_id_8ef1f915_fk_ShoppingA` (`employee_id`),
  CONSTRAINT `ShoppingApp_send_employee_id_8ef1f915_fk_ShoppingA` FOREIGN KEY (`employee_id`) REFERENCES `shoppingapp_employees` (`eid`),
  CONSTRAINT `ShoppingApp_send_order_id_65c07328_fk_ShoppingApp_orders_oid` FOREIGN KEY (`order_id`) REFERENCES `shoppingapp_orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_send`
--

LOCK TABLES `shoppingapp_send` WRITE;
/*!40000 ALTER TABLE `shoppingapp_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingapp_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingapp_transfers`
--

DROP TABLE IF EXISTS `shoppingapp_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingapp_transfers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tdate` datetime(6) NOT NULL,
  `reference` varchar(35) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `order_id` varchar(13) NOT NULL,
  `bill` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ShoppingApp_transfer_order_id_6a415ec2_fk_ShoppingA` (`order_id`),
  CONSTRAINT `ShoppingApp_transfer_order_id_6a415ec2_fk_ShoppingA` FOREIGN KEY (`order_id`) REFERENCES `shoppingapp_orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingapp_transfers`
--

LOCK TABLES `shoppingapp_transfers` WRITE;
/*!40000 ALTER TABLE `shoppingapp_transfers` DISABLE KEYS */;
INSERT INTO `shoppingapp_transfers` VALUES (7,'2022-10-18 06:09:15.292558','11111','KBT','-','OD-2210000003','static/bills/dbt-head_IzoZde4.png'),(8,'2022-10-18 10:40:43.468876','22222','sdfas','-','OD-2210000002','static/bills/LINE_ALBUM_เกยรตบตรพลเมอง_๒๒๐๙๑๔_0.jpg');
/*!40000 ALTER TABLE `shoppingapp_transfers` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2023-02-03 22:22:21
