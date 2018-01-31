-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: fitnessjiffy
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `id` binary(16) NOT NULL,
  `category` varchar(25) COLLATE utf8_bin NOT NULL,
  `code` varchar(5) COLLATE utf8_bin NOT NULL,
  `description` varchar(250) COLLATE utf8_bin NOT NULL,
  `metabolic_equivalent` double NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (0x004211892A15329EBCF5EF7181D5B83B,'Сад и огород','08202','Уборка снега',7.5)
,(0x0058FFC50CAD35EAA6468FCDF03386CE,'Катание на велосипеде','01011','Катание по ровной дороге',6.8),
    (0x0092EA85BA7930D58F1AA26755D0DCED,'Музыка','10120','Игра на гитаре',2),(0x0092ECA4B41D3161954DFA4EDAF68DF7,'Спорт','15542','Родео',4),(0x0098841EE1E83FDA9F59297D9FC88780,'Прогулка','17090','Быстрый машр',8),(0x00CF0D29A59030A4A42D6B3AAC98A6B7,'Зимняя активность','19160','Спуск на лыжах',5.3),(0x01201F9BDDEE31E7B84FCFF4112C1BFF,'Спорт','15592','Катание на ролликах',9.8),(0x012170EEF22A3838B29DC1168DB5E796,'Упражнения','02022','Отжимания',3.8)
,(0x01244D41652132F5976986FF3F350929,'Активность на воде','18180','Ныряние с аквалангом',15.8),(0x04883AD1A6E13DE1A2DC8FB68B62DDCB,'другие','11410','horse racing, walking',3.8),(0x0494DE0051AE3649906CB2D6C3234536,'Активность на воде','18365','Водный воллейбол',3),(0x04C4B18094653C4FB1D3367AC9231260,'Сад и огород','08010','Уборка древесины',5.5);
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_performed`
--

DROP TABLE IF EXISTS `exercise_performed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_performed` (
  `id` binary(16) NOT NULL,
  `date` date NOT NULL,
  `minutes` int(11) NOT NULL,
  `exercise_id` binary(16) NOT NULL,
  `user_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oc1fognywyv0fn3dcogp2nn8e` (`user_id`,`exercise_id`,`date`),
  KEY `FK_52nub55r5musrfyjsvpth76bh` (`exercise_id`),
  CONSTRAINT `FK_52nub55r5musrfyjsvpth76bh` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`id`),
  CONSTRAINT `FK_o3b6rrwboc2sshggrq8hjw3xu` FOREIGN KEY (`user_id`) REFERENCES `fitnessjiffy_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_performed`
--

LOCK TABLES `exercise_performed` WRITE;
/*!40000 ALTER TABLE `exercise_performed` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_performed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fitnessjiffy_user`
--

DROP TABLE IF EXISTS `fitnessjiffy_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fitnessjiffy_user` (
  `id` binary(16) NOT NULL,
  `activity_level` double NOT NULL,
  `birthdate` date NOT NULL,
  `created_time` datetime NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `gender` varchar(6) COLLATE utf8_bin NOT NULL,
  `height_in_inches` double NOT NULL,
  `last_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `last_updated_time` datetime NOT NULL,
  `password_hash` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fitnessjiffy_user`
--

LOCK TABLES `fitnessjiffy_user` WRITE;
/*!40000 ALTER TABLE `fitnessjiffy_user` DISABLE KEYS */;
INSERT INTO `fitnessjiffy_user` VALUES (0xD7F955943B3F11E6A8D4EE99CE7856CC,1.25,'1985-01-01',NOW(),'demo@demo.com','Demo','MALE',70,'User',NOW(),'$2a$10$y9lTADvs0HW5XGOj41sXQOWlRqb3e20e28TruX..MtXD8zfOeIH.e','America/New_York');
/*!40000 ALTER TABLE `fitnessjiffy_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `id` binary(16) NOT NULL,
  `calories` int(11) NOT NULL,
  `carbs` double NOT NULL,
  `created_time` datetime NOT NULL,
  `default_serving_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `fat` double NOT NULL,
  `fiber` double NOT NULL,
  `last_updated_time` datetime NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `protein` double NOT NULL,
  `saturated_fat` double NOT NULL,
  `serving_type_qty` double NOT NULL,
  `sodium` double NOT NULL,
  `sugar` double NOT NULL,
  `owner_id` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_of9wdgtxdh2mgh2cfh3spllvi` (`id`,`owner_id`),
  KEY `FK_k8ugf925yeo9p3f8vwdo8ctsu` (`owner_id`),
  CONSTRAINT `FK_k8ugf925yeo9p3f8vwdo8ctsu` FOREIGN KEY (`owner_id`) REFERENCES `fitnessjiffy_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--
-- WHERE:  owner_id is null

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (0x003CDE36B81F3AB88F0E8BD6781F4DC3,90,4,'2008-04-11 00:00:00','Стакан',7,0,'2008-04-11 00:00:00','Томатный соус',2,4,0.25,430,2,NULL),(0x00E59FC81D0731FAB65ABBAA62C18F70,3820,345,'2008-02-17 00:00:00','Унция',188,21,'2008-02-17 00:00:00','Курица под соусом',183.5,94.25,76,5175,18.5,NULL),(0x01A1F74C7BDA32DAB8448FD285CA1EB3,15,4,'2012-06-22 00:00:00','Столовая ложка',0,0,'2012-06-22 00:00:00','Кукурузные хлопья',0,0,1,400,3,NULL),(0x01E7721184A73F91A9CC9454C1923899,600,66,'2008-06-06 00:00:00','CUSTOM',21,8,'2008-06-06 00:00:00','Cheese Ravioli',35,12,6,1744,14,NULL),(0x022AA62974853F0897DD7DDDD35A75EC,275,0,'2008-01-23 00:00:00','Унция',6.25,0,'2008-01-23 00:00:00','Куринная грудка',57.5,1.25,10,0,0,NULL),(0x03302FC700793A28852BB43FEC9F2D1F,140,23,'2008-03-05 00:00:00','Стакан',1.5,4,'2008-03-05 00:00:00','Куриный бульон',9,0.5,1,850,7,NULL),(0x033C4116B0E33F6583274D71575DF4E1,130,19,'2008-06-02 00:00:00','Стакан',4.5,1,'2008-06-02 00:00:00','Начос',3,3,0.33000001311302185,320,5,NULL);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_eaten`
--

DROP TABLE IF EXISTS `food_eaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_eaten` (
  `id` binary(16) NOT NULL,
  `date` date NOT NULL,
  `serving_qty` double NOT NULL,
  `serving_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `food_id` binary(16) NOT NULL,
  `user_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o17xkhthgnqe2icjgamjbun93` (`user_id`,`food_id`,`date`),
  KEY `FK_a6t0pikjip5a2k9jntw8s0755` (`food_id`),
  CONSTRAINT `FK_a6t0pikjip5a2k9jntw8s0755` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  CONSTRAINT `FK_fqyglhvonkjbp4kd7htfy02cb` FOREIGN KEY (`user_id`) REFERENCES `fitnessjiffy_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_eaten`
--

LOCK TABLES `food_eaten` WRITE;
/*!40000 ALTER TABLE `food_eaten` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_eaten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_data`
--

DROP TABLE IF EXISTS `report_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_data` (
  `id` binary(16) NOT NULL,
  `date` date NOT NULL,
  `net_calories` int(11) NOT NULL,
  `net_points` double NOT NULL,
  `pounds` double NOT NULL,
  `user_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5bacnypi0a0a5vcxaqovytq93` (`user_id`,`date`),
  CONSTRAINT `FK_mm7j7rv35awetxl921usmtdm4` FOREIGN KEY (`user_id`) REFERENCES `fitnessjiffy_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_data`
--

LOCK TABLES `report_data` WRITE;
/*!40000 ALTER TABLE `report_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weight`
--

DROP TABLE IF EXISTS `weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weight` (
  `id` binary(16) NOT NULL,
  `date` date NOT NULL,
  `pounds` double NOT NULL,
  `user_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r4ky9e01cp3060j1hgmmqo220` (`user_id`,`date`),
  CONSTRAINT `FK_rus9mpsdmijsl6fujhhud5pgu` FOREIGN KEY (`user_id`) REFERENCES `fitnessjiffy_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weight`
--

LOCK TABLES `weight` WRITE;
/*!40000 ALTER TABLE `weight` DISABLE KEYS */;
/*!40000 ALTER TABLE `weight` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-20 19:28:07