-- MySQL dump 10.13  Distrib 5.6.51, for osx10.16 (x86_64)
--
-- Host: bt-02-test.in.llycloud.com    Database: 
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.15-MariaDB-log

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
-- Current Database: `wdc-project`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wdc-project` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wdc-project`;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `update_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `permissions` varchar(255) NOT NULL,
  `requirements` varchar(255) NOT NULL,
  `hotspot` varchar(255) NOT NULL,
  `icon` varchar(1000) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `update_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('2021-05-09 15:07:33','2021-05-09 15:07:35','Akide_Liu','Akide_Liu',1,3,'admin','administrators');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role__menu_menu`
--

DROP TABLE IF EXISTS `role__menu_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role__menu_menu` (
  `roleRoleId` int(11) NOT NULL,
  `menuMenuId` int(11) NOT NULL,
  PRIMARY KEY (`roleRoleId`,`menuMenuId`),
  KEY `IDX_6d773ac2269b2e9ba007a2dc5b` (`roleRoleId`),
  KEY `IDX_17d153a1cd0186db26923356a6` (`menuMenuId`),
  CONSTRAINT `FK_17d153a1cd0186db26923356a6d` FOREIGN KEY (`menuMenuId`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_6d773ac2269b2e9ba007a2dc5b8` FOREIGN KEY (`roleRoleId`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role__menu_menu`
--

LOCK TABLES `role__menu_menu` WRITE;
/*!40000 ALTER TABLE `role__menu_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `role__menu_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `update_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `is_in_hotspot` tinyint(4) NOT NULL,
  `is_approval` tinyint(4) NOT NULL,
  `phone` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2021-05-09 15:06:45','2021-05-09 15:06:47','Akide_Liu','Akide_Liu',1,'Akide_Liu','123456','5 allan st, prospect, SA','mail@llycloud.com',0,1,450460166),('2021-05-09 15:06:45','2021-05-09 15:06:47','123','Akide_Liu',2,'test','123456','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166),('2021-05-09 15:06:45','2021-05-09 15:06:47','123','Akide_Liu',3,'test','123456','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166),('2021-05-09 15:06:45','2021-05-09 15:06:47','123','Akide_Liu',6,'test','123456','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user__role_role`
--

DROP TABLE IF EXISTS `user__role_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user__role_role` (
  `userUserId` int(11) NOT NULL,
  `roleRoleId` int(11) NOT NULL,
  PRIMARY KEY (`userUserId`,`roleRoleId`),
  KEY `IDX_862a70c27d492b2261c0755906` (`userUserId`),
  KEY `IDX_032597d3b0a539dc062e4e7e84` (`roleRoleId`),
  CONSTRAINT `FK_032597d3b0a539dc062e4e7e841` FOREIGN KEY (`roleRoleId`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_862a70c27d492b2261c0755906e` FOREIGN KEY (`userUserId`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user__role_role`
--

LOCK TABLES `user__role_role` WRITE;
/*!40000 ALTER TABLE `user__role_role` DISABLE KEYS */;
INSERT INTO `user__role_role` VALUES (1,1);
/*!40000 ALTER TABLE `user__role_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user__user_check_in_user_check_in`
--

DROP TABLE IF EXISTS `user__user_check_in_user_check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user__user_check_in_user_check_in` (
  `userUserId` int(11) NOT NULL,
  `userCheckInCheckInId` int(11) NOT NULL,
  PRIMARY KEY (`userUserId`,`userCheckInCheckInId`),
  KEY `IDX_9045ff89198c2a4aaf527df1e3` (`userUserId`),
  KEY `IDX_77da8fb7667c15848c17f3a743` (`userCheckInCheckInId`),
  CONSTRAINT `FK_77da8fb7667c15848c17f3a7430` FOREIGN KEY (`userCheckInCheckInId`) REFERENCES `user_check_in` (`check_in_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_9045ff89198c2a4aaf527df1e34` FOREIGN KEY (`userUserId`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user__user_check_in_user_check_in`
--

LOCK TABLES `user__user_check_in_user_check_in` WRITE;
/*!40000 ALTER TABLE `user__user_check_in_user_check_in` DISABLE KEYS */;
INSERT INTO `user__user_check_in_user_check_in` VALUES (1,1);
/*!40000 ALTER TABLE `user__user_check_in_user_check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user__venue_venue`
--

DROP TABLE IF EXISTS `user__venue_venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user__venue_venue` (
  `userUserId` int(11) NOT NULL,
  `venueVenueId` int(11) NOT NULL,
  PRIMARY KEY (`userUserId`,`venueVenueId`),
  KEY `IDX_9c9870e96644d4f632c265e664` (`userUserId`),
  KEY `IDX_366f54ef596ed4eda8c56ddc90` (`venueVenueId`),
  CONSTRAINT `FK_366f54ef596ed4eda8c56ddc908` FOREIGN KEY (`venueVenueId`) REFERENCES `venue` (`venue_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_9c9870e96644d4f632c265e664b` FOREIGN KEY (`userUserId`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user__venue_venue`
--

LOCK TABLES `user__venue_venue` WRITE;
/*!40000 ALTER TABLE `user__venue_venue` DISABLE KEYS */;
INSERT INTO `user__venue_venue` VALUES (1,1);
/*!40000 ALTER TABLE `user__venue_venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_check_in`
--

DROP TABLE IF EXISTS `user_check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_check_in` (
  `update_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `check_in_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_id` int(11) NOT NULL,
  `CheckInAddress` varchar(255) NOT NULL,
  `CheckInTimeStamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`check_in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_check_in`
--

LOCK TABLES `user_check_in` WRITE;
/*!40000 ALTER TABLE `user_check_in` DISABLE KEYS */;
INSERT INTO `user_check_in` VALUES ('2021-05-09 15:46:06','2021-05-09 15:46:07','Akide_Liu','Akide_Liu',1,1,'156 george st ,Adelaide','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user_check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_check_in__users_user`
--

DROP TABLE IF EXISTS `user_check_in__users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_check_in__users_user` (
  `userCheckInCheckInId` int(11) NOT NULL,
  `userUserId` int(11) NOT NULL,
  PRIMARY KEY (`userCheckInCheckInId`,`userUserId`),
  KEY `IDX_e991f657994c5cfa4a8c9aea28` (`userCheckInCheckInId`),
  KEY `IDX_36c01ec877592fde48b83f5e2a` (`userUserId`),
  CONSTRAINT `FK_36c01ec877592fde48b83f5e2a5` FOREIGN KEY (`userUserId`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_e991f657994c5cfa4a8c9aea282` FOREIGN KEY (`userCheckInCheckInId`) REFERENCES `user_check_in` (`check_in_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_check_in__users_user`
--

LOCK TABLES `user_check_in__users_user` WRITE;
/*!40000 ALTER TABLE `user_check_in__users_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_check_in__users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `update_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_by` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `venue_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_in_code` varchar(1000) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `venue_name` varchar(255) NOT NULL,
  `shop_address` varchar(255) NOT NULL,
  `is_hotspot` tinyint(4) NOT NULL,
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES ('2021-05-09 15:53:38','2021-05-09 15:53:39','Akide_Liu','Akide_Liu',1,'1000001','mail@adelaide.edu.au','University of Adelaide','The University of Adelaide\nSA 5005\nAUSTRALIA',0);
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-10  1:33:07
