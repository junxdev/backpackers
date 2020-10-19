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
-- Table structure for table `sights`
--

DROP TABLE IF EXISTS `sights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sights` (
  `sightsNo` int NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `latlng` varchar(300) NOT NULL,
  `ellipsis` varchar(300) NOT NULL,
  `link` varchar(300) NOT NULL,
  `sightsContent` varchar(2000) NOT NULL,
  PRIMARY KEY (`sightsNo`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sights`
--

LOCK TABLES `sights` WRITE;
/*!40000 ALTER TABLE `sights` DISABLE KEYS */;
INSERT INTO `sights` VALUES (1,'북한산','37.661749, 126.993376','경기 고양시 덕양구 대서문길 375','www.knps.or.kr/front','<p>북한산 국립공원으로 오세요~</p>'),(2,'북악산','37.593203, 126.973331','서울 종로구 부암동','http://www.chf.or.kr/c1/sub5_4.jsp','<p>북악산으로 가볼까요? 네 그랜디크내ㅔㅣ언 hi</p><p><br></p><p><img src=\"/backpackers/gear/image/34\" style=\"width: 50%;\"></p><p><br></p><p><img src=\"/backpackers/gear/image/35\" style=\"width: 50%;\"><br></p>'),(3,'인왕산','37.585199, 126.959328','서울 종로구 무악동 산2-1','http://','인왕산을 걸어요~adsfasdf'),(4,'낙산공원','37.580740, 127.007475','서울 종로구 낙산길 41','https://parks.seoul.go.kr/template/sub/naksan.do','낙산공원에서 야경을!'),(5,'남산공원','37.551097, 126.990903','서울 중구 삼일대로 231','http://parks.seoul.go.kr/namsan','<p>남산공원에서 야경을!</p>');
/*!40000 ALTER TABLE `sights` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16 19:16:29
