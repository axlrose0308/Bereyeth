-- MySQL dump 10.13  Distrib 8.0.12, for Linux (x86_64)
--
-- Host: localhost    Database: seminar_management_system
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id_uindex` (`id`),
  UNIQUE KEY `admin_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','1234','eatonjiangtonlei@gmail.comm');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendee`
--

DROP TABLE IF EXISTS `attendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attendee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `code` varchar(200) NOT NULL,
  `seminar_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name_tag` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attendee_id_uindex` (`id`),
  UNIQUE KEY `attendee_code_uindex` (`code`),
  KEY `attendee_seminar_id_fk` (`seminar_id`),
  CONSTRAINT `attendee_seminar_id_fk` FOREIGN KEY (`seminar_id`) REFERENCES `seminar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendee`
--

LOCK TABLES `attendee` WRITE;
/*!40000 ALTER TABLE `attendee` DISABLE KEYS */;
INSERT INTO `attendee` VALUES (1,'might_103@yeah.net','-705505188',1,1,'tongtong'),(2,'lol@gmail.con','SEMA1832372368',1,1,'test'),(4,'might_103@yeah.net','SEMA1090858907',8,0,'tongtong'),(6,'might_103@yeah.net','SEMA705505188',1,0,'tongtong'),(7,'might_103@yeah.net','SEMA666402191',10,0,'Kitty'),(8,'leighton070103@gmail.com','SEMA267815948',10,0,'Chenchen'),(9,'leighton070103@gmail.com','SEMA482628286',12,0,'Kitty Cute'),(10,'might_103@yeah.net','SEMA125653716',12,0,'tongtong'),(11,'419446019@qq.com','SEMA2047674787',12,0,'testing');
/*!40000 ALTER TABLE `attendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host_id_uindex` (`id`),
  UNIQUE KEY `host_username_uindex` (`username`),
  KEY `host_admin_id_fk` (`admin_id`),
  CONSTRAINT `host_admin_id_fk` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (3,'lei','7499','456456456','1232@123.com',1,1),(7,'ericwwww','1234','123123123','eafeasdfaewf@asdf.com',1,1),(8,'yichen1','1234','8374837484','lkjasdf@asdf.como',1,0),(9,'yichen2','1234','12934879213847','aoisudfh@uhwen.com',1,0),(10,'yichen3','1234','8987938473','aefaef@loiojwoe.comm',1,1),(12,'yichen4','1234','912837','laskdjf@laskdjf.alskdfj',1,1),(13,'yichen666','1234','3456789','12333@gmail.com',1,0),(14,'shadiao','1234','234329481','23123@gmail.com',1,0),(15,'test','1234','345678','might_103@yeah.net',1,0);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizer`
--

DROP TABLE IF EXISTS `organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organizer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Organizer_id_uindex` (`id`),
  UNIQUE KEY `Organizer_username_uindex` (`username`),
  UNIQUE KEY `Organizer_email_uindex` (`email`),
  KEY `Organizer_admin_id_fk` (`admin_id`),
  CONSTRAINT `Organizer_admin_id_fk` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizer`
--

LOCK TABLES `organizer` WRITE;
/*!40000 ALTER TABLE `organizer` DISABLE KEYS */;
INSERT INTO `organizer` VALUES (6,'tong1','1234','aewf@eev.com',1,0,'1231341324'),(9,'tong2','1234','qwer31412@ss.com',1,0,'13412'),(11,'test','1234','',1,1,'13412341');
/*!40000 ALTER TABLE `organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seminar`
--

DROP TABLE IF EXISTS `seminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seminar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(50) DEFAULT NULL,
  `time` time NOT NULL,
  `subject` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `duration` time NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `organizer_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `hold_date` date DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seminar_id_uindex` (`id`),
  KEY `seminar_admin_id_fk` (`admin_id`),
  KEY `seminar_organizer_id_fk` (`organizer_id`),
  KEY `seminar_host_id_fk` (`host_id`),
  KEY `seminar___fk` (`capacity`),
  CONSTRAINT `seminar_admin_id_fk` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `seminar_host_id_fk` FOREIGN KEY (`host_id`) REFERENCES `host` (`id`),
  CONSTRAINT `seminar_organizer_id_fk` FOREIGN KEY (`organizer_id`) REFERENCES `organizer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seminar`
--

LOCK TABLES `seminar` WRITE;
/*!40000 ALTER TABLE `seminar` DISABLE KEYS */;
INSERT INTO `seminar` VALUES (1,'UTS','11:00:00','java','javaafa','02:00:00',1,6,8,0,'2018-09-28','Forum',50),(2,'UTS','18:03:00','ddd','ADFAFEFAWDF','15:55:00',NULL,6,9,0,'2018-09-06','Forum',50),(5,'uts','08:00:00','WSD','qpoiefjqpewofijqoewifj','02:00:00',1,9,8,0,'2018-09-10','Summit Meeting',100),(8,'dafa','16:55:00','WSD','12321EAFAE','10:52:00',NULL,6,9,0,'2018-09-27','Lecture',200),(9,'dd','11:58:00','dd','adsfadfa','15:59:00',NULL,6,8,0,'2018-09-25','Summit Meeting',100),(10,'UTS library','12:00:00','Graduation','Please come for your graduation.','16:00:00',NULL,6,14,0,'2018-09-22','Summit Meeting',200),(11,'UTS','12:59:00','adfa','sdfadfewf','15:00:00',NULL,6,8,1,'2018-12-28','Summit Meeting',150),(12,'Powerhouse','06:00:00','Graduation','Testing','15:00:00',NULL,6,13,0,'2018-10-10','Forum',50),(13,'city','13:59:00','try','sadfafs','15:59:00',NULL,6,8,1,'2018-09-06','Forum',150),(14,'adsfasdfa','14:59:00','dsafadf','2342dsfaewf','14:59:00',NULL,6,14,1,'2018-09-29','Forum',150);
/*!40000 ALTER TABLE `seminar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-28 20:58:03
