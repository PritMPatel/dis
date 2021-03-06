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
  `enrollmentno` varchar(12) NOT NULL,
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
  `enrollmentno` varchar(12) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_master`
--

LOCK TABLES `co_master` WRITE;
/*!40000 ALTER TABLE `co_master` DISABLE KEYS */;
INSERT INTO `co_master` VALUES (12,1,'CO1',1,1),(13,2,'CO2',1,1),(14,3,'CO3',1,1),(15,4,'CO4',1,1),(16,5,'CO5',1,1);
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
  `batch` int(11) NOT NULL,
  `totalMaxMarks` float NOT NULL,
  `weightage` float NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_master`
--

LOCK TABLES `exam_master` WRITE;
/*!40000 ALTER TABLE `exam_master` DISABLE KEYS */;
INSERT INTO `exam_master` VALUES (1,'Practical',2017,100,100,1,4,1);
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
  `percentWeight` float NOT NULL,
  `subjectID` int(11) NOT NULL,
  `componentTotal` int(3) NOT NULL,
  PRIMARY KEY (`examTypeID`),
  KEY `subjectID` (`subjectID`),
  CONSTRAINT `examtype_master_ibfk_1` FOREIGN KEY (`subjectID`) REFERENCES `subject_master` (`subjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examtype_master`
--

LOCK TABLES `examtype_master` WRITE;
/*!40000 ALTER TABLE `examtype_master` DISABLE KEYS */;
INSERT INTO `examtype_master` VALUES (1,'ESE',0.45,1,70),(2,'PA(M)',0.2,1,30),(3,'PA(I)',0.15,1,20),(4,'ESE(V)-PR',0.2,1,30);
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
  `calcObtainedMarks` float NOT NULL,
  `nCalcObtainedMarks` float NOT NULL DEFAULT '0',
  `enrollmentno` varchar(12) NOT NULL,
  `questionID` int(11) NOT NULL,
  PRIMARY KEY (`marksID`),
  KEY `enrollmentno` (`enrollmentno`),
  KEY `marks_obtained_master_ibfk_1_idx` (`questionID`),
  CONSTRAINT `marks_obtained_master_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question_master` (`questionID`),
  CONSTRAINT `marks_obtained_master_ibfk_2` FOREIGN KEY (`enrollmentno`) REFERENCES `student_master` (`enrollmentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks_obtained_master`
--

LOCK TABLES `marks_obtained_master` WRITE;
/*!40000 ALTER TABLE `marks_obtained_master` DISABLE KEYS */;
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
  `multipleMap` int(2) NOT NULL,
  `calcQuesMaxMarks` float NOT NULL,
  `nCalcQuesMaxMarks` float NOT NULL,
  `examID` int(11) NOT NULL,
  `coID1` int(11) NOT NULL,
  `coID2` int(11) DEFAULT NULL,
  `coID3` int(11) DEFAULT NULL,
  `coID4` int(11) DEFAULT NULL,
  `coID5` int(11) DEFAULT NULL,
  `coID6` int(11) DEFAULT NULL,
  `coID7` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionID`),
  KEY `question_master_ibfk_1_idx` (`examID`),
  KEY `coID` (`coID1`,`coID2`,`coID3`,`coID4`,`coID5`,`coID6`,`coID7`),
  KEY `2_idx` (`coID2`),
  KEY `3_idx` (`coID3`),
  KEY `4_idx` (`coID4`),
  KEY `5_idx` (`coID5`),
  KEY `6_idx` (`coID6`),
  KEY `7_idx` (`coID7`),
  CONSTRAINT `1` FOREIGN KEY (`coID1`) REFERENCES `co_master` (`coID`),
  CONSTRAINT `2` FOREIGN KEY (`coID2`) REFERENCES `co_master` (`coID`),
  CONSTRAINT `3` FOREIGN KEY (`coID3`) REFERENCES `co_master` (`coID`),
  CONSTRAINT `4` FOREIGN KEY (`coID4`) REFERENCES `co_master` (`coID`),
  CONSTRAINT `5` FOREIGN KEY (`coID5`) REFERENCES `co_master` (`coID`),
  CONSTRAINT `6` FOREIGN KEY (`coID6`) REFERENCES `co_master` (`coID`),
  CONSTRAINT `7` FOREIGN KEY (`coID7`) REFERENCES `co_master` (`coID`),
  CONSTRAINT `question_master_ibfk_1` FOREIGN KEY (`examID`) REFERENCES `exam_master` (`examID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_master`
--

LOCK TABLES `question_master` WRITE;
/*!40000 ALTER TABLE `question_master` DISABLE KEYS */;
INSERT INTO `question_master` VALUES (1,'P1',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(2,'P2',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(3,'P3',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(4,'P4',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(5,'P5',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(6,'P6',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(7,'P7',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(8,'P8',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(9,'P9',10,1,10,2,1,13,NULL,NULL,NULL,NULL,NULL,NULL),(10,'P10',5,1,5,1,1,15,NULL,NULL,NULL,NULL,NULL,NULL),(11,'P11',5,1,5,1,1,16,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `question_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_master`
--

DROP TABLE IF EXISTS `student_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_master` (
  `enrollmentno` varchar(12) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`enrollmentno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_master`
--

LOCK TABLES `student_master` WRITE;
/*!40000 ALTER TABLE `student_master` DISABLE KEYS */;
INSERT INTO `student_master` VALUES ('170170116001',2017),('170170116002',2017),('170170116003',2017),('170170116004',2017),('170170116005',2017),('170170116007',2017),('170170116008',2017),('170170116009',2017),('170170116010',2017),('170170116011',2017);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2020-03-17 20:33:19
