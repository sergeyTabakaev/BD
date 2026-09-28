-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `cafs`
--

DROP TABLE IF EXISTS `cafs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafs` (
  `idcafs` int NOT NULL,
  `name` varchar(75) NOT NULL,
  `zavkaf` int NOT NULL,
  PRIMARY KEY (`idcafs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafs`
--

LOCK TABLES `cafs` WRITE;
/*!40000 ALTER TABLE `cafs` DISABLE KEYS */;
INSERT INTO `cafs` VALUES (1,'Математики и методики обучения математике',1018),(2,'Физики, техники и технологического образования',1001),(3,'Педагогики и психологии ИФМИТО',1019),(4,'Информационных систем и цифрового образования',1017);
/*!40000 ALTER TABLE `cafs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `student` int NOT NULL,
  `teacher` int NOT NULL,
  `subj` int NOT NULL,
  `date_exam` date NOT NULL,
  `mark_exam` int DEFAULT NULL,
  `mark` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`student`,`teacher`,`subj`,`date_exam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (100,1000,10,'2026-09-09',4,NULL),(100,1002,12,'2027-09-09',NULL,'зачтено'),(101,1000,19,'2026-09-10',3,NULL),(101,1001,10,'2026-09-09',5,NULL),(101,1015,20,'2026-09-11',4,NULL),(101,1016,12,'2026-09-09',3,NULL),(101,1017,18,'2026-09-09',5,NULL),(103,1001,10,'2026-09-14',NULL,NULL),(103,1002,11,'2026-09-14',5,NULL),(103,1016,19,'2026-09-09',5,NULL),(103,1016,20,'2026-09-09',5,NULL),(103,1017,12,'2026-09-10',3,NULL),(103,1018,15,'2026-09-14',3,NULL),(104,1000,12,'2026-06-09',NULL,'зачтено'),(104,1015,18,'2026-09-30',4,NULL),(104,1016,12,'2026-09-09',4,NULL),(104,1018,12,'2026-09-09',2,NULL),(104,1018,15,'2026-09-06',3,NULL),(111,1018,15,'2026-09-30',4,NULL),(112,1018,15,'2026-09-11',4,NULL);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `idgroup` varchar(10) NOT NULL,
  `napr` varchar(100) NOT NULL DEFAULT 'Направление обучения',
  PRIMARY KEY (`idgroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Учебная группа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('4.025.1.26',' Безопасность и здоровье'),('4.030.2.25','Логопедические технологии преодоления расстройств речевой деятельности'),('4.100.2.26','Обучение физике в цифровой образовательной среде'),('4.130.1.25','Цифровизация в управлении образованием');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `idstudent` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `group` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idstudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Информация о студентах';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (100,'Гриценко Артём','2000-10-05',NULL,'Черепаново'),(101,'Хуголь Богдан','2001-08-30','4.030.2.25','Новосибирск'),(102,'Смирнов Михаил','2000-01-12','4.100.2.26','Искитим'),(103,'Иванов Игнат','1999-11-20','4.130.1.25','Бердск'),(104,'Игнатьев Иван','2002-12-03','4.025.1.26','Новосибирск'),(110,'Семенов Иван','2002-09-03',NULL,'Новосибирск'),(111,'Петров Илья','2002-08-25','4.025.1.26','Чик'),(112,'Сергеев Илья','2002-12-03','4.025.1.26','Гусиный брод'),(113,'Иванов Геннадий','2001-01-30','4.025.1.26',NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `idsubject` int NOT NULL,
  `name_s` varchar(45) DEFAULT NULL,
  `k_hours` int DEFAULT NULL,
  `kaf` int NOT NULL,
  PRIMARY KEY (`idsubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (10,'Базы данных',40,4),(11,'Информационная безопасность',25,4),(14,'Физика',18,2),(15,'Роботехника',30,2),(17,'Логопедия',32,3),(18,'Математика',40,1),(19,'Геометрия',46,1),(20,'Педагогика',96,3);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `idteacher` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `group` varchar(10) DEFAULT NULL,
  `stage` double(4,2) DEFAULT '1.00',
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idteacher`),
  UNIQUE KEY `num_group_UNIQUE` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1000,'Каменев Роман Владимирович','4.025.1.26',20.50,'Тогучин'),(1001,'Верещагина Александра Сергеевна','4.100.2.26',22.73,'Владивосток'),(1002,'Иванова Наталья Сергеевна','4.130.1.25',20.75,'Новосибирск'),(1010,'Петров Андрей Николаевич',NULL,18.00,'Искитим'),(1015,'Ступин Андрей Анатольевич','4.030.2.25',15.75,'Бердск'),(1016,'Гейбука Светлана Васильевна',NULL,20.50,'Павлодар'),(1017,'Сартаков Игорь Витальевич',NULL,37.90,'Новосибирск'),(1018,'Яровая Евгения Анатольевна',NULL,41.20,'Москва'),(1019,'Андриенко Елена Васильевна',NULL,41.00,'Новосибирск'),(1020,'Понкратьева Елена Сергеевна',NULL,20.00,'Венгерово'),(1021,'Щепачёв Алексей Иванович',NULL,19.00,'Астана');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-28 15:37:38
