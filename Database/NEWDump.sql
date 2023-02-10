CREATE DATABASE  IF NOT EXISTS `badibasket` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `badibasket`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: badibasket
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `add_products`
--

DROP TABLE IF EXISTS `add_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_products` (
  `employee_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  KEY `employee_id_idx` (`employee_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`idEmployee`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_products`
--

LOCK TABLES `add_products` WRITE;
/*!40000 ALTER TABLE `add_products` DISABLE KEYS */;
INSERT INTO `add_products` VALUES (4,48),(3,42),(6,32),(2,74),(5,40),(3,71),(5,16),(1,54),(1,28),(8,31),(10,68),(4,69),(4,42),(2,5),(6,80),(3,97),(10,64),(9,62),(1,62),(4,95),(2,11),(6,24),(7,82),(9,15),(5,21),(8,54),(2,9),(5,28),(1,85),(5,28),(4,90),(6,11),(5,80),(3,31),(6,71),(3,30),(7,7),(8,62),(9,4),(3,45),(1,51),(8,6),(2,8),(2,35),(10,32),(3,61),(6,16),(8,100),(6,37),(2,87),(2,38),(9,24),(10,68),(1,27),(6,73),(1,30),(9,97),(7,3),(1,98),(3,67),(3,81),(9,6),(9,14),(1,93),(1,29),(8,99),(2,47),(8,45),(7,13),(2,19),(8,79),(2,34),(9,27),(10,1),(3,36),(10,75),(2,43),(7,74),(3,2),(6,65),(2,11),(1,59),(1,5),(1,81),(6,94),(1,36),(6,7),(10,49),(7,29),(8,94),(2,32),(9,32),(6,51),(2,1),(3,8),(10,71),(7,87),(3,56),(6,46),(5,63);
/*!40000 ALTER TABLE `add_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idAdmin` int unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` char(45) NOT NULL,
  `admin_username` varchar(45) NOT NULL,
  `admin_password` varchar(45) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Owner','vishalrahul','kuchpassword');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_adds_discount`
--

DROP TABLE IF EXISTS `admin_adds_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_adds_discount` (
  `admin_id_addsDisc` int unsigned NOT NULL,
  `discount_id_add` int unsigned NOT NULL,
  KEY `admin_id_idx` (`admin_id_addsDisc`),
  KEY `discount_idx` (`discount_id_add`),
  CONSTRAINT `admin_id_addsDisc` FOREIGN KEY (`admin_id_addsDisc`) REFERENCES `admin` (`idAdmin`),
  CONSTRAINT `discount_id_add` FOREIGN KEY (`discount_id_add`) REFERENCES `discount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_adds_discount`
--

LOCK TABLES `admin_adds_discount` WRITE;
/*!40000 ALTER TABLE `admin_adds_discount` DISABLE KEYS */;
INSERT INTO `admin_adds_discount` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `admin_adds_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_employee_link`
--

DROP TABLE IF EXISTS `admin_employee_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_employee_link` (
  `admin_id` int unsigned NOT NULL,
  `employee_id_forAdmin` int unsigned NOT NULL,
  KEY `id1_idx` (`admin_id`),
  KEY `id2_idx` (`employee_id_forAdmin`),
  CONSTRAINT `admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`idAdmin`),
  CONSTRAINT `employee_id_forAdmin` FOREIGN KEY (`employee_id_forAdmin`) REFERENCES `employee` (`idEmployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_employee_link`
--

LOCK TABLES `admin_employee_link` WRITE;
/*!40000 ALTER TABLE `admin_employee_link` DISABLE KEYS */;
INSERT INTO `admin_employee_link` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10);
/*!40000 ALTER TABLE `admin_employee_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `idCart` int unsigned NOT NULL AUTO_INCREMENT,
  `total_price` int NOT NULL,
  `discount_id` int unsigned NOT NULL,
  PRIMARY KEY (`idCart`),
  KEY `discount_id_idx` (`discount_id`),
  CONSTRAINT `discount_id` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,27791,1),(2,35483,2),(3,15980,2),(4,65101,2),(5,476,1),(6,69151,1),(7,57603,1),(8,42993,1),(9,60922,1),(10,43267,1),(11,27642,2),(12,16150,1),(13,67279,2),(14,43094,1),(15,67118,1),(16,16066,1),(17,28798,1),(18,15163,1),(19,43959,1),(20,15724,1),(21,13774,1),(22,60058,2),(23,47698,2),(24,76672,1),(25,11128,1),(26,66023,2),(27,20894,2),(28,6597,1),(29,72480,1),(30,74654,1),(31,99873,1),(32,51367,1),(33,50245,1),(34,96275,1),(35,9995,1),(36,63562,1),(37,37177,1),(38,59107,1),(39,16475,1),(40,63609,1),(41,2110,2),(42,59676,1),(43,7463,1),(44,73745,1),(45,1639,2),(46,99050,1),(47,44752,1),(48,80505,2),(49,85714,1),(50,38937,1),(51,42275,1),(52,32848,2),(53,14392,1),(54,99509,1),(55,13601,2),(56,98565,2),(57,88321,1),(58,53392,2),(59,59969,1),(60,73209,1),(61,439,2),(62,10081,1),(63,88338,1),(64,37540,2),(65,83273,2),(66,54223,1),(67,41797,2),(68,58408,1),(69,23466,1),(70,9393,1),(71,94431,1),(72,25697,1),(73,35633,1),(74,81322,1),(75,21548,1),(76,98407,1),(77,23362,1),(78,17964,2),(79,24422,1),(80,82445,2),(81,37547,1),(82,83839,1),(83,44323,1),(84,43155,1),(85,67897,1),(86,45696,1),(87,63510,1),(88,84237,1),(89,98831,2),(90,88395,1),(91,52530,1),(92,77958,2),(93,82701,1),(94,12906,2),(95,33008,1),(96,66181,1),(97,181,2),(98,4566,1),(99,97533,1),(100,33882,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idCustomer` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` char(45) NOT NULL,
  `contact_info` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `delivery_partner_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  PRIMARY KEY (`idCustomer`),
  KEY `cart_id_idx` (`cart_id`),
  CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`idCart`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Lilia Baddeley',892516974,'4 Pond Center','lbaddeley0','bjYKUUD',6,32),(2,'Wiatt Pickering',989881119,'0 Paget Street','wpickering1','hEWiTn',8,80),(3,'Nonie Packham',863494208,'51 Victoria Point','npackham2','jCxwbC',15,52),(4,'Denver Kingscote',702400061,'1749 Bay Way','dkingscote3','ks9omnJ1JxU0',2,15),(5,'Leyla Blankau',604932964,'9481 Texas Avenue','lblankau4','JiwIHu4bv',6,41),(6,'Mallory Cordes',754951612,'6 Westerfield Avenue','mcordes5','fMZhdPGboJ',9,72),(7,'Georgianna Hanniger',784857578,'021 Hazelcrest Parkway','ghanniger6','CVNDVCTC',18,32),(8,'Iorgo Bownass',813968059,'1 Meadow Ridge Crossing','ibownass7','PGggk4rBgz',3,35),(9,'Ches Whiley',693065960,'3300 Memorial Lane','cwhiley8','duc94AcK6NT0',5,49),(10,'Lissi Goodricke',616541180,'8 Lyons Way','lgoodricke9','PdQ4akw',8,43),(11,'Chane Roddell',640448337,'119 Kedzie Road','croddella','kdCqT3uYArk',5,27),(12,'Phebe Higounet',716959312,'8660 Veith Point','phigounetb','eZuMmUH87jiU',1,98),(13,'Orrin Ambroziak',847564286,'7 Golden Leaf Circle','oambroziakc','6lGBiU5b',16,40),(14,'Travers Drieu',670271349,'775 Onsgard Center','tdrieud','I5J9B43w1x2L',15,45),(15,'Eadie Grieger',676477510,'66 Stoughton Alley','egriegere','jTiayL',5,62),(16,'Anna Geroldi',731060827,'63 Ilene Parkway','ageroldif','i6iZiCfb',15,58),(17,'Constantine Beaumont',624030126,'55716 High Crossing Terrace','cbeaumontg','vYinKQ',19,77),(18,'Putnam Musterd',821800459,'31874 Gerald Terrace','pmusterdh','XJ5Jhtv',17,84),(19,'Lamond Tirte',876109183,'89756 Talisman Parkway','ltirtei','oi3gtY',9,26),(20,'Mike Di Matteo',768174379,'5465 Valley Edge Park','mdij','L3ZAkptA2zP',20,85),(21,'Kelvin Duxfield',708546308,'7701 Hollow Ridge Park','kduxfieldk','TnCapi',6,55),(22,'Pen Muckersie',737867304,'744 Melrose Center','pmuckersiel','MZaf6WvUDE4',18,92),(23,'Drake Lindmark',669397053,'5 Thierer Alley','dlindmarkm','JON6RBW3VRm',6,39),(24,'Gaile Gawthrope',668083294,'63 Burning Wood Lane','ggawthropen','9ZeytzbM',7,53),(25,'Diana Henstridge',815425981,'9761 Iowa Lane','dhenstridgeo','SoZD9iMd',5,37),(26,'Welch Gotmann',880384188,'8 Lyons Trail','wgotmannp','URa7pU89p',15,1),(27,'Maurizia Pemble',759816979,'68879 Kenwood Way','mpembleq','eMuMrSG',5,14),(28,'Melba Kirkup',859265334,'62 Delladonna Avenue','mkirkupr','sKzfIYr5',18,93),(29,'Ellis Gladbach',689859389,'69792 Carey Hill','egladbachs','bMXXU6KF',5,64),(30,'Gilberta Odgaard',901689908,'0976 Ilene Way','godgaardt','kDtf75Q5',8,51),(31,'Riane Dodwell',916002945,'17849 Garrison Park','rdodwellu','kbeN3H32t',6,8),(32,'Anabelle Lochrie',789406521,'1200 Talisman Parkway','alochriev','96d7IoIY9i',19,52),(33,'Hailee Welbrock',887682875,'8 Beilfuss Street','hwelbrockw','r3qUxZelx7xr',13,14),(34,'Emlynne Lehrmann',913614983,'721 Elka Lane','elehrmannx','VilTvvns',5,99),(35,'Nikola Mattaus',887749423,'45 Esch Parkway','nmattausy','4QwM8V71JU1',14,9),(36,'Esra Tollmache',880969776,'07 Annamark Point','etollmachez','xxPF9LW0faML',3,39),(37,'Virgie Seaman',649130994,'634 Lillian Parkway','vseaman10','HaO09F',19,45),(38,'Rosaleen Braid',642441584,'3 Lunder Park','rbraid11','B7rux1',11,31),(39,'Gretel Scarce',977123499,'2 Hazelcrest Drive','gscarce12','bsWvYE',17,60),(40,'Kippie Idle',758784986,'581 Carioca Lane','kidle13','uMUL6k8i',11,66),(41,'Atlanta Acklands',952824787,'83622 Truax Lane','aacklands14','DH6actKxuD',1,50),(42,'Rube Howselee',970239356,'09 Norway Maple Hill','rhowselee15','rvbb7Thy',14,19),(43,'Emmerich Egentan',943322334,'3882 Old Shore Center','eegentan16','SC5UjFa3Hv3',2,53),(44,'Rori Spyer',963021800,'76 Northridge Hill','rspyer17','TAQHmSSg',11,78),(45,'Veronika Sword',891502555,'841 Meadow Valley Place','vsword18','5SQgOMe23E',1,86),(46,'Leena MacMoyer',789037080,'95217 Kensington Point','lmacmoyer19','3BcfmFmGF',17,1),(47,'Rahel Lagne',653132359,'251 Garrison Center','rlagne1a','uFDvIsCy6JKa',13,93),(48,'Lombard Bassam',985564645,'0718 Red Cloud Court','lbassam1b','q2B9NBkUMZ',4,71),(49,'Danila O\'Curneen',692779860,'53 Sage Junction','docurneen1c','MygNoMJD3V',8,11),(50,'Tobie Droghan',685217893,'23 4th Alley','tdroghan1d','ZE9JdRz',4,6),(51,'Samantha Gallamore',914359257,'4535 Carpenter Point','sgallamore1e','MXzZFPGLd',12,1),(52,'Faunie Doyle',637183274,'6698 Cody Street','fdoyle1f','TORgUfO',10,10),(53,'Lennard Gillings',969465786,'961 Forest Dale Road','lgillings1g','XuvlVOD5',17,1),(54,'Haleigh Gerrelts',973938064,'7 Darwin Plaza','hgerrelts1h','Hx5vpFgOOZV',10,42),(55,'Timothy Boribal',829428433,'6461 Schiller Pass','tboribal1i','j9N6XtjOvx5o',4,80),(56,'Marylee Gisbey',632712440,'30057 Anthes Center','mgisbey1j','7PRaS7YKD',2,37),(57,'Woody Surgen',856726238,'340 Mifflin Lane','wsurgen1k','8WE1EXWu2ec',4,83),(58,'Alvin Rack',993237140,'1281 Artisan Point','arack1l','7FSdt3I1vR',1,65),(59,'Harcourt Alliberton',867188049,'2 Schlimgen Street','halliberton1m','cNsDg0kgav',14,76),(60,'Von Strudwick',927539293,'30266 Caliangt Crossing','vstrudwick1n','LHbxX0ji5t',13,72),(61,'Nickolaus Deverille',685991410,'34 Morning Lane','ndeverille1o','q6B7zf5',6,64),(62,'Jule Piccop',724823192,'3 Graceland Road','jpiccop1p','Ss6tn4vkE',5,44),(63,'Reidar de Nore',792552454,'7 Homewood Point','rde1q','UafcQl',3,51),(64,'Abigale Schonfeld',797997032,'999 Sauthoff Place','aschonfeld1r','ZZSgCJUFnp2k',14,20),(65,'Celisse Sherborne',678887533,'90323 Blue Bill Park Crossing','csherborne1s','EvbArx2Skyf',13,86),(66,'Rubie Petigrew',927049918,'93255 Novick Court','rpetigrew1t','VBAECvEZi8v',14,68),(67,'Clareta Crean',851990872,'049 Derek Street','ccrean1u','XMrpGuxhL',16,91),(68,'Ulberto Baiyle',815078953,'464 Meadow Vale Way','ubaiyle1v','UQdT37XP5',15,27),(69,'Filmore Kryska',909338759,'8 Moulton Parkway','fkryska1w','Dl3poNvQZBqh',3,98),(70,'Isaiah Stutely',857940274,'0 Hoepker Crossing','istutely1x','ySLhtZGPC',20,12),(71,'Wylma Elleton',849766509,'30 Atwood Terrace','welleton1y','4Fqx9k8nc',10,14),(72,'Rosy McGragh',927015625,'55 Aberg Crossing','rmcgragh1z','NkvWgoT',2,91),(73,'Fidel Bunner',975263116,'25192 Laurel Pass','fbunner20','Re1zqGEn',12,36),(74,'Maria Lissemore',687380147,'3820 Bartelt Trail','mlissemore21','x6wzKIiHIni0',2,62),(75,'Bondie McHale',600831729,'79761 Walton Court','bmchale22','RwkqIJqvp2Fz',19,39),(76,'Angelico Crutchfield',824087061,'74 Cody Court','acrutchfield23','IK16Zr2CX1UE',13,51),(77,'Grantley Stedman',649314751,'254 Badeau Park','gstedman24','hz6rZXkQ',17,78),(78,'Lelia Chelsom',884980999,'6 Lawn Avenue','lchelsom25','QPaEzX',16,22),(79,'Erek McGray',695181460,'5 Lerdahl Avenue','emcgray26','2Hj1hrvzR',2,90),(80,'Josy Duggan',620517545,'2 Maple Wood Pass','jduggan27','FY2Gjk9g08F4',9,86),(81,'Camella Lowes',997277812,'4 Mcbride Circle','clowes28','03dT6OoGjQW8',8,39),(82,'Georgy Vanyakin',883927210,'3 Hayes Point','gvanyakin29','rcz8ylt9',10,72),(83,'Vincents Bosquet',928565100,'35162 Talmadge Avenue','vbosquet2a','ZzYDoD',13,72),(84,'Kimberli Cabena',680297156,'5 Rieder Center','kcabena2b','57zBzoajzhQ',11,45),(85,'Nestor Skipp',612896892,'79382 Harbort Way','nskipp2c','puIlNtX',9,81),(86,'Richmound Philcott',658845901,'18084 Boyd Avenue','rphilcott2d','UwN67New',15,4),(87,'Avictor Rotchell',828021379,'70033 Schurz Lane','arotchell2e','QzQ7jl',19,63),(88,'Kippy Huxtable',654138125,'76820 Dwight Plaza','khuxtable2f','KfJNulWOeW',6,9),(89,'Melanie Bradfield',985214470,'58 Carberry Trail','mbradfield2g','7WxhSQ',8,3),(90,'Rick Ferrant',626985188,'11 Granby Pass','rferrant2h','WJ3fiW0kDX',6,67),(91,'Dominga Danielsky',908825723,'33 Independence Place','ddanielsky2i','G54F0LXP',16,81),(92,'Stefano McDermott',707455796,'268 Sage Court','smcdermott2j','ezMqiokYC2qA',10,61),(93,'Devonne Owlner',677679369,'70 Valley Edge Street','dowlner2k','v3BssNhUJ',19,90),(94,'Rhett Brood',826568055,'197 Dunning Avenue','rbrood2l','buPju8iZvrP',3,82),(95,'Melli Angric',693532901,'244 Macpherson Circle','mangric2m','gDPv55',8,59),(96,'Claudian Gotobed',916433981,'24405 Lukken Pass','cgotobed2n','xAM9JL3Jv6z',5,57),(97,'Dorthy Corness',843894115,'72116 Aberg Trail','dcorness2o','YSQaRk4fOTe',8,7),(98,'Devondra Burge',803227725,'9 Barnett Parkway','dburge2p','REp8Xy',13,42),(99,'Anatola Strognell',747970201,'1 Westerfield Point','astrognell2q','j6zDULdt44',6,28),(100,'Mellisent Egan',978383732,'6786 Homewood Hill','megan2r','D0ovVc',1,36);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order_partner_link`
--

DROP TABLE IF EXISTS `customer_order_partner_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order_partner_link` (
  `customer_id_order` int unsigned NOT NULL,
  `delivery_id` int unsigned NOT NULL,
  `order_id_completed` int unsigned NOT NULL,
  KEY `delivery_partner_id_idx` (`delivery_id`),
  KEY `order_id_idx` (`order_id_completed`),
  KEY `customer_id_idx` (`customer_id_order`),
  CONSTRAINT `customer_id_order` FOREIGN KEY (`customer_id_order`) REFERENCES `customer` (`idCustomer`),
  CONSTRAINT `delivery_id` FOREIGN KEY (`delivery_id`) REFERENCES `delivery_partner` (`idDelivery_Partner`),
  CONSTRAINT `order_id_completed` FOREIGN KEY (`order_id_completed`) REFERENCES `order` (`idOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order_partner_link`
--

LOCK TABLES `customer_order_partner_link` WRITE;
/*!40000 ALTER TABLE `customer_order_partner_link` DISABLE KEYS */;
INSERT INTO `customer_order_partner_link` VALUES (4,20,51),(18,3,59),(66,12,20),(98,19,47),(9,14,21),(21,4,48),(24,7,51),(60,19,67),(47,10,49),(61,20,63),(18,11,88),(1,11,21),(44,3,92),(13,2,98),(82,2,79),(62,17,71),(33,13,85),(3,4,96),(78,4,3),(83,11,72),(13,6,61),(44,19,43),(89,19,55),(83,10,25),(37,5,89),(16,4,19),(60,18,79),(98,8,7),(96,11,50),(65,3,87),(74,6,94),(75,10,34),(30,12,27),(39,4,32),(22,3,52),(52,12,83),(87,8,13),(88,20,62),(46,18,53),(19,10,63),(9,14,13),(91,8,66),(26,1,95),(39,5,65),(68,1,35),(37,20,21),(88,13,92),(58,8,66),(68,15,14),(81,10,40),(65,14,79),(73,8,71),(21,1,45),(82,15,93),(80,3,37),(12,7,13),(36,5,27),(63,4,37),(96,13,31),(99,4,49),(85,12,45),(70,11,13),(65,18,4),(93,17,91),(14,14,68),(99,16,25),(17,2,19),(87,18,43),(53,7,18),(3,17,39),(32,1,60),(6,11,50),(86,19,40),(8,12,31),(31,17,24),(17,20,2),(16,6,16),(81,16,6),(46,5,75),(51,6,63),(33,1,50),(91,12,31),(8,15,73),(68,14,84),(91,18,39),(59,19,79),(13,20,9),(2,10,82),(36,2,99),(77,10,84),(19,11,17),(27,9,26),(43,12,79),(2,2,5),(26,16,31),(69,6,71),(42,1,57),(49,4,92),(13,6,95),(17,5,19);
/*!40000 ALTER TABLE `customer_order_partner_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_partner`
--

DROP TABLE IF EXISTS `delivery_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partner` (
  `idDelivery_Partner` int unsigned NOT NULL AUTO_INCREMENT,
  `partner_name` char(45) NOT NULL,
  `partner_contact` int NOT NULL,
  `partner_rating` int NOT NULL,
  `order_id` int unsigned NOT NULL,
  PRIMARY KEY (`idDelivery_Partner`),
  KEY `order_id_idx` (`order_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`idOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partner`
--

LOCK TABLES `delivery_partner` WRITE;
/*!40000 ALTER TABLE `delivery_partner` DISABLE KEYS */;
INSERT INTO `delivery_partner` VALUES (1,'Ralph Schoolfield',887568040,1,77),(2,'Romona Greschik',817653177,1,91),(3,'Linnet Biggs',996836790,3,83),(4,'Niles Worms',612828031,2,30),(5,'Valenka Fairbrother',663749663,4,96),(6,'Udall Domaschke',875262962,1,59),(7,'Quillan Dudson',998661265,0,16),(8,'Rudie Haith',980939483,2,25),(9,'Darice Warkup',969894941,3,41),(10,'Vincenz Potten',791164530,3,16),(11,'Trisha Harteley',610277182,4,8),(12,'Jeannie Pickwell',833558656,1,71),(13,'Enrichetta Paunsford',704204952,4,40),(14,'Zebulen Boam',859275695,0,9),(15,'Erna Pile',981306351,1,58),(16,'Jorgan Buttle',882456535,1,68),(17,'Jose Mochar',690538209,3,39),(18,'Elysha Danilchik',668219262,2,58),(19,'Massimiliano Antoniazzi',942767714,5,89),(20,'Doyle Boich',816789049,3,41);
/*!40000 ALTER TABLE `delivery_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discount_name` varchar(50) DEFAULT NULL,
  `discount_percent` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'Holi',37,'2022-11-30','2022-06-29'),(2,'Holi',78,'2022-03-04','2022-10-08');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `idEmployee` int unsigned NOT NULL AUTO_INCREMENT,
  `employee_name` char(45) NOT NULL,
  `job_title` char(45) NOT NULL,
  `salary` int NOT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Angelique Bugler','Dental Hygienist',10000),(2,'Janeva Congdon','Web Designer IV',10000),(3,'Mano Gilliatt','Engineer II',12000),(4,'Hobart Besse','Business Systems Development Analyst',14000),(5,'Karon Lethbrig','Technical Writer',15000),(6,'Margaux Bavister','Nurse',10000),(7,'Grete Lukesch','Project Manager',10000),(8,'Derick Braunton','Staff Accountant II',14000),(9,'Boris Waples','Senior Quality Engineer',15000),(10,'Udell Frith','Research Associate',10000);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idOrder` int unsigned NOT NULL AUTO_INCREMENT,
  `mode_of_payment` char(45) NOT NULL,
  `total_amount` int NOT NULL,
  `estimated_time_of_delivery` date NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  `products_on_discount` longtext NOT NULL,
  `minimum_order_value` int NOT NULL,
  `max_discount` int NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`idCustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'credit card',84762,'2023-01-30','529 Mosinee Drive','Cookie - Oreo 100x2',279,1860,69),(2,'COD',61737,'2022-06-02','2 3rd Pass','Oil - Cooking Spray',678,5977,44),(3,'UPI',64967,'2022-03-04','49 Fuller Center','Wine - Vouvray Cuvee Domaine',688,3715,3),(4,'net banking',50523,'2022-12-07','64 Graceland Center','Flower - Commercial Bronze',630,997,99),(5,'COD',1010,'2022-08-31','6 Kedzie Street','Seedlings - Buckwheat, Organic',897,497,10),(6,'net banking',56764,'2023-02-01','7 Springs Center','Ice Cream Bar - Rolo Cone',124,5221,57),(7,'UPI',21569,'2023-02-08','6110 Sunfield Court','Apple - Macintosh',520,3704,84),(8,'credit card',26873,'2022-10-29','2 Harbort Place','Lettuce - Lolla Rosa',727,5318,24),(9,'credit card',19695,'2022-06-15','50 Oneill Alley','Cake Slab',367,3352,47),(10,'net banking',70075,'2022-07-29','8 Hazelcrest Terrace','Beer - Camerons Cream Ale',189,5226,60),(11,'COD',84858,'2022-11-21','3 Kenwood Drive','Burger Veggie',509,985,31),(12,'COD',51207,'2022-02-10','231 Amoth Junction','Knife Plastic - White',665,4250,74),(13,'UPI',94605,'2022-06-24','666 Redwing Court','Shichimi Togarashi Peppeers',373,1486,45),(14,'credit card',47580,'2022-05-07','3919 3rd Junction','Pepsi - Diet, 355 Ml',697,2191,18),(15,'credit card',98474,'2022-04-20','55772 Reinke Avenue','Wheat - Soft Kernal Of Wheat',442,4978,67),(16,'COD',91807,'2023-01-04','1167 North Terrace','Tomatillo',611,1402,43),(17,'COD',252,'2022-05-30','0129 Fisk Terrace','Dc - Sakura Fu',842,8117,80),(18,'credit card',59144,'2022-08-24','53708 Sundown Circle','Lamb - Leg, Bone In',896,9248,42),(19,'credit card',23604,'2022-10-12','17577 Upham Park','Nut - Walnut, Chopped',254,5090,74),(20,'net banking',50863,'2023-02-03','79 Farmco Plaza','Galliano',277,6960,48),(21,'UPI',931,'2022-06-10','6034 Weeping Birch Drive','Pie Box - Cello Window 2.5',918,5446,32),(22,'UPI',64215,'2023-01-28','13 Esch Plaza','Mortadella',783,3614,40),(23,'credit card',84481,'2022-05-18','7854 Stang Hill','Soup - Campbells, Butternut',696,7878,31),(24,'UPI',78863,'2022-06-01','95583 Fremont Circle','Bread - Sour Sticks With Onion',436,4860,57),(25,'COD',69809,'2022-10-13','0 Lillian Crossing','Cape Capensis - Fillet',953,5984,82),(26,'COD',86464,'2022-04-13','8 Dryden Court','Cognac - Courvaisier',848,7181,90),(27,'COD',15677,'2022-02-20','274 Vernon Parkway','Ginsing - Fresh',676,7643,27),(28,'credit card',5238,'2022-10-26','35970 Riverside Parkway','Mackerel Whole Fresh',521,894,37),(29,'COD',70179,'2023-01-25','4 Sage Pass','Nantucket Apple Juice',300,9634,10),(30,'credit card',36397,'2022-06-12','9630 Nelson Way','Tofu - Soft',678,1845,64),(31,'net banking',66889,'2022-03-19','06151 Judy Drive','Ecolab - Hand Soap Form Antibac',661,3806,23),(32,'UPI',9726,'2022-02-21','3082 Menomonie Plaza','Pasta - Fusili Tri - Coloured',381,6393,30),(33,'net banking',27972,'2022-03-29','1 Cordelia Drive','Juice - V8 Splash',618,6764,24),(34,'net banking',69802,'2022-05-17','42142 Forster Point','Soy Protein',854,131,3),(35,'COD',564,'2022-10-12','5 Menomonie Avenue','Soup - Cream Of Broccoli',319,9006,80),(36,'COD',73519,'2022-09-29','21 Holmberg Alley','Wiberg Cure',830,9027,53),(37,'credit card',36275,'2022-05-24','582 Caliangt Road','Rice - Long Grain',118,398,77),(38,'credit card',70699,'2022-09-16','5340 Tomscot Court','Curry Paste - Madras',806,2844,57),(39,'credit card',9155,'2023-01-05','40391 Dottie Pass','Pasta - Fusili, Dry',362,7785,98),(40,'UPI',22397,'2022-04-20','375 American Ash Circle','Crab - Meat',175,2243,43),(41,'UPI',10897,'2022-11-02','9 Glacier Hill Pass','Pate - Cognac',349,7836,9),(42,'UPI',41394,'2022-05-18','1 Magdeline Center','Banana',549,4469,20),(43,'UPI',61011,'2022-11-19','05756 Mcbride Point','Sesame Seed',408,1356,64),(44,'UPI',19779,'2022-04-06','4439 Schiller Lane','Cake - Pancake',652,435,51),(45,'credit card',80531,'2022-12-21','95 Lawn Hill','Croissant, Raw - Mini',625,197,41),(46,'UPI',3071,'2023-01-03','9650 Garrison Court','Tea - Camomele',840,2782,4),(47,'COD',80331,'2022-05-10','20007 Express Avenue','Dc - Frozen Momji',552,2284,40),(48,'UPI',52126,'2022-08-19','735 Pearson Park','Milk Powder',794,4319,48),(49,'net banking',72488,'2022-07-30','8 Holmberg Road','Muffin Mix - Corn Harvest',417,9173,20),(50,'UPI',477,'2022-10-07','8508 Harbort Road','Dooleys Toffee',144,7075,45),(51,'credit card',87506,'2022-05-29','029 Cascade Junction','Orange - Blood',738,1997,73),(52,'COD',21765,'2022-05-22','831 Swallow Plaza','Cheese - Cream Cheese',178,7197,11),(53,'net banking',81711,'2022-05-10','57 Stone Corner Crossing','Tea Peppermint',320,1268,34),(54,'net banking',39094,'2022-12-04','09 Swallow Way','Nantucket Orange Juice',900,7804,54),(55,'credit card',86760,'2022-08-29','54654 Donald Hill','Veal - Eye Of Round',389,6711,41),(56,'net banking',551,'2022-05-06','7863 Sutherland Pass','Wine - Fat Bastard Merlot',997,8269,84),(57,'COD',99483,'2022-03-09','374 Grayhawk Point','Cheese - Pont Couvert',757,3269,12),(58,'net banking',36020,'2022-06-11','14835 Esker Avenue','Trout - Rainbow, Frozen',197,5078,71),(59,'credit card',83412,'2022-07-13','62 David Pass','Cheese - Ricotta',933,6696,38),(60,'net banking',34042,'2022-12-23','61829 Everett Avenue','Sausage - Andouille',160,7454,13),(61,'credit card',1982,'2022-11-20','5 Butterfield Hill','Alize Red Passion',761,166,1),(62,'net banking',26473,'2022-06-16','8243 Drewry Park','Petit Baguette',640,854,11),(63,'net banking',31854,'2022-09-04','412 Banding Circle','Cherries - Frozen',671,3583,83),(64,'credit card',10287,'2022-08-24','77323 Charing Cross Drive','Flour - Strong',614,7342,33),(65,'net banking',64777,'2022-10-15','1717 Lindbergh Junction','Island Oasis - Pina Colada',994,7684,49),(66,'credit card',6937,'2022-10-15','723 Waxwing Avenue','Bread - White Epi Baguette',982,7895,70),(67,'credit card',35557,'2022-03-17','83994 Union Junction','Gingerale - Diet - Schweppes',121,9178,87),(68,'net banking',7270,'2022-04-30','06 Westerfield Crossing','Rhubarb',162,9243,7),(69,'UPI',37360,'2022-08-07','1668 Pleasure Lane','Beer - Camerons Cream Ale',584,6775,53),(70,'COD',50206,'2023-01-25','9889 Mayfield Alley','Wine - Clavet Saint Emilion',216,8505,82),(71,'COD',35748,'2022-07-19','4 Farmco Court','Muffin Orange Individual',681,5108,38),(72,'COD',32945,'2023-01-14','751 Blue Bill Park Trail','Muffin Hinge 117n',251,7262,50),(73,'UPI',9585,'2022-06-02','5415 Hansons Pass','Foam Dinner Plate',271,8728,69),(74,'UPI',9034,'2023-01-18','3 Pepper Wood Place','Plastic Arrow Stir Stick',253,9824,10),(75,'UPI',77202,'2023-01-14','57 Cardinal Court','Toothpick Frilled',420,3704,89),(76,'UPI',85279,'2022-07-05','2 Lotheville Plaza','Cheese - Parmigiano Reggiano',422,4668,46),(77,'credit card',60833,'2022-07-19','7333 Main Place','Blackberries',653,2533,62),(78,'UPI',22266,'2022-04-11','43659 Southridge Park','Squid U5 - Thailand',779,5968,100),(79,'net banking',38515,'2022-10-10','234 Carey Drive','Arizona - Green Tea',263,3056,77),(80,'COD',65911,'2023-01-13','6251 Lawn Parkway','Straws - Cocktale',167,4985,44),(81,'COD',58868,'2022-11-11','064 Fallview Terrace','Pepper - Yellow Bell',634,8326,95),(82,'UPI',81286,'2022-06-06','8077 Elka Way','Crush - Cream Soda',363,8999,20),(83,'net banking',37919,'2023-01-02','30 Stang Way','Shrimp - Baby, Cold Water',343,4195,92),(84,'net banking',55852,'2022-10-26','337 Hooker Terrace','Island Oasis - Strawberry',388,7455,84),(85,'net banking',73873,'2022-09-19','2 Crescent Oaks Junction','Wood Chips - Regular',371,425,44),(86,'COD',78407,'2022-08-14','1 Novick Pass','Pork - Sausage, Medium',420,4347,19),(87,'COD',74921,'2022-12-25','2 Northview Way','Cheese - Cheddar, Mild',418,9192,40),(88,'COD',11880,'2022-08-29','96 Vahlen Plaza','Cod - Black Whole Fillet',390,4282,66),(89,'UPI',40285,'2022-02-16','5 Banding Alley','Wine - Magnotta, Merlot Sr Vqa',427,1478,55),(90,'net banking',11872,'2023-02-05','4 Lighthouse Bay Point','Capon - Breast, Double, Wing On',621,994,99),(91,'UPI',25675,'2022-03-06','3 Saint Paul Road','Mackerel Whole Fresh',597,7510,47),(92,'COD',82930,'2022-04-11','7492 Briar Crest Lane','Nantucket - Pomegranate Pear',512,4875,80),(93,'credit card',92391,'2022-12-23','62034 Kennedy Park','Turkey - Breast, Bone - In',936,4193,86),(94,'COD',94974,'2022-08-23','513 Hallows Pass','Muffins - Assorted',234,4547,89),(95,'net banking',20894,'2022-04-15','1 Nova Pass','Cup - Paper 10oz 92959',548,334,98),(96,'net banking',13530,'2023-01-15','4 Johnson Drive','Sauce - Fish 25 Ozf Bottle',891,7690,68),(97,'COD',92783,'2022-06-27','2580 Hoard Drive','Wine - Two Oceans Sauvignon',296,8559,10),(98,'credit card',4190,'2022-07-08','29919 Sunnyside Parkway','Gatorade - Xfactor Berry',142,1133,47),(99,'credit card',15684,'2022-04-23','07854 3rd Drive','Soup - Tomato Mush. Florentine',175,6184,100),(100,'net banking',76084,'2022-05-12','476 Beilfuss Alley','Grenadillo',459,368,50);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` char(45) NOT NULL,
  `product_type` char(45) NOT NULL,
  `product_quantity` int DEFAULT NULL,
  `product_price` varchar(45) NOT NULL,
  `expiry_date` date NOT NULL,
  `discount_percent` int NOT NULL,
  `aisle_number` int NOT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Beef - Bresaola','Outdoors',946,'413','2022-05-01',62,37),(2,'Nantucket - Orange Mango Cktl','Home',136,'489','2022-07-05',57,20),(3,'Wine - Cava Aria Estate Brut','Tools',420,'802','2023-01-13',6,99),(4,'Onion - Dried','Beauty',585,'315','2022-03-04',64,39),(5,'Wonton Wrappers','Books',674,'264','2022-04-14',29,49),(6,'Cheese - Cheddar With Claret','Computers',601,'898','2023-01-27',17,93),(7,'Beef Wellington','Home',377,'131','2022-03-29',85,11),(8,'Chocolate - Compound Coating','Grocery',204,'831','2022-08-22',7,58),(9,'Bread - Rolls, Rye','Beauty',954,'66','2022-12-09',67,90),(10,'Mustard - Pommery','Books',331,'600','2023-01-18',57,73),(11,'Laundry - Bag Cloth','Music',989,'321','2022-09-22',13,5),(12,'Pasta - Canelloni, Single Serve','Baby',670,'238','2022-08-01',99,79),(13,'Wine - Saint Emilion Calvet','Electronics',769,'296','2022-04-22',98,62),(14,'Coconut - Creamed, Pure','Music',330,'609','2022-06-02',77,88),(15,'Beer - Mill St Organic','Games',326,'859','2022-10-21',97,58),(16,'Wine - Red, Metus Rose','Kids',985,'45','2022-05-24',39,71),(17,'Tuna - Fresh','Games',442,'126','2022-05-21',21,50),(18,'Carbonated Water - Lemon Lime','Movies',414,'759','2022-08-04',23,75),(19,'Capers - Ox Eye Daisy','Beauty',289,'578','2022-05-12',41,45),(20,'Gelatine Leaves - Bulk','Jewelry',641,'568','2022-06-11',10,65),(21,'Milk - Homo','Grocery',960,'944','2023-01-21',36,95),(22,'Rabbit - Whole','Games',725,'178','2022-12-05',70,97),(23,'Sugar - Brown','Toys',584,'844','2022-06-17',63,62),(24,'Oil - Safflower','Movies',309,'888','2022-09-25',28,79),(25,'Wine - Barbera Alba Doc 2001','Baby',403,'501','2023-01-15',77,48),(26,'Appetizer - Spring Roll, Veg','Clothing',974,'490','2022-08-15',14,15),(27,'Wine - Lamancha Do Crianza','Shoes',908,'283','2022-12-05',88,64),(28,'Tomatoes - Plum, Canned','Movies',146,'353','2022-05-14',90,9),(29,'Soap - Hand Soap','Toys',131,'214','2022-02-26',87,66),(30,'Sobe - Cranberry Grapefruit','Games',179,'52','2022-07-09',46,35),(31,'Kellogs Cereal In A Cup','Clothing',172,'283','2022-03-07',88,21),(32,'Squid - U 5','Clothing',969,'831','2022-12-31',94,7),(33,'Wine - Pinot Noir Stoneleigh','Movies',556,'9','2022-05-21',90,13),(34,'Squid - Breaded','Grocery',958,'50','2022-05-08',81,71),(35,'Salmon - Atlantic, Skin On','Tools',448,'304','2023-02-06',66,30),(36,'Peach - Halves','Shoes',508,'377','2022-10-07',3,60),(37,'Crab - Dungeness, Whole, live','Sports',538,'907','2022-06-16',12,66),(38,'Flower - Carnations','Tools',159,'621','2022-10-09',85,46),(39,'Brandy - Orange, Mc Guiness','Outdoors',536,'88','2022-09-01',39,48),(40,'Oregano - Fresh','Sports',812,'212','2022-03-04',97,23),(41,'Kiwano','Jewelry',149,'485','2022-06-24',66,6),(42,'Cheese - Feta','Automotive',380,'503','2022-08-11',86,48),(43,'Veal - Inside, Choice','Books',599,'871','2022-10-17',26,52),(44,'Truffle Cups - Red','Kids',953,'610','2022-09-26',43,25),(45,'Wasabi Powder','Music',932,'843','2023-01-06',85,89),(46,'Longos - Lasagna Veg','Grocery',883,'990','2022-11-21',36,86),(47,'Energy Drink - Redbull 355ml','Toys',233,'330','2022-05-22',13,54),(48,'Breadfruit','Jewelry',229,'7','2022-07-21',67,20),(49,'Banana Turning','Jewelry',532,'964','2022-10-11',28,49),(50,'Cheese - Mascarpone','Music',741,'737','2022-08-29',29,44),(51,'Wine - White, Chardonnay','Clothing',892,'349','2022-04-24',45,52),(52,'Sauce - Bernaise, Mix','Jewelry',643,'358','2022-09-28',70,29),(53,'Tomato - Peeled Italian Canned','Garden',159,'814','2022-12-22',13,66),(54,'Clams - Bay','Kids',723,'983','2022-11-25',42,36),(55,'V8 - Tropical Blend','Beauty',396,'74','2022-10-28',61,72),(56,'Foam Tray S2','Tools',480,'93','2022-11-06',21,27),(57,'Turnip - Mini','Garden',681,'893','2022-09-05',68,46),(58,'Soup - French Onion','Outdoors',585,'527','2022-08-30',4,8),(59,'Coffee Cup 8oz 5338cd','Movies',443,'299','2022-05-04',76,95),(60,'Saskatoon Berries - Frozen','Home',131,'464','2022-06-22',66,65),(61,'Sauerkraut','Music',480,'49','2023-01-21',75,56),(62,'Flower - Potmums','Home',483,'610','2022-03-07',12,19),(63,'Bread - Ciabatta Buns','Garden',451,'881','2022-10-04',8,66),(64,'Container - Foam Dixie 12 Oz','Garden',718,'4','2022-06-17',20,92),(65,'Table Cloth 120 Round White','Outdoors',779,'761','2022-02-26',7,73),(66,'Salt - Table','Books',207,'45','2022-11-17',11,29),(67,'Wine - White, Pinot Grigio','Home',239,'906','2022-06-28',40,30),(68,'Basil - Fresh','Jewelry',407,'291','2022-06-23',46,47),(69,'Wine - Alicanca Vinho Verde','Home',187,'654','2022-08-22',65,83),(70,'Cheese - Cheddar, Old White','Grocery',218,'767','2022-07-08',52,4),(71,'Squash - Butternut','Baby',237,'108','2022-06-04',66,59),(72,'Icecream Cone - Areo Chocolate','Garden',262,'153','2022-02-14',73,7),(73,'Wine - Marlbourough Sauv Blanc','Garden',101,'39','2022-04-15',42,43),(74,'Juice - Propel Sport','Shoes',526,'593','2023-01-29',40,84),(75,'Coffee Caramel Biscotti','Health',198,'352','2022-09-09',31,15),(76,'Lotus Rootlets - Canned','Health',369,'679','2022-08-09',82,66),(77,'Salmon - Atlantic, Fresh, Whole','Games',270,'433','2022-06-14',1,39),(78,'Oneshot Automatic Soap System','Electronics',485,'163','2022-04-21',54,13),(79,'Pasta - Cheese / Spinach Bauletti','Automotive',915,'998','2022-10-09',15,82),(80,'Wine - Bourgogne 2002, La','Grocery',460,'51','2022-07-11',65,99),(81,'Wine - Mondavi Coastal Private','Music',252,'138','2022-10-17',90,28),(82,'Cheese - Boursin, Garlic / Herbs','Home',936,'101','2022-07-19',94,85),(83,'Grapes - Red','Books',633,'315','2023-01-07',66,98),(84,'Muffin - Mix - Strawberry Rhubarb','Home',882,'618','2022-07-08',34,12),(85,'Syrup - Monin - Passion Fruit','Kids',843,'154','2022-07-13',53,59),(86,'Tarragon - Primerba, Paste','Garden',839,'263','2022-05-09',81,16),(87,'Muffin Batt - Choc Chk','Automotive',391,'720','2022-05-10',44,92),(88,'Tarts Assorted','Automotive',615,'61','2022-07-30',33,92),(89,'Rye Special Old','Electronics',501,'493','2022-03-08',24,32),(90,'Stock - Beef, Brown','Garden',501,'374','2022-12-08',62,97),(91,'Table Cloth 90x90 Colour','Grocery',864,'396','2023-01-31',70,74),(92,'Wine - Prosecco Valdobiaddene','Shoes',382,'435','2022-10-19',67,5),(93,'Soup - French Onion, Dry','Sports',647,'842','2022-10-28',87,86),(94,'Pail - 15l White, With Handle','Tools',776,'8','2022-04-23',70,86),(95,'Lamb - Leg, Bone In','Movies',286,'373','2022-06-20',65,76),(96,'Cornflakes','Electronics',328,'96','2022-08-15',15,46),(97,'Veal - Brisket, Provimi,bnls','Shoes',281,'955','2022-05-01',99,69),(98,'Beef - Sushi Flat Iron Steak','Jewelry',830,'178','2022-08-07',58,90),(99,'Mushroom - Trumpet, Dry','Shoes',812,'567','2022-10-19',32,51),(100,'Lettuce - Boston Bib','Clothing',871,'717','2022-04-19',38,19);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_in_cart`
--

DROP TABLE IF EXISTS `products_in_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_in_cart` (
  `product_id_inCart` int unsigned NOT NULL,
  `cart_id_inside` int unsigned NOT NULL,
  KEY `product_id_idx` (`product_id_inCart`),
  KEY `cart_id_idx` (`cart_id_inside`),
  CONSTRAINT `cart_id_inside` FOREIGN KEY (`cart_id_inside`) REFERENCES `cart` (`idCart`),
  CONSTRAINT `product_id_inCart` FOREIGN KEY (`product_id_inCart`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_in_cart`
--

LOCK TABLES `products_in_cart` WRITE;
/*!40000 ALTER TABLE `products_in_cart` DISABLE KEYS */;
INSERT INTO `products_in_cart` VALUES (31,22),(11,4),(72,74),(86,88),(88,52),(81,69),(25,59),(69,50),(91,43),(88,32),(23,78),(23,34),(63,45),(90,65),(74,68),(44,72),(83,94),(43,82),(52,50),(84,8),(85,96),(20,66),(46,19),(54,33),(53,31),(35,18),(60,2),(76,75),(76,47),(51,94),(96,82),(17,92),(31,15),(75,78),(73,9),(17,91),(35,92),(29,80),(11,78),(87,94),(48,75),(45,5),(55,59),(88,96),(90,10),(34,38),(5,26),(97,20),(99,3),(77,12),(44,9),(94,31),(4,76),(9,45),(94,27),(12,53),(15,49),(11,17),(58,61),(96,5),(80,16),(41,73),(60,20),(78,63),(94,25),(55,18),(16,65),(43,55),(43,46),(51,35),(78,46),(95,23),(77,87),(69,19),(1,30),(63,10),(92,27),(68,36),(48,6),(3,29),(29,21),(33,17),(67,98),(45,58),(87,27),(12,78),(17,64),(31,20),(68,52),(56,42),(26,54),(28,23),(83,71),(66,100),(82,87),(31,77),(89,21),(31,51),(44,62),(83,79);
/*!40000 ALTER TABLE `products_in_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `idRating` int NOT NULL,
  `delivery_partner_id` int unsigned NOT NULL,
  `customer_id_rates` int unsigned NOT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`idRating`),
  KEY `delivery_partner_id_idx` (`delivery_partner_id`),
  KEY `customer_id_idx` (`customer_id_rates`) /*!80000 INVISIBLE */,
  CONSTRAINT `customer_id_rates` FOREIGN KEY (`customer_id_rates`) REFERENCES `customer` (`idCustomer`),
  CONSTRAINT `delivery_partner_id` FOREIGN KEY (`delivery_partner_id`) REFERENCES `delivery_partner` (`idDelivery_Partner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,4,24,5),(2,2,11,2),(3,4,28,2),(4,9,49,1),(5,9,44,1),(6,5,69,3),(7,16,88,2),(8,17,22,4),(9,15,41,3),(10,18,61,1),(11,7,69,3),(12,1,74,2),(13,1,96,3),(14,5,19,2),(15,4,10,5),(16,14,58,5),(17,20,6,1),(18,19,21,1),(19,14,50,3),(20,12,36,2),(21,5,86,5),(22,2,90,1),(23,17,21,1),(24,7,91,5),(25,17,52,3),(26,20,90,2),(27,15,59,3),(28,3,47,5),(29,1,26,2),(30,11,66,1),(31,3,60,1),(32,15,73,5),(33,19,44,1),(34,9,17,2),(35,20,9,1),(36,18,1,5),(37,16,57,4),(38,19,11,4),(39,11,26,3),(40,8,85,4),(41,8,25,4),(42,13,21,2),(43,8,70,4),(44,2,51,1),(45,19,78,5),(46,14,99,2),(47,7,44,5),(48,6,77,1),(49,13,55,3),(50,5,68,1),(51,1,25,4),(52,12,82,4),(53,17,98,4),(54,2,97,2),(55,10,69,1),(56,8,30,4),(57,9,7,1),(58,4,82,4),(59,1,87,1),(60,12,37,3),(61,7,97,4),(62,3,37,2),(63,8,38,3),(64,1,52,3),(65,19,93,4),(66,11,53,5),(67,14,26,4),(68,9,26,1),(69,17,93,2),(70,20,90,2),(71,14,47,2),(72,8,24,3),(73,12,3,2),(74,19,73,1),(75,7,79,1),(76,10,40,1),(77,20,92,4),(78,1,15,3),(79,5,94,5),(80,20,23,1),(81,20,86,3),(82,14,33,5),(83,19,20,4),(84,12,96,3),(85,18,1,1),(86,10,40,1),(87,17,31,5),(88,12,66,3),(89,19,94,1),(90,16,98,5),(91,15,66,5),(92,16,82,1),(93,14,95,2),(94,3,84,3),(95,19,89,5),(96,19,93,2),(97,16,69,3),(98,17,9,2),(99,20,85,5),(100,5,75,2);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'badibasket'
--

--
-- Dumping routines for database 'badibasket'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-10 21:15:25
