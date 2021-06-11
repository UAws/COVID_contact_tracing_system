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
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refresh_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `expires` datetime NOT NULL,
  `userUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_e45ab0495d24a774bd49731b7a` (`userUserId`),
  CONSTRAINT `FK_e45ab0495d24a774bd49731b7a5` FOREIGN KEY (`userUserId`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` VALUES (1,'58.17ed0622098045b2ea4507ce5ab4f69b1e0f87c7b8b82acfbb31c4295b378f9ae9e87a2fb7e9aa28','2021-06-08 21:33:31',58),(6,'101.f1aab8d3810798af9b10f3ace2770705be1531e2497f7fad6d12b3ecd55201d69f9a9955c93ea998','2021-06-08 21:47:24',101),(7,'102.a58fb04f4757549666786191ee5dfa44c3b99b354871af02226960083fc42676e6f0dfa2ee82aac9','2021-06-08 21:50:19',102),(10,'170.be422becd64b486bf8cb38568e53268cfdfcfa2fefbe7451013912bea0f4ba479a7fa591e71d0fc9','2021-06-08 21:54:40',170),(11,'171.eeed7ad467a6c99e7aade5c98d4ae601fade4ec0d732ee41d0a7014aadeb82442a15099f5ce744be','2021-06-08 21:56:47',171),(12,'172.ee2c340a640ebaff12922a5cc633256c43bdf060e38034b874b65b7644e163639f78a5175618b199','2021-06-08 21:57:01',172),(13,'173.beb8141c1837b62e31d08042b05ff5d2597b5fb7fe9b54d3aa693326a875e48b3e109d1ca898fc58','2021-06-08 21:59:47',173),(14,'174.59d66af438c308f343fb6f7b3844bbf704c131d4cf4f15c5fc314aa468406cd237768f32cd6ae962','2021-06-08 22:18:13',174),(26,'176.bd6f8196b543ba1b03f74bde2a6ee215eef0b60beb5a62b0a758fe5251814ecebe2647a1816f9f22','2021-06-08 22:57:18',176),(28,'185.49ae9683f7455c443003fbde90dbec82bd63c81c78b78b64429b93b1ea4b621253911e2a585b751a','2021-06-09 01:11:59',185),(30,'175.c31a1b3df4bcc538476f8bdc833516a76a1d2a36f11fa0405db0ced1f7c6911b07f70ed3fac8a56d','2021-06-08 16:25:00',175),(85,'190.72568e44a5d092f728d6b3dee29d9cf63d674a26f9ea9b1c57c8efbac6c603f44e5f83f65732adfe','2021-06-09 03:35:12',190),(314,'234.6030bb0b8000a8f8d68e09375a2670455fe7c7e3ac0a092829808d84b57e79bfc4b1ce28d2e69605','2021-06-11 03:39:21',234),(341,'243.2cec5f652974a77dcffb05cee6114be347d982441d4d76cd4519e34c76f1c2322c1301de85f1479e','2021-06-15 00:39:44',243),(347,'242.2acb409e485e9c62f937c9d914696b862062da10fa0a314978ace8d6f262f201da1f56f9e2b68190','2021-06-15 00:57:57',242),(349,'244.53b9e3d780e774f12bcc51fbbe8903b7c599f49a8823495a877add0385ab491bafa90fcaff7755ad','2021-06-15 00:58:42',244),(356,'245.e86139af9c19d999151ac83ccdb648d6906200279a48445ff92cd1e6105cfadae8bc92a15d4dd38e','2021-06-15 01:03:13',245),(391,'235.6f1a7f3533d41c1b4a22cb56ccbf8fe557e6355f674db2379b0f33f3ac51740ef7952796a4af293b','2021-06-16 04:40:53',235),(422,'248.d169c46f3c00536869112de5af020e90cd96e66f651d3948aad08e21c27beca24ae4fd6153dbcf01','2021-06-16 05:42:00',248),(424,'250.96b7b5c63f6ef35e2a357fe8c02b4e7209df4771ebde67929d0dcbaee8daba76945b7b3177f13805','2021-06-16 05:42:57',250),(434,'232.fe8318bd7e07fd699f0cd486d3c8439e3d5fd8a0f5e47a90ebe33b3926e7eca6f196f2e185395270','2021-06-16 13:49:50',232);
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('2021-05-09 15:07:33','2021-05-09 15:07:35','Akide_Liu','Akide_Liu',1,3,'admin','Administrators'),('2021-05-09 15:07:33','2021-05-09 15:07:35','Akide_Liu','Akide_Liu',2,2,'venue','Venue Manager'),('2021-05-09 15:07:33','2021-05-09 15:07:35','Akide_Liu','Akide_Liu',3,1,'user','General User');
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
  `address` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `is_in_hotspot` tinyint(4) DEFAULT NULL,
  `is_approval` tinyint(4) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2021-06-03 18:24:57','2021-05-26 15:22:54','Akide_Liu','Akide_Liu',40,'User2','$2b$10$Ii4z1jJYiSABMzhVTHXYd.nrWKm4OBIZ5JL9/s1s1p0XRNh7qoGoq','test st, prospect, SA','test@adelaide.edu.au',1,0,450460666),('2021-06-03 19:31:18','2021-05-26 15:27:20','Akide_Liu','Akide_Liu',42,'test42','$2b$10$7fiFOHk8VW2CaieKMR9Kg.487T6ezCIEuk3RBI8Vhbj3u65GPTO5u','test st, prospect, SA','test@adelaide.edu.au',1,0,450460666),('2021-06-03 20:13:52','2021-05-26 15:27:31','Akide_Liu','Akide_Liu',43,'test43','$2b$10$XDHBM1UlyEiwMzhI5YrBLu5HIEkbIQYoEceuW0jckJfJ.y731SiSC','test st, prospect, SA','test@adelaide.edu.au',1,0,450460166),('2021-06-03 20:15:18','2021-05-26 15:27:58','Akide_Liu','Akide_Liu',44,'test44','$2b$10$z/aVMUR/WolP4JGj2/g.tOyOD74/KdnOSBu4eOqA0G.vO9TckYrNa','test st, prospect, SA','test@adelaide.edu.au',1,1,6666666),('2021-06-03 19:35:51','2021-05-26 15:28:27','Akide_Liu','Akide_Liu',45,'test45','$2b$10$G39K7Rlb8aN4bIa/GTKKvudmPjsrmBnCtWMLvbpUAbrKnaCbUJory','test st, prospect, SA','test@adelaide.edu.au',1,0,450460166),('2021-05-26 15:30:52','2021-05-26 15:31:30','Akide_Liu','Akide_Liu',48,'test','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:32:14','2021-05-26 15:32:16','Akide_Liu','Akide_Liu',50,'test','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:32:33','2021-05-26 15:32:35','Akide_Liu','Akide_Liu',51,'test','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:34:18','2021-05-26 15:34:21','Akide_Liu','Akide_Liu',52,'test','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 16:43:15','2021-05-26 16:43:19','Akide_Liu','Akide_Liu',54,'test','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 08:40:22','2021-05-26 08:40:24','Akide_Liu','Akide_Liu',55,'test','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 08:40:29','2021-05-26 08:40:32','Akide_Liu','Akide_Liu',56,'test2','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',58,'testJWT','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',101,'testJWT','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',102,'testJWT','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',170,'testJWT','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',171,'testJWT','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',172,'testJWT','123456','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',173,'testJWT','$2b$10$B8m80bmfJAzHIozoXuXEq.m0MK7hQOnm5onwEJaiZawV/1Vs8Ou5K','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',174,'testJWT','$2b$10$D.u9ZMpyiznbIuIPYWr.sOrV8dKVUuGRW1GvZj.9JVLLe8opKoL0G','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',175,'testJWT2','$2b$10$bSugLw11UWuKh7A8X3pDSejDhrllCOJFSFl7F8t8Ezwe1IAQgehim','test st, prospect, SA','testJWT@adelaide.edu.au',0,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',176,'testJWT2','$2b$10$Vwec7codqzhSP2X1mr3PyeFVAv2aO3BXAfGpiK/4gizsBBPaz1.TS','test st, prospect, SA','testJWT@adelaide.edu.au',0,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',177,'testJWT2','$2b$10$Vwec7codqzhSP2X1mr3PyeFVAv2aO3BXAfGpiK/4gizsBBPaz1.TS','test st, prospect, SA','testJWT@adelaide.edu.au',0,0,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',178,'testJWT1','$2b$10$Vwec7codqzhSP2X1mr3PyeFVAv2aO3BXAfGpiK/4gizsBBPaz1.TS','test st, prospect, SA','testJWT@adelaide.edu.au',0,0,450460166),('2021-05-26 16:43:15','2021-05-26 16:43:19','Akide_Liu','Akide_Liu',179,'test666','123456','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166),('2021-05-26 16:43:15','2021-05-26 16:43:19','Akide_Liu','Akide_Liu',180,'test66666','123456','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166),('2021-06-01 06:27:26','2021-06-01 06:27:28','Akide_Liu','Akide_Liu',181,'test','123456','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-01 06:27:26','2021-06-01 06:27:28','Akide_Liu','Akide_Liu',182,'test','123456','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166),('2021-06-01 17:11:59','2021-06-01 17:11:59','Akide_Liu','Akide_Liu',185,'testJWT2','$2b$10$CQ4C.TlOYLbjRppy14F//eQycbnD84FUTbLGo0eDRrPqlFb2zlRiK','test st, prospect, SA','testJWT@adelaide.edu.au',0,1,450460166),('2021-06-01 17:14:52','2021-06-01 17:14:52','Akide_Liu','Akide_Liu',186,'testJWT2','$2b$10$UMp0PsKXf8uZvIpsbCdEOe6Ev1twXBZ7eoeIZYAA/HcXCasKg1tAK','test st, prospect, SA','testJWT@adelaide.edu.au',0,1,450460166),('2021-06-01 17:16:56','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',187,'testJWT2','$2b$10$5SWvO2LykdkwlJVgUfm2VewPIvQZ0qyO1m0RIFptBnDutuQsTviia','test st, prospect, SA','testJWT@adelaide.edu.au',0,1,450460166),('2021-05-26 15:15:35','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',188,'testJWT','123456','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166),('2021-06-01 19:30:29','2021-06-01 19:30:29','System admin','System admin',190,'haha','$2b$10$MAVEW1Y/28UtYqzqyq.9seYmSJRhQ70polReojnYyUQjCg77uE1eu','501 King St, prospect, SA','wdc@adelaide.edu.au',0,1,450466666),('2021-06-01 19:34:46','2021-06-01 19:34:46','Akide_Liu','Akide_Liu',191,'testmnbn','$2b$10$PngQNN6FdHp2zByTi/4y5uuy13YDoL7CB0Gwg6gopSUX0R/M7ab/O','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-01 19:36:11','2021-06-01 19:36:11','Akide_Liu','Akide_Liu',192,'2','$2b$10$QvFLaDYEyQWIuZPJ99qaFeehWAgMTPqnFPgkvuowieb.RMBlD4hcC','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-02 05:05:21','2021-06-02 05:03:25','Akide_Liu','Akide_Liu',193,'Wendy','$2b$10$Os0HToxnXm8W.G1pyEg0iO3SV1H5WVMjmzedVeCgVxTo837x8Dn/K','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166),('2021-06-02 05:08:22','2021-06-02 05:06:02','Akide_Liu','Akide_Liu',194,'WendyAdmin','$2b$10$cZve7XryP3PxcIRqWV3UY.BRpfTfqpHqhkDnPM38o87PRF6HQniXa','test st, prospect, SA','test@adelaide.edu.au',0,0,450460166),('2021-06-02 05:08:42','2021-06-02 05:08:42','Akide_Liu','Akide_Liu',195,'22','$2b$10$pnIbTyk04KuUc/HKJLMUsONupFLH6PSkGEmPhBdATJA.ufVjN3yNe','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-02 05:08:50','2021-06-02 05:08:50','Akide_Liu','Akide_Liu',196,'test','$2b$10$QqYH8jIAQgHLYzR2wUgaUOwg6ug7D0obI4X74sWXHcdQAKhXbAJ8.','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 00:52:56','2021-06-03 00:52:56','Akide_Liu','Akide_Liu',197,'test','$2b$10$hnOORbPzBlijpU5UxsuAteNjQs7fFbYQgzdvKpw0KKgfpuL.uEuRG','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 00:53:13','2021-06-03 00:53:13','Akide_Liu','Akide_Liu',198,'test','$2b$10$Pm3F.yIQluYt1C0QfNxKQe0VCg9Gud4VTTpuOsb/DF2qJFBg0MVeq','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 00:54:05','2021-06-03 00:54:05','Akide_Liu','Akide_Liu',199,'Chi','$2b$10$cvmvq1iMdAqFfCW2m6o7z.YF9HExvtaC7fycm/6BXAFdW.aoczjwO','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 00:56:50','2021-06-03 00:56:50','Akide_Liu','Akide_Liu',200,'test','$2b$10$hBHQTeY/IqEjvFIEWhHmGu.Us7eDsgN8CPssOvrPbpJxKkRMSmARS','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 00:58:04','2021-06-03 00:58:04','Akide_Liu','Akide_Liu',201,'test','$2b$10$HWddaRz5TKpkK7PMiHIdfOBjOP7ECi.zaMzxhJxn8Iv3MXp18.kCC','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:04:02','2021-06-03 01:04:02','Akide_Liu','Akide_Liu',202,'test','$2b$10$Sux2kL0Bnq1sFPCyFtZZCeCGDAfGc0u2hbLFmIOLCX8IIXWUqMdh6','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:13:36','2021-06-03 01:13:36','Akide_Liu','Akide_Liu',203,'test','$2b$10$3x8kSvNz2icZXiQMg6tnFulVW4SaygsjxWM55TptAlB5vac1k0ruC','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:13:55','2021-06-03 01:13:55','Akide_Liu','Akide_Liu',204,'test','$2b$10$CtrKq5wTpHvnIbcIfZ5GV.aGMJsM7cbWMSDbnQoTwICEAKgkaNfZy','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:17:28','2021-06-03 01:17:28','Akide_Liu','Akide_Liu',205,'test','$2b$10$6BTvnFslZY42RWX8TL6vq.e3xW7Squ1MQSdYKdS./2ECaSOYAWgq2','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:17:36','2021-06-03 01:17:36','Akide_Liu','Akide_Liu',206,'test','$2b$10$GTAXaDp1zir0jm6asxFlBe47velsX7Z1crb/xYaC4D3sxMONiNB82','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:20:36','2021-06-03 01:20:36','Akide_Liu','Akide_Liu',207,'test','$2b$10$xJnqsfH9PLi2GObb/A8dieP7dZaONTIKMVI5IWfnYEObGtjRjTdou','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:22:13','2021-06-03 01:22:13','Akide_Liu','Akide_Liu',208,'test','$2b$10$J5P8gONzZoLqqgq4BsO8u.P3yV4wjfYX6tV.lv2S86QObj9cSG87G','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:25:45','2021-06-03 01:25:45','Akide_Liu','Akide_Liu',209,'test','$2b$10$0oky1GINdDFGWXDP1kL3DOqZYiuKwG.aVFMDEv.8IIloRBEAxUR4a','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:25:55','2021-06-03 01:25:55','Akide_Liu','Akide_Liu',210,'test','$2b$10$MhUpJPE3Sxa4wF8XTqK4ju7VkVjE7kc7TNUUtKyTi0CKliEUlheaK','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:29:03','2021-06-03 01:29:03','Akide_Liu','Akide_Liu',211,'test','$2b$10$ksBzWljI0tnFYUMoqhvXcuiqGiBwzk2rXxV4RVNbCAJrLxqHS.ThK','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:29:32','2021-06-03 01:29:32','Akide_Liu','Akide_Liu',212,'test','$2b$10$WLmd3bc/RNR7hlaZya/TNOyamw9GDiQfbdVxzQoIZhGQ1bUFnifzq','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:30:02','2021-06-03 01:30:02','Akide_Liu','Akide_Liu',213,'test','$2b$10$OWA4ReGeRfqlGrphUBrST.ubjhyyDgt8ZwR3Gzihud8h2KMYuDqrm','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:30:25','2021-06-03 01:30:25','Akide_Liu','Akide_Liu',214,'test','$2b$10$PtUk3ekhqrur0ZWxoUUePuesXbgL8CBnGmmCJnuyJ/W2OZaeFIOb6','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:32:22','2021-06-03 01:32:22','Akide_Liu','Akide_Liu',215,'test','$2b$10$AcIvjbUcDsfWvYOol4Ltaubu/xuTHurqnMq.gGCfEoc8GBM6mBr52','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:34:28','2021-06-03 01:34:28','Akide_Liu','Akide_Liu',216,'test','$2b$10$0.AxMfigNHy/TJ6CDsHVo.8PhBWUGBhomnLEqqPyFmg/qcgSEbG2K','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:34:38','2021-06-03 01:34:38','Akide_Liu','Akide_Liu',217,'test','$2b$10$ljp4qfir5hpml5NQnzza9.XwGt5DrqqDiYq81xuXPaOP9HU6KpKPG','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:35:02','2021-06-03 01:35:02','Akide_Liu','Akide_Liu',218,'test','$2b$10$CBVZQthfqxR50Gnv0ujm8eB.0IobnDd.Chvj2UYcm/p0R.lg5i7kq','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:35:10','2021-06-03 01:35:10','Akide_Liu','Akide_Liu',219,'test','$2b$10$Pm/UJN9msw4tjHvDTJWh/e8/eisEzuYUBNbLIX3pC6UnFdlXR4TK6','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:35:27','2021-06-03 01:35:27','Akide_Liu','Akide_Liu',220,'test','$2b$10$ZSoegJ.Qqlg09plZA4XllOEhTgUzKWOWm/0RqSdrpfFHURvIQcCXm','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:35:33','2021-06-03 01:35:33','Akide_Liu','Akide_Liu',221,'test','$2b$10$GHsV5/YO8x0Gx1e.pmXnwuVf8x8Tgez9gvMqxkzJPmFn.DOyofQ1.','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:35:47','2021-06-03 01:35:47','Akide_Liu','Akide_Liu',222,'test','$2b$10$lLt7v5R81ufdaRyGXSupbePTCscx6heMduXCv0rQ/zzDD9SlBUOdS','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:35:56','2021-06-03 01:35:56','Akide_Liu','Akide_Liu',223,'dsadsa','$2b$10$zkfLh/1rGCGZGQvEZGTFbON7r/5txRPmqwvC.y4Z7xiWPxpismlv6','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:36:14','2021-06-03 01:36:14','Akide_Liu','Akide_Liu',224,'test','$2b$10$fF0JsY6PIJ.nPT4tBgqVWeztTteToVrICxycT4pdcNMGeBbeoLIUy','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:36:18','2021-06-03 01:36:18','Akide_Liu','Akide_Liu',225,'test','$2b$10$Z9bWzxeFdFFqqi3sNZQoVuKlE/OMscJtblhIeAB8V15LuQstK.2xe','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:36:24','2021-06-03 01:36:24','Akide_Liu','Akide_Liu',226,'test','$2b$10$kRNzVm.kHcgeKJqtlqjCyerDBJEX3RwQ3edaatbgRsRxFjiU1E7e6','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:36:28','2021-06-03 01:36:28','Akide_Liu','Akide_Liu',227,'test','$2b$10$0/d2CTcORGlWe2jTGMCv.ug6xS6/FOzY865qbv6qn/W98XkVq3Xvm','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:36:41','2021-06-03 01:36:41','Akide_Liu','Akide_Liu',228,'test','$2b$10$DiQIVJ7RQHIp.wygkat2huqnGJufmq51G07T9xPF64lCeF6AR5Iiu','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:37:09','2021-06-03 01:37:09','Akide_Liu','Akide_Liu',229,'test','$2b$10$i37oqqhoMEX2T8NxX94yLOxTj9buFZRV7FTP4wwIHSxhSbllN5qj6','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:37:13','2021-06-03 01:37:13','Akide_Liu','Akide_Liu',230,'test','$2b$10$FFn9xq8BxgAtZhUpDTCqzecRtJj5nFoAWMwF/sU.viw3MvdN7iHwS','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 01:39:12','2021-06-03 01:39:12','Akide_Liu','Akide_Liu',231,'test','$2b$10$mpzlf23MquZRUyjqjDk97.rmavrkWUYRCmFLfOqjMPN1YaYqh32fy','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-03 20:02:23','2021-06-03 18:45:48','2021-06-03T18:32:23.281Z','System admin',232,'admin','$2b$10$L2FRn09AOaq/yPkTGJ5gC.JeL2DqHDGVaNq0UPdG6QktMG6DDAE.a','501 King St, prospect, SA','wdc@adelaide.edu.au',0,1,450466666),('2021-06-03 20:07:56','2021-06-03 18:53:51','2021-06-03T18:37:56.329Z','System admin',234,'testAdmin1','$2b$10$CgWH0vwWAf/fZfoaSqsnDOd4SeI4dXsQOxtQyCVVO7o7HsEWdv6jq','501 King St, prospect, SA','wdc@adelaide.edu.au',0,1,450466666),('2021-06-03 19:55:04','2021-06-03 19:55:04','System admin','System admin',235,'testAdmin2','$2b$10$nDhWw9gSbu15rTu4Wd5EtOO1jlU7ne3Mjv0VFT5SIOzeSlsOtPMGy','501 King St, prospect, SA','wdc@adelaide.edu.au',0,1,450466666),('2021-06-03 18:29:43','2021-06-03 18:29:43','Akide_Liu','Akide_Liu',236,'Ziqi Zhang','$2b$10$6wdOkgJ/JYn5L0HWPp/.WOBVfgT4fbKi05N2/Cq79wZkHnnOdNSmS','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-04 23:58:44','2021-06-04 23:58:44','Akide_Liu','Akide_Liu',237,'99','$2b$10$IGXZYXnaSw0B/TIkC3GVceBRuiZZ78dtqQAEuHCPJQcL2XUAPllva','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-04 23:58:54','2021-06-04 23:58:54','Akide_Liu','Akide_Liu',238,'test','$2b$10$dCHhmlJ8k25HpmzrorPwYeVKBC4RxlTfvlq7Iy4h3fqcccRXlUD9a','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-05 00:00:28','2021-06-05 00:00:28','Akide_Liu','Akide_Liu',239,'ming','$2b$10$61z8ATrD0iiB9TqdvA7MX.tBg1RTMq0beg/f8qB1ssaO5bqYYLYW6','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-07 16:37:03','2021-06-07 16:37:03','System admin','System admin',242,'test003','$2b$10$zij2qZVkIv8cm/ndOWad0.3ViIMzdUSxKcX98mkr2bpI.CjhxX2N2','test.test st','test@test.com',0,0,450460666),('2021-06-07 16:39:44','2021-06-07 16:39:44','System admin','System admin',243,'test004','$2b$10$gdsw/.sqg5av0y3RVkHJiuHnPbCheb0jdObK4xKxIHBYW0quDKPQS','asdjklasd','test@test.com',0,0,450460666),('2021-06-07 16:41:17','2021-06-07 16:41:17','System admin','System admin',244,'test005','$2b$10$6lszGvNgPC8.zHS8u6Tn7.Qw3.FN/Xw.7YSuvwK3zvX4Bd/fKGV5O','123st','test@test.com',0,0,450460666),('2021-06-07 16:59:20','2021-06-07 16:59:20','System admin','System admin',245,'test007','$2b$10$YeXMHELIsGQLQtGEATiVB.OcpQo6dZ0LaIyMo2GsVVryo//KlYsRu','test st','test@test.com',0,0,450460166),('2021-06-08 21:42:00','2021-06-07 21:14:33','2021-06-08T19:56:01.686Z','System admin',248,'Akide Liu','$2b$10$o8EHWXi4LeBDAsWY9x8Z5Ok/5Q3Uap./cuMtBvTk1t8bF0m93qgDS','','lly404861870@gmail.com',0,0,NULL),('2021-06-08 21:31:31','2021-06-08 21:31:31','Akide_Liu','Akide_Liu',249,'test123456','$2b$10$WPn8skIdpbfKgZv2nhlEu.xHZJpLJlpHjazA.nzaHlHto/G3iG.NC','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166),('2021-06-08 21:42:46','2021-06-08 21:42:46','Akide_Liu','Akide_Liu',250,'backup','$2b$10$bRYVtswOOV4b1kZr76U.iuNHM3tV63KAkK6DraBFnldJsLUNZ20oK','test st, prospect, SA','test@adelaide.edu.au',0,1,450460166);
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
INSERT INTO `user__role_role` VALUES (40,3),(42,3),(43,1),(44,2),(45,3),(48,3),(50,3),(51,3),(52,2),(54,3),(55,3),(56,3),(58,3),(101,3),(102,3),(170,3),(171,3),(172,3),(173,3),(174,3),(175,3),(176,3),(177,3),(178,3),(179,3),(180,3),(181,3),(182,3),(185,3),(186,3),(187,3),(188,3),(190,1),(191,3),(192,3),(193,3),(194,1),(195,3),(196,3),(197,3),(198,3),(199,1),(200,3),(201,3),(202,3),(203,3),(204,3),(205,3),(206,3),(207,3),(208,3),(209,3),(210,3),(211,3),(212,3),(213,3),(214,3),(215,3),(216,3),(217,3),(218,3),(219,3),(220,3),(221,3),(222,3),(223,3),(224,3),(225,3),(226,3),(227,3),(228,3),(229,3),(230,3),(231,3),(232,1),(234,1),(235,1),(236,3),(237,3),(238,3),(239,3),(242,2),(243,1),(244,3),(245,1),(248,3),(249,1),(250,2);
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
INSERT INTO `user__user_check_in_user_check_in` VALUES (42,2),(232,3),(232,4),(248,5),(248,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_check_in`
--

LOCK TABLES `user_check_in` WRITE;
/*!40000 ALTER TABLE `user_check_in` DISABLE KEYS */;
INSERT INTO `user_check_in` VALUES ('2021-05-09 15:46:06','2021-05-09 15:46:07','Akide_Liu','Akide_Liu',1,1,'156 george st ,Adelaide','0000-00-00 00:00:00'),('2021-06-08 19:41:05','2021-06-08 19:41:05','test42','test42',2,1,'156 george st ,Adelaide','2021-06-08 18:11:06'),('2021-06-08 19:56:30','2021-06-08 19:56:30','admin','admin',3,2,'22 hendly st, Adelaide','2021-06-08 19:56:30'),('2021-06-08 20:01:01','2021-06-08 20:01:01','admin','admin',4,2,'22 hendly st, Adelaide','2021-06-08 20:01:01'),('2021-06-08 21:26:27','2021-06-08 21:26:27','Akide Liu','Akide Liu',5,2,'22 hendly st, Adelaide','2021-06-08 21:26:27'),('2021-06-08 21:38:42','2021-06-08 21:38:42','Akide Liu','Akide Liu',6,2,'22 hendly st, Adelaide','2021-06-08 21:38:42');
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
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `risk_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES ('2021-06-09 04:48:07','2021-05-30 05:08:46','admin','Super Admin',2,'100002','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',1,138.5964059,-34.9197809,3),('2021-05-30 05:11:25','2021-05-30 05:11:25','Super Admin','Super Admin',3,'100001','tes@test.com','test','test st',1,138.587581,-34.9197809,1),('2021-05-30 05:20:32','2021-05-30 05:08:46','Super Admin','Super Admin',4,'100003','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,138.587581,-34.9269366,2),('2021-05-30 05:20:32','2021-05-30 05:08:46','Super Admin','Super Admin',5,'100004','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,138.61375066889812,-34.91864256833583,3),('2021-05-30 05:20:32','2021-05-30 05:08:46','Super Admin','Super Admin',6,'100005','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,138.60135860418657,-34.907230552776596,2),('2021-05-30 05:20:32','2021-05-30 05:08:46','Super Admin','Super Admin',7,'100006','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',1,138.64114895293912,-34.94027914073686,3),('2021-05-30 05:20:32','2021-05-30 05:08:46','Super Admin','Super Admin',8,'100007','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,NULL,NULL,NULL),('2021-05-30 05:20:32','2021-05-30 05:08:46','Super Admin','Super Admin',9,'100008','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,NULL,NULL,NULL),('2021-06-09 15:25:34','2021-05-30 05:08:46','admin','Super Admin',10,'100009','cccc@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,NULL,NULL,NULL),('2021-06-09 05:55:08','2021-05-30 05:08:46','admin','Super Admin',11,'100010','cccc@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,138.59103189286603,-34.90640360153534,3),('2021-05-30 05:20:32','2021-05-30 05:08:46','Super Admin','Super Admin',12,'100011','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,NULL,NULL,NULL),('2021-05-30 05:20:32','2021-05-30 05:08:46','Super Admin','Super Admin',13,'100012','aaaa@adelaide.edu.au','Killision','22 hendly st, Adelaide',0,NULL,NULL,NULL),('2021-06-08 21:08:06','2021-06-08 21:08:06','admin','admin',14,'122121','w@gmail.com','dasds','dqwdadas',0,NULL,NULL,NULL),('2021-06-08 22:38:05','2021-06-08 22:38:05','admin','admin',15,'1111111','w08@gmail.com','dsfaf','asdasd 5000',1,NULL,NULL,NULL),('2021-06-09 04:48:27','2021-06-09 04:48:18','admin','admin',16,'2','3','1','4',0,NULL,NULL,NULL);
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

-- Dump completed on 2021-06-09 23:26:50
