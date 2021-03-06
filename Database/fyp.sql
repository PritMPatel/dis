CREATE DATABASE  IF NOT EXISTS `finalyearproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `finalyearproject`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: finalyearproject
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attainment_co`
--

DROP TABLE IF EXISTS `attainment_co`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attainment_co` (
  `attainCoID` int(11) NOT NULL AUTO_INCREMENT,
  `weighMarks` float NOT NULL,
  `attainmentCo` float NOT NULL,
  `enrollmentno` decimal(12,0) NOT NULL,
  `subjectID` int(11) NOT NULL,
  `coID` int(11) NOT NULL,
  PRIMARY KEY (`attainCoID`),
  KEY `enrollmentno` (`enrollmentno`),
  KEY `subjectID` (`subjectID`),
  KEY `coID` (`coID`),
  CONSTRAINT `attainment_co_ibfk_1` FOREIGN KEY (`enrollmentno`) REFERENCES `student_master` (`enrollmentno`),
  CONSTRAINT `attainment_co_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subject_master` (`subjectID`),
  CONSTRAINT `attainment_co_ibfk_3` FOREIGN KEY (`coID`) REFERENCES `co_master` (`coID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attainment_co`
--

LOCK TABLES `attainment_co` WRITE;
/*!40000 ALTER TABLE `attainment_co` DISABLE KEYS */;
/*!40000 ALTER TABLE `attainment_co` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attainment_overall`
--

DROP TABLE IF EXISTS `attainment_overall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attainment_overall` (
  `attainOverallID` int(11) NOT NULL AUTO_INCREMENT,
  `attainmentOverall` float NOT NULL,
  `enrollmentno` decimal(12,0) NOT NULL,
  `subjectID` int(11) NOT NULL,
  PRIMARY KEY (`attainOverallID`),
  KEY `enrollmentno` (`enrollmentno`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `attainment_overall_ibfk_1` FOREIGN KEY (`enrollmentno`) REFERENCES `student_master` (`enrollmentno`),
  CONSTRAINT `attainment_overall_ibfk_2` FOREIGN KEY (`subjectID`) REFERENCES `subject_master` (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attainment_overall`
--

LOCK TABLES `attainment_overall` WRITE;
/*!40000 ALTER TABLE `attainment_overall` DISABLE KEYS */;
/*!40000 ALTER TABLE `attainment_overall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_master`
--

DROP TABLE IF EXISTS `co_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `co_master` (
  `coID` int(11) NOT NULL AUTO_INCREMENT,
  `coSrNo` int(2) NOT NULL DEFAULT '0',
  `coStatement` varchar(512) NOT NULL,
  `subjectID` int(11) NOT NULL,
  `facultyID` int(11) NOT NULL,
  PRIMARY KEY (`coID`),
  KEY `subjectID` (`subjectID`),
  KEY `co_master_ibfk_2_idx` (`facultyID`),
  CONSTRAINT `co_master_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subject_master` (`subjectID`),
  CONSTRAINT `co_master_ibfk_2` FOREIGN KEY (`facultyID`) REFERENCES `faculty_master` (`facultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_master`
--

LOCK TABLES `co_master` WRITE;
/*!40000 ALTER TABLE `co_master` DISABLE KEYS */;
INSERT INTO `co_master` VALUES (1,1,'Follow CO1',1,1),(2,2,'Follow CO2',1,1),(3,3,'Follow CO3',1,1),(4,4,'Follow CO4',1,1);
/*!40000 ALTER TABLE `co_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_master`
--

DROP TABLE IF EXISTS `exam_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam_master` (
  `examID` int(11) NOT NULL AUTO_INCREMENT,
  `examName` varchar(128) NOT NULL DEFAULT 'Exam',
  `examDate` date NOT NULL,
  `batch` int(11) NOT NULL,
  `maxMarks` float NOT NULL,
  `nMaxMarks` float NOT NULL,
  `maxWeighMarks` float unsigned NOT NULL,
  `subjectID` int(11) NOT NULL,
  `examTypeID` int(11) NOT NULL,
  `facultyID` int(11) NOT NULL,
  PRIMARY KEY (`examID`),
  KEY `subjectID` (`subjectID`),
  KEY `examTypeID` (`examTypeID`),
  KEY `exam_master_ibfk_3_idx` (`facultyID`),
  CONSTRAINT `exam_master_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subject_master` (`subjectID`),
  CONSTRAINT `exam_master_ibfk_2` FOREIGN KEY (`examTypeID`) REFERENCES `examtype_master` (`examTypeID`),
  CONSTRAINT `exam_master_ibfk_3` FOREIGN KEY (`facultyID`) REFERENCES `faculty_master` (`facultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_master`
--

LOCK TABLES `exam_master` WRITE;
/*!40000 ALTER TABLE `exam_master` DISABLE KEYS */;
INSERT INTO `exam_master` VALUES (1,'MidSem','2018-07-03',2017,30,30,20,1,2,1),(2,'EndSem','2018-11-03',2017,70,70,45,1,1,1),(3,'Practical','2018-07-03',2017,30,30,20,1,4,1),(4,'ClassTest','2018-07-03',2017,20,20,15,1,3,1);
/*!40000 ALTER TABLE `exam_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examtype_master`
--

DROP TABLE IF EXISTS `examtype_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `examtype_master` (
  `examTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `typeDescription` varchar(128) NOT NULL,
  `weightage` float NOT NULL,
  `subjectID` int(11) NOT NULL,
  PRIMARY KEY (`examTypeID`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `examtype_master_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subject_master` (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examtype_master`
--

LOCK TABLES `examtype_master` WRITE;
/*!40000 ALTER TABLE `examtype_master` DISABLE KEYS */;
INSERT INTO `examtype_master` VALUES (1,'ESE',0.45,1),(2,'PA(M)',0.2,1),(3,'PA(I)',0.15,1),(4,'ESE(V)-PR',0.2,1);
/*!40000 ALTER TABLE `examtype_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_master`
--

DROP TABLE IF EXISTS `faculty_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faculty_master` (
  `facultyID` int(11) NOT NULL AUTO_INCREMENT,
  `facultyName` varchar(25) NOT NULL,
  `facultyEmail` varchar(50) NOT NULL,
  `facultyPassword` varchar(256) NOT NULL,
  `facultyDepartment` varchar(25) NOT NULL,
  PRIMARY KEY (`facultyID`),
  UNIQUE KEY `facultyEmail_UNIQUE` (`facultyEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_master`
--

LOCK TABLES `faculty_master` WRITE;
/*!40000 ALTER TABLE `faculty_master` DISABLE KEYS */;
INSERT INTO `faculty_master` VALUES (1,'SJM','sjm@gmail.com','SJM','Information Technology');
/*!40000 ALTER TABLE `faculty_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks_obtained_master`
--

DROP TABLE IF EXISTS `marks_obtained_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marks_obtained_master` (
  `marksID` int(11) NOT NULL AUTO_INCREMENT,
  `obtainedMarks` int(11) NOT NULL,
  `nObtainedMarks` float NOT NULL DEFAULT '0',
  `obtainedWeighMarks` float NOT NULL,
  `questionID` int(11) NOT NULL,
  `enrollmentno` decimal(12,0) NOT NULL,
  PRIMARY KEY (`marksID`),
  KEY `questionID` (`questionID`),
  KEY `enrollmentno` (`enrollmentno`),
  CONSTRAINT `marks_obtained_master_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question_master` (`questionID`),
  CONSTRAINT `marks_obtained_master_ibfk_2` FOREIGN KEY (`enrollmentno`) REFERENCES `student_master` (`enrollmentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks_obtained_master`
--

LOCK TABLES `marks_obtained_master` WRITE;
/*!40000 ALTER TABLE `marks_obtained_master` DISABLE KEYS */;
INSERT INTO `marks_obtained_master` VALUES (1,12,0,8,1,1),(2,8,0,5.33,1,2),(3,10,0,6.67,1,3),(4,4,0,2.67,2,1),(5,5,0,3.33,2,2),(6,4,0,2.67,2,3),(7,8,0,5.33,3,1),(8,9,0,6,3,2),(9,8,0,5.33,3,3),(10,20,0,12.857,4,1),(11,24,0,15.4285,4,2),(12,22,0,14.1428,4,3),(13,12,0,7.7142,5,1),(14,14,0,9,5,2),(15,12,0,7.7142,5,3),(16,18,0,11.5714,6,1),(17,16,0,10.2857,6,2),(18,18,0,11.5714,6,3),(19,9,0,5.7857,7,1),(20,9,0,5.7857,7,2),(21,8,0,5.1428,7,3),(22,12,0,8,8,1),(23,10,0,6.67,8,2),(24,14,0,9.33,8,3),(25,8,0,5.33,9,1),(26,9,0,6,9,2),(27,8,0,5.33,9,3),(28,4,0,2.67,10,1),(29,5,0,3.33,10,2),(30,4,0,2.67,10,3),(31,10,0,7.5,11,1),(32,12,0,9,11,2),(33,9,0,6.75,11,3),(34,8,0,6,12,1),(35,8,0,6,12,2),(36,7,0,5.25,12,3);
/*!40000 ALTER TABLE `marks_obtained_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_master`
--

DROP TABLE IF EXISTS `question_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_master` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `queDesc` varchar(128) NOT NULL,
  `queMaxMarks` float NOT NULL,
  `nQueMaxMarks` float NOT NULL,
  `queMaxWeighMarks` float NOT NULL,
  `examID` int(11) NOT NULL,
  `coID` int(11) NOT NULL,
  PRIMARY KEY (`questionID`),
  KEY `examID` (`examID`),
  KEY `coID` (`coID`),
  CONSTRAINT `question_master_ibfk_1` FOREIGN KEY (`examID`) REFERENCES `exam_master` (`examID`),
  CONSTRAINT `question_master_ibfk_2` FOREIGN KEY (`coID`) REFERENCES `co_master` (`coID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_master`
--

LOCK TABLES `question_master` WRITE;
/*!40000 ALTER TABLE `question_master` DISABLE KEYS */;
INSERT INTO `question_master` VALUES (1,'Q1',15,0,10,1,2),(2,'Q2',5,0,3.33,1,3),(3,'Q3',10,0,6.66,1,4),(4,'Q1',25,0,16.07,2,2),(5,'Q2',15,0,9.64,2,1),(6,'Q3',20,0,12.85,2,3),(7,'Q4',10,0,6.43,2,4),(8,'Q1',15,0,10,3,3),(9,'Q2',10,0,6.67,3,1),(10,'Q3',5,0,3.33,3,2),(11,'Q1',12,0,9,4,2),(12,'Q2',8,0,6,4,4);
/*!40000 ALTER TABLE `question_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_master`
--

DROP TABLE IF EXISTS `student_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_master` (
  `enrollmentno` decimal(12,0) NOT NULL,
  `name` varchar(25) NOT NULL,
  `mobile` decimal(10,0) NOT NULL,
  `email` varchar(50) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`enrollmentno`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_master`
--

LOCK TABLES `student_master` WRITE;
/*!40000 ALTER TABLE `student_master` DISABLE KEYS */;
INSERT INTO `student_master` VALUES (1,'Sakshi',8888888888,'sakshi@email.com',2017),(2,'Prit',9999999999,'prit@email.com',2017),(3,'Naeem',7777777777,'naeem@email.com',2017);
/*!40000 ALTER TABLE `student_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_master`
--

DROP TABLE IF EXISTS `subject_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subject_master` (
  `subjectID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(50) NOT NULL,
  `subjectCode` decimal(7,0) NOT NULL,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`subjectID`),
  UNIQUE KEY `subjectCode` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_master`
--

LOCK TABLES `subject_master` WRITE;
/*!40000 ALTER TABLE `subject_master` DISABLE KEYS */;
INSERT INTO `subject_master` VALUES (1,'DBMS',2130703,3);
/*!40000 ALTER TABLE `subject_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03 11:57:06
