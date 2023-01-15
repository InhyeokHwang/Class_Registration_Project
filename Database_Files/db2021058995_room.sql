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
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` varchar(3) NOT NULL,
  `building_id` char(3) DEFAULT NULL,
  `occupancy` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `building_id` (`building_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('1','305','140'),('10','305','40'),('100','212','40'),('101','212','40'),('102','212','40'),('103','212','40'),('104','212','40'),('105','212','40'),('106','212','45'),('107','211','40'),('108','211','40'),('109','211','40'),('11','305','50'),('110','211','40'),('111','211','40'),('112','211','40'),('113','211','40'),('114','211','55'),('115','211','40'),('116','211','40'),('117','211','40'),('118','211','40'),('119','211','40'),('12','305','100'),('120','211','40'),('121','211','40'),('122','211','40'),('123','211','65'),('124','211','40'),('125','211','40'),('126','211','40'),('127','211','40'),('128','211','40'),('129','211','40'),('13','305','40'),('130','208','40'),('131','208','40'),('132','208','110'),('133','208','40'),('134','208','40'),('135','208','40'),('136','208','40'),('137','604','40'),('138','604','40'),('139','604','40'),('14','305','50'),('140','604','90'),('141','604','40'),('142','604','40'),('143','604','40'),('144','604','40'),('145','604','40'),('146','407','40'),('147','407','70'),('148','407','40'),('149','407','40'),('15','305','40'),('150','407','40'),('151','407','40'),('152','407','40'),('153','407','40'),('154','407','60'),('155','407','40'),('156','408','40'),('157','408','40'),('158','408','40'),('159','408','40'),('16','305','40'),('160','408','40'),('161','408','40'),('162','408','40'),('163','408','65'),('164','408','40'),('165','408','40'),('166','408','40'),('167','408','40'),('168','408','40'),('169','507','120'),('17','305','50'),('170','507','40'),('171','507','40'),('172','507','40'),('173','507','80'),('174','507','40'),('175','507','40'),('176','507','40'),('177','507','40'),('178','507','40'),('179','507','35'),('18','305','40'),('180','507','40'),('181','507','55'),('182','507','40'),('183','507','40'),('184','507','45'),('185','507','40'),('186','507','40'),('187','504','40'),('188','504','95'),('189','504','40'),('19','305','40'),('190','504','40'),('191','504','40'),('192','504','40'),('193','504','40'),('194','504','40'),('195','504','40'),('196','504','40'),('197','504','84'),('198','504','50'),('199','504','40'),('2','305','40'),('20','618','40'),('21','618','40'),('22','618','40'),('23','618','50'),('24','618','40'),('25','618','40'),('26','618','80'),('27','618','40'),('28','618','120'),('29','618','40'),('3','305','40'),('30','618','40'),('31','618','50'),('32','618','40'),('33','618','40'),('34','618','30'),('35','401','40'),('36','401','40'),('37','401','40'),('38','401','40'),('39','401','50'),('4','305','40'),('40','401','40'),('41','401','40'),('42','401','40'),('43','401','40'),('44','401','50'),('45','401','40'),('46','401','40'),('47','401','40'),('48','401','45'),('49','401','40'),('5','305','40'),('50','401','40'),('51','401','100'),('52','401','40'),('53','401','40'),('54','401','120'),('55','304','40'),('56','304','40'),('57','304','40'),('58','304','40'),('59','304','40'),('6','305','40'),('60','304','40'),('61','304','40'),('62','304','40'),('63','304','40'),('64','304','50'),('65','304','40'),('66','304','40'),('67','304','40'),('68','306','40'),('69','306','40'),('7','305','30'),('70','306','40'),('71','306','40'),('72','306','40'),('73','212','40'),('74','212','80'),('75','212','40'),('76','212','40'),('77','212','40'),('78','212','40'),('79','212','100'),('8','305','35'),('80','212','40'),('81','212','40'),('82','212','40'),('83','212','40'),('84','212','40'),('85','212','40'),('86','212','40'),('87','212','30'),('88','212','40'),('89','212','40'),('9','305','40'),('90','212','40'),('91','212','40'),('92','212','40'),('93','212','40'),('94','212','40'),('95','212','40'),('96','212','40'),('97','212','35'),('98','212','40'),('99','212','40');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
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