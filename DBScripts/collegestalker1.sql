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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfw`
--

LOCK TABLES `cfw` WRITE;
/*!40000 ALTER TABLE `cfw` DISABLE KEYS */;
INSERT INTO `cfw` VALUES (5,'2019-04-05 06:53:23',1,'20','8','9','6','8','6','4','7','13','10','8','10'),(6,'2019-04-05 06:53:23',2,'20','2','10','6','7','4','4','7','12','12','8','9'),(7,'2019-04-05 06:53:23',3,'20','9','13','8','14','8','8','6','9','9','5','6'),(8,'2019-04-05 06:53:23',4,'20','8','13','9','13','8','8','7','11','10','6','6');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_mobile` (`contact`),
  KEY `fk3` (`type_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`type_id`) REFERENCES `college_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_details`
--

LOCK TABLES `college_details` WRITE;
/*!40000 ALTER TABLE `college_details` DISABLE KEYS */;
INSERT INTO `college_details` VALUES (1,'2019-03-10 18:13:38','College1','college1@gmail.com','343212312','delhi','delhi','110006',1,NULL),(2,'2019-03-10 18:13:38','College2','college2@gmail.com','232312312','mathura','uttar pradesh','281406',2,NULL),(3,'2019-03-10 18:13:38','College3','college3@gmail.com','433123122','noida','uttar pradesh','282346',3,NULL),(4,'2019-03-10 18:13:38','College4','college4@gmail.com','241312312','allahabad','uttar pradesh','548806',4,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college_spec`
--

LOCK TABLES `college_spec` WRITE;
/*!40000 ALTER TABLE `college_spec` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_fee`
--

LOCK TABLES `course_fee` WRITE;
/*!40000 ALTER TABLE `course_fee` DISABLE KEYS */;
INSERT INTO `course_fee` VALUES (5,'2019-04-05 06:44:48',1,1,'50000'),(6,'2019-04-05 06:44:48',1,2,'65000'),(7,'2019-04-05 06:44:48',1,3,'110000'),(8,'2019-04-05 06:44:48',1,4,'150000');
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

-- Dump completed on 2019-04-05 12:31:56
