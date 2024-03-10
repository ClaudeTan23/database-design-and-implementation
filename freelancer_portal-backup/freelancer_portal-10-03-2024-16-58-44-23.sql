-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: freelancer_portal
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientprofile`
--

DROP TABLE IF EXISTS `clientprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientprofile` (
  `clientID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `companyName` varchar(100) NOT NULL DEFAULT '-',
  `companyInfo` text NOT NULL DEFAULT '-',
  `ProjectRequirements` text NOT NULL DEFAULT '-',
  PRIMARY KEY (`clientID`),
  KEY `userID` (`userID`),
  CONSTRAINT `clientprofile_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientprofile`
--

LOCK TABLES `clientprofile` WRITE;
/*!40000 ALTER TABLE `clientprofile` DISABLE KEYS */;
INSERT INTO `clientprofile` VALUES (1,2,'ABC Corp','Software development company','Looking for a web developer for a new project'),(2,4,'XYZ Ltd','Marketing agency','Seeking content writers for blog posts'),(3,6,'LMN Enterprises','Consulting firm','Hiring consultants for a project'),(4,8,'PQR Solutions','IT Services provider','Looking for software developers for a project'),(5,10,'JKL Inc','E-commerce company','Hiring graphic designers for website design');
/*!40000 ALTER TABLE `clientprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freelancerprofile`
--

DROP TABLE IF EXISTS `freelancerprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freelancerprofile` (
  `freelancerID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `skills` varchar(150) NOT NULL DEFAULT '-',
  `expertise` varchar(150) NOT NULL DEFAULT '-',
  `portfolio` text NOT NULL DEFAULT '-',
  `hourlyRate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `availability` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`freelancerID`),
  KEY `userID` (`userID`),
  CONSTRAINT `freelancerprofile_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancerprofile`
--

LOCK TABLES `freelancerprofile` WRITE;
/*!40000 ALTER TABLE `freelancerprofile` DISABLE KEYS */;
INSERT INTO `freelancerprofile` VALUES (1,1,'Web Development, Graphic Design','10 years experience','www.portfolio.com',50.00,1),(2,3,'Content Writing, SEO','5 years experience','www.contentportfolio.com',40.00,1),(3,5,'Mobile App Development','8 years experience','www.mobileapps.com',60.00,1),(4,7,'Digital Marketing','7 years experience','www.digitalmarketing.com',45.00,1),(5,9,'Data Entry, Virtual Assistance','3 years experience','www.virtualassistance.com',35.00,1);
/*!40000 ALTER TABLE `freelancerprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freelancerrating`
--

DROP TABLE IF EXISTS `freelancerrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freelancerrating` (
  `freelancerRatingID` int(11) NOT NULL AUTO_INCREMENT,
  `freelancerID` int(11) NOT NULL,
  `feedbackUserId` int(11) NOT NULL,
  `ratings` decimal(3,2) NOT NULL,
  `feedback` text DEFAULT NULL,
  PRIMARY KEY (`freelancerRatingID`),
  KEY `freelancerID` (`freelancerID`),
  KEY `feedbackUserId` (`feedbackUserId`),
  CONSTRAINT `freelancerrating_ibfk_1` FOREIGN KEY (`freelancerID`) REFERENCES `user` (`userID`),
  CONSTRAINT `freelancerrating_ibfk_2` FOREIGN KEY (`feedbackUserId`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancerrating`
--

LOCK TABLES `freelancerrating` WRITE;
/*!40000 ALTER TABLE `freelancerrating` DISABLE KEYS */;
INSERT INTO `freelancerrating` VALUES (1,1,2,4.50,'Excellent work on the website project.'),(2,3,2,4.00,'Good communication and quality of work.'),(3,5,4,4.80,'Highly skilled freelancer. Delivered the project on time.'),(4,2,1,4.20,'Great experience working with Jane. Highly recommended.'),(5,4,5,4.70,'The digital marketing campaign was a success. Good job!');
/*!40000 ALTER TABLE `freelancerrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `senderID` int(11) DEFAULT NULL,
  `recipientID` int(11) DEFAULT NULL,
  `messageContent` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `readStatus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`messageID`),
  KEY `senderID` (`senderID`),
  KEY `recipientID` (`recipientID`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`senderID`) REFERENCES `user` (`userID`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recipientID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,2,'Hi Jane, I saw your project posting and I am interested in working on it.','2024-03-10 03:03:35',0),(2,3,1,'Hello John, I have reviewed your portfolio and I am impressed with your work.','2024-03-10 03:03:35',0),(3,2,3,'Hi Sam, we have some content writing projects available. Are you interested?','2024-03-10 03:03:35',0),(4,4,5,'Hi Sara, let\'s discuss the details of the digital marketing campaign.','2024-03-10 03:03:35',0),(5,5,4,'Hello Peter, could you provide more information about the project requirements?','2024-03-10 03:03:35',0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `milestoneID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `description` text NOT NULL,
  `dueDate` date DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`milestoneID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `milestones_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
INSERT INTO `milestones` VALUES (1,1,'Design phase completed','2024-03-10','Completed'),(2,2,'First batch of articles written','2024-03-15','In Progress'),(3,3,'Wireframing completed','2024-03-12','Pending'),(4,4,'Social media marketing setup','2024-03-20','In Progress'),(5,5,'Data entry tasks assigned','2024-03-18','Open');
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notificationID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `notificationContent` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`notificationID`),
  KEY `userID` (`userID`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,1,'You have a new message from Jane.','2024-03-10 03:05:44'),(2,2,'You have a new project proposal from John.','2024-03-10 03:05:44'),(3,3,'New project opportunities available. Check your dashboard.','2024-03-10 03:05:44'),(4,4,'New message received. Please check your inbox.','2024-03-10 03:05:44'),(5,5,'You have a new project assignment. Check details in your dashboard.','2024-03-10 03:05:44');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,2500.00,'Paid'),(2,3,4000.00,'Pending'),(3,5,1500.00,'Paid'),(4,2,500.00,'Pending'),(5,4,2000.00,'Paid');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `projectID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) DEFAULT NULL,
  `projectDetails` text NOT NULL,
  `requirements` text NOT NULL,
  `budget` decimal(15,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`projectID`),
  KEY `clientID` (`clientID`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `clientprofile` (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'Build a website','Responsive design, E-commerce functionality',5000.00,'In Progress'),(2,2,'Content writing for blog posts','SEO optimized content',1000.00,'In Progress'),(3,3,'Develop a mobile app','iOS and Android platforms',8000.00,'Open'),(4,4,'Digital marketing campaign','Social media marketing, SEO',3000.00,'Open'),(5,5,'Data entry and virtual assistance','Data management, Customer support',2000.00,'In Progress');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectassignment`
--

DROP TABLE IF EXISTS `projectassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectassignment` (
  `assignmentID` int(11) NOT NULL AUTO_INCREMENT,
  `freelancerID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`assignmentID`),
  KEY `freelancerID` (`freelancerID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `projectassignment_ibfk_1` FOREIGN KEY (`freelancerID`) REFERENCES `freelancerprofile` (`freelancerID`),
  CONSTRAINT `projectassignment_ibfk_2` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectassignment`
--

LOCK TABLES `projectassignment` WRITE;
/*!40000 ALTER TABLE `projectassignment` DISABLE KEYS */;
INSERT INTO `projectassignment` VALUES (1,1,1,'Assigned'),(2,2,2,'Assigned'),(3,3,3,'Assigned'),(4,4,4,'Assigned'),(5,5,5,'Assigned');
/*!40000 ALTER TABLE `projectassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectfeedback`
--

DROP TABLE IF EXISTS `projectfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectfeedback` (
  `projectFeedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `ratings` decimal(3,2) NOT NULL,
  `feedbackContent` text DEFAULT NULL,
  PRIMARY KEY (`projectFeedbackID`),
  KEY `projectID` (`projectID`),
  KEY `userID` (`userID`),
  CONSTRAINT `projectfeedback_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`),
  CONSTRAINT `projectfeedback_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectfeedback`
--

LOCK TABLES `projectfeedback` WRITE;
/*!40000 ALTER TABLE `projectfeedback` DISABLE KEYS */;
INSERT INTO `projectfeedback` VALUES (1,1,2,4.50,'Great experience working with John. Highly recommended.'),(2,2,1,4.00,'Jane provided excellent content for our blog posts.'),(3,3,3,4.80,'Sam is an excellent mobile app developer. Highly skilled.'),(4,4,5,4.70,'Sara delivered outstanding results for the digital marketing campaign.');
/*!40000 ALTER TABLE `projectfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contactInfo` varchar(100) NOT NULL,
  `userType` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `userType` (`userType`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userType`) REFERENCES `usertype` (`userTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john_doe','password123','John','Doe','john@example.com','123 Main St, London','+1234567890',1),(2,'jane_smith','qwerty456','Jane','Smith','jane@example.com','456 Park Ave, London','+9876543210',2),(3,'sam_jones','sam123','Sam','Jones','sam@example.com','789 Broadway, London','+1112223333',1),(4,'sara_williams','sara456','Sara','Williams','sara@example.com','321 Oak St, London','+4445556666',2),(5,'mark_jackson','mark789','Mark','Jackson','mark@example.com','555 Maple Ave, London','+7778889999',1),(6,'anna_king','anna123','Anna','King','anna@example.com','678 Elm St, London','+9998887777',2),(7,'peter_brown','peter456','Peter','Brown','peter@example.com','987 Pine St, London','+3334445555',1),(8,'emily_taylor','emily789','Emily','Taylor','emily@example.com','234 Oak St, London','+6667778888',2),(9,'michael_clark','michael123','Michael','Clark','michael@example.com','876 Birch St, London','+1112223333',1),(10,'sophia_anderson','sophia456','Sophia','Anderson','sophia@example.com','345 Cedar St, London','+9998887777',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `userTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(50) NOT NULL,
  PRIMARY KEY (`userTypeID`),
  KEY `userType` (`userType`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (3,'admin'),(2,'client'),(1,'freelancer'),(4,'moderator'),(5,'owner');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'freelancer_portal'
--

--
-- Dumping routines for database 'freelancer_portal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-10 16:58:44
