-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: saigonfood
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDDish` int NOT NULL,
  `Content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Time` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDDish` (`IDDish`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`IDDish`) REFERENCES `dishes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDRestaurant` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Price` int NOT NULL,
  `Rating` int DEFAULT NULL,
  `Details` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDRestaurant` (`IDRestaurant`),
  CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`IDRestaurant`) REFERENCES `restaurants` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritedish`
--

DROP TABLE IF EXISTS `favoritedish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritedish` (
  `IDUser` int NOT NULL,
  `IDDish` int NOT NULL,
  PRIMARY KEY (`IDUser`,`IDDish`),
  KEY `IDDish` (`IDDish`),
  CONSTRAINT `favoritedish_ibfk_1` FOREIGN KEY (`IDUser`) REFERENCES `users` (`ID`),
  CONSTRAINT `favoritedish_ibfk_2` FOREIGN KEY (`IDDish`) REFERENCES `dishes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritedish`
--

LOCK TABLES `favoritedish` WRITE;
/*!40000 ALTER TABLE `favoritedish` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritedish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoriterestaurant`
--

DROP TABLE IF EXISTS `favoriterestaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoriterestaurant` (
  `IDUser` int NOT NULL,
  `IDRestaurant` int NOT NULL,
  PRIMARY KEY (`IDUser`,`IDRestaurant`),
  KEY `IDRestaurant` (`IDRestaurant`),
  CONSTRAINT `favoriterestaurant_ibfk_1` FOREIGN KEY (`IDRestaurant`) REFERENCES `restaurants` (`ID`),
  CONSTRAINT `favoriterestaurant_ibfk_2` FOREIGN KEY (`IDUser`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriterestaurant`
--

LOCK TABLES `favoriterestaurant` WRITE;
/*!40000 ALTER TABLE `favoriterestaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoriterestaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratingdish`
--

DROP TABLE IF EXISTS `ratingdish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratingdish` (
  `IDUser` int NOT NULL,
  `IDDish` int NOT NULL,
  `Rating` int NOT NULL,
  PRIMARY KEY (`IDUser`,`IDDish`),
  KEY `IDDish` (`IDDish`),
  CONSTRAINT `ratingdish_ibfk_1` FOREIGN KEY (`IDDish`) REFERENCES `dishes` (`ID`),
  CONSTRAINT `ratingdish_ibfk_2` FOREIGN KEY (`IDUser`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingdish`
--

LOCK TABLES `ratingdish` WRITE;
/*!40000 ALTER TABLE `ratingdish` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratingdish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratingrestaurant`
--

DROP TABLE IF EXISTS `ratingrestaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratingrestaurant` (
  `IDUser` int NOT NULL,
  `IDRestaurant` int NOT NULL,
  `Rating` int NOT NULL,
  PRIMARY KEY (`IDUser`,`IDRestaurant`),
  KEY `IDRestaurant` (`IDRestaurant`),
  CONSTRAINT `ratingrestaurant_ibfk_1` FOREIGN KEY (`IDUser`) REFERENCES `users` (`ID`),
  CONSTRAINT `ratingrestaurant_ibfk_2` FOREIGN KEY (`IDRestaurant`) REFERENCES `restaurants` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingrestaurant`
--

LOCK TABLES `ratingrestaurant` WRITE;
/*!40000 ALTER TABLE `ratingrestaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratingrestaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDChuQuan` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AveragePrice` int NOT NULL,
  `Rating` int DEFAULT NULL,
  `OperationTime` varchar(45) NOT NULL,
  `Introduce` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDChuQuan` (`IDChuQuan`),
  CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`IDChuQuan`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `IDUser` int NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL COLLATE utf8_unicode_ci ,
  `Typefood` varchar(100) NOT NULL COLLATE utf8_unicode_ci ,
  `Content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDUser` (`IDUser`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`IDUser`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

BEGIN;

INSERT INTO `review` VALUES (1, 1,jpg,'Học lập trình C#','Phát triển web.','vhgvhgvh');
INSERT INTO `review` VALUES (2, 1,jpg,'Học lập trình D','Phát triển web ','Hiểu kiến ​​thức cơ bản về lập trình ');
INSERT INTO `review` VALUES (3, 1,jpg,'Học lập trình E','Phát triển web l','Những gì bạn sẽ học');
INSERT INTO `review` VALUES (4, 1,jpg,'Học lập trình H','Phát triển web h.',' Hiểu kiến ​​thức cơ bản về lập trình ');
COMMIT;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrefreshtoken`
--

DROP TABLE IF EXISTS `userrefreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrefreshtoken` (
  `IDUser` int NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`IDUser`),
  CONSTRAINT `userrefreshtoken_ibfk_1` FOREIGN KEY (`IDUser`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrefreshtoken`
--

LOCK TABLES `userrefreshtoken` WRITE;
/*!40000 ALTER TABLE `userrefreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrefreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `TypeUser` int NOT NULL,
  `Permission` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
BEGIN;

INSERT INTO `users` VALUES (1,1,1,1,1,1);
COMMIT;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'saigonfood'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-05 11:55:10
