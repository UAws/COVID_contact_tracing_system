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
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
INSERT INTO `refresh_token` VALUES (1,'58.17ed0622098045b2ea4507ce5ab4f69b1e0f87c7b8b82acfbb31c4295b378f9ae9e87a2fb7e9aa28','2021-06-08 21:33:31',58),(6,'101.f1aab8d3810798af9b10f3ace2770705be1531e2497f7fad6d12b3ecd55201d69f9a9955c93ea998','2021-06-08 21:47:24',101),(7,'102.a58fb04f4757549666786191ee5dfa44c3b99b354871af02226960083fc42676e6f0dfa2ee82aac9','2021-06-08 21:50:19',102),(10,'170.be422becd64b486bf8cb38568e53268cfdfcfa2fefbe7451013912bea0f4ba479a7fa591e71d0fc9','2021-06-08 21:54:40',170),(11,'171.eeed7ad467a6c99e7aade5c98d4ae601fade4ec0d732ee41d0a7014aadeb82442a15099f5ce744be','2021-06-08 21:56:47',171),(12,'172.ee2c340a640ebaff12922a5cc633256c43bdf060e38034b874b65b7644e163639f78a5175618b199','2021-06-08 21:57:01',172),(13,'173.beb8141c1837b62e31d08042b05ff5d2597b5fb7fe9b54d3aa693326a875e48b3e109d1ca898fc58','2021-06-08 21:59:47',173),(14,'174.59d66af438c308f343fb6f7b3844bbf704c131d4cf4f15c5fc314aa468406cd237768f32cd6ae962','2021-06-08 22:18:13',174),(26,'176.bd6f8196b543ba1b03f74bde2a6ee215eef0b60beb5a62b0a758fe5251814ecebe2647a1816f9f22','2021-06-08 22:57:18',176),(28,'185.49ae9683f7455c443003fbde90dbec82bd63c81c78b78b64429b93b1ea4b621253911e2a585b751a','2021-06-09 01:11:59',185),(30,'175.c31a1b3df4bcc538476f8bdc833516a76a1d2a36f11fa0405db0ced1f7c6911b07f70ed3fac8a56d','2021-06-08 16:25:00',175),(85,'190.72568e44a5d092f728d6b3dee29d9cf63d674a26f9ea9b1c57c8efbac6c603f44e5f83f65732adfe','2021-06-09 03:35:12',190),(314,'234.6030bb0b8000a8f8d68e09375a2670455fe7c7e3ac0a092829808d84b57e79bfc4b1ce28d2e69605','2021-06-11 03:39:21',234),(341,'243.2cec5f652974a77dcffb05cee6114be347d982441d4d76cd4519e34c76f1c2322c1301de85f1479e','2021-06-15 00:39:44',243),(347,'242.2acb409e485e9c62f937c9d914696b862062da10fa0a314978ace8d6f262f201da1f56f9e2b68190','2021-06-15 00:57:57',242),(349,'244.53b9e3d780e774f12bcc51fbbe8903b7c599f49a8823495a877add0385ab491bafa90fcaff7755ad','2021-06-15 00:58:42',244),(356,'245.e86139af9c19d999151ac83ccdb648d6906200279a48445ff92cd1e6105cfadae8bc92a15d4dd38e','2021-06-15 01:03:13',245),(391,'235.6f1a7f3533d41c1b4a22cb56ccbf8fe557e6355f674db2379b0f33f3ac51740ef7952796a4af293b','2021-06-16 04:40:53',235),(424,'250.96b7b5c63f6ef35e2a357fe8c02b4e7209df4771ebde67929d0dcbaee8daba76945b7b3177f13805','2021-06-16 05:42:57',250),(452,'251.933a7dce89a243297f3f41d305dafebafbe4a8ec2f4940bb2e3a7db7b6169cb1fb18521f18afd908','2021-06-19 03:13:27',251),(454,'252.751f843edd76e0b5d5417b347b9423e0c98ab6603547b6e42ff5ecb635b718ca0a2230d625bc719f','2021-06-19 03:40:10',252),(471,'232.61d606a2dab44bbe1863fc3233001c8bd976aa99781357728315b506f5150a6d13fcddeeadba7555','2021-06-20 17:25:43',232),(472,'249.16c2f03a9aa659603cbe391d2e2cce13b314abac94f6c1ed2cedb4ff65699af0501adc18c606ffc1','2021-06-20 09:29:06',249),(480,'42.58044723aa510fa3dffb4ca996ce9b2de2bc7a78ef35be15813711af758b10777bc5f61539c160df','2021-06-20 10:57:16',42),(483,'256.a80eb86d1cbbccb0435da3812d84a0f1f3da82c6b9dbc25f28e1bbfe1abc4ef9de7ce3a4a29951ac','2021-06-20 10:59:25',256),(484,'257.ce6fee274fff43ff52a5bdb9535fd421ca9288fd7841f94d71e2f1866d6eb28645564a704f836842','2021-06-20 11:03:42',257),(485,'254.4f359fbb986664c9998feeae787020208fe790592dfb8f81c40019248c61d96750d4db1d023f664e','2021-06-20 11:04:02',254),(491,'202.fd9c282605854e92a9b1943948e798af85f7e393b4350e201d8b56a43519319f06b73f1e9f67fd6b','2021-06-21 05:47:20',202),(493,'201.71d60a3d81345b6ebf9fbc7e6b2c50344fcdcb5fb2586c80f9b5a970482a03fcf2e49235e10ea844','2021-06-21 05:48:59',201),(495,'212.ff5c74f4b8c65deabe6dd05ebfbd40d362ddf8053f065d451dc43f474b8f66802440888c83d170b2','2021-06-21 05:53:16',212),(496,'191.63de8af620fe2f3dd2191906b4364f604a52b98d54a38b8a58573ed8a7feb6158f6cef28efc7878f','2021-06-21 05:56:42',191),(498,'188.fe9d7bb2d291416e96541d100fc8ac335490e36ee1041553cd14a458d912af2428268d29ca3fc754','2021-06-21 06:00:57',188),(500,'193.d4bbfa4cb251ee5eb675040b994c7eae6202931d9a190f1bbfa3e6c21928b91c10c807f2dca60d3d','2021-06-21 06:01:32',193),(501,'208.5e1f05065c97c1e03c88634c08ba776d50e8142b2859cc8f6333bc29cdbf9948d3ea9a1195302c82','2021-06-21 06:03:25',208),(502,'213.55e6147a0b43ff2c2718f82ccce154eb4f7d7927c3e31d65644308e0a5dec0bfce0c098c4715d026','2021-06-21 06:06:06',213),(511,'248.a595605f925155113fc490ecf5a7fdebc8d9115fe8f93c7caf9cd08e5499a10d1df679b40a120d7e','2021-06-21 18:30:32',248),(512,'253.b82d2e0b358d120ad3887fe34f561779031ceba9759262f50402ade0774df7391ee009aef6ebc91e','2021-06-21 19:37:42',253);
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
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2021-06-13 02:57:50','2021-05-26 15:22:54','Akide_Liu','Akide_Liu',40,'Marry','$2b$10$zn/9zM9DCVTanvvptXcPDuunJpBpIqMYscLn.Ej7j.530Oz7dKCFe','Brompton Shopping Centre, shop 6/89-91 Torrens Rd, Brompton SA 5007','Marry@gmail.com',0,0,450460612),('2021-06-13 02:56:58','2021-05-26 15:27:20','Akide_Liu','Akide_Liu',42,'Matt','$2b$10$lqBI2Eszaw9Q.VycRPRiluixcrECGl.P7.FKuUUR6qyuagB5Vi/E6','2A George St, Hindmarsh SA 5007','matt@gmail.com',0,0,450434786),('2021-06-12 07:37:37','2021-05-26 15:27:31','Akide_Liu','Akide_Liu',43,'Ranny','$2b$10$3lYjRfeDBkG/6bVTXBde6O4GawNyvYR4IO/UbPnDXUg/X1wZtHaU6','9/13 Bacon St, Hindmarsh SA 5007','Ranny@adelaide.edu.au',0,0,462356431),('2021-06-12 07:37:51','2021-05-26 15:27:58','Akide_Liu','Akide_Liu',44,'Yiyi','$2b$10$mOHNoZMSmyc.SQJpLNr/3uR1.BnrITjiyIiqWcR23IbjemxsPADiK','57/59 Second Ave, St Peters SA 5069','Yiyi@adelaide.edu.au',0,0,422578922),('2021-06-13 09:13:26','2021-05-26 15:28:27','Akide_Liu','Akide_Liu',45,'Amanda','$2b$10$yWH9Ztuj19SW/iFqnq1C1uQ5gIlu57gamWSm.TFvaj6Y7Nt6z6UD6','Bruce Webb Cres, Urrbrae SA 5064','Amanda@adelaide.edu.au',0,1,450460168),('2021-06-12 07:38:23','2021-05-26 15:31:30','Akide_Liu','Akide_Liu',48,'Wenwen','$2b$10$VtZTQ2gM3YaYmr6/tupndelkfe.Zq9vDGmJxU.NdFe5FWmB48ZcQO','St James Kinder, 19 Strathcona Ave, Panorama SA 5041','Wenwen@qq.com',0,0,450462893),('2021-06-12 07:39:10','2021-05-26 15:32:16','Akide_Liu','Akide_Liu',50,'Vera','$2b$10$2OvPc/wvINmrDDIzWrfjC.Y/ShXhBTkt0Y9vnJu2zJPuBegRRaZdy','28 Crozier Ave, Daw Park SA 5041','Vera@qq.com',0,0,450460228),('2021-06-12 07:38:39','2021-05-26 15:32:35','Akide_Liu','Akide_Liu',51,'Yuyu','$2b$10$WhQWhKQZKB6Q6VE8ZpaR.OMLuYTpCvsdCHTnAIe0HVCaZJfzRkCXu','11 Adelaide St, Magill SA 5072','Yuyu@adelaide.edu.au',0,0,450460145),('2021-06-12 07:39:38','2021-05-26 15:34:21','Akide_Liu','Akide_Liu',52,'Jessie','$2b$10$KKgn5pfvqoxPQWkaivD14unDSrrw/KBTuX/O545V92ySYJ41BWW0i','Building B University of South Australia Magill Campus, St Bernards Rd, Adelaide SA 5072','Jessie@gmail.com',0,0,423567389),('2021-06-12 07:40:04','2021-05-26 16:43:19','Akide_Liu','Akide_Liu',54,'Yuki','$2b$10$U.knzilHcVU9.06jLgz.qukM.HQ8fIm7X.A7FNjGKt0lmEbbFH5tC','485 The Parade, Magill SA 5072','Yuki@gmail.com',0,0,450460113),('2021-06-13 02:54:41','2021-05-26 08:40:24','Akide_Liu','Akide_Liu',55,'Amy','$2b$10$orAgRHnB1LtufzJOECjXfOlaAQHTUP2Syp91BQrDan5zkgX2OS3OW','414 Kensington Rd, Wattle Park SA 5066','Amy@gmail.com',0,0,450460134),('2021-06-12 07:57:39','2021-05-26 08:40:32','Akide_Liu','Akide_Liu',56,'Manman','$2b$10$ocB8n3LQnUKgp7ulIfXtNua7NojtObCYwXF.A8eOk7ddKsv9uI30.','26 Goyder St, Erindale SA 5066','Manman@gmail.com',0,0,450460169),('2021-06-12 07:43:46','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',58,'Rom','$2b$10$rjUL.9t6X..P.diJnXuKA.otAbln8kAdAq8u7oTXz.gi9wnPUeIbe','18A Hamilton St, Erindale SA 5066','rom@gmail.com',0,0,450460123),('2021-06-12 07:41:57','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',101,'Abby','$2b$10$rJO.2ejbMWQ8g8jUPW0Cp.gr.Nk5YPFviJ/ZuYt8EP69vvYz.8GLm','1A Hubbe Ct, Burnside SA 5066','Abby@gmail.com',0,0,450460234),('2021-06-12 07:43:29','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',102,'Yifan Wu','$2b$10$fYGbj16YggvBpHXgTsqEwurCkx5KYuLxU9WOhZmtELvba0DAG2E36','8 Allen St, Burnside SA 5066','YifanWu@gmail.com',0,0,435460122),('2021-06-12 07:43:06','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',170,'Timmy','$2b$10$Ws.eTv98RWbdmG4NBctBJORQnf9iyTLR5RPsqS89zFEI6Q49ZtNva','3 Bradfield St, Burnside SA 5066','Timmy@qq.com',0,0,450463456),('2021-06-12 07:42:52','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',171,'Rogar','$2b$10$GX1gb.FZEpkW54chwgT0tet5Z4jWf.F6MoZLKvT.s8IoMro/vgnyi','7A Undelcarra Rd, Burnside SA 5066','Rogar@qq.com',0,0,422570267),('2021-06-12 07:57:39','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',172,'Robert','$2b$10$luYTl1UMquacEOUNhxZ8cuQnl6lLCTN2qBg3bKYLQix1zDOSL/C.2','7A Undelcarra Rd, Burnside SA 5096','Robert@qq.com',0,0,450360123),('2021-06-12 07:42:17','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',173,'Danny','$2b$10$KNa.utx53t6WG4h2uodw4.8R3QwupU.//mr/b8I.XNTpCQcSLACiC','7 Willcox Ave, Prospect SA 5082','Danny@adelaide.edu.au',0,0,450462366),('2021-06-12 07:42:07','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',174,'Chris','$2b$10$BRSzVICsfzpJSQ9rKkB9Tuo5YkMqKWz0Iy7b90No/PibuNB70EjnK','28 Gladstone Rd, Prospect SA 5082','Chris@adelaide.edu.au',0,0,452874489),('2021-06-12 07:44:56','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',175,'Bill','$2b$10$lzFsUqI4hSELPcQDYLMnV.wXQKsAyDQUcnIDohFskcWalsNskpny.','168 Prospect Rd, Prospect SA 5082','Bill@qq.com',0,0,450469900),('2021-06-12 07:45:02','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',176,'Vivian','$2b$10$EjNeM5V9T7deeWshIPE91ONKcyKKaVOogrTh.IId8yRaJyd.psTBS','97 Boyle St, Prospect SA 5082','Vivian@adelaide.edu.au',0,0,450676716),('2021-06-12 07:47:45','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',177,'Selina','$2b$10$0tSqEAuDKZPx3jpoCEmJBOsd86s6Bs/ujxNrWP1uYP5HjwVToPo82','16 McQuillan Ave, Renown Park SA 5008','Selina@gmail.com',0,0,450463767),('2021-06-12 07:47:04','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',178,'Nanyi','$2b$10$JF991WkcYK3KhluW4PO2f.iAyFj0jJY1lBoxdA0PiBT4DRinkKs2O','16 McQuillan Ave, Renown Park SA 5070','hjhsdjhvksj@gmail.com',0,0,450460234),('2021-06-12 07:46:45','2021-05-26 16:43:19','Akide_Liu','Akide_Liu',179,'Xixi','$2b$10$zUgJN8LSrbV5YgBVoU9Tbe3XcNAwrKT.60a3sObaSLj96wG69uLMm','15 Francis Ridley Cct, Brompton SA 5007','a1810022@adelaide.edu.au',0,0,470462183),('2021-06-12 07:46:36','2021-05-26 16:43:19','Akide_Liu','Akide_Liu',180,'Frank','$2b$10$KThP5WoBIMzK0FGN0Puosu5FOaNNoKZMbM3PtTp8j4GrQQfBaazIm','114A Coglin St, Brompton SA 5007','Frank@google.com',0,0,450460986),('2021-06-12 07:46:57','2021-06-01 06:27:28','Akide_Liu','Akide_Liu',181,'Cici','$2b$10$rTrrzx3dftz9Lb966Yd.Fu2BCwlTeI3jmqHrgwzE/mh0osyJkKz3q','114A Coglin St, Brompton SA 5087','Cici@apple.com',0,0,450460789),('2021-06-12 07:51:00','2021-06-01 06:27:28','Akide_Liu','Akide_Liu',182,'Chichi','$2b$10$n.hQ4DTeVJvnscLbaFZAyuyU8gKXEZs0HgCjkImvuXLa7ioQWRDfC','Lvel 1, The Tennyson Centre, 520 South Rd, Kurralta Park SA 5037','Chichi@yahoo.com',0,0,450489088),('2021-06-12 07:48:50','2021-06-01 17:11:59','Akide_Liu','Akide_Liu',185,'Zaclsp','$2b$10$GTl5te1t2cJ.792P/uofkuBaX/kFsYbgX7TigzY1s0Krr2l85gBEC','72 Wood Ave, Ridleyton SA 5008','Zaclsp@gmail.com',0,0,450498797),('2021-06-12 07:56:10','2021-06-01 17:14:52','Akide_Liu','Akide_Liu',186,'Gilbert','$2b$10$EX1bDBDkHMjtlanWcC0bOuQMIQS2II20r9iquIE6H58JVIK3QyRgG','172 Anzac Hwy, Glandore SA 5037','Gilbert@yahoo.com',0,0,450460162),('2021-06-12 07:57:15','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',187,'Roberto','$2b$10$T.spJmHg6aIT00s0mk/U6O8CCeZ97pmEolipZmbOLfM/D1XPVpy7i','62/64 Anzac Hwy, Everard Park SA 5035','Roberto@byte.com',0,0,450460176),('2021-06-12 07:57:10','2021-05-26 15:15:46','Akide_Liu','Akide_Liu',188,'Ramon','$2b$10$Yp80VP5S/O8PVfvVBdA9Buei.RabKoRHV5gonu.NI5tejR.Febapm','66-72 Leader St, Forestville SA 5035','Ramon@banana.com',0,0,451460162),('2021-06-12 07:56:30','2021-06-01 19:30:29','System admin','System admin',190,'haha','$2b$10$HUtkVd3SjnreM6Wsb/vraOdXwb7o0YsiUo2sAksfw8udQyasQeXcq','501 King St, prospect, SA','wdc@adelaide.edu.au',0,0,450466478),('2021-06-13 21:41:29','2021-06-01 19:34:46','Akide_Liu','Akide_Liu',191,'Liam','$2b$10$kPA2yHqbSSTbtelka3kAy.n.bbKf2DLopc9rTvLJtX3r8jA2q5jH.','75 Goodwood Rd, Goodwood SA 5034','Liam@apple.com',1,0,450986012),('2021-06-13 21:41:50','2021-06-01 19:36:11','Akide_Liu','Akide_Liu',192,'Claude','$2b$10$b.TYNft9Y5e3y65QPVXrJeULiKqHnE60t.FevxexEASlJz6NaMVJS','test st, prospect, 141 Goodwood Rd, Goodwood SA 5034SA','cici@gmail.com',0,0,450460163),('2021-06-13 21:42:04','2021-06-02 05:03:25','Akide_Liu','Akide_Liu',193,'Antonio','$2b$10$p20xtsNtMELSifB7NXBzuuqbhqR5zO.cUgOuKE9bnM3VsY2T7P2.u','test st, pros2HVM+JC Millswood, South Australiapect, SA','Antonio@ppp.com',1,0,452464156),('2021-06-12 07:52:16','2021-06-02 05:06:02','Akide_Liu','Akide_Liu',194,'Winnie','$2b$10$UN1QxwQczhmtkHfqXYJN2eM0RsIN3WNFYff.k3G2TPRwb4HgWiBZO','53 Fourth Ave, Klemzig SA 5087','123455321@qq.com',0,0,450460456),('2021-06-13 21:43:07','2021-06-02 05:08:42','Akide_Liu','Akide_Liu',195,'William','$2b$10$hHZrGl3m.RS3sVhVrfV90e.cTt918jC9hPcmRGfQD1HOE5e9Mt8ja','Everard Park SA 5035','william@adelaide.edu.au',0,0,450460166),('2021-06-13 21:43:16','2021-06-02 05:08:50','Akide_Liu','Akide_Liu',196,'Zizi','$2b$10$jt2Q2GzhixvZkRiyl7dUtOJQZG.jPV1qzeyb2XduRbcQ748oahYWK','244 - 270 East Parkway Corner Hampstead Road and, East Pkwy, Lightsview SA 5085','Zizi@outlook.com',0,0,450462882),('2021-06-12 07:49:56','2021-06-03 00:52:56','Akide_Liu','Akide_Liu',197,'Beta','$2b$10$aFleEcLL9oaoLS5AHSHv2ucNE0x4.YZl1uPPXogbBzlbjVOnvJf6.','23 Taminga St, Regency Park SA 5010','Beta@gmail.com',0,0,450460889),('2021-06-13 01:14:15','2021-06-03 00:53:13','Akide_Liu','Akide_Liu',198,'Isabella','$2b$10$WMRaYnDvWuSoXqFeGLn6ROYXShgtbUfF/uQIEVnxwON.8il.GAzTi','28 Begley Street  ADELAIDE, South Australia(SA), 5000','Isabella@Isabella.com',0,0,491570156),('2021-06-13 01:14:51','2021-06-03 00:56:50','Akide_Liu','Akide_Liu',200,'Isabella','$2b$10$9rcy2bWTj/y/iw6FV2cprupGgm2z3LnBtmezbsHFlc5cOe70ncggK','33 Pirie St, Adelaide SA 5000','Isabella@plane.com',0,0,491570158),('2021-06-13 21:43:28','2021-06-03 00:58:04','Akide_Liu','Akide_Liu',201,'Jessica','$2b$10$x0m11F1fixwi/UiqcYOydOvzn.FtXRmHZlu3xhDCAYJBlKoGn6EyO','226 Morphett St, Adelaide SA 5000','Jessica@office.com',0,0,491570159),('2021-06-13 21:43:52','2021-06-03 01:04:02','Akide_Liu','Akide_Liu',202,'Lily','$2b$10$zZE6NWTwTzQLX4Pl2x8lR.JfD8JY/g/8s8OrRJyPeRRySvj2NpTki','25 O\'Connell St, North Adelaide SA 5006','Lily@car.com',1,0,491570160),('2021-06-13 21:44:07','2021-06-03 01:13:36','Akide_Liu','Akide_Liu',203,'Margaret','$2b$10$nnP69YT0msY32.EfWi/u/OeRtPeLMdJnKqp9NqUMQwhEdo4ZBuRuO','42 O\'Connell St, North Adelaide SA 5006','Margaret@Lily.com',0,0,491570110),('2021-06-13 01:16:34','2021-06-03 01:13:55','Akide_Liu','Akide_Liu',204,'Handoff','$2b$10$c0bG2pkJiDtNTGJYl6p1nOrQZvgaZdY8R5s/sOSxsntsH.j86rDjW','51 O\'Connell St, North Adelaide SA 5006','Handoff@kett.com',0,0,491570111),('2021-06-13 21:44:44','2021-06-03 01:17:28','Akide_Liu','Akide_Liu',205,'Bethany','$2b$10$V.CEV/lnLk7/etae1/HdbONEqtCxVY3cKORuCULNSh7pyayNj7BUy','37 O\'Connell St, North Adelaide SA 5006','Bethany@flus.com',0,0,491570112),('2021-06-13 01:17:17','2021-06-03 01:17:36','Akide_Liu','Akide_Liu',206,'Elizabeth','$2b$10$lzmtmk2B9rgjQvZDenPaYu4EOdFTyo1TNwDXyHU5r.lagxaGVVaZ.','175 O\'Connell St, North Adelaide SA 5006','Elizabeth@beth.com',0,0,491570113),('2021-06-13 21:44:57','2021-06-03 01:20:36','Akide_Liu','Akide_Liu',207,'Joanne','$2b$10$tNjiX3FzlZoM3h0kwIPHfug0AJ1chfvkQQJBHconV6bfbMXn4cNHi','175 O\'Connell St, North Adelaide SA 5006','Joanne@seyou.edu.au',0,0,491570119),('2021-06-13 21:45:16','2021-06-03 01:22:13','Akide_Liu','Akide_Liu',208,'Megan','$2b$10$5LqO23sMv6Wkeec2/jEAlONgfLMa9W5ZlxekUjA5x8uFzhozzjDqG','179 O\'Connell St, North Adelaide SA 5006','Megan@adelaide.edu.au',1,0,450460171),('2021-06-13 01:20:32','2021-06-03 01:25:45','Akide_Liu','Akide_Liu',209,'Victoria','$2b$10$xQPVdPQMSy3jyc7EcClBOemYylacnn.89i2fCg6UHMgaQ8aEP5KkW','181 O\'Connell St, North Adelaide SA 5006','Victoria@adelaide.edu.au',0,0,450460172),('2021-06-13 01:21:04','2021-06-03 01:25:55','Akide_Liu','Akide_Liu',210,'Lauren','$2b$10$fPTNGzQocQMwXIL6PmX/MOtvlcgUT2aPIrTdrESX.YzJ3SC4P8Neu','43 O\'Connell St, North Adelaide SA 5006','Lauren@adelaide.edu.au',0,0,450460173),('2021-06-13 01:20:54','2021-06-03 01:29:03','Akide_Liu','Akide_Liu',211,'Michelle','$2b$10$5qpy5ECoYCze8Puugs8/iOosUtAx8t7.gk9rS6ZGGw5R1zf6xDhme','53A O\'Connell St, North Adelaide SA 5006','Michelle@163.edu.au',0,0,450460175),('2021-06-13 21:45:32','2021-06-03 01:29:32','Akide_Liu','Akide_Liu',212,'Tracy','$2b$10$x7bNMSNUqsxgbeigOk83k.n8aB/EBwVnKGkIPglrBm7liA.ltwyY.','3/57-59 O\'Connell St, North Adelaide SA 5006','Tracy@terrave.edu.au',1,0,450460176),('2021-06-13 21:45:50','2021-06-03 01:30:02','Akide_Liu','Akide_Liu',213,'Emma','$2b$10$.hKWKzaGGKOiMCbmBB5msuT52Ld47mjnlhkBoaski/THN5WQs.tU.','60 O\'Connell St, North Adelaide SA 5006','Emma@cat.com',1,0,450460001),('2021-06-13 21:46:02','2021-06-03 01:30:25','Akide_Liu','Akide_Liu',214,'Sophia','$2b$10$OFn7EpahuK17/sRKZp/gVeUknZ6rTGF.Cp3GinO2Q41JUtPvUImQ2','50 O\'Connell St, North Adelaide SA 5006','Sophia@wangyi.com',0,0,450460002),('2021-06-13 01:18:15','2021-06-03 01:32:22','Akide_Liu','Akide_Liu',215,'Isabella','$2b$10$YSoJbszWb2jhMscDtstt2.fdSDjaUuYW1bjOyNp9V8SXKLNEUAChW','42 O\'Connell St, North Adelaide SA 5006','Isabella@365.com',0,0,450460004),('2021-06-13 01:17:56','2021-06-03 01:34:28','Akide_Liu','Akide_Liu',216,'Ava','$2b$10$qYp4fSG1pEv7U0gg7SFrPOL/mYiM5TDhgCE96QJEeMot8s7XABkJq','51 O\'Connell St, North Adelaide SA 5006','Ava@monky.com',0,0,450460008),('2021-06-13 01:17:39','2021-06-03 01:34:38','Akide_Liu','Akide_Liu',217,'Sophie','$2b$10$wZzLvdu8bCHKYKc5jB8WxeZ/BgN0LbhUvgb.cNi8L6gS7M.O9Vdvi','19 O\'Connell St, North Adelaide SA 5006','Sophie@panda.com',0,0,450469004),('2021-06-13 01:08:45','2021-06-03 01:35:02','Akide_Liu','Akide_Liu',218,'Noah	','$2b$10$R2iBkLB32Kl06j3YoxybPu1Xypf3MM8I7di8j5ZZGmx1HglmTAxym','197 Gover St, North Adelaide, SA 5006 ','Noah@hook.com',0,0,450400166),('2021-06-13 01:08:57','2021-06-03 01:35:10','Akide_Liu','Akide_Liu',219,'Richard','$2b$10$goQOr44iYjL3s5ZXkRyoAeCGOy0MpX2cfDti2nSpBDgdU3w/Axety','25 Vincent Pl, Adelaide, SA 5000  ','Richard@man.com',0,0,450461166),('2021-06-13 01:09:17','2021-06-03 01:35:27','Akide_Liu','Akide_Liu',220,'Thomas','$2b$10$3IqvpWg8CSsq5zj/BfkK1.iIM3PyJEPbxvsxCi/.LW8GlGHNCcy1G','141 East Tce, Adelaide, SA 5000','Thomas@163.com',0,0,450461266),('2021-06-13 01:09:29','2021-06-03 01:35:33','Akide_Liu','Akide_Liu',221,'Reece','$2b$10$.sbr2F26xSw.UkYW5V98ZOvkO9T6YG29BCIaSmEoCfS61C9yh0okO','233 A Wright St, Adelaide, SA 5000','Reece@360.com',0,0,450408166),('2021-06-13 01:21:39','2021-06-03 01:35:47','Akide_Liu','Akide_Liu',222,'Jack','$2b$10$Ne37ZM5lZk21L2ye/E3w4uhskAIJYWl0Yy76v9YQ0t9fXyEm7NihO','46 Pennington Tce, North Adelaide, SA 5006 ','Jack@queen.com',0,0,460460166),('2021-06-13 01:22:08','2021-06-03 01:35:56','Akide_Liu','Akide_Liu',223,'Oscar','$2b$10$JMF/xaH9k.RkQV.CJ93b5uL7/L9FrV38lOe.sRCsjeauDPDk.rVCq','1 Hindley St, Adelaide, SA 5000','Oscar@chian.com',0,0,452460166),('2021-06-13 01:22:49','2021-06-03 01:36:14','Akide_Liu','Akide_Liu',224,'Rhys','$2b$10$Aj1bjOGivYutDlYXWxPUQ.THAlfUcCobPf7x1pxHnq/li6UZnm2dS','6 Hurman St, Adelaide, SA 5000','Rhys@Rhys.com',0,0,421460166),('2021-06-13 01:23:37','2021-06-03 01:36:18','Akide_Liu','Akide_Liu',225,'Daniel','$2b$10$JFI28q.uvOklA4WZwQzRNOXZ9/rKhQy9FknOzpN7fn3tIVS0VGL62','212 Gilles St, Adelaide, SA 5000','Daniel@Daniel.com',0,0,401111166),('2021-06-13 01:31:40','2021-06-03 01:36:24','Akide_Liu','Akide_Liu',226,'Amelia','$2b$10$/LSj7YOLdt/OhGmMbckFVOHoYwpj2jiVvsVs8esf6RP/oG.IRECQ6','10 Nelson Pl, Adelaide, SA 5000','Amelia@shan.com',0,0,454321166),('2021-06-13 01:32:15','2021-06-03 01:36:28','Akide_Liu','Akide_Liu',227,'Olivia','$2b$10$V.u5hiUbikXJZthy/krax.lsdneWcf72RPUjohE74mNvnoQ1hbF8e','20 Ehmckes La, Adelaide, SA 5000','Olivia@adelaide.edu.au',0,0,411160166),('2021-06-13 01:32:28','2021-06-03 01:36:41','Akide_Liu','Akide_Liu',228,'Isla','$2b$10$zVD9lm7A1S24cbD1lLZGZuiD5vfLDUloTHV9/rCS0WJdHgwu8u9oq','15 Francis St, North Adelaide, SA 5006 ','Isla@feiji.com',0,0,422222216),('2021-06-13 01:33:28','2021-06-03 01:37:09','Akide_Liu','Akide_Liu',229,'Ava','$2b$10$RkFxf9REh6yvqj/TPIite.b9sHhip5Le5H0/OMsdeueai1TiRMXl2','19 Edith Pl, North Adelaide, SA 5006','Ava@adelaide.edu.au',0,0,450411166),('2021-06-13 01:33:43','2021-06-03 01:37:13','Akide_Liu','Akide_Liu',230,'Poppy','$2b$10$zsdqU2MyorPyAcyfdX3oUO4/BOOtx35upksiBfTHCug/ZPlMPUa1G','17 Boulton St, North Adelaide, SA 5006','Poppy@zhejiang.com',0,0,450432323),('2021-06-13 01:34:22','2021-06-03 01:39:12','Akide_Liu','Akide_Liu',231,'Emily','$2b$10$WRNCGRBneVETwi2n.XOU1.h4Q1kL48Qot2ybWzjWta0wofdg.1eoi','408 Gilles St, Adelaide, SA 5000','Emily@watch.com',0,0,450465588),('2021-06-13 01:30:16','2021-06-03 18:45:48','2021-06-03T18:32:23.281Z','System admin',232,'Isla','$2b$10$1b5DU5SVQQ5k81tCNAz2P.MJOH7gPF2mdsz9a7XL9XPRKrJ5FvcHa','137 Strangways Tce, North Adelaide, SA 5006','wdc@adelaide.edu.au',0,0,450464522),('2021-06-13 00:45:52','2021-06-03 18:53:51','2021-06-03T18:37:56.329Z','System admin',234,'Liam','$2b$10$BEJTTrRypyy3k2MPOu0D2uWPAOmHibu6ZfprQ5ahet8ROgLS2Voqa','408 Gilles St, Adelaide, SA 5000','Liam@liam.com',0,0,450466666),('2021-06-13 01:30:30','2021-06-03 19:55:04','System admin','System admin',235,'Mason','$2b$10$xa/k.erVxD46oI8VgAA0veZsXF5W0VsUfYXdMdYvt.UlaJQhTo.Iq','501 King St, prospect, SA','wdc@adelaide.edu.au',0,0,450464722),('2021-06-13 01:34:03','2021-06-03 18:29:43','Akide_Liu','Akide_Liu',236,'Ziqi Zhang','$2b$10$XMIFNIEgDKsj4i.mhapBo.TIykCAvQwHl86NYsuIKxfYrwXWCyis2','Adelaide SA 5000, Adelaide, SA 5000','Ziqi@email.com',0,0,450460166),('2021-06-13 01:33:04','2021-06-04 23:58:44','Akide_Liu','Akide_Liu',237,'James','$2b$10$CIDORdxhQiorkReNczfx9ekjjip7f4Pm4Jdj9jv14v4a3hXnokvZ.','17 Boulton St, North Adelaide, SA 5006 ','James@hemp.com',0,0,450546716),('2021-06-13 01:32:45','2021-06-04 23:58:54','Akide_Liu','Akide_Liu',238,'George','$2b$10$QvEQmqYPV3auz6S0mNgVtuFQbEAON4AjunzW0yfbpHY.F5BYS9Kby','222 Grote St, Adelaide, SA 5000','George@moke.com',0,0,450222166),('2021-06-12 23:44:46','2021-06-05 00:00:28','Akide_Liu','Akide_Liu',239,'ming','$2b$10$/HrW8w3qQ3aS3Am/gnjjOe1r2iOfrhkJDdVuRh/BWYjk.U/1rzc2q','Corner of Hackney Rd &, Botanic St, Adelaide SA 5000','ming@apple,com',0,0,450460166),('2021-06-12 23:56:14','2021-06-07 16:37:03','System admin','System admin',242,'Osteria','$2b$10$IIFrB9CST4YBYlGOYzYujegvP9ffgVK1yM3RTckQALroeXppBLqBi','76 Pirie St, Adelaide SA 5000','Osteria@ban.com',0,0,450460600),('2021-06-12 23:55:24','2021-06-07 16:39:44','System admin','System admin',243,'Rhys','$2b$10$d4PM9cN4Yu2mSd9KMYisE.vAbPIQKrRvMUTScMrLREgQdwMeOjWku','44-60 Gouger St, Adelaide SA 5000','Rhys@venom.com',0,0,450460666),('2021-06-12 23:54:31','2021-06-07 16:41:17','System admin','System admin',244,'Jacob','$2b$10$FyYprfsXgDtPwazOirDBcudqEG/zvWlvn9klbLEPNif82xoAxzC.a','120 Angas St, Adelaide SA 5000','Jacob@app.com',0,0,450460609),('2021-06-12 23:53:21','2021-06-07 16:59:20','System admin','System admin',245,'Joseph','$2b$10$pF5CJNP5DVl5UbRAzOvGKOtHMM6qKIwwZuCDqglCIZ6pM8Thp4o2C','South Terrace &, Glen Osmond Rd, Adelaide SA 5000','Joseph@apple.com',0,0,450460154),('2021-06-14 10:30:32','2021-06-07 21:14:33','2021-06-08T19:56:01.686Z','System admin',248,'Akide Liu','$2b$10$Wgf5QO50dnRJRrk.BQWJU.1nzdHdw/6x9FunVS0/1QdnF.LrotVhi','236 Pulteney St, Adelaide SA 5000','lly404861870@gmail.com',1,0,402325602),('2021-06-13 01:29:31','2021-06-08 21:31:31','Akide_Liu','Akide_Liu',249,'davide','$2b$10$hN/h2sUHLffRP8Dx6k7lEeGxiJGQqzJgHF/DJwJcFV4GxjhahXTV6','194 Greenhill Rd, Eastwood SA 5063','David@google.com',0,0,450460166),('2021-06-12 23:51:10','2021-06-08 21:42:46','Akide_Liu','Akide_Liu',250,'Jack','$2b$10$vwsZDuZbcS9hLI0CMyvX0ulViINaHsNBR0z/tPkTJlOE1Ayfeu6DC','Corner George St and, William St, Norwood SA 5067','Jack@adelaide.edu.au',0,0,450460133),('2021-06-13 01:30:59','2021-06-11 17:48:56','System admin','System admin',251,'Liyang Liu','$2b$10$7/NBGlD.wvuvYv4/JhL53ulAvS2JAFlXeAynBYh4vP8LgvXb6HLhe','79 High St, Kensington SA 5068','a1743748@student.adelaide.edu.au',0,0,450460661),('2021-06-13 01:05:26','2021-06-11 19:39:59','Akide_Liu','Akide_Liu',252,'Oliver','$2b$10$RslZ7zM9rygQJaO/fMrE0.3E56rQBFjTnVx1RhK43VJzR.5bDKfAi','7 Wakefield St, Kent Town SA 5067','Oliver@qq.com',0,0,450461100),('2021-06-14 07:11:37','2021-06-13 01:29:42','2021-06-14T05:41:37.884Z','Akide_Liu',253,'admin','$2b$10$FLwAjcOOXtXHt6NsJj/XjeDzKxvDqhaFctLNleyU3fDr/xOzOnQGm','test st, prospect, SA','test@adelaide.edu.au',1,1,450460166),('2021-06-13 02:55:35','2021-06-13 02:55:35','Akide_Liu','Akide_Liu',254,'chi wang','$2b$10$ERX5TOz8kvd0/LQdOMAZG.EkTUf2esGYa3EajeVSRj7xF2lgxlkve','test st, prospect, SA','chi@gmail.com',0,1,450460166),('2021-06-13 02:56:22','2021-06-13 02:56:22','Akide_Liu','Akide_Liu',255,'chi wang','$2b$10$LPYcXAc3UFmz6v1ZP1O5p.VsLhgYjQ1zpLi.G0YNfVZjOnWf4kqi6','Adelaide 5000 SA','chi@adelaide.edu.au',0,1,450460166),('2021-06-13 02:59:13','2021-06-13 02:59:13','System admin','System admin',256,'chiwang','$2b$10$1pXrriayiuv.R97DcnuI/.J6lpodXea2aGU2G3TK2daepDnjHbJqm','SA 5000','sbc@gmail.com',0,0,411118021),('2021-06-13 03:03:42','2021-06-13 03:03:42','System admin','System admin',257,'chi wang','$2b$10$ibavt/ZaZRJHdvNJzfGlb..RohdgH81THvnDnaXnv0176ieDNWDOi','SA 5000','abc@gmail.com',0,0,499988521);
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
INSERT INTO `user__role_role` VALUES (40,2),(42,2),(43,1),(44,3),(45,3),(48,3),(50,3),(51,3),(52,2),(54,3),(55,3),(56,3),(58,3),(101,2),(102,1),(170,3),(171,3),(172,3),(173,3),(174,3),(175,3),(176,3),(177,2),(178,3),(179,3),(180,3),(181,3),(182,3),(185,3),(186,3),(187,3),(188,3),(190,1),(191,3),(192,3),(193,3),(194,1),(195,3),(196,3),(197,3),(198,3),(200,3),(201,3),(202,3),(203,3),(204,3),(205,3),(206,3),(207,3),(208,3),(209,3),(210,3),(211,3),(212,3),(213,3),(214,3),(215,3),(216,3),(217,3),(218,3),(219,3),(220,3),(221,3),(222,3),(223,3),(224,3),(225,3),(226,3),(227,3),(228,3),(229,3),(230,3),(231,3),(232,1),(234,1),(235,1),(236,3),(237,3),(238,3),(239,3),(242,2),(243,1),(244,3),(245,1),(248,3),(249,1),(250,2),(251,2),(252,2),(253,1),(254,3),(255,3),(256,3),(257,3);
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
INSERT INTO `user__user_check_in_user_check_in` VALUES (42,2),(191,30),(191,31),(191,32),(191,33),(191,34),(191,35),(191,36),(191,37),(191,38),(191,39),(191,40),(193,41),(193,42),(193,43),(193,44),(193,45),(193,46),(193,47),(193,48),(201,16),(201,17),(201,18),(201,19),(201,20),(201,21),(202,12),(202,13),(202,14),(202,15),(208,49),(208,50),(208,51),(208,52),(208,53),(208,54),(208,55),(208,56),(208,57),(212,22),(212,23),(212,24),(212,25),(212,26),(212,27),(212,28),(212,29),(213,58),(213,59),(213,60),(213,61),(213,62),(213,63),(213,64),(213,65),(213,66),(232,3),(232,4),(232,7),(232,8),(232,9),(232,10),(248,5),(248,6),(248,11),(248,67),(248,68),(248,69),(248,70);
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
INSERT INTO `user__venue_venue` VALUES (172,45),(186,49),(219,42),(232,2),(253,7);
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
  `venueVenueId` int(11) DEFAULT NULL,
  PRIMARY KEY (`check_in_id`),
  KEY `FK_6bbcca94b6da0d08721fd1670ff` (`venueVenueId`),
  CONSTRAINT `FK_6bbcca94b6da0d08721fd1670ff` FOREIGN KEY (`venueVenueId`) REFERENCES `venue` (`venue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_check_in`
--

LOCK TABLES `user_check_in` WRITE;
/*!40000 ALTER TABLE `user_check_in` DISABLE KEYS */;
INSERT INTO `user_check_in` VALUES ('2021-05-09 15:46:06','2021-05-09 15:46:07','Akide_Liu','Akide_Liu',1,1,'156 george st ,Adelaide','0000-00-00 00:00:00',NULL),('2021-06-08 19:41:05','2021-06-08 19:41:05','test42','test42',2,1,'156 george st ,Adelaide','2021-06-08 18:11:06',NULL),('2021-06-08 19:56:30','2021-06-08 19:56:30','admin','admin',3,2,'22 hendly st, Adelaide','2021-06-08 19:56:30',NULL),('2021-06-08 20:01:01','2021-06-08 20:01:01','admin','admin',4,2,'22 hendly st, Adelaide','2021-06-08 20:01:01',NULL),('2021-06-08 21:26:27','2021-06-08 21:26:27','Akide Liu','Akide Liu',5,2,'22 hendly st, Adelaide','2021-06-08 21:26:27',NULL),('2021-06-08 21:38:42','2021-06-08 21:38:42','Akide Liu','Akide Liu',6,2,'22 hendly st, Adelaide','2021-06-08 21:38:42',NULL),('2021-06-11 16:15:06','2021-06-11 16:15:06','admin','admin',7,2,'22 hendly st, Adelaide','2021-06-11 16:15:06',2),('2021-06-11 16:21:49','2021-06-11 16:21:49','admin','admin',8,2,'22 hendly st, Adelaide','2021-06-11 16:21:49',2),('2021-06-11 16:21:58','2021-06-11 16:21:58','admin','admin',9,2,'22 hendly st, Adelaide','2021-06-11 16:21:58',2),('2021-06-11 16:22:03','2021-06-11 16:22:03','admin','admin',10,2,'22 hendly st, Adelaide','2021-06-11 16:22:03',2),('2021-06-11 18:07:57','2021-06-11 18:07:57','Akide Liu','Akide Liu',11,2,'22 hendly st, Adelaide','2021-06-11 18:07:57',2),('2021-06-13 21:47:45','2021-06-13 21:47:45','Lily','Lily',12,2,'67 Wood Ave, Brompton SA 5007','2021-06-13 21:47:45',2),('2021-06-13 21:48:07','2021-06-13 21:48:07','Lily','Lily',13,5,'Prospect Rd, Prospect SA 5082','2021-06-13 21:48:07',5),('2021-06-13 21:48:14','2021-06-13 21:48:14','Lily','Lily',14,10,'Shop52, 53/81 Carrington St, Adelaide SA 5000','2021-06-13 21:48:14',10),('2021-06-13 21:48:21','2021-06-13 21:48:21','Lily','Lily',15,23,'Level 4/70 Light Square, Adelaide SA 5000','2021-06-13 21:48:21',23),('2021-06-13 21:49:50','2021-06-13 21:49:50','Jessica','Jessica',16,46,'373 Glen Osmond Rd, Glen Osmond SA 5064','2021-06-13 21:49:50',46),('2021-06-13 21:50:24','2021-06-13 21:50:24','Jessica','Jessica',17,2,'67 Wood Ave, Brompton SA 5007','2021-06-13 21:50:24',2),('2021-06-13 21:50:46','2021-06-13 21:50:46','Jessica','Jessica',18,20,'North Terrace, Adelaide SA 5000','2021-06-13 21:50:46',20),('2021-06-13 21:51:20','2021-06-13 21:51:20','Jessica','Jessica',19,30,'Adelaide SA 5000','2021-06-13 21:51:20',30),('2021-06-13 21:51:45','2021-06-13 21:51:45','Jessica','Jessica',20,12,'232 Hutt St, Adelaide SA 5000','2021-06-13 21:51:45',12),('2021-06-13 21:52:14','2021-06-13 21:52:14','Jessica','Jessica',21,5,'Prospect Rd, Prospect SA 5082','2021-06-13 21:52:14',5),('2021-06-13 21:53:40','2021-06-13 21:53:40','Tracy','Tracy',22,7,'Level 1/309 Pulteney St, Adelaide SA 5000','2021-06-13 21:53:40',7),('2021-06-13 21:53:49','2021-06-13 21:53:49','Tracy','Tracy',23,2,'67 Wood Ave, Brompton SA 5007','2021-06-13 21:53:49',2),('2021-06-13 21:54:11','2021-06-13 21:54:11','Tracy','Tracy',24,15,'44-60 Gouger St, Adelaide SA 5000','2021-06-13 21:54:11',15),('2021-06-13 21:54:59','2021-06-13 21:54:59','Tracy','Tracy',25,42,'55 Anzac Hwy, Ashford SA 5035','2021-06-13 21:54:59',42),('2021-06-13 21:55:15','2021-06-13 21:55:15','Tracy','Tracy',26,42,'55 Anzac Hwy, Ashford SA 5035','2021-06-13 21:55:15',42),('2021-06-13 21:55:35','2021-06-13 21:55:35','Tracy','Tracy',27,17,'Cnr Main North Road &, Kings Rd, Parafield SA 5106','2021-06-13 21:55:35',17),('2021-06-13 21:56:17','2021-06-13 21:56:17','Tracy','Tracy',28,35,'Jeffrey Smart Building, 217/243 Hindley St, Adelaide SA 5000','2021-06-13 21:56:17',35),('2021-06-13 21:56:25','2021-06-13 21:56:25','Tracy','Tracy',29,19,'Sir Edwin Smith Ave, North Adelaide SA 5006','2021-06-13 21:56:25',19),('2021-06-13 21:56:52','2021-06-13 21:56:52','Liam','Liam',30,33,'13 Shannon Pl, Adelaide SA 5000','2021-06-13 21:56:52',33),('2021-06-13 21:56:59','2021-06-13 21:56:59','Liam','Liam',31,2,'67 Wood Ave, Brompton SA 5007','2021-06-13 21:56:59',2),('2021-06-13 21:57:03','2021-06-13 21:57:03','Liam','Liam',32,4,'255 South Rd, Renown Park SA 5008','2021-06-13 21:57:03',4),('2021-06-13 21:57:09','2021-06-13 21:57:09','Liam','Liam',33,5,'Prospect Rd, Prospect SA 5082','2021-06-13 21:57:09',5),('2021-06-13 21:57:12','2021-06-13 21:57:12','Liam','Liam',34,6,'28/20 Little Gilbert St, Adelaide SA 5000','2021-06-13 21:57:12',6),('2021-06-13 21:57:17','2021-06-13 21:57:17','Liam','Liam',35,7,'Level 1/309 Pulteney St, Adelaide SA 5000','2021-06-13 21:57:17',7),('2021-06-13 21:57:21','2021-06-13 21:57:21','Liam','Liam',36,8,'North Terrace, Adelaide SA 5000','2021-06-13 21:57:21',8),('2021-06-13 21:57:26','2021-06-13 21:57:26','Liam','Liam',37,9,'80-88 Rundle Mall, Adelaide SA 5000','2021-06-13 21:57:26',9),('2021-06-13 21:57:36','2021-06-13 21:57:36','Liam','Liam',38,10,'Shop52, 53/81 Carrington St, Adelaide SA 5000','2021-06-13 21:57:36',10),('2021-06-13 21:57:52','2021-06-13 21:57:52','Liam','Liam',39,11,'408 King William St, Adelaide SA 5000','2021-06-13 21:57:52',11),('2021-06-13 21:58:36','2021-06-13 21:58:36','Liam','Liam',40,12,'232 Hutt St, Adelaide SA 5000','2021-06-13 21:58:36',12),('2021-06-13 22:01:47','2021-06-13 22:01:47','Antonio','Antonio',41,14,'60 Hardys Rd, Torrensville SA 5031','2021-06-13 22:01:47',14),('2021-06-13 22:01:51','2021-06-13 22:01:51','Antonio','Antonio',42,15,'44-60 Gouger St, Adelaide SA 5000','2021-06-13 22:01:51',15),('2021-06-13 22:02:07','2021-06-13 22:02:07','Antonio','Antonio',43,16,'33-37 Port Wakefield Rd, Gepps Cross SA 5094','2021-06-13 22:02:07',16),('2021-06-13 22:02:13','2021-06-13 22:02:13','Antonio','Antonio',44,16,'33-37 Port Wakefield Rd, Gepps Cross SA 5094','2021-06-13 22:02:13',16),('2021-06-13 22:02:17','2021-06-13 22:02:17','Antonio','Antonio',45,17,'Cnr Main North Road &, Kings Rd, Parafield SA 5106','2021-06-13 22:02:17',17),('2021-06-13 22:02:21','2021-06-13 22:02:21','Antonio','Antonio',46,18,'Adelaide SA 5005','2021-06-13 22:02:21',18),('2021-06-13 22:02:27','2021-06-13 22:02:27','Antonio','Antonio',47,19,'Sir Edwin Smith Ave, North Adelaide SA 5006','2021-06-13 22:02:27',19),('2021-06-13 22:02:32','2021-06-13 22:02:32','Antonio','Antonio',48,20,'North Terrace, Adelaide SA 5000','2021-06-13 22:02:32',20),('2021-06-13 22:03:41','2021-06-13 22:03:41','Megan','Megan',49,22,'120 Currie St, Adelaide SA 5000','2021-06-13 22:03:41',22),('2021-06-13 22:03:46','2021-06-13 22:03:46','Megan','Megan',50,23,'Level 4/70 Light Square, Adelaide SA 5000','2021-06-13 22:03:46',23),('2021-06-13 22:04:03','2021-06-13 22:04:03','Megan','Megan',51,24,'171 Hindley St, Adelaide SA 5000','2021-06-13 22:04:03',24),('2021-06-13 22:04:07','2021-06-13 22:04:07','Megan','Megan',52,25,'133 Hindley St, Adelaide SA 5000','2021-06-13 22:04:07',25),('2021-06-13 22:04:11','2021-06-13 22:04:11','Megan','Megan',53,26,'19 Morphett St, Adelaide SA 5000','2021-06-13 22:04:11',26),('2021-06-13 22:04:16','2021-06-13 22:04:16','Megan','Megan',54,27,'61-68 North Terrace, Adelaide SA 5000','2021-06-13 22:04:16',27),('2021-06-13 22:04:22','2021-06-13 22:04:22','Megan','Megan',55,28,'208 Hindley St, Adelaide SA 5000','2021-06-13 22:04:22',28),('2021-06-13 22:04:26','2021-06-13 22:04:26','Megan','Megan',56,29,'189/207 Hindley St, Adelaide SA 5000','2021-06-13 22:04:26',29),('2021-06-13 22:04:31','2021-06-13 22:04:31','Megan','Megan',57,30,'Adelaide SA 5000','2021-06-13 22:04:31',30),('2021-06-13 22:06:23','2021-06-13 22:06:23','Emma','Emma',58,32,'231 Waymouth St, Adelaide SA 5000','2021-06-13 22:06:23',32),('2021-06-13 22:06:27','2021-06-13 22:06:27','Emma','Emma',59,33,'13 Shannon Pl, Adelaide SA 5000','2021-06-13 22:06:27',33),('2021-06-13 22:09:26','2021-06-13 22:09:26','Emma','Emma',60,35,'Jeffrey Smart Building, 217/243 Hindley St, Adelaide SA 5000','2021-06-13 22:09:26',35),('2021-06-13 22:09:31','2021-06-13 22:09:31','Emma','Emma',61,36,'Ground Floor, 262/266 Pirie St, Adelaide SA 5000','2021-06-13 22:09:31',36),('2021-06-13 22:09:35','2021-06-13 22:09:35','Emma','Emma',62,37,'252-260 Pirie St, Adelaide SA 5000','2021-06-13 22:09:35',37),('2021-06-13 22:09:40','2021-06-13 22:09:40','Emma','Emma',63,38,'246-250 Pirie St, Adelaide SA 5000','2021-06-13 22:09:40',38),('2021-06-13 22:09:44','2021-06-13 22:09:44','Emma','Emma',64,42,'55 Anzac Hwy, Ashford SA 5035','2021-06-13 22:09:44',42),('2021-06-13 22:09:47','2021-06-13 22:09:47','Emma','Emma',65,43,'204 Unley Rd, Unley SA 5061','2021-06-13 22:09:47',43),('2021-06-13 22:09:57','2021-06-13 22:09:57','Emma','Emma',66,2,'67 Wood Ave, Brompton SA 5007','2021-06-13 22:09:57',2),('2021-06-14 07:43:23','2021-06-14 07:43:23','Akide Liu','Akide Liu',67,8,'North Terrace, Adelaide SA 5000','2021-06-14 07:43:23',8),('2021-06-14 07:43:26','2021-06-14 07:43:26','Akide Liu','Akide Liu',68,8,'North Terrace, Adelaide SA 5000','2021-06-14 07:43:26',8),('2021-06-14 07:45:15','2021-06-14 07:45:15','Akide Liu','Akide Liu',69,8,'North Terrace, Adelaide SA 5000','2021-06-14 07:45:15',8),('2021-06-14 07:45:23','2021-06-14 07:45:23','Akide Liu','Akide Liu',70,9,'80-88 Rundle Mall, Adelaide SA 5000','2021-06-14 07:45:23',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES ('2021-06-12 07:35:10','2021-05-30 05:08:46','admin','Super Admin',2,'100002','SitStayDogTreats@gmail.com','Sit Stay Dog Treats','67 Wood Ave, Brompton SA 5007',1,138.5964059,-34.9197809,3),('2021-06-12 07:35:32','2021-05-30 05:11:25','admin','Super Admin',3,'100001','Croydon@qq.com','Croydon Bowling Club','64 Blight St, Ridleyton SA 5008',0,138.587581,-34.9197809,1),('2021-06-12 07:35:48','2021-05-30 05:08:46','admin','Super Admin',4,'100003','a1810034@adelaide.edu.au','Singyen Hair & Beauty','255 South Rd, Renown Park SA 5008',0,138.587581,-34.9269366,2),('2021-06-13 11:16:22','2021-05-30 05:08:46','admin','Super Admin',5,'100004','Coles@gmail.com','Coles','Prospect Rd, Prospect SA 5082',0,138.61375066889812,-34.91864256833583,3),('2021-06-12 07:36:23','2021-05-30 05:08:46','admin','Super Admin',6,'100005','Mosque@gmail.com','Adelaide Mosque','28/20 Little Gilbert St, Adelaide SA 5000',0,138.60135860418657,-34.907230552776596,2),('2021-06-13 11:48:12','2021-05-30 05:08:46','admin','Super Admin',7,'100006','Cavalier@gmail.com','Cavalier Legal','Level 1/309 Pulteney St, Adelaide SA 5000',1,138.64114895293912,-34.94027914073686,3),('2021-06-12 07:37:18','2021-05-30 05:08:46','admin','Super Admin',8,'100007','Gallery@gmail.com','Art Gallery of South Australia','North Terrace, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-12 07:37:44','2021-05-30 05:08:46','admin','Super Admin',9,'100008','13ui21y4i@qq.com','Woolworths Rundle Mall','80-88 Rundle Mall, Adelaide SA 5000',0,138.58745397875978,-34.93284755990522,2),('2021-06-12 07:38:58','2021-05-30 05:08:46','admin','Super Admin',10,'100009','a17287488@adelaide.edu.au','The Mat on Carrington','Shop52, 53/81 Carrington St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 11:47:34','2021-05-30 05:08:46','admin','Super Admin',11,'100010','akjhckj@outlook.com','Mugen House','408 King William St, Adelaide SA 5000',0,138.59103189286603,-34.90640360153534,3),('2021-06-12 07:42:07','2021-05-30 05:08:46','admin','Super Admin',12,'100011','a1718173@adelaide.edu.au','Adelaide (Hutt St) IGA','232 Hutt St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-12 07:42:27','2021-05-30 05:08:46','admin','Super Admin',13,'100012','padjbfjnv@gmail.com','Corner Store Cafe','23 Swift Ave, Dulwich SA 5065',0,NULL,NULL,NULL),('2021-06-12 07:42:44','2021-06-08 21:08:06','admin','admin',14,'100013','www477@gmail.com','Adelaide Badminton Centre','60 Hardys Rd, Torrensville SA 5031',0,NULL,NULL,NULL),('2021-06-12 07:10:28','2021-06-08 22:38:05','admin','admin',15,'100014','w08@gmail.com','Adelaide Central Market','44-60 Gouger St, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-12 07:43:36','2021-06-09 04:48:18','admin','admin',16,'100015','jhsdfhjb@gmail.com','Sunday Market Gepps Cross','33-37 Port Wakefield Rd, Gepps Cross SA 5094',0,NULL,NULL,NULL),('2021-06-12 07:43:51','2021-06-11 17:35:07','admin','admin',17,'100016','a1810048@adelaide.edu.au','Bunnings Parafield','Cnr Main North Road &, Kings Rd, Parafield SA 5106',0,NULL,NULL,NULL),('2021-06-13 01:41:02','2021-06-13 01:41:02','admin','admin',18,'100017','adelaideuni@edu.au','The University of Adelaide','Adelaide SA 5005',0,NULL,NULL,NULL),('2021-06-13 01:42:31','2021-06-13 01:42:31','Isla','Isla',19,'100018','hos@gmail.com','The Memorial Hospital','Sir Edwin Smith Ave, North Adelaide SA 5006',1,NULL,NULL,NULL),('2021-06-13 01:43:06','2021-06-13 01:43:06','Isla','Isla',20,'100019','art@gmail.com','Art Gallery of South Australia','North Terrace, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:43:52','2021-06-13 01:43:52','Isla','Isla',21,'100020','centre@gmail.com','The Centre of Democracy','Institute Building, corner of North Terrace and, Kintore Ave, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:45:25','2021-06-13 01:45:25','Isla','Isla',22,'100021','tafe@gmail.com','TAFE SA - Adelaide Campus','120 Currie St, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-13 01:46:11','2021-06-13 01:46:11','Isla','Isla',23,'100022','Logic@gmail.com','Logic Plus','Level 4/70 Light Square, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-13 01:46:50','2021-06-13 01:46:50','Isla','Isla',24,'100023','Restaurant @gmail.com','Phonatic Restaurant','171 Hindley St, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-13 01:48:04','2021-06-13 01:48:04','Isla','Isla',25,'100024','Horus@gmail.com','Horus Egyptian Cafe & Shisha House, Restaurant & Bar','133 Hindley St, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-13 01:48:50','2021-06-13 01:48:50','Isla','Isla',26,'100025','JamFactory@gmail.com','JamFactory','19 Morphett St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:49:24','2021-06-13 01:49:24','Isla','Isla',27,'100026','Campus@gmail.com','University of South Australia, City West Campus','61-68 North Terrace, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:50:20','2021-06-13 01:50:20','Isla','Isla',28,'100027','Oak@gmail.com','West Oak Hotel','208 Hindley St, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-13 01:51:05','2021-06-13 01:51:05','Isla','Isla',29,'100028','Parking@gmail.com','Wilson Parking - City West','189/207 Hindley St, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-13 01:51:56','2021-06-13 01:51:56','Isla','Isla',30,'100029','West@gmail.com','West End Carpark','Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:52:36','2021-06-13 01:52:36','Isla','Isla',31,'100030','Remand@gmail.com','Adelaide Remand Centre: Department for Correctional Services','208 Currie St, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-13 01:53:14','2021-06-13 01:53:14','Isla','Isla',32,'100031','Atira@gmail.com','Atira Waymouth St Student Accommodation','231 Waymouth St, Adelaide SA 5000',1,NULL,NULL,NULL),('2021-06-13 01:53:51','2021-06-13 01:53:51','Isla','Isla',33,'100032','Challenger@gmail.com','Challenger Fitness Club','13 Shannon Pl, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:54:39','2021-06-13 01:54:39','Isla','Isla',34,'100033','Embassy@yohoo.com','Oaks Adelaide Embassy Suites','96 North Terrace, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:55:20','2021-06-13 01:55:20','Isla','Isla',35,'100034','Library@adelaide.com','City West Library','Jeffrey Smart Building, 217/243 Hindley St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:56:00','2021-06-13 01:56:00','Isla','Isla',36,'100035','Legal@Legal.com','Adco Legal','Ground Floor, 262/266 Pirie St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:56:31','2021-06-13 01:56:31','Isla','Isla',37,'100036','Wilson@carpark.com','Wilson Parking - 252-260 Pirie St','252-260 Pirie St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 01:58:34','2021-06-13 01:58:34','Isla','Isla',38,'100037','Zanda@Wealth.com','Zanda Wealth Mortgage Brokers','246-250 Pirie St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 02:00:12','2021-06-13 02:00:12','Isla','Isla',39,'100038','VON@hoppy.com','VON Thai','264 Flinders St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 02:02:02','2021-06-13 02:02:02','Isla','Isla',40,'100039','Tandanya@Aboriginal.com','Tandanya National Aboriginal Cultural Institute','253 Grenfell St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 02:02:29','2021-06-13 02:02:29','Isla','Isla',41,'100040','Salvation@gmail.com','The Salvation Army Adelaide Corps','277 Pirie St, Adelaide SA 5000',0,NULL,NULL,NULL),('2021-06-13 21:43:26','2021-06-13 11:49:17','admin','admin',42,'100041','a173627@adelaide.edu.au','Ashford Hospital','55 Anzac Hwy, Ashford SA 5035',1,NULL,NULL,NULL),('2021-06-13 21:41:31','2021-06-13 21:41:31','admin','admin',43,'100042','211763271@gmail.com','Unley Shopping Centre','204 Unley Rd, Unley SA 5061',1,NULL,NULL,NULL),('2021-06-13 21:44:08','2021-06-13 21:44:08','admin','admin',44,'100043','hsdgfjgf@gmail.com','Pickle in the Middle - Unley Cafe','134 Unley Rd, Unley SA 5061',0,NULL,NULL,NULL),('2021-06-13 21:44:48','2021-06-13 21:44:48','admin','admin',45,'100044','Bricks@gmail.com','Bricks And Stones Cafe','190 Unley Rd, Unley SA 5061',0,NULL,NULL,NULL),('2021-06-13 21:45:34','2021-06-13 21:45:34','admin','admin',46,'100045','373KBBQ@outlook.com','Korean charcoal BBQ - De Jang Gum','373 Glen Osmond Rd, Glen Osmond SA 5064',0,NULL,NULL,NULL),('2021-06-13 21:46:04','2021-06-13 21:46:04','admin','admin',47,'100046','BrownHill@gmail.com','Brown Hill Trig','Brown Hill Creek SA 5062',0,NULL,NULL,NULL),('2021-06-13 21:46:43','2021-06-13 21:46:43','admin','admin',48,'100047','ZARA@outlook,com','ZARA','447 Portrush Rd, Glenside SA 5065',0,NULL,NULL,NULL),('2021-06-13 21:47:23','2021-06-13 21:47:23','admin','admin',49,'100048','Leabrook@gmailcom','Leabrook IGA Fresh','457 Glynburn Rd, Leabrook SA 5068',0,NULL,NULL,NULL),('2021-06-13 21:58:13','2021-06-13 21:58:13','admin','admin',50,'100049','Hazelwood@outlook.com','Hazelwood Park Playground','Hazelwood Park, SA 5066',0,NULL,NULL,NULL),('2021-06-13 22:07:09','2021-06-13 22:07:09','admin','admin',51,'100050','ByAppointment@gmail.com','DDS Diamond Design Studios','By Appointment Only, 46 High St, Burnside SA 5066',0,NULL,NULL,NULL),('2021-06-13 22:07:48','2021-06-13 22:07:48','admin','admin',52,'100051','TwigStudio@gmail.com','Twig Studio','2A The Common, Beaumont SA 5066',0,NULL,NULL,NULL),('2021-06-13 22:08:47','2021-06-13 22:08:47','admin','admin',53,'100052','FlowersbyAlice@outlook.com','Flowers by Alice','464 Fullarton Rd, Myrtle Bank SA 5064',0,NULL,NULL,NULL),('2021-06-13 22:09:28','2021-06-13 22:09:28','admin','admin',54,'100053','NaturesProvidore@gmail.com','Nature\'s Providore','88 Duthy St, Malvern SA 5061',0,NULL,NULL,NULL),('2021-06-13 22:12:57','2021-06-13 22:12:57','admin','admin',55,'100054','Mitcham@outlook.com','Mitcham Girls High School','Kyre Ave, Kingswood SA 5062',0,NULL,NULL,NULL),('2021-06-13 22:13:42','2021-06-13 22:13:42','admin','admin',56,'100055','BrownhillCreek@gmail.com','Brownhill Creek Caravan Park','60 Brown Hill Creek Rd, Mitcham SA 5062',0,NULL,NULL,NULL),('2021-06-13 22:14:45','2021-06-13 22:14:45','admin','admin',57,'100056','Windy@gmail.com','Windy Point Restaurant','Windy Point Lookout, Belair Rd, Belair SA 5052',0,NULL,NULL,NULL),('2021-06-13 22:15:27','2021-06-13 22:15:27','admin','admin',58,'100057','KFC@gmail.com','KFC Edwardstown','1081 South Rd, Edwardstown SA 5039',1,NULL,NULL,NULL),('2021-06-13 22:16:04','2021-06-13 22:16:04','admin','admin',59,'100058','Edwardstown@gmail.com','Daws Road Recycling Centre','76-78 Daws Rd, Edwardstown SA 5039',0,NULL,NULL,NULL),('2021-06-13 22:16:36','2021-06-13 22:16:36','admin','admin',60,'100059','sjdfbjk@qq.com','Park Holme Library','1 Duncan Ave, Park Holme SA 5043',0,NULL,NULL,NULL),('2021-06-13 22:17:12','2021-06-13 22:17:12','admin','admin',61,'100060','Nagic@qq.com','Magic Millions Adelaide','1 Park Terrace, Morphettville SA 5043',0,NULL,NULL,NULL),('2021-06-13 22:17:41','2021-06-13 22:17:41','admin','admin',62,'100061','Home2home@gmail.com','Home2home Childcare Centre','Peppertree Grove, 407 Anzac Hwy, Camden Park SA 5038',0,NULL,NULL,NULL),('2021-06-13 22:18:17','2021-06-13 22:18:17','admin','admin',63,'100062','Momonn@gmail.com','Momo n more','55A Bray St, Plympton Park SA 5038',0,NULL,NULL,NULL),('2021-06-13 22:18:57','2021-06-13 22:18:57','admin','admin',64,'100063','LittleChilliPadi@gmail.com','Little Chilli Padi','645 Marion Rd, Ascot Park SA 5043',0,NULL,NULL,NULL),('2021-06-13 22:19:40','2021-06-13 22:19:40','admin','admin',65,'100064','24Mul@gmail.com','Mulcra Avenue Reserve','24 Mulcra Ave, Park Holme SA 5043',0,NULL,NULL,NULL);
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

-- Dump completed on 2021-06-14 19:38:41
