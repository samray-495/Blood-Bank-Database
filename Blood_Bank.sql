CREATE DATABASE  IF NOT EXISTS `donations` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `donations`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: donations
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
-- Temporary view structure for view `available nurses for patients`
--

DROP TABLE IF EXISTS `available nurses for patients`;
/*!50001 DROP VIEW IF EXISTS `available nurses for patients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `available nurses for patients` AS SELECT 
 1 AS `Nurses`,
 1 AS `Nurse_ID`,
 1 AS `date_patients`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `blood_bags`
--

DROP TABLE IF EXISTS `blood_bags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_bags` (
  `BloodBag_ID` varchar(4) NOT NULL,
  `B_Components` varchar(45) DEFAULT NULL,
  `Blood_Group` varchar(3) DEFAULT NULL,
  `Quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BloodBag_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_bags`
--

LOCK TABLES `blood_bags` WRITE;
/*!40000 ALTER TABLE `blood_bags` DISABLE KEYS */;
INSERT INTO `blood_bags` VALUES ('BB01','Red Blood Cells','A-','783'),('BB02','Platelet','AB-','420'),('BB03','Platelet','A+','200'),('BB04','Plasma','AB+','523'),('BB05','Plasma','AB-','823'),('BB06','Red Blood Cells','A+','678'),('BB07','Red Blood Cells','B-','768'),('BB08','Red Blood Cells','O+','530'),('BB09','Platelet','AB+','574'),('BB11','Red Blood Cells','O-','656'),('BB12','Whole Blood','A+','769'),('BB13','Whole Blood','A-','525'),('BB14','Whole Blood','O+','587'),('BB15','Platelet','B+','415'),('BB16','Whole Blood','O-','405'),('BB17','Whole Blood','B+','470');
/*!40000 ALTER TABLE `blood_bags` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `blood_bag_BEFORE_INSERT` BEFORE INSERT ON `blood_bags` FOR EACH ROW BEGIN
/*Warning if blood quantity is below 530 before inserting data */
IF blood_bag.quantity < 530 THEN 
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'This Blood Bag quantity is running low.'; 
END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `blood_bag_AFTER_UPDATE` AFTER UPDATE ON `blood_bags` FOR EACH ROW BEGIN
/*Warning if blood quantity is below 530 After updating data if there still isn't enough */
IF blood_bag.quantity < 530 THEN 
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'This Blood Bag quantity is running low.'; 
END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `blood_bank_location`
--

DROP TABLE IF EXISTS `blood_bank_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_bank_location` (
  `BankLoc_ID` varchar(7) NOT NULL,
  `Location_Name` varchar(45) DEFAULT NULL,
  `Located_In` varchar(45) DEFAULT NULL,
  `Address` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`BankLoc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_bank_location`
--

LOCK TABLES `blood_bank_location` WRITE;
/*!40000 ALTER TABLE `blood_bank_location` DISABLE KEYS */;
INSERT INTO `blood_bank_location` VALUES ('BLoc01','Maimonides Blood Donation Center','Maimonides Medical Center','4802 10th Ave, Brooklyn, NY 11219'),('BLoc02','Olgam Life Plasma',NULL,'1104 Fulton St, Brooklyn, NY 11238'),('BLoc03','Grand Central Donor Center','Chanin Building','115 E 41st St, New York, NY 10017'),('BLoc04','New York Blood Center',' Port Authority Bus Terminal',' 625 8th Avenue Between 40th And 41st Streets Main Floor, New York, NY 10018'),('BLoc05','Anonymous Hope\n',NULL,' 68 E 12th St 1st floor, New York, NY 10022'),('BLoc06','Queens Hospital Center',NULL,'82-68 164th St, Queens, NY 11432'),('BLoc07','New York Blood Center\n',NULL,'45-01 Vernon Blvd, Queens, NY 11101'),('BLoc08','Montefiore Blood Donor Suite\n','Montefiore Hospital','111 E 210th St, Bronx, NY 10467'),('BLoc09','Project Achieve\n',NULL,'391 E 149th St #405, Bronx, NY 10455');
/*!40000 ALTER TABLE `blood_bank_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_information_sheet`
--

DROP TABLE IF EXISTS `donation_information_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_information_sheet` (
  `Donation_ID` varchar(7) NOT NULL,
  `B_Components` varchar(45) DEFAULT NULL,
  `Blood_Group` varchar(3) DEFAULT NULL,
  `Amount_Donated` varchar(45) DEFAULT NULL,
  `Date_Donated` date DEFAULT NULL,
  PRIMARY KEY (`Donation_ID`),
  CONSTRAINT `Don` FOREIGN KEY (`Donation_ID`) REFERENCES `donors` (`Donor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_information_sheet`
--

LOCK TABLES `donation_information_sheet` WRITE;
/*!40000 ALTER TABLE `donation_information_sheet` DISABLE KEYS */;
INSERT INTO `donation_information_sheet` VALUES ('Donor01','Red Blood Cells','A+','2 Units','2021-11-09'),('Donor02','Plasma','AB-','1 Unit','2021-11-10'),('Donor03','Platelet','B+','1 Unit','2021-11-11'),('Donor04','Whole Blood','O-','1 Unit','2021-11-12'),('Donor05','Platelet','AB+','2 Units','2021-11-12'),('Donor06','Red Blood Cells','B-','1 Unit','2021-11-13'),('Donor07','Plasma','AB-','1 Unit','2021-11-17'),('Donor08','Plasma','AB+','1 Unit','2021-11-17'),('Donor09','Red Blood Cells','O+','1 Unit','2021-11-17'),('Donor10','Whole Blood','A+','2 Units','2021-11-18'),('Donor11','Whole Blood','B+','2 Units','2021-11-19'),('Donor12','Red Blood Cells','A-','1 Units','2021-11-19'),('Donor13','Platete','A-','1 Unit','2021-11-19'),('Donor14','Red Blood Cells','A+','2 Units','2021-11-21'),('Donor15','Plasma','AB+','1 Unit','2021-11-21'),('Donor16','Whole Blood','O+','2 Units','2021-11-23');
/*!40000 ALTER TABLE `donation_information_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donors`
--

DROP TABLE IF EXISTS `donors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donors` (
  `Donor_ID` varchar(7) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `Height` varchar(5) DEFAULT NULL,
  `Phone_num` varchar(45) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `BankLoc_ID` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`Donor_ID`),
  KEY `BBankLoc2_idx` (`BankLoc_ID`),
  CONSTRAINT `BBankLoc2` FOREIGN KEY (`BankLoc_ID`) REFERENCES `blood_bank_location` (`BankLoc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donors`
--

LOCK TABLES `donors` WRITE;
/*!40000 ALTER TABLE `donors` DISABLE KEYS */;
INSERT INTO `donors` VALUES ('Donor01','Angela','Sosa','1985-05-27','F',175,'5\'9\"','212-566-4432','92 Pilling St, Brooklyn, NY 11207','BLoc01'),('Donor02','Sienna','Sloan','1995-02-18','F',126,'5\'11\"','212-090-4434','94 Grant Ave, Brooklyn, NY 11208','BLoc02'),('Donor03','Autum ','Mac','2000-01-01','M',135,'5\'8\"','718-009-3323','9437 Shore Rd,Brooklyn, NY 11209','BLoc01'),('Donor04','Glenn','Lozano','2002-07-06','M',183,'6\'3\"','929-567-1233','941 E 77th St, Brooklyn, NY 11236','BLoc05'),('Donor05','George','Magee','1978-11-06','M',170,'6\'1\"','917-266-9847','118 W 132nd St, New York, NY 10027','BLoc04'),('Donor06','Rene','Morgan','1984-01-22','F',140,'5\'4\"','202-593-7031','158 W 131st St #12, New York, NY 10027 ','BLoc03'),('Donor07','Isabelle','Bober','2005-04-13','F',209,'5\'7\"','315-751-2310','155 E 29th St, New York, NY 10016','BLoc02'),('Donor08','Tran','Williams','2004-02-18','M',167,'5\'10\"','646-668-7425','966 Lexington Ave,  New York, NY 10021','BLoc02'),('Donor09','Joshua','Cloud','1987-06-01','M',143,'5\'9\"','815-246-6888','505 Walnut St. Bronx, NY 10466\n','BLoc09'),('Donor10','Ashley','Bouton','2003-09-18','F',156,'5\'5','919-370-6892','1303 Findlay Ave, Bronx, NY 10456\n','BLoc08'),('Donor11','Charlene','Luna','2001-06-15','F',130,'5\'4\"','718-548-0079','1649 Andrews Ave S, Bronx, NY 10453\n','BLoc09'),('Donor12','Robert','Davis','1998-05-21','M',200,'5\'11\"','347-728-9444','811 E 228th St, Bronx, NY 10466\n','BLoc04'),('Donor13','Jessica','Howe','1993-11-03','F',115,'5\'8\"','212-969-5566','160th St, Fresh Meadows, NY 11365\n','BLoc06'),('Donor14','Valerie','Knight','1999-02-12','F',230,'5\'10\"','815-591-8318','159th St #APT 2B, Jamaica, NY, 11433\n','BLoc07'),('Donor15','Corina','Felice','2002-07-27','F',201,'5\'9\"','718-820-6343','Hillside Ave #APT 3L, Jamaica, NY, 11432\r ','BLoc08'),('Donor16','David','Richards','1989-03-06','M',230,'6\'3\"','347-453-2342','11616 Atlantic Ave, South Richmond Hill, NY, 11418\r ','BLoc09');
/*!40000 ALTER TABLE `donors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `donors_AFTER_INSERT` AFTER INSERT ON `donors` FOR EACH ROW BEGIN
/*Would not allow the user input the weight/ donor due to weight being less than 110  */
IF donors.weight < 110 THEN 
 SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'You can not insert weight, the donor weighs less then 110';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medical_conditions`
--

DROP TABLE IF EXISTS `medical_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_conditions` (
  `Condition_ID` varchar(4) NOT NULL,
  `Condition_Type` varchar(45) DEFAULT NULL,
  `Affected_Components` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Condition_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_conditions`
--

LOCK TABLES `medical_conditions` WRITE;
/*!40000 ALTER TABLE `medical_conditions` DISABLE KEYS */;
INSERT INTO `medical_conditions` VALUES ('CO1','Autoimmune Disorder','Plasma'),('CO10','Von Willebrand disease','Platelet'),('CO11','thrombocytopenia','Platelet'),('CO12','platelet dysfunction','Platelet'),('CO2','COVID-19','Plasma '),('CO3',' Blood Clotting','Plasma'),('CO4','Leukaemia','Whole Blood'),('CO5','Peptic Ulcer','Whole Blood'),('CO6',' Serious injury/surgeries','Whole Blood '),('CO7','Thalassemia ','Red Blood Cells'),('CO8','Lupus','Red Blood Cells'),('CO9','Sickle Cell','Red Blood Cells');
/*!40000 ALTER TABLE `medical_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `nurse's public info`
--

DROP TABLE IF EXISTS `nurse's public info`;
/*!50001 DROP VIEW IF EXISTS `nurse's public info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `nurse's public info` AS SELECT 
 1 AS `Nurses`,
 1 AS `Nurse_ID`,
 1 AS `BankLoc_ID`,
 1 AS `Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `Nurse_ID` varchar(7) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Date_Donations` date DEFAULT NULL,
  `Date_Patients` date DEFAULT NULL,
  `BankLoc_ID` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`Nurse_ID`),
  KEY `BBankLoc_idx` (`BankLoc_ID`),
  CONSTRAINT `BBankLoc` FOREIGN KEY (`BankLoc_ID`) REFERENCES `blood_bank_location` (`BankLoc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES ('Nurse01','Gladys','Jeffers','F',64000,'2021-11-19','2021-12-04','BLoc06'),('Nurse02','Maria','McKay','F',63000,'2021-11-17','2021-12-10','BLoc09'),('Nurse03','Alfred','Rankin','M',55000,'2021-11-19','2021-12-03','BLoc04'),('Nurse04','Joni','Aldrich','F',73000,'2021-11-10','2021-12-06','BLoc02'),('Nurse05','Allen','Mitchell','M',74000,'2021-11-19','2021-12-03','BLoc09'),('Nurse06','Amanda','Richardson','F',49000,'2021-11-12','2021-12-02','BLoc05'),('Nurse07','Anne','Moody','F',84000,'2021-11-17','2021-12-10','BLoc02'),('Nurse08','Carl','Baines','M',75000,'2021-11-11','2021-12-16','BLoc01'),('Nurse09','Mara','Hardaway','F',81000,'2021-11-18','2021-12-15','BLoc08'),('Nurse10','Arthur','Jamison','M',67000,'2021-11-23',NULL,'BLoc09'),('Nurse11','Cardin ','Reed','N',62000,'2021-11-12',NULL,'BLoc04'),('Nurse12','Devin ','Blayne','F',56000,'2021-11-21',NULL,'BLoc08'),('Nurse13','Avia ','Kelsie','F',73000,'2021-11-13',NULL,'BLoc03'),('Nurse14','Kurt ','Raven','M',87000,'2021-11-17',NULL,'BLoc02'),('Nurse15','Lynn','Rae','F',79000,'2021-11-21',NULL,'BLoc07'),('Nurse16','Ronny ','Maryann','M',61000,'2021-11-09',NULL,'BLoc01');
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Patient_ID` varchar(3) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `Height (ft)` varchar(5) DEFAULT NULL,
  `Blood_Group` varchar(3) DEFAULT NULL,
  `Condition_ID` varchar(4) DEFAULT NULL,
  `BloodBag_ID` varchar(4) DEFAULT NULL,
  `Priority` varchar(7) DEFAULT NULL,
  `Amount_Needed` varchar(45) DEFAULT NULL,
  `Receive_Date` date DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `BloodBag_idx` (`BloodBag_ID`),
  KEY `Con_idx` (`Condition_ID`),
  CONSTRAINT `BloodBag` FOREIGN KEY (`BloodBag_ID`) REFERENCES `blood_bags` (`BloodBag_ID`),
  CONSTRAINT `Con` FOREIGN KEY (`Condition_ID`) REFERENCES `medical_conditions` (`Condition_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('P01','Benjamin','Ferguson','2005-04-27','M',152,'5\'8\"','AB+','CO5','BB12','Low','2 Units','2021-12-15'),('P02','Nubia','Gana','1999-02-23','F',133,'5\'11\"','B+','CO9','BB07','Medium','1 Unit','2021-12-06'),('P03','Shon','Ramundo','2004-12-08','M',196,'6\'2\"','O+','CO4','BB14','High','2 Units','2021-12-04'),('P04','Kathey','Pliego','1992-10-12','F',205,'5\'4\"','A+','CO8','BB01','Medium','1 Unit','2021-12-10'),('P05','Mildred','Clarke','1989-12-15','F',133,'5\'8\"','B-','CO12','BB09','High','1 Unit','2021-12-03'),('P06','Robert','Bowen','1999-07-27','M',145,'6\'1\"','A-','CO3','BB04','High','1 Unit','2021-12-03'),('P07','John','Applin','1970-09-16','M',167,'5\'6\"','AB-','CO7','BB07','Low','1 Unit','2021-12-16'),('P08','Charles','Ryan','1966-11-02','M',159,'5\'9\"','B+','CO1','BB05','High','1 Unit','2021-12-07'),('P09','Evangeline  ','Martinez','1995-09-14','F',121,'5\'7\"','A+','CO2','BB05','High','2 Units','2021-12-02'),('P10','Valerie','Knight','1960-04-05','F',163,'5\'10\"','AB+','CO11','BB09','Medium','1 Unit','2021-12-10');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'donations'
--

--
-- Final view structure for view `available nurses for patients`
--

/*!50001 DROP VIEW IF EXISTS `available nurses for patients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `available nurses for patients` AS select concat(' ',`nurses`.`Fname`,' ',`nurses`.`Lname`) AS `Nurses`,`nurses`.`Nurse_ID` AS `Nurse_ID`,`nurses`.`Date_Patients` AS `date_patients` from `nurses` where (`nurses`.`Date_Patients` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nurse's public info`
--

/*!50001 DROP VIEW IF EXISTS `nurse's public info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nurse's public info` AS select concat(' ',`s`.`Fname`,' ',`s`.`Lname`) AS `Nurses`,`s`.`Nurse_ID` AS `Nurse_ID`,`s`.`BankLoc_ID` AS `BankLoc_ID`,`w`.`Address` AS `Address` from (`nurses` `s` left join `blood_bank_location` `w` on((`w`.`BankLoc_ID` = `s`.`BankLoc_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 13:09:08
