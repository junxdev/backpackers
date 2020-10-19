-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: backpackers
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `board_reply`
--

DROP TABLE IF EXISTS `board_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_reply` (
  `reply_no` int NOT NULL AUTO_INCREMENT,
  `reply_id` varchar(50) NOT NULL,
  `reply_depth` int NOT NULL,
  `reply_time` timestamp NOT NULL,
  `reply_content` varchar(45) NOT NULL,
  `reply_delete` int NOT NULL DEFAULT '1',
  `board_no` int NOT NULL,
  PRIMARY KEY (`reply_no`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_reply`
--

LOCK TABLES `board_reply` WRITE;
/*!40000 ALTER TABLE `board_reply` DISABLE KEYS */;
INSERT INTO `board_reply` VALUES (32,'kim',1,'2020-10-13 07:05:09','댓글수정123ㄴㅇㄴㅇ',1,2),(40,'kim',1,'2020-10-13 08:05:20','댓글수정123ㄴㅇㄴㅇ',1,3),(50,'admin',1,'2020-10-14 06:18:36','김대영11111',1,15),(51,'admin',1,'2020-10-14 06:18:40','김대영21',1,15),(55,'admin',1,'2020-10-14 07:09:27','sadsadsa',1,15),(56,'admin',1,'2020-10-14 08:31:51','카카오가라',1,19),(57,'kim',1,'2020-10-14 08:50:01','dsfdsfㅏㅣㅣ[ㅣ[ㅣ[',1,23),(58,'kim',1,'2020-10-14 08:50:07','ㄱㅁㅇㄴㅁㅇ',1,23),(59,'kim',1,'2020-10-14 08:50:10','ㄴㅁㄴㅁㅇㄹ',1,23),(79,'kim',1,'2020-10-14 11:21:34','김대영123',1,33),(84,'kim',1,'2020-10-14 11:27:41','ㅂㄷㅈㅁㅇㄴㅁ',1,30),(85,'kim',1,'2020-10-14 11:27:46','김대영2',1,30),(86,'kim',1,'2020-10-14 11:28:09','',1,30),(87,'kim',1,'2020-10-14 11:28:31','김대영1990',1,29),(88,'kim',1,'2020-10-14 11:33:14','kimdeayoung',1,29),(89,'kim',1,'2020-10-14 11:38:25','하이요~~',1,27),(91,'kim',1,'2020-10-15 04:46:48','123123',1,270),(92,'kim',1,'2020-10-15 04:47:06','김대영',1,270),(93,'kim',1,'2020-10-15 04:47:29','김대영123',1,269),(94,'kim',1,'2020-10-15 05:03:04','김대영123',1,178),(95,'kim',1,'2020-10-15 05:03:07','김김',1,178),(96,'kim',1,'2020-10-15 05:03:30','김대영',1,268),(97,'kim',1,'2020-10-15 05:03:36','김대영',1,268),(98,'admin',1,'2020-10-16 03:39:59','ㄴㅁㅇㄴㅁㅇㄴㅁㅇ',1,272),(99,'admin',1,'2020-10-16 04:36:00','SAADSADS',1,272),(100,'admin',1,'2020-10-16 04:36:02','SADSADDA',1,272),(105,'admin',1,'2020-10-16 04:41:43','김대영123',1,266);
/*!40000 ALTER TABLE `board_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 19:16:30
