-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db2021058995
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `lecturer_id` varchar(10) NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `major_id` char(1) DEFAULT NULL,
  PRIMARY KEY (`lecturer_id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `lecturer_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES ('2001001001','조병완','1'),('2001001002','조용식','1'),('2001011003','조병완','1'),('2001011004','한혁','1'),('2001021002','강수용','2'),('2001031001','박희진','2'),('2001032003','이인환','3'),('2001032004','최진식','3'),('2001032005','김상욱','3'),('2001032006','박종일','3'),('2001032007','신동훈','4'),('2001032008','고광철','4'),('2001032009','정진욱','4'),('2001032010','김진오','4'),('2001032011','최창식','5'),('2001032012','이충선','5'),('2001032013','정재원','5'),('2001032014','이종석','5'),('2001032015','김승남','5'),('2001032016','문성용','6'),('2001032017','서경도','6'),('2001032018','서경도','6'),('2001032019','김진국','6'),('2001032020','공성호','6'),('2001032021','서영웅','6'),('2001032022','이동윤','7'),('2001032023','류성언','7'),('2001032024','윤채옥','7'),('2001032025','안희준','8'),('2001032026','안이용','8'),('2001032027','안형준','8'),('2001032028','강용수','9'),('2001032029','최기한','9'),('2001032030','권태수','9'),('2001032031','박두희','1'),('2001032032','조용식','1'),('2001032033','유재석','1'),('2001032034','조용식','1'),('2001032035','정형수','2'),('2001032036','차재혁','3'),('2001032037','임을규','3'),('2001032038','장의선','3'),('2001032039','김상욱','3'),('2001032040','이형철','4'),('2001032041','이형철','4'),('2001032042','노태협','4'),('2001032043','정정주','4'),('2001032044','고광철','4'),('2001032045','유기찬','5'),('2001032046','전진용','5'),('2001032047','박운종','5'),('2001032048','한상환','5'),('2001032049','Justyn Wayne Jaworski','6'),('2001032050','서동학','6'),('2001032051','서영웅','6'),('2001032052','오성근','6'),('2001032053','서경도','6'),('2001032054','이병희','6'),('2001032055','류성언','7'),('2001032056','임태연','7'),('2001032057','김용희','7'),('2001032058','안광일','7'),('2001032059','김성훈','8'),('2001032060','안희준','8'),('2001032061','임승순','8'),('2001032062','이윤정','9'),('2001032063','이준기','9'),('2001032064','안광일','9'),('2001032065','서종원','1'),('2001032066','박대효','1'),('2001032067','강석구','1'),('2001032068','반호기','1'),('2001032069','최용석','2'),('2001032070','노미나','3'),('2001032071','이춘화','3'),('2001032072','한규옥','3'),('2001032073','최진식','3'),('2001032074','정규선','4'),('2001032075','현동석','4'),('2001032076','김래영','4'),('2001032077','이주','4'),('2001032078','김동준','4'),('2001032079','김효진','5'),('2001032080','전진용','5'),('2001032081','차성민','5'),('2001032082','김주형','5'),('2001032083','배영찬','6'),('2001032084','서경도','6'),('2001032085','최유빈','6');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 23:52:28
