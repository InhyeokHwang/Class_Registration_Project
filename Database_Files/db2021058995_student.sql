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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` char(10) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `major_id` varchar(2) DEFAULT NULL,
  `lecturer_id` char(10) DEFAULT NULL,
  `year` char(1) DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `major_id` (`major_id`),
  KEY `lecturer_id` (`lecturer_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`lecturer_id`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('2018003125','125125125','?????????','female','44','2001032011','4','??????'),('2018004052','39nnf2','?????????','male','4','2001032064','3','??????'),('2019499349','2bn4','?????????','female','5','2001032031','4','??????'),('2020004003','banila','?????????','male','33','2001032030','3','??????'),('2020004203','qwe123','?????????','male','2','2001021002','3','??????'),('2020004533','35234','?????????',' male','3','2001032070','3','??????'),('2020040404','x17171771','?????????','female','15','2001032068','3','??????'),('2020394929','3425nn5','?????????','female','1','2001032085','3','??????'),('2021001445','7007','?????????','female','4','2001032010','2','??????'),('2021004004','foxfoxfox','?????????','male','22','2001032004','2','??????'),('2021004394','goodboy','?????????','male','1','2001032004','2','??????'),('2021030128','food','?????????','male','44','2001032078','2','??????'),('2021030303','arandomkey','????????????','male','34','2001032031','2','??????'),('2021040051','zeroone234','?????????','female','19','2001032078','2','??????'),('2021058996','studentpw','?????????','male','3','2001021002','2','??????'),('2022001303','192939','?????????','female','3','2001032009','1','??????'),('2022002331','wer234','?????????','male','2','2001032008','1','??????'),('2022005004','hexahed','?????????','male','5','2001032081','1','??????'),('2022019493','zerozero','?????????','male','17','2001032003','1','??????'),('2022040404','donkey','?????????','female','22','2001032053','1','??????'),('2022505050','hellobaby','?????????','female','44','2001032078','1','??????');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 23:52:27
