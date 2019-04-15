-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: collegestalker
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `cfw`
--

DROP TABLE IF EXISTS `cfw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `college_id` int(11) unsigned NOT NULL,
  `fee` varchar(15) NOT NULL DEFAULT '0',
  `bus` varchar(15) NOT NULL DEFAULT '0',
  `hostel` varchar(15) NOT NULL DEFAULT '0',
  `infra` varchar(15) NOT NULL DEFAULT '0',
  `placement` varchar(15) NOT NULL DEFAULT '0',
  `discipline` varchar(15) NOT NULL DEFAULT '0',
  `clubs` varchar(15) NOT NULL DEFAULT '0',
  `reviews` varchar(15) NOT NULL DEFAULT '0',
  `affiliations` varchar(15) NOT NULL DEFAULT '0',
  `curriculum` varchar(15) NOT NULL DEFAULT '0',
  `duration` varchar(15) NOT NULL DEFAULT '0',
  `surrounding` varchar(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk8` (`college_id`),
  CONSTRAINT `fk8` FOREIGN KEY (`college_id`) REFERENCES `college_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfw`
--

LOCK TABLES `cfw` WRITE;
/*!40000 ALTER TABLE `cfw` DISABLE KEYS */;
INSERT INTO `cfw` VALUES (12,'2019-04-11 09:48:27',19,'20','5','12','8','6','6','4','8','14','10','9','8'),(13,'2019-04-11 09:59:39',20,'20','5','14','9','12','8','7','9','13','12','4','6'),(14,'2019-04-11 10:09:41',21,'20','3','12','8','6','6','3','6','13','7','7','8'),(15,'2019-04-11 10:18:42',22,'20','5','13','7','11','8','7','8','12','11','8','6'),(16,'2019-04-11 10:23:59',23,'20','8','10','7','13','6','7','9','14','13','6','8'),(17,'2019-04-11 10:28:29',24,'20','2','10','6','5','4','3','6','13','12','8','7'),(18,'2019-04-11 10:43:15',25,'20','8','12','8','10','5','6','8','9','10','7','3'),(19,'2019-04-11 10:45:56',26,'20','2','5','8','8','5','8','6','12','10','8','9'),(20,'2019-04-11 10:48:13',27,'20','9','10','9','8','8','9','5','10','8','6','8'),(21,'2019-04-11 10:52:56',28,'20','9','14','9','5','5','9','6','7','8','8','9'),(22,'2019-04-11 10:56:27',29,'20','9','14','9','11','7','8','8','10','12','5','8'),(23,'2019-04-11 10:58:13',30,'20','9','14','9','13','8','10','6','10','10','4','7'),(24,'2019-04-11 11:00:37',31,'20','7','12','8','12','6','9','8','11','12','5','8'),(25,'2019-04-11 11:02:55',32,'20','4','6','10','7','3','7','8','14','13','7','8');
/*!40000 ALTER TABLE `cfw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_details`
--

DROP TABLE IF EXISTS `college_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(63) NOT NULL,
  `email` varchar(63) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `state` varchar(31) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `fees` varchar(30) DEFAULT NULL,
  `bus` varchar(30) DEFAULT NULL,
  `hostel` varchar(30) DEFAULT NULL,
  `faculty` varchar(30) DEFAULT NULL,
  `naac` varchar(30) DEFAULT NULL,
  `pb` varchar(30) DEFAULT NULL,
  `surrounding` varchar(30) DEFAULT NULL,
  `students` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_mobile` (`contact`),
  KEY `fk3` (`type_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`type_id`) REFERENCES `college_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_details`
--

LOCK TABLES `college_details` WRITE;
/*!40000 ALTER TABLE `college_details` DISABLE KEYS */;
INSERT INTO `college_details` VALUES (19,'2019-04-15 07:16:34','APJ Abdul Kalam University','apjabdulkalamclg@gmail.com','+91-9760941714','Lucknow','Uttar Pradesh','261003',1,'upload_d184c469f9807024790e11fd1250c7ee','40000','Limited','8/10','500+','A','Yes','Urban','10000+'),(20,'2019-04-15 07:16:18',' Delhi Technical University','dtu@gmail.com','+91-9765141268','Delhi','Delhi','274002',1,'upload_6152821e56da5dff524b0d991bc96d60','65000','Limited','9/10','700+','A+','Yes','Rural','80000+'),(21,'2019-04-15 07:17:49','Deen Dayal Upadhyay University','dduu@gmail.com','+91-9765141456','Gorakhpur','Uttar Pradesh','276001',1,'upload_6ef0d3fe76368d7248972e263ca7a832','35000','Very limited','8/10','300+','A','Yes','Sub-Urban','8000+'),(22,'2019-04-15 07:19:15','Shaheed Bhagat Singh Institute of Technology','sbsit@gmail.com','+91-9765431211','Ferozpur','Punjab','312004',2,'upload_07e960b99e41f5b8a4ee464101c1e859','62000','Limited','5/10','500+','B+','Yes','Rural','4000+'),(23,'2019-04-15 07:20:42','Netaji Subhash Institute of Technology','nsit@gmail.com','+91-8126199171','Delhi','Delhi','271003',2,'upload_e6096c211763cef5cb9ad26c98b26242','48000','High availability','6/10','700+','A','No','Sub-Urban','3000+'),(24,'2019-04-15 07:22:04','Dayalbagh Institute of Technology','dayalbaghit@gmail.com','+91-9045788521','Agra','Uttar Pradesh','241003',2,'upload_fdb1cde9f0392171accd0d7933f6d94d','10000','Only for Staff','6/10','600+','A','Yes','Out of Residence area','1000+'),(25,'2019-04-15 07:23:41','Hindustan Institute of Science and Technology','hist@gmail.com','+91-5400312454','Agra','Uttar Pradesh','271005',4,'upload_bfcee526d661f9d2183ac6af32ee847f','140000','High availabiity','8/10','500+','B','Yes','Urban','2000+'),(26,'2019-04-15 07:26:58','BSA College of Technology','bsa@gmail.com','+91-8126151189','Mathura','Uttar Pradesh','281004',4,'upload_57dbced8004f0c31b9b872f092716f24','140000','Only for Staff','3/10','300+','B+','Yes','Urban','1500+'),(27,'2019-04-15 07:27:46','ABES Engineering college','abes@gmail.com','+91-9997774441','Ghaziabad','Uttar Pradesh','391412',4,'upload_1192cc30241f634f4029a5e0b2b7dbb7','200000','High availability','8.5/10','500+','A','Yes','Urban','1500+'),(28,'2019-04-15 07:29:00','Dalal Global Institute of Technology','dgiot@gmail.com','+91-8888811111','Delhi','Delhi','301010',4,'upload_0bac93800b63ce27a5f9482a72b02503','150000','High availability','9/10','600+','A','Yes','Urban','2600+'),(29,'2019-04-15 07:29:42','Indraprasth University','ipu@gmail.com','0565-281003','Delhi','Delhi','300001',3,'upload_07928f08921259bcdf981c1b4ad027e8','220000','High availability','9/10','400+','B+','No','Sub-Urban','2000+'),(30,'2019-04-15 07:30:28','Amity University','amityuniv@gmail.com','0565-240398','Noida','Uttar Pradesh','291004',3,'upload_8e74387d992294457c7efae3ebb51356','300000','High availability','9.5/10','800+','A','Yes','Sub-Urban','10000+'),(31,'2019-04-15 07:31:15','Chandigarh University','chandigarhuni@gmail.com','+91-6667778881','Chandigarh','Punjab','290001',3,'upload_16deee415e439ea30f3a48c31c400b75','150000','Available','8/10','500+','B+','Yes','Urban','1000+'),(32,'2019-04-15 07:31:54','Aligarh uslim University','amu@gmail.com','+91-8888888881','Aligarh','Uttar Pradesh','271003',1,'upload_677e8a58e15a20c67fd77b8d232a77ce','30000','Limited','7/10','400+','B+','Yes','Urban','2000+');
/*!40000 ALTER TABLE `college_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_spec`
--

DROP TABLE IF EXISTS `college_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_spec` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `college_id` int(11) unsigned NOT NULL,
  `spec_score` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk4` (`college_id`),
  CONSTRAINT `fk4` FOREIGN KEY (`college_id`) REFERENCES `college_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_spec`
--

LOCK TABLES `college_spec` WRITE;
/*!40000 ALTER TABLE `college_spec` DISABLE KEYS */;
INSERT INTO `college_spec` VALUES (1,'2019-04-14 20:20:20',19,73),(2,'2019-04-14 20:20:20',20,79),(3,'2019-04-14 20:20:20',21,66),(4,'2019-04-14 20:20:20',22,77),(5,'2019-04-14 20:20:20',23,81),(6,'2019-04-14 20:20:20',24,64),(7,'2019-04-14 20:20:20',25,71),(8,'2019-04-14 20:20:20',26,67),(9,'2019-04-14 20:20:20',27,73),(10,'2019-04-14 20:20:20',28,73),(11,'2019-04-14 20:20:20',29,81),(12,'2019-04-14 20:20:20',30,80),(13,'2019-04-14 20:20:20',31,79),(14,'2019-04-14 20:20:20',32,71);
/*!40000 ALTER TABLE `college_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college_type`
--

DROP TABLE IF EXISTS `college_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `college_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_type`
--

LOCK TABLES `college_type` WRITE;
/*!40000 ALTER TABLE `college_type` DISABLE KEYS */;
INSERT INTO `college_type` VALUES (1,'2019-03-10 17:59:23','Govt University'),(2,'2019-03-10 17:59:23','Govt College'),(3,'2019-03-10 17:59:23','Private Univ'),(4,'2019-03-10 17:59:23','Private College');
/*!40000 ALTER TABLE `college_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_fee`
--

DROP TABLE IF EXISTS `course_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course_id` int(11) unsigned NOT NULL,
  `college_id` int(11) unsigned NOT NULL,
  `avgfee` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk5` (`course_id`),
  KEY `fk9` (`college_id`),
  CONSTRAINT `fk5` FOREIGN KEY (`course_id`) REFERENCES `course_type` (`id`),
  CONSTRAINT `fk9` FOREIGN KEY (`college_id`) REFERENCES `college_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_fee`
--

LOCK TABLES `course_fee` WRITE;
/*!40000 ALTER TABLE `course_fee` DISABLE KEYS */;
INSERT INTO `course_fee` VALUES (11,'2019-04-11 09:48:27',1,19,'40000'),(12,'2019-04-11 09:59:39',1,20,'65000'),(13,'2019-04-11 10:09:40',1,21,'35000'),(14,'2019-04-11 10:18:41',1,22,'62000'),(15,'2019-04-11 10:23:59',1,23,'48000'),(16,'2019-04-11 10:28:28',1,24,'10000'),(17,'2019-04-11 10:43:15',1,25,'140000'),(18,'2019-04-11 10:45:56',1,26,'140000'),(19,'2019-04-11 10:48:13',1,27,'200000'),(20,'2019-04-11 10:52:56',1,28,'150000'),(21,'2019-04-11 10:56:27',1,29,'220000'),(22,'2019-04-11 10:58:13',1,30,'300000'),(23,'2019-04-11 11:00:37',1,31,'150000'),(24,'2019-04-11 11:02:54',1,32,'30000');
/*!40000 ALTER TABLE `course_fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_type`
--

LOCK TABLES `course_type` WRITE;
/*!40000 ALTER TABLE `course_type` DISABLE KEYS */;
INSERT INTO `course_type` VALUES (1,'2019-04-05 06:44:44','BTech');
/*!40000 ALTER TABLE `course_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee`
--

DROP TABLE IF EXISTS `fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `college_id` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `fee` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk6` (`college_id`),
  KEY `fk7` (`type_id`),
  CONSTRAINT `fk6` FOREIGN KEY (`college_id`) REFERENCES `college_details` (`id`),
  CONSTRAINT `fk7` FOREIGN KEY (`type_id`) REFERENCES `fee_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee`
--

LOCK TABLES `fee` WRITE;
/*!40000 ALTER TABLE `fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_type`
--

DROP TABLE IF EXISTS `fee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_type`
--

LOCK TABLES `fee_type` WRITE;
/*!40000 ALTER TABLE `fee_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'2019-03-10 17:30:40','end_user'),(2,'2019-03-10 17:30:40','admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spec_weight`
--

DROP TABLE IF EXISTS `spec_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spec_weight` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `specification` varchar(15) NOT NULL,
  `weight` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spec_weight`
--

LOCK TABLES `spec_weight` WRITE;
/*!40000 ALTER TABLE `spec_weight` DISABLE KEYS */;
INSERT INTO `spec_weight` VALUES (1,'2019-04-04 21:17:50','fee',20,NULL),(2,'2019-04-04 21:17:50','bus',10,NULL),(3,'2019-04-04 21:17:50','hostel',15,NULL),(4,'2019-04-04 21:17:50','infra',10,NULL),(5,'2019-04-04 21:17:50','placement',15,NULL),(6,'2019-04-04 21:17:50','discipline',10,NULL),(7,'2019-04-04 21:17:50','clubs',10,NULL),(8,'2019-04-04 21:17:50','reviews',10,NULL),(9,'2019-04-04 21:17:50','affiliations',15,NULL),(10,'2019-04-04 21:17:50','curriculum',15,NULL),(11,'2019-04-04 21:17:50','duration',10,NULL),(12,'2019-04-04 21:17:50','surrounding',10,NULL);
/*!40000 ALTER TABLE `spec_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `email` varchar(63) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `password` varchar(127) NOT NULL,
  `gender` char(1) NOT NULL,
  `city` varchar(15) NOT NULL,
  `state` varchar(31) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_mobile` (`mobile_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'2019-03-10 17:49:41','rahul','dixit','rd@gmail.com','7007258711','rd@123','m','mathura','uttar pradesh','281406',0,NULL),(2,'2019-03-10 17:49:41','prateek','verma','pvr@gmail.com','9723456254','pv@123','m','mathura','uttar pradesh','281406',0,NULL),(3,'2019-03-10 17:49:41','manu','parmar','mp@gmail.com','8953726233','mp@123','m','mathura','uttar pradesh','281406',0,NULL),(4,'2019-03-10 17:49:41','kumud','gupta','kg@gmail.com','8766656565','kg@123','m','mathura','uttar pradesh','281406',0,NULL);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `creation_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1` (`role_id`),
  KEY `fk2` (`user_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk2` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'2019-03-10 17:54:07',2,1),(2,'2019-03-10 17:54:07',1,2),(3,'2019-03-10 17:54:07',1,3),(4,'2019-03-10 17:54:07',2,4);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-16  4:40:47
