CREATE DATABASE  IF NOT EXISTS `studentpaymentsystem` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `studentpaymentsystem`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: studentpaymentsystem
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseID` int NOT NULL,
  `CourseTitle` varchar(50) DEFAULT NULL,
  `Duration` varchar(10) DEFAULT NULL,
  `Fee` double DEFAULT NULL,
  `NeedToPay` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentID` int NOT NULL,
  `PaymentType` varchar(45) DEFAULT NULL,
  `Amount` varchar(45) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Course_CourseID` int NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `fk_Payment_Course1_idx` (`Course_CourseID`),
  CONSTRAINT `fk_Payment_Course1` FOREIGN KEY (`Course_CourseID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentID` varchar(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `NIC` bigint NOT NULL,
  `DOB` datetime DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_course`
--

DROP TABLE IF EXISTS `student_has_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_course` (
  `Student_StudentID` varchar(20) NOT NULL,
  `Course_CourseID` int NOT NULL,
  PRIMARY KEY (`Student_StudentID`,`Course_CourseID`),
  KEY `fk_Student_has_Course_Course1_idx` (`Course_CourseID`),
  KEY `fk_Student_has_Course_Student_idx` (`Student_StudentID`),
  CONSTRAINT `fk_Student_has_Course_Course1` FOREIGN KEY (`Course_CourseID`) REFERENCES `course` (`CourseID`),
  CONSTRAINT `fk_Student_has_Course_Student` FOREIGN KEY (`Student_StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_course`
--

LOCK TABLES `student_has_course` WRITE;
/*!40000 ALTER TABLE `student_has_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_has_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_payment`
--

DROP TABLE IF EXISTS `student_has_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_payment` (
  `Student_StudentID` varchar(20) NOT NULL,
  `Payment_paymentID` int NOT NULL,
  PRIMARY KEY (`Student_StudentID`,`Payment_paymentID`),
  KEY `fk_Student_has_Payment_Payment1_idx` (`Payment_paymentID`),
  KEY `fk_Student_has_Payment_Student1_idx` (`Student_StudentID`),
  CONSTRAINT `fk_Student_has_Payment_Payment1` FOREIGN KEY (`Payment_paymentID`) REFERENCES `payment` (`paymentID`),
  CONSTRAINT `fk_Student_has_Payment_Student1` FOREIGN KEY (`Student_StudentID`) REFERENCES `student` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_payment`
--

LOCK TABLES `student_has_payment` WRITE;
/*!40000 ALTER TABLE `student_has_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_has_payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-06 23:22:58
