-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_user
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add servicio',6,'add_servicio'),(22,'Can change servicio',6,'change_servicio'),(23,'Can delete servicio',6,'delete_servicio'),(24,'Can view servicio',6,'view_servicio'),(25,'Can add categoria',7,'add_categoria'),(26,'Can change categoria',7,'change_categoria'),(27,'Can delete categoria',7,'delete_categoria'),(28,'Can view categoria',7,'view_categoria'),(29,'Can add post',8,'add_post'),(30,'Can change post',8,'change_post'),(31,'Can delete post',8,'delete_post'),(32,'Can view post',8,'view_post'),(33,'Can add Categoria Producto',9,'add_categoria'),(34,'Can change Categoria Producto',9,'change_categoria'),(35,'Can delete Categoria Producto',9,'delete_categoria'),(36,'Can view Categoria Producto',9,'view_categoria'),(37,'Can add Producto',10,'add_producto'),(38,'Can change Producto',10,'change_producto'),(39,'Can delete Producto',10,'delete_producto'),(40,'Can view Producto',10,'view_producto'),(41,'Can add user',11,'add_customuser'),(42,'Can change user',11,'change_customuser'),(43,'Can delete user',11,'delete_customuser'),(44,'Can view user',11,'view_customuser'),(45,'Can add Marca',12,'add_marca'),(46,'Can change Marca',12,'change_marca'),(47,'Can delete Marca',12,'delete_marca'),(48,'Can view Marca',12,'view_marca'),(49,'Can add producto imagen',13,'add_productoimagen'),(50,'Can change producto imagen',13,'change_productoimagen'),(51,'Can delete producto imagen',13,'delete_productoimagen'),(52,'Can view producto imagen',13,'view_productoimagen'),(53,'Can add Subcategoría de Producto',14,'add_subcategoria'),(54,'Can change Subcategoría de Producto',14,'change_subcategoria'),(55,'Can delete Subcategoría de Producto',14,'delete_subcategoria'),(56,'Can view Subcategoría de Producto',14,'view_subcategoria'),(57,'Can add Venta',15,'add_venta'),(58,'Can change Venta',15,'change_venta'),(59,'Can delete Venta',15,'delete_venta'),(60,'Can view Venta',15,'view_venta');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categoria`
--

DROP TABLE IF EXISTS `blog_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categoria`
--

LOCK TABLES `blog_categoria` WRITE;
/*!40000 ALTER TABLE `blog_categoria` DISABLE KEYS */;
INSERT INTO `blog_categoria` VALUES (4,'Review','2024-08-12 15:43:17.648339','2024-08-12 15:43:17.648339'),(5,'Noticias','2024-08-12 15:43:38.309011','2024-08-12 15:43:38.309011'),(6,'Lo que se viene','2024-08-12 15:45:01.893338','2024-08-12 15:45:01.893338'),(7,'Sobre los envíos','2024-08-12 15:45:50.814386','2024-08-12 15:45:50.814386'),(8,'Medios y Formas de Pago','2024-08-12 15:46:10.271200','2024-08-12 15:46:10.271200'),(9,'Otros Productos','2024-08-12 16:14:00.431737','2024-08-12 16:14:00.431737');
/*!40000 ALTER TABLE `blog_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `contenido` longtext NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `autor_id` bigint NOT NULL,
  `autor_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_autor_id_8811ea21_fk_registros_customuser_id` (`autor_id`),
  CONSTRAINT `blog_post_autor_id_8811ea21_fk_registros_customuser_id` FOREIGN KEY (`autor_id`) REFERENCES `registros_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,'Jisoo Test','Algo para venerar y amar a jisoocristo','blog/GUnEtN4W0AAd1TC.jpeg','2024-08-12 15:47:59.417169','2024-08-12 15:47:59.417169',1,'Lucas De Jisoo'),(2,'Jisoo Test2','asdasa','blog/edit_champ.jpg','2024-08-12 15:53:10.229637','2024-08-12 15:53:10.229637',1,'Lucas De Jisoo'),(3,'Jisoo Test34','asddasdaddas','blog/GUnEtN4W0AAd1TC_hpQXnT5.jpeg','2024-08-12 16:43:42.929601','2024-08-12 16:43:42.929601',1,'Lucas De Jisoo'),(4,'saddddddddddd','sdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','blog/Redragon_H520_Icon_Wired_Gaming_Headset.webp','2024-08-12 18:59:02.851601','2024-08-12 18:59:02.851601',1,'Lucas De Jisoo');
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_categorias`
--

DROP TABLE IF EXISTS `blog_post_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_categorias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_categorias_post_id_categoria_id_70b54e48_uniq` (`post_id`,`categoria_id`),
  KEY `blog_post_categorias_categoria_id_f3743c06_fk_blog_categoria_id` (`categoria_id`),
  CONSTRAINT `blog_post_categorias_categoria_id_f3743c06_fk_blog_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `blog_categoria` (`id`),
  CONSTRAINT `blog_post_categorias_post_id_212bf44c_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_categorias`
--

LOCK TABLES `blog_post_categorias` WRITE;
/*!40000 ALTER TABLE `blog_post_categorias` DISABLE KEYS */;
INSERT INTO `blog_post_categorias` VALUES (4,1,7),(6,2,4),(7,3,4),(8,3,7),(9,4,5);
/*!40000 ALTER TABLE `blog_post_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_venta`
--

DROP TABLE IF EXISTS `carrito_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad_vendida` int NOT NULL,
  `fecha_venta` datetime(6) NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `numero_factura` varchar(20) DEFAULT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_factura` (`numero_factura`),
  KEY `carrito_venta_producto_id_8b73d593_fk_producto_producto_id` (`producto_id`),
  CONSTRAINT `carrito_venta_producto_id_8b73d593_fk_producto_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto_producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_venta`
--

LOCK TABLES `carrito_venta` WRITE;
/*!40000 ALTER TABLE `carrito_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_venta` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_registros_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_registros_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `registros_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-08-12 15:38:49.251899','1','Periféricos',1,'[{\"added\": {}}]',7,1),(2,'2024-08-12 15:39:20.750450','2','Videojuegos y Consolas',1,'[{\"added\": {}}]',7,1),(3,'2024-08-12 15:39:25.105938','2','Videojuegos y Consolas',2,'[]',7,1),(4,'2024-08-12 15:39:45.365854','3','Componentes de PC',1,'[{\"added\": {}}]',7,1),(5,'2024-08-12 15:43:17.649339','4','Review',1,'[{\"added\": {}}]',7,1),(6,'2024-08-12 15:43:38.309011','5','Noticias',1,'[{\"added\": {}}]',7,1),(7,'2024-08-12 15:45:01.894338','6','Lo que se viene',1,'[{\"added\": {}}]',7,1),(8,'2024-08-12 15:45:50.815386','7','Sobre los envíos',1,'[{\"added\": {}}]',7,1),(9,'2024-08-12 15:46:10.271200','8','Medios y Formas de Pago',1,'[{\"added\": {}}]',7,1),(10,'2024-08-12 15:47:13.417313','2','Videojuegos y Consolas',3,'',7,1),(11,'2024-08-12 15:47:17.541239','1','Periféricos',3,'',7,1),(12,'2024-08-12 15:47:20.455894','3','Componentes de PC',3,'',7,1),(13,'2024-08-12 15:48:31.512314','1','Jisoo Test',2,'[{\"changed\": {\"fields\": [\"Categorias\"]}}]',8,1),(14,'2024-08-12 16:14:00.431737','9','Otros Productos',1,'[{\"added\": {}}]',7,1),(15,'2024-08-12 18:56:05.872009','3','Jisoo Test34',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',8,1),(16,'2024-08-12 18:59:54.128075','2','Jisoo Test2',2,'[{\"changed\": {\"fields\": [\"Imagen\"]}}]',8,1),(17,'2024-08-13 05:17:37.326380','1','Servicio Técnico',1,'[{\"added\": {}}]',6,1),(18,'2024-08-13 05:18:26.938384','2','Servicio de Entrega',1,'[{\"added\": {}}]',6,1),(19,'2024-08-13 05:19:15.907914','3','Pago con Criptos',1,'[{\"added\": {}}]',6,1),(20,'2024-08-13 05:20:03.861649','4','Instalación Windows',1,'[{\"added\": {}}]',6,1),(21,'2024-08-13 12:37:26.354252','1','Test_cat',1,'[{\"added\": {}}]',9,1),(22,'2024-08-13 12:37:58.366361','1','jisoo dea',1,'[{\"added\": {}}]',10,1),(23,'2024-08-13 14:03:49.722670','1','Imagen de jisoo dea',1,'[{\"added\": {}}]',13,1),(24,'2024-08-13 14:04:21.214742','1','jisoo dea',2,'[]',10,1),(25,'2024-08-13 14:07:59.395179','1','jisoo dea',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(26,'2024-08-13 19:51:30.465938','101','Termo Stanley 1,2L',3,'',10,1),(27,'2024-08-13 19:51:30.470939','100','Maquina Humificadora',3,'',10,1),(28,'2024-08-13 19:51:30.475940','99','Cable HDMI 5mts',3,'',10,1),(29,'2024-08-13 19:51:30.477941','98','Cable Conversor DisplayPort a VGA 3mts',3,'',10,1),(30,'2024-08-13 19:51:30.481942','97','Microprocesador Intel I7 12700F S1700',3,'',10,1),(31,'2024-08-13 19:51:30.484942','96','Microprocesador Amd Ryzen 7 5700G 5gen AM4',3,'',10,1),(32,'2024-08-13 19:51:30.487943','95','Motherboard Gigabyte B660M DS3H DDR4 1.0 s1700',3,'',10,1),(33,'2024-08-13 19:51:30.490944','94','Motherboard MSI MPG B550 Gaming Plus DDR4 Am4',3,'',10,1),(34,'2024-08-13 19:51:30.492944','93','Disco Ssd Nvme Kingston 500Gb Nv2 PCIe 4.0',3,'',10,1),(35,'2024-08-13 19:51:30.495945','92','Disco Ssd Kingston A400 240Gb',3,'',10,1),(36,'2024-08-13 19:51:30.497945','91','Monitor Samsung 22\" T350 Full Hd 75hz IPS LF22T350FHL',3,'',10,1),(37,'2024-08-13 19:51:30.501946','90','Monitor Redragon Jade 27 165Hz',3,'',10,1),(38,'2024-08-13 19:51:30.503947','89','Auricular Logitech G335 White',3,'',10,1),(39,'2024-08-13 19:51:30.506947','88','Auricular Redragon Zeus X RGB Ps4/Pc',3,'',10,1),(40,'2024-08-13 19:51:30.508948','87','Teclado Gaming Logitech G Pro TKL LOL 2',3,'',10,1),(41,'2024-08-13 19:51:30.511948','86','Teclado Mecánico Redragon Dark Avenger K568 Rgb',3,'',10,1),(42,'2024-08-13 19:51:30.513949','85','Mouse Logitech G Pro Black Wireless',3,'',10,1),(43,'2024-08-13 19:51:30.515949','84','Mouse Logitech G203 Lightsync White RGB',3,'',10,1),(44,'2024-08-13 19:51:30.519950','83','Mouse Gamer Redragon Cobra Fps M711 Negro',3,'',10,1),(45,'2024-08-13 19:51:30.521951','82','Mouse Gamer Redragon Storm Elite white M988-W RGB',3,'',10,1),(46,'2024-08-13 19:51:30.524951','81','Termo Stanley 1,2L',3,'',10,1),(47,'2024-08-13 19:51:30.526952','80','Maquina Humificadora',3,'',10,1),(48,'2024-08-13 19:51:30.530953','79','Cable HDMI 5mts',3,'',10,1),(49,'2024-08-13 19:51:30.533953','78','Cable Conversor DisplayPort a VGA 3mts',3,'',10,1),(50,'2024-08-13 19:51:30.536954','77','Microprocesador Intel I7 12700F S1700',3,'',10,1),(51,'2024-08-13 19:51:30.538954','76','Microprocesador Amd Ryzen 7 5700G 5gen AM4',3,'',10,1),(52,'2024-08-13 19:51:30.541955','75','Motherboard Gigabyte B660M DS3H DDR4 1.0 s1700',3,'',10,1),(53,'2024-08-13 19:51:30.544956','74','Motherboard MSI MPG B550 Gaming Plus DDR4 Am4',3,'',10,1),(54,'2024-08-13 19:51:30.547956','73','Disco Ssd Nvme Kingston 500Gb Nv2 PCIe 4.0',3,'',10,1),(55,'2024-08-13 19:51:30.550957','72','Disco Ssd Kingston A400 240Gb',3,'',10,1),(56,'2024-08-13 19:51:30.553958','71','Monitor Samsung 22\" T350 Full Hd 75hz IPS LF22T350FHL',3,'',10,1),(57,'2024-08-13 19:51:30.555958','70','Monitor Redragon Jade 27 165Hz',3,'',10,1),(58,'2024-08-13 19:51:30.557959','69','Auricular Logitech G335 White',3,'',10,1),(59,'2024-08-13 19:51:30.561960','68','Auricular Redragon Zeus X RGB Ps4/Pc',3,'',10,1),(60,'2024-08-13 19:51:30.564960','67','Teclado Gaming Logitech G Pro TKL LOL 2',3,'',10,1),(61,'2024-08-13 19:51:30.567961','66','Teclado Mecánico Redragon Dark Avenger K568 Rgb',3,'',10,1),(62,'2024-08-13 19:51:30.570962','65','Mouse Logitech G Pro Black Wireless',3,'',10,1),(63,'2024-08-13 19:51:30.573962','64','Mouse Logitech G203 Lightsync White RGB',3,'',10,1),(64,'2024-08-13 19:51:30.576963','63','Mouse Gamer Redragon Cobra Fps M711 Negro',3,'',10,1),(65,'2024-08-13 19:51:30.579964','62','Mouse Gamer Redragon Storm Elite white M988-W RGB',3,'',10,1),(66,'2024-08-13 19:51:30.582964','61','Termo Stanley 1,2L',3,'',10,1),(67,'2024-08-13 19:51:30.585965','60','Maquina Humificadora',3,'',10,1),(68,'2024-08-13 19:51:30.588966','59','Cable HDMI 5mts',3,'',10,1),(69,'2024-08-13 19:51:30.590966','58','Cable Conversor DisplayPort a VGA 3mts',3,'',10,1),(70,'2024-08-13 19:51:30.593967','57','Microprocesador Intel I7 12700F S1700',3,'',10,1),(71,'2024-08-13 19:51:30.596967','56','Microprocesador Amd Ryzen 7 5700G 5gen AM4',3,'',10,1),(72,'2024-08-13 19:51:30.599968','55','Motherboard Gigabyte B660M DS3H DDR4 1.0 s1700',3,'',10,1),(73,'2024-08-13 19:51:30.603969','54','Motherboard MSI MPG B550 Gaming Plus DDR4 Am4',3,'',10,1),(74,'2024-08-13 19:51:30.606970','53','Disco Ssd Nvme Kingston 500Gb Nv2 PCIe 4.0',3,'',10,1),(75,'2024-08-13 19:51:30.608970','52','Disco Ssd Kingston A400 240Gb',3,'',10,1),(76,'2024-08-13 19:51:30.610971','51','Monitor Samsung 22\" T350 Full Hd 75hz IPS LF22T350FHL',3,'',10,1),(77,'2024-08-13 19:51:30.614971','50','Monitor Redragon Jade 27 165Hz',3,'',10,1),(78,'2024-08-13 19:51:30.617972','49','Auricular Logitech G335 White',3,'',10,1),(79,'2024-08-13 19:51:30.619973','48','Auricular Redragon Zeus X RGB Ps4/Pc',3,'',10,1),(80,'2024-08-13 19:51:30.623973','47','Teclado Gaming Logitech G Pro TKL LOL 2',3,'',10,1),(81,'2024-08-13 19:51:30.626974','46','Teclado Mecánico Redragon Dark Avenger K568 Rgb',3,'',10,1),(82,'2024-08-13 19:51:30.628975','45','Mouse Logitech G Pro Black Wireless',3,'',10,1),(83,'2024-08-13 19:51:30.633976','44','Mouse Logitech G203 Lightsync White RGB',3,'',10,1),(84,'2024-08-13 19:51:30.636976','43','Mouse Gamer Redragon Cobra Fps M711 Negro',3,'',10,1),(85,'2024-08-13 19:51:30.639977','42','Mouse Gamer Redragon Storm Elite white M988-W RGB',3,'',10,1),(86,'2024-08-13 19:51:30.642978','41','Termo Stanley 1,2L',3,'',10,1),(87,'2024-08-13 19:51:30.647979','40','Maquina Humificadora',3,'',10,1),(88,'2024-08-13 19:51:30.651980','39','Cable HDMI 5mts',3,'',10,1),(89,'2024-08-13 19:51:30.654980','38','Cable Conversor DisplayPort a VGA 3mts',3,'',10,1),(90,'2024-08-13 19:51:30.657981','37','Microprocesador Intel I7 12700F S1700',3,'',10,1),(91,'2024-08-13 19:51:30.660982','36','Microprocesador Amd Ryzen 7 5700G 5gen AM4',3,'',10,1),(92,'2024-08-13 19:51:30.663983','35','Motherboard Gigabyte B660M DS3H DDR4 1.0 s1700',3,'',10,1),(93,'2024-08-13 19:51:30.666983','34','Motherboard MSI MPG B550 Gaming Plus DDR4 Am4',3,'',10,1),(94,'2024-08-13 19:51:30.668984','33','Disco Ssd Nvme Kingston 500Gb Nv2 PCIe 4.0',3,'',10,1),(95,'2024-08-13 19:51:30.672985','32','Disco Ssd Kingston A400 240Gb',3,'',10,1),(96,'2024-08-13 19:51:30.675985','31','Monitor Samsung 22\" T350 Full Hd 75hz IPS LF22T350FHL',3,'',10,1),(97,'2024-08-13 19:51:30.677986','30','Monitor Redragon Jade 27 165Hz',3,'',10,1),(98,'2024-08-13 19:51:30.680986','29','Auricular Logitech G335 White',3,'',10,1),(99,'2024-08-13 19:51:30.683987','28','Auricular Redragon Zeus X RGB Ps4/Pc',3,'',10,1),(100,'2024-08-13 19:51:30.686988','27','Teclado Gaming Logitech G Pro TKL LOL 2',3,'',10,1),(101,'2024-08-13 19:51:30.688988','26','Teclado Mecánico Redragon Dark Avenger K568 Rgb',3,'',10,1),(102,'2024-08-13 19:51:30.692989','25','Mouse Logitech G Pro Black Wireless',3,'',10,1),(103,'2024-08-13 19:51:30.695990','24','Mouse Logitech G203 Lightsync White RGB',3,'',10,1),(104,'2024-08-13 19:51:30.697990','23','Mouse Gamer Redragon Cobra Fps M711 Negro',3,'',10,1),(105,'2024-08-13 19:51:30.701991','22','Mouse Gamer Redragon Storm Elite white M988-W RGB',3,'',10,1),(106,'2024-08-13 19:51:30.703991','21','Termo Stanley 1,2L',3,'',10,1),(107,'2024-08-13 19:51:30.707992','20','Maquina Humificadora',3,'',10,1),(108,'2024-08-13 19:51:30.709993','19','Cable HDMI 5mts',3,'',10,1),(109,'2024-08-13 19:51:30.712993','18','Cable Conversor DisplayPort a VGA 3mts',3,'',10,1),(110,'2024-08-13 19:51:30.715994','17','Microprocesador Intel I7 12700F S1700',3,'',10,1),(111,'2024-08-13 19:51:30.717995','16','Microprocesador Amd Ryzen 7 5700G 5gen AM4',3,'',10,1),(112,'2024-08-13 19:51:30.719995','15','Motherboard Gigabyte B660M DS3H DDR4 1.0 s1700',3,'',10,1),(113,'2024-08-13 19:51:30.723996','14','Motherboard MSI MPG B550 Gaming Plus DDR4 Am4',3,'',10,1),(114,'2024-08-13 19:51:30.725996','13','Disco Ssd Nvme Kingston 500Gb Nv2 PCIe 4.0',3,'',10,1),(115,'2024-08-13 19:51:30.728997','12','Disco Ssd Kingston A400 240Gb',3,'',10,1),(116,'2024-08-13 19:51:30.732998','11','Monitor Samsung 22\" T350 Full Hd 75hz IPS LF22T350FHL',3,'',10,1),(117,'2024-08-13 19:51:30.735999','10','Monitor Redragon Jade 27 165Hz',3,'',10,1),(118,'2024-08-13 19:51:30.737999','9','Auricular Logitech G335 White',3,'',10,1),(119,'2024-08-13 19:51:30.742000','8','Auricular Redragon Zeus X RGB Ps4/Pc',3,'',10,1),(120,'2024-08-13 19:51:30.744000','7','Teclado Gaming Logitech G Pro TKL LOL 2',3,'',10,1),(121,'2024-08-13 19:51:30.748002','6','Teclado Mecánico Redragon Dark Avenger K568 Rgb',3,'',10,1),(122,'2024-08-13 19:51:30.751002','5','Mouse Logitech G Pro Black Wireless',3,'',10,1),(123,'2024-08-13 19:51:30.753003','4','Mouse Logitech G203 Lightsync White RGB',3,'',10,1),(124,'2024-08-13 19:51:30.756003','3','Mouse Gamer Redragon Cobra Fps M711 Negro',3,'',10,1),(125,'2024-08-13 19:51:30.758004','2','Mouse Gamer Redragon Storm Elite white M988-W RGB',3,'',10,1),(126,'2024-08-13 19:51:30.761004','1','jisoo dea',3,'',10,1),(127,'2024-08-13 20:04:19.321131','2','Imagen de Mouse Gamer Redragon Storm Elite white M988-W RGB',1,'[{\"added\": {}}]',13,1),(128,'2024-08-13 20:04:34.622675','102','Mouse Gamer Redragon Storm Elite white M988-W RGB',2,'[]',10,1),(129,'2024-08-13 20:10:03.974094','3','Imagen de Mouse Gamer Redragon Cobra Fps M711 Negro',1,'[{\"added\": {}}]',13,1),(130,'2024-08-13 20:10:10.102499','102','Mouse Gamer Redragon Storm Elite white M988-W RGB',2,'[]',10,1),(131,'2024-08-13 20:13:54.944284','102','Mouse Gamer Redragon Storm Elite white M988-W RGB',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(132,'2024-08-13 20:14:40.553511','103','Mouse Gamer Redragon Cobra Fps M711 Negro',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(133,'2024-08-13 20:15:34.589530','4','Imagen de Cable Conversor DisplayPort a VGA 3mts',1,'[{\"added\": {}}]',13,1),(134,'2024-08-13 20:15:44.718308','118','Cable Conversor DisplayPort a VGA 3mts',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(135,'2024-08-13 20:16:04.698753','5','Imagen de Microprocesador Intel I7 12700F S1700',1,'[{\"added\": {}}]',13,1),(136,'2024-08-13 20:16:09.995951','117','Microprocesador Intel I7 12700F S1700',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(137,'2024-08-13 20:16:36.161796','6','Imagen de Microprocesador Amd Ryzen 7 5700G 5gen AM4',1,'[{\"added\": {}}]',13,1),(138,'2024-08-13 20:16:38.946924','116','Microprocesador Amd Ryzen 7 5700G 5gen AM4',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(139,'2024-08-13 20:17:05.061764','7','Imagen de Motherboard Gigabyte B660M DS3H DDR4 1.0 s1700',1,'[{\"added\": {}}]',13,1),(140,'2024-08-13 20:17:07.231251','115','Motherboard Gigabyte B660M DS3H DDR4 1.0 s1700',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(141,'2024-08-13 20:17:47.991756','8','Imagen de Motherboard MSI MPG B550 Gaming Plus DDR4 Am4',1,'[{\"added\": {}}]',13,1),(142,'2024-08-13 20:17:56.552200','114','Motherboard MSI MPG B550 Gaming Plus DDR4 Am4',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(143,'2024-08-13 20:18:29.714601','9','Imagen de Disco Ssd Nvme Kingston 500Gb Nv2 PCIe 4.0',1,'[{\"added\": {}}]',13,1),(144,'2024-08-13 20:18:32.806296','113','Disco Ssd Nvme Kingston 500Gb Nv2 PCIe 4.0',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(145,'2024-08-13 20:18:48.783827','10','Imagen de Disco Ssd Kingston A400 240Gb',1,'[{\"added\": {}}]',13,1),(146,'2024-08-13 20:18:51.388412','112','Disco Ssd Kingston A400 240Gb',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(147,'2024-08-13 20:19:13.390883','11','Imagen de Monitor Samsung 22\" T350 Full Hd 75hz IPS LF22T350FHL',1,'[{\"added\": {}}]',13,1),(148,'2024-08-13 20:19:17.253688','111','Monitor Samsung 22\" T350 Full Hd 75hz IPS LF22T350FHL',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(149,'2024-08-13 20:19:34.479060','12','Imagen de Monitor Redragon Jade 27 165Hz',1,'[{\"added\": {}}]',13,1),(150,'2024-08-13 20:19:38.011356','110','Monitor Redragon Jade 27 165Hz',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(151,'2024-08-13 20:19:58.772981','13','Imagen de Auricular Logitech G335 White',1,'[{\"added\": {}}]',13,1),(152,'2024-08-13 20:20:01.225532','109','Auricular Logitech G335 White',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(153,'2024-08-13 20:20:33.409425','14','Imagen de Auricular Redragon Zeus X RGB Ps4/Pc',1,'[{\"added\": {}}]',13,1),(154,'2024-08-13 20:20:36.443106','108','Auricular Redragon Zeus X RGB Ps4/Pc',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(155,'2024-08-13 20:21:06.548316','15','Imagen de Teclado Gaming Logitech G Pro TKL LOL 2',1,'[{\"added\": {}}]',13,1),(156,'2024-08-13 20:21:10.271152','107','Teclado Gaming Logitech G Pro TKL LOL 2',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(157,'2024-08-13 20:21:28.278636','16','Imagen de Teclado Mecánico Redragon Dark Avenger K568 Rgb',1,'[{\"added\": {}}]',13,1),(158,'2024-08-13 20:21:30.432120','106','Teclado Mecánico Redragon Dark Avenger K568 Rgb',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(159,'2024-08-13 20:22:01.556149','17','Imagen de Mouse Logitech G Pro Black Wireless',1,'[{\"added\": {}}]',13,1),(160,'2024-08-13 20:22:03.104505','105','Mouse Logitech G Pro Black Wireless',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(161,'2024-08-13 20:22:24.958856','18','Imagen de Mouse Gamer Redragon Cobra Fps M711 Negro',1,'[{\"added\": {}}]',13,1),(162,'2024-08-13 20:22:40.870622','103','Mouse Gamer Redragon Cobra Fps M711 Negro',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(163,'2024-08-13 20:23:28.063305','19','Imagen de Mouse Logitech G203 Lightsync White RGB',1,'[{\"added\": {}}]',13,1),(164,'2024-08-13 20:23:30.547371','104','Mouse Logitech G203 Lightsync White RGB',2,'[{\"changed\": {\"fields\": [\"Imagenes\"]}}]',10,1),(165,'2024-08-13 22:57:21.088684','1','Test_cat',3,'',9,1),(166,'2024-08-13 22:57:32.061160','6','nan',3,'',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'blog','categoria'),(8,'blog','post'),(15,'carrito','venta'),(4,'contenttypes','contenttype'),(9,'producto','categoria'),(12,'producto','marca'),(10,'producto','producto'),(13,'producto','productoimagen'),(14,'producto','subcategoria'),(11,'registros','customuser'),(6,'servicios','servicio'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-09 04:40:58.761961'),(2,'contenttypes','0002_remove_content_type_name','2024-08-09 04:40:58.856982'),(3,'auth','0001_initial','2024-08-09 04:40:59.138046'),(4,'auth','0002_alter_permission_name_max_length','2024-08-09 04:40:59.203060'),(5,'auth','0003_alter_user_email_max_length','2024-08-09 04:40:59.210062'),(6,'auth','0004_alter_user_username_opts','2024-08-09 04:40:59.215063'),(7,'auth','0005_alter_user_last_login_null','2024-08-09 04:40:59.220064'),(8,'auth','0006_require_contenttypes_0002','2024-08-09 04:40:59.223065'),(9,'auth','0007_alter_validators_add_error_messages','2024-08-09 04:40:59.228066'),(10,'auth','0008_alter_user_username_max_length','2024-08-09 04:40:59.233067'),(11,'auth','0009_alter_user_last_name_max_length','2024-08-09 04:40:59.238068'),(12,'auth','0010_alter_group_name_max_length','2024-08-09 04:40:59.250071'),(13,'auth','0011_update_proxy_permissions','2024-08-09 04:40:59.257072'),(14,'auth','0012_alter_user_first_name_max_length','2024-08-09 04:40:59.261073'),(15,'registros','0001_initial','2024-08-09 04:40:59.607151'),(16,'admin','0001_initial','2024-08-09 04:40:59.762186'),(17,'admin','0002_logentry_remove_auto_add','2024-08-09 04:40:59.770188'),(18,'admin','0003_logentry_add_action_flag_choices','2024-08-09 04:40:59.776189'),(19,'blog','0001_initial','2024-08-09 04:41:00.043249'),(20,'producto','0001_initial','2024-08-09 04:41:00.146272'),(21,'producto','0002_alter_producto_options_producto_created_and_more','2024-08-09 04:41:00.191282'),(22,'producto','0003_alter_producto_imagen','2024-08-09 04:41:00.196283'),(23,'servicios','0001_initial','2024-08-09 04:41:00.221289'),(24,'servicios','0002_rename_coptenido_servicio_contenido','2024-08-09 04:41:00.241293'),(25,'servicios','0003_alter_servicio_imagen','2024-08-09 04:41:00.246294'),(26,'sessions','0001_initial','2024-08-09 04:41:00.286304'),(27,'registros','0002_remove_customuser_username','2024-08-09 05:13:04.516041'),(28,'registros','0003_alter_customuser_managers','2024-08-09 15:10:42.141109'),(29,'registros','0004_alter_customuser_province','2024-08-09 22:45:09.283774'),(30,'blog','0002_post_autor_nombre','2024-08-12 18:14:10.630126'),(31,'blog','0003_rename_autor_nombre_post_autor_name','2024-08-12 18:42:34.265084'),(32,'blog','0004_alter_post_contenido_alter_post_titulo','2024-08-13 02:29:07.995302'),(33,'blog','0005_alter_post_imagen','2024-08-13 05:13:35.438652'),(34,'servicios','0004_alter_servicio_imagen_alter_servicio_updated','2024-08-13 05:13:35.485662'),(35,'servicios','0005_alter_servicio_contenido','2024-08-13 05:16:14.282769'),(36,'producto','0004_marca_alter_categoria_options_and_more','2024-08-13 13:30:03.228518'),(37,'carrito','0001_initial','2024-08-13 13:30:03.330541'),(38,'producto','0005_alter_producto_categoria_principal_and_more','2024-08-13 18:07:08.582633'),(39,'producto','0006_alter_producto_precio_otro_and_more','2024-08-13 19:44:44.127037'),(40,'producto','0007_alter_producto_stock','2024-08-15 22:20:01.280048');
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
INSERT INTO `django_session` VALUES ('btjdb9nfb6dvfyqj8i9z5b30m3jobol0','.eJxVjjFuwzAMRa9iaDYc0ZJtKWMLtFM69AIBJdKOkloyZGcKcvfKQJZMJPg_H95DeMw5bEkcHwKk2kcgcSxrLWKaXWZxFKd0X7n6xplz9cuUcUqx-kwuY_W1rNVpAKh-eMpJ1GLJ7EPBQSdlI2sRZpw4FshhZgp4WHKiu9_SAcD33chOAxutOnIkpfKyhb5n23XUXJep8DzGLRAWJ_V81uKM9-1yLjr5vHsKEG83h_7GcQ_oinFKjU9xy8E1e6V5pWtzSsR_H6_uG-CC66V8j2BI9paHntC22mog03XWtgQjOJY4kjEDyMEqUMaPyoxkNRntNbh-aMXzHyR1bLQ:1sgT4X:vd70g1RepWhF-LdFwyLux_qkogmb30QKGttUzm6vm4c','2024-09-03 17:55:09.976726'),('ut85yftclj4xt9vgkm6op0nqj8dx1vq6','.eJxVjDEOgzAMRe_iuYowBGJ37N4zICdOCm1FpAAT4u4tEgvrf-_9DYKUMi4Z7tt-g17WZejXOZZ-VLgDwmXzEj5xOoC-ZXplE_K0lNGbQzEnnc0za_w-TvdyMMg8_OuEpFXH0XUqXFu2qNS2zLViQh8rSUrksHLcYEMhNZSUrZINFn3nath_AHw7zA:1seFga:r_fgrceqhqh2EN2WqWn92DtX59WtfIA__NQrhI0ToyI','2024-08-28 15:13:16.063866');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_categoria`
--

DROP TABLE IF EXISTS `producto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_categoria`
--

LOCK TABLES `producto_categoria` WRITE;
/*!40000 ALTER TABLE `producto_categoria` DISABLE KEYS */;
INSERT INTO `producto_categoria` VALUES (2,'Periféricos','2024-08-13 17:20:06.995614','2024-08-13 17:20:06.995614'),(3,'Componentes de PC','2024-08-13 17:20:07.016619','2024-08-13 17:20:07.016619'),(4,'Cables y Adaptadores','2024-08-13 17:20:07.030622','2024-08-13 17:20:07.030622'),(5,'Outro','2024-08-13 17:20:07.034623','2024-08-13 17:20:07.034623');
/*!40000 ALTER TABLE `producto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_marca`
--

DROP TABLE IF EXISTS `producto_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_marca` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_marca`
--

LOCK TABLES `producto_marca` WRITE;
/*!40000 ALTER TABLE `producto_marca` DISABLE KEYS */;
INSERT INTO `producto_marca` VALUES (1,'Logitech','2024-08-13 17:20:07.038624','2024-08-13 17:20:07.038624'),(2,'Redragon','2024-08-13 17:20:07.042625','2024-08-13 17:20:07.042625'),(3,'Samsung','2024-08-13 17:20:07.045625','2024-08-13 17:20:07.045625'),(4,'Corsair','2024-08-13 17:20:07.049626','2024-08-13 17:20:07.049626'),(5,'Kingston','2024-08-13 17:20:07.052627','2024-08-13 17:20:07.052627'),(6,'MSI','2024-08-13 17:20:07.056628','2024-08-13 17:20:07.056628'),(7,'Gigabyte','2024-08-13 17:20:07.060629','2024-08-13 17:20:07.060629'),(8,'Ryzen','2024-08-13 17:20:07.064630','2024-08-13 17:20:07.064630'),(9,'Intel','2024-08-13 17:20:07.068631','2024-08-13 17:20:07.068631'),(10,'nan','2024-08-13 19:41:12.244946','2024-08-13 19:41:12.244946');
/*!40000 ALTER TABLE `producto_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_producto`
--

DROP TABLE IF EXISTS `producto_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `precio_contado` double NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL,
  `stock` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `categoria_principal_id` bigint NOT NULL,
  `descripcion` longtext,
  `precio_otro` double DEFAULT NULL,
  `precio_tarjeta` double DEFAULT NULL,
  `marca_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_producto_categoria_principal__7f283c31_fk_producto_` (`categoria_principal_id`),
  KEY `producto_producto_marca_id_3e6157bc_fk_producto_marca_id` (`marca_id`),
  CONSTRAINT `producto_producto_categoria_principal__7f283c31_fk_producto_` FOREIGN KEY (`categoria_principal_id`) REFERENCES `producto_categoria` (`id`),
  CONSTRAINT `producto_producto_marca_id_3e6157bc_fk_producto_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `producto_marca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_producto`
--

LOCK TABLES `producto_producto` WRITE;
/*!40000 ALTER TABLE `producto_producto` DISABLE KEYS */;
INSERT INTO `producto_producto` VALUES (102,'Mouse Gamer Redragon Storm Elite white M988-W RGB',1000,1,10,'2024-08-13 20:00:11.691445','2024-08-13 20:13:54.943284',2,'',0,0,2),(103,'Mouse Gamer Redragon Cobra Fps M711 Negro',1500,1,10,'2024-08-13 20:00:11.703448','2024-08-13 20:22:40.868621',2,'',0,0,2),(104,'Mouse Logitech G203 Lightsync White RGB',1000,1,10,'2024-08-13 20:00:11.714450','2024-08-13 20:23:30.545370',2,'',0,0,1),(105,'Mouse Logitech G Pro Black Wireless',1500,1,10,'2024-08-13 20:00:11.722452','2024-08-13 20:22:03.102505',2,'',0,0,1),(106,'Teclado Mecánico Redragon Dark Avenger K568 Rgb',3000,1,10,'2024-08-13 20:00:11.729454','2024-08-13 20:21:30.430120',2,'',0,0,2),(107,'Teclado Gaming Logitech G Pro TKL LOL 2',3000,1,10,'2024-08-13 20:00:11.738456','2024-08-13 20:21:10.269152',2,'',0,0,1),(108,'Auricular Redragon Zeus X RGB Ps4/Pc',2500,1,10,'2024-08-13 20:00:11.745457','2024-08-13 20:20:36.441106',2,'',0,0,2),(109,'Auricular Logitech G335 White',3000,1,10,'2024-08-13 20:00:11.754459','2024-08-13 20:20:01.224532',2,'',0,0,1),(110,'Monitor Redragon Jade 27 165Hz',15000,1,10,'2024-08-13 20:00:11.761461','2024-08-13 20:19:38.009355',2,'',0,0,2),(111,'Monitor Samsung 22\" T350 Full Hd 75hz IPS LF22T350FHL',15000,1,10,'2024-08-13 20:00:11.769463','2024-08-13 20:19:17.251688',2,'',0,0,3),(112,'Disco Ssd Kingston A400 240Gb',5000,1,10,'2024-08-13 20:00:11.776464','2024-08-13 20:18:51.387411',3,'',0,0,5),(113,'Disco Ssd Nvme Kingston 500Gb Nv2 PCIe 4.0',10000,1,10,'2024-08-13 20:00:11.784466','2024-08-13 20:18:32.803296',3,'',0,0,5),(114,'Motherboard MSI MPG B550 Gaming Plus DDR4 Am4',30000,1,10,'2024-08-13 20:00:11.793468','2024-08-13 20:17:56.550199',3,'',0,0,6),(115,'Motherboard Gigabyte B660M DS3H DDR4 1.0 s1700',30000,1,10,'2024-08-13 20:00:11.800470','2024-08-13 20:17:07.229251',3,'',0,0,7),(116,'Microprocesador Amd Ryzen 7 5700G 5gen AM4',50000,1,10,'2024-08-13 20:00:11.808472','2024-08-13 20:16:38.945923',3,'',0,0,8),(117,'Microprocesador Intel I7 12700F S1700',60000,1,10,'2024-08-13 20:00:11.817474','2024-08-13 20:16:09.993951',3,'',0,0,9),(118,'Cable Conversor DisplayPort a VGA 3mts',5000,1,10,'2024-08-13 20:00:11.824475','2024-08-13 20:15:44.717307',4,'',0,0,10),(119,'Cable HDMI 5mts',3000,1,10,'2024-08-13 20:00:11.828476','2024-08-13 20:00:11.828476',4,NULL,0,0,10),(120,'Maquina Humificadora',5000,1,10,'2024-08-13 20:00:11.834477','2024-08-13 20:00:11.834477',5,NULL,0,0,10),(121,'Termo Stanley 1,2L',5000,1,10,'2024-08-13 20:00:11.839478','2024-08-13 20:00:11.839478',5,NULL,0,0,10);
/*!40000 ALTER TABLE `producto_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_producto_imagenes`
--

DROP TABLE IF EXISTS `producto_producto_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_producto_imagenes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `producto_id` bigint NOT NULL,
  `productoimagen_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `producto_producto_imagen_producto_id_productoimag_c5416c93_uniq` (`producto_id`,`productoimagen_id`),
  KEY `producto_producto_im_productoimagen_id_e9597e79_fk_producto_` (`productoimagen_id`),
  CONSTRAINT `producto_producto_im_producto_id_9dab691a_fk_producto_` FOREIGN KEY (`producto_id`) REFERENCES `producto_producto` (`id`),
  CONSTRAINT `producto_producto_im_productoimagen_id_e9597e79_fk_producto_` FOREIGN KEY (`productoimagen_id`) REFERENCES `producto_productoimagen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_producto_imagenes`
--

LOCK TABLES `producto_producto_imagenes` WRITE;
/*!40000 ALTER TABLE `producto_producto_imagenes` DISABLE KEYS */;
INSERT INTO `producto_producto_imagenes` VALUES (2,102,2),(18,103,18),(19,104,19),(17,105,17),(16,106,16),(15,107,15),(14,108,14),(13,109,13),(12,110,12),(11,111,11),(10,112,10),(9,113,9),(8,114,8),(7,115,7),(6,116,6),(5,117,5),(4,118,4);
/*!40000 ALTER TABLE `producto_producto_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_producto_subcategorias`
--

DROP TABLE IF EXISTS `producto_producto_subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_producto_subcategorias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `producto_id` bigint NOT NULL,
  `subcategoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `producto_producto_subcat_producto_id_subcategoria_a63415ae_uniq` (`producto_id`,`subcategoria_id`),
  KEY `producto_producto_su_subcategoria_id_8a3709b1_fk_producto_` (`subcategoria_id`),
  CONSTRAINT `producto_producto_su_producto_id_30007da5_fk_producto_` FOREIGN KEY (`producto_id`) REFERENCES `producto_producto` (`id`),
  CONSTRAINT `producto_producto_su_subcategoria_id_8a3709b1_fk_producto_` FOREIGN KEY (`subcategoria_id`) REFERENCES `producto_subcategoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_producto_subcategorias`
--

LOCK TABLES `producto_producto_subcategorias` WRITE;
/*!40000 ALTER TABLE `producto_producto_subcategorias` DISABLE KEYS */;
INSERT INTO `producto_producto_subcategorias` VALUES (81,102,2),(82,103,2),(83,104,2),(84,105,2),(85,106,1),(86,107,1),(87,108,3),(88,109,3),(89,110,4),(90,111,4),(91,112,7),(92,113,7),(93,114,6),(94,115,6),(95,116,5),(96,117,5);
/*!40000 ALTER TABLE `producto_producto_subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_productoimagen`
--

DROP TABLE IF EXISTS `producto_productoimagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_productoimagen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_productoima_producto_id_8d247da6_fk_producto_` (`producto_id`),
  CONSTRAINT `producto_productoima_producto_id_8d247da6_fk_producto_` FOREIGN KEY (`producto_id`) REFERENCES `producto_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_productoimagen`
--

LOCK TABLES `producto_productoimagen` WRITE;
/*!40000 ALTER TABLE `producto_productoimagen` DISABLE KEYS */;
INSERT INTO `producto_productoimagen` VALUES (2,'producto/da2be64369204977b5553ee43193eb0f.jpg',NULL,'2024-08-13 20:04:19.320131','2024-08-13 20:04:19.320131',102),(3,'producto/0ed830eebd064067b8c27ef85d291fc7.jpeg',NULL,'2024-08-13 20:10:03.974094','2024-08-13 20:10:03.974094',103),(4,'producto/b38d1c3f2f9946cdbefa2b86f9804994.jpg',NULL,'2024-08-13 20:15:34.589530','2024-08-13 20:15:34.589530',118),(5,'producto/63dc8064a5244ed1bf0864050f303d17.jpg',NULL,'2024-08-13 20:16:04.698753','2024-08-13 20:16:04.698753',117),(6,'producto/dc1a4e0d76fd45bbb53f1bbd5b9f275c.jpg',NULL,'2024-08-13 20:16:36.161796','2024-08-13 20:16:36.161796',116),(7,'producto/3292680a18be419cabf2c1ba607d412a.jpg',NULL,'2024-08-13 20:17:05.060764','2024-08-13 20:17:05.060764',115),(8,'producto/590debd742fc495da4fc0c78a8deb550.jpg',NULL,'2024-08-13 20:17:47.990756','2024-08-13 20:17:47.991756',114),(9,'producto/c96604a5e5664da3beec16cd7b819167.jpg',NULL,'2024-08-13 20:18:29.713601','2024-08-13 20:18:29.713601',113),(10,'producto/dbad5e828f944310aa140d6b74bd03c2.jpg',NULL,'2024-08-13 20:18:48.783827','2024-08-13 20:18:48.783827',112),(11,'producto/b6627b89b8a34f2896289c878334d926.jpg',NULL,'2024-08-13 20:19:13.389883','2024-08-13 20:19:13.389883',111),(12,'producto/8cc6b5d724d445f4a42fa5e1cf3cdf54.jpg',NULL,'2024-08-13 20:19:34.479060','2024-08-13 20:19:34.479060',110),(13,'producto/776cd2f07abc41709f60e0c905b82ee9.jpeg',NULL,'2024-08-13 20:19:58.772981','2024-08-13 20:19:58.772981',109),(14,'producto/f4a5e2210ec9460fb782ff542e584709.jpg',NULL,'2024-08-13 20:20:33.408425','2024-08-13 20:20:33.408425',108),(15,'producto/86178511e2864e129da74d681b555957.jpg',NULL,'2024-08-13 20:21:06.548316','2024-08-13 20:21:06.548316',107),(16,'producto/0e03ec079c374aed89f5a6d67b8cdf87.jpg',NULL,'2024-08-13 20:21:28.277636','2024-08-13 20:21:28.277636',106),(17,'producto/abeb7c32915d44fea16ebe80d831e94f.jpg',NULL,'2024-08-13 20:22:01.555149','2024-08-13 20:22:01.555149',105),(18,'producto/11c65feb41e8435dbd003c02166e955d.jpg',NULL,'2024-08-13 20:22:24.957856','2024-08-13 20:22:24.957856',103),(19,'producto/d537fe9fe628477ba264ec214cf753db.jpg',NULL,'2024-08-13 20:23:28.063305','2024-08-13 20:23:28.063305',104);
/*!40000 ALTER TABLE `producto_productoimagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_subcategoria`
--

DROP TABLE IF EXISTS `producto_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_subcategoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_subcategori_categoria_id_6c2f68eb_fk_producto_` (`categoria_id`),
  CONSTRAINT `producto_subcategori_categoria_id_6c2f68eb_fk_producto_` FOREIGN KEY (`categoria_id`) REFERENCES `producto_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_subcategoria`
--

LOCK TABLES `producto_subcategoria` WRITE;
/*!40000 ALTER TABLE `producto_subcategoria` DISABLE KEYS */;
INSERT INTO `producto_subcategoria` VALUES (1,'Teclados','2024-08-13 17:20:07.000615','2024-08-13 17:20:07.000615',2),(2,'Mouses','2024-08-13 17:20:07.004616','2024-08-13 17:20:07.004616',2),(3,'Auriculares','2024-08-13 17:20:07.009617','2024-08-13 17:20:07.009617',2),(4,'Monitores','2024-08-13 17:20:07.012618','2024-08-13 17:20:07.012618',2),(5,'Procesadores','2024-08-13 17:20:07.020620','2024-08-13 17:20:07.020620',3),(6,'Motherboards','2024-08-13 17:20:07.024621','2024-08-13 17:20:07.024621',3),(7,'Discos SSD','2024-08-13 17:20:07.027621','2024-08-13 17:20:07.027621',3);
/*!40000 ALTER TABLE `producto_subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_customuser`
--

DROP TABLE IF EXISTS `registros_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_customuser`
--

LOCK TABLES `registros_customuser` WRITE;
/*!40000 ALTER TABLE `registros_customuser` DISABLE KEYS */;
INSERT INTO `registros_customuser` VALUES (1,'pbkdf2_sha256$720000$qNJICwTYhrtS7TSCvfDMLm$+cs6KjBJfKHz6moeHlkoK+r0nEXglOkj1Ky0v0ESQzQ=','2024-08-20 16:30:46.946971',1,'Lucas','Martinez Fernandez',1,1,'2024-08-09 05:01:29.920183','lucascallamullo@hotmail.com','3515437688','',''),(2,'pbkdf2_sha256$720000$Cj1VFRFlfA4LFlMEoW0zRa$gIJspxxLNLHCA2sz5cXVTbjwBlxZYvNUVLkYx2wsH0A=',NULL,0,'','',0,1,'2024-08-09 15:11:01.508459','test@example.com','123456789',NULL,NULL),(3,'pbkdf2_sha256$720000$Bry9NT39oocTVziPv2v8In$nAGOnK21nWO6T7uPm6EGxwe/TvY8YLVeJ5iSw7LFvds=','2024-08-20 16:12:13.785965',0,'Lucas','Callamullo',0,1,'2024-08-09 16:02:12.253792','lucasss_cab@hotmail.com','3515437688','Córdoba','Av Tronador 2079'),(4,'pbkdf2_sha256$720000$YLrINInqB0xKCHCWwrFGB6$ip7TC66mQIplT0uYwYjOzdHaQXlbPIiN9r5sYprGlug=',NULL,0,'Lucas','De Keila',0,1,'2024-08-09 19:00:37.084911','luuuu@gmail.com','3515437688','Córdoba','Av Tronador 2079'),(5,'pbkdf2_sha256$720000$V4SImcXxncDsYFV9ywhTY3$4cqSmdy9MidlDlIAEQu+CmsHZ5vUg9u1svSBPXHSwEE=',NULL,0,'Lucas','De Keila',0,1,'2024-08-09 19:31:38.601635','lucascallamullaao@example34.com','3515437688','Córdoba','Av Tronador 2079'),(6,'pbkdf2_sha256$720000$JjyTSI8j3jJJGsoeYZ95EH$q0WBz1yxpBpMtDf72TBCGTnXekiNWsEPgoHgF2jP1Zo=',NULL,0,'Lucas','De Keila',0,1,'2024-08-09 20:01:09.480458','lucascallamulla111ao@example34.com','3515437688','Córdoba','Av Tronador 2079'),(7,'pbkdf2_sha256$720000$P7ReWdpK49QP4l6bjogrp3$je0lc14ZH3dBCsfSLzdS8hSxuFO9jgggWEiR0nIbq4g=',NULL,0,'Lucas','De Nanu',0,1,'2024-08-09 20:01:46.953281','lucass2Nanu@example34.com','3515437688','Córdoba','Av Tronador 2079'),(8,'pbkdf2_sha256$720000$ZSWC1xoeElxmqgT2A8v4OC$7Dmo0UCpppNn5sMiN3+dFvzLL7i8/vBdglk5WcK/tdE=',NULL,0,'Lucas','Callamullo',0,1,'2024-08-09 20:19:42.510767','lucascallamulloasd@hotmail.com','3515437688','',''),(9,'pbkdf2_sha256$720000$BSXEzCUMlCWeNFiog4Nyjp$KbmhBegOeBt2+CQ44m4vrSjHHc4AZxG+t0XlJdpC9hs=',NULL,0,'Lucas','Callamullo',0,1,'2024-08-09 20:24:03.283029','lucascallamulloasd@a.com','3515437688','',''),(10,'pbkdf2_sha256$720000$wzCtGinA35PkuKhJ7Vijac$SFLImMjlpDjGNK4HflGfHpZQugAhVxVp7eiJdx//gA4=',NULL,0,'Kei','Trola',0,1,'2024-08-09 22:47:06.368605','keilatrola@hotmail.com','3515437688','',''),(11,'pbkdf2_sha256$720000$ZsNxuMJyWgMelWfD7h0ULG$0Wpulp64blkmArzqKH9MzaxfxUHqI6yv8bFtSe+IptE=','2024-08-09 22:51:31.342403',0,'Cami','Ricardo',0,1,'2024-08-09 22:51:30.482209','camitrolaa@hotmail.com','3515437688','',''),(12,'pbkdf2_sha256$720000$efnOuTKqXmLZn2jwt48ZB6$zlW5og6LfFkj5DHPn+esTmIsRHetELTa2s//EOLj3qE=','2024-08-20 16:29:54.789594',0,'Lucas','Ricardo',0,1,'2024-08-20 16:29:53.886370','lucascallamullo2@hotmail.com','3515437688','Córdoba','');
/*!40000 ALTER TABLE `registros_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_customuser_groups`
--

DROP TABLE IF EXISTS `registros_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registros_customuser_groups_customuser_id_group_id_9697ec28_uniq` (`customuser_id`,`group_id`),
  KEY `registros_customuser_groups_group_id_0146484f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `registros_customuser_customuser_id_6447861b_fk_registros` FOREIGN KEY (`customuser_id`) REFERENCES `registros_customuser` (`id`),
  CONSTRAINT `registros_customuser_groups_group_id_0146484f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_customuser_groups`
--

LOCK TABLES `registros_customuser_groups` WRITE;
/*!40000 ALTER TABLE `registros_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_customuser_user_permissions`
--

DROP TABLE IF EXISTS `registros_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registros_customuser_use_customuser_id_permission_8a4bbad9_uniq` (`customuser_id`,`permission_id`),
  KEY `registros_customuser_permission_id_b19d106d_fk_auth_perm` (`permission_id`),
  CONSTRAINT `registros_customuser_customuser_id_7a090ee1_fk_registros` FOREIGN KEY (`customuser_id`) REFERENCES `registros_customuser` (`id`),
  CONSTRAINT `registros_customuser_permission_id_b19d106d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_customuser_user_permissions`
--

LOCK TABLES `registros_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `registros_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_servicio`
--

DROP TABLE IF EXISTS `servicios_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_servicio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `contenido` longtext NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_servicio`
--

LOCK TABLES `servicios_servicio` WRITE;
/*!40000 ALTER TABLE `servicios_servicio` DISABLE KEYS */;
INSERT INTO `servicios_servicio` VALUES (1,'Servicio Técnico','Ofrecemos servicio de armado de PC incluido con tu compra de una PC completa, también ofrecemos garantía de fábrica por seis a doce meses','servicios/337eedb2716a4e4f94a5a8ae20914d58.jpg','2024-08-13 05:17:37.325380','2024-08-13 05:17:37.325380'),(2,'Servicio de Entrega','Ofrecemos servicio de entrega personalizado a todo Córdoba Capital y alrededores, también ofrecemos servicio de entrega a todo el país por Andreani.','servicios/9310ba85d2af4f8d92bf132a708bc1ac.jpg','2024-08-13 05:18:26.937384','2024-08-13 05:18:26.937384'),(3,'Pago con Criptos','Recibimos pagos con criptomonedas como USD, USDT, Ethereum, Bitcon recibimos el pago por Binance','servicios/5055a9eeb59949dbb3efbbbb24ba4695.jpg','2024-08-13 05:19:15.907914','2024-08-13 05:19:15.907914'),(4,'Instalación Windows','Instalación de Windows Gratuita incluida con tu compra y armado de PC completo.','servicios/2cf2d2e3354d4bcaa7d7f1f786c49d05.webp','2024-08-13 05:20:03.860648','2024-08-13 05:20:03.860648');
/*!40000 ALTER TABLE `servicios_servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-20 15:53:53
