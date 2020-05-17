-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: paperreviews
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `EMAILAddr` varchar(255) NOT NULL,
  PRIMARY KEY (`EMAILAddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES ('Uppuluri','Hemanth','hemanthuppuluri@gmail.com'),('Jitin','Dammu','jitindammu@gmail.com'),('Jyothsna','Uppuluri','jyothsnauppuluri@gmail.com'),('Jyothsna','Uppuluri','jyothsnauppuluri1@gmail.com'),('Royal','Mint','rm@gmail.com'),('Testing Last Name 2','Testing First Name 2','testingemail2@gmail.com'),('Testing Last Name 3','Testing First Name 3','testingemail3@gmail.com'),('Testing Last Name 4','Testing First Name 4 ','testingemail4@gmail.com'),('Testing Last Name 5','Testing First Name 5','testingemail5@gmail.com'),('Jawahar','Gandhi','ujg@gmail.com'),('Yashwanth','Uppuluri','yashwanthuppuluri@gmail.com');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper` (
  `Id` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Abstract` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `EMAILAddr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `EMAILAddr` (`EMAILAddr`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`EMAILAddr`) REFERENCES `author` (`EMAILAddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (1,'casade','thriller','April','hemanthuppuluri@gmail.com'),(2,'harry','scifi','May','testingemail2@gmail.com'),(3,'sherlock','dectetive','June','testingemail3@gmail.com'),(4,'Avatar','anime','July','testingemail4@gmail.com'),(5,'Game','Series','August','testingemail5@gmail.com'),(6,'new creation','check','September','yashwanthuppuluri@gmail.com'),(9,'creating new','check','October','jyothsnauppuluri1@gmail.com'),(11,'creating new','allnew','November','ujg@gmail.com'),(12,'creating new','allnew1','December','rm@gmail.com');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paperr`
--

DROP TABLE IF EXISTS `paperr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paperr` (
  `Id` int NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Abstract` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `EMAILAddr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `EMAILAddr` (`EMAILAddr`),
  CONSTRAINT `paperr_ibfk_1` FOREIGN KEY (`EMAILAddr`) REFERENCES `author` (`EMAILAddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paperr`
--

LOCK TABLES `paperr` WRITE;
/*!40000 ALTER TABLE `paperr` DISABLE KEYS */;
INSERT INTO `paperr` VALUES (6,'new creation','check','September','hemanthuppuluri@gmail.com'),(7,'new creation','check','September','hemanthuppuluri@gmail.com'),(8,'new creation','check','September','hemanthuppuluri@gmail.com'),(9,'new creation','check','September','hemanthuppuluri@gmail.com'),(10,'new creation','check','September','hemanthuppuluri@gmail.com');
/*!40000 ALTER TABLE `paperr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `Recommendation` varchar(255) DEFAULT NULL,
  `Id` int NOT NULL,
  `PaperId` int DEFAULT NULL,
  `ReadabilityScore` int DEFAULT NULL,
  `ReviewerId` varchar(255) DEFAULT NULL,
  `RelevanceScore` int DEFAULT NULL,
  `OriginalityScore` int DEFAULT NULL,
  `MeritScore` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `PaperId` (`PaperId`),
  KEY `ReviewerId` (`ReviewerId`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`PaperId`) REFERENCES `paper` (`Id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`ReviewerId`) REFERENCES `reviewer` (`EMAILAddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('Recommendationtest',1,1,92,'testingemail1@gmail',97,95,100),('Recommendationtest1',2,2,92,'testingemail2@gmail',98,96,100),('Recommendationtest2',3,3,92,'testingemail3@gmail',96,94,100),('Recommendationtest3',4,4,92,'testingemail4@gmail',99,94,100),('Recommendationtest4',5,5,92,'testingemail5@gmail',92,91,100);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer` (
  `EMAILAddr` varchar(255) NOT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `CommiteeFeedback` varchar(255) DEFAULT NULL,
  `PhoneNum` int DEFAULT NULL,
  `Affliation` varchar(255) DEFAULT NULL,
  `AuthorFeedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMAILAddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES ('testingemail1@gmail','test','part1','excellent',1112223456,'Affliationtest','Feedbacktest'),('testingemail2@gmail','test1','part2','excellent1',1112223457,'Affliationtest1','Feedbacktest1'),('testingemail3@gmail','test2','part3','excellent2',1112223458,'Affliationtest2','Feedbacktest2'),('testingemail4@gmail','test3','part4','excellent3',1112223459,'Affliationtest3','Feedbacktest3'),('testingemail5@gmail','test4','part5','excellent4',1112223460,'Affliationtest4','Feedbacktest4');
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `Id` int NOT NULL,
  `TopicName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'TopicNameTest'),(2,'TopicNameTest2'),(3,'TopicNameTest3'),(4,'TopicNameTest4'),(5,'TopicNameTest5');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 23:00:26
