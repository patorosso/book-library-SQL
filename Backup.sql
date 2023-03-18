CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `library`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(20) DEFAULT NULL,
  `id_nacionalidad` int DEFAULT NULL,
  PRIMARY KEY (`id_autor`),
  KEY `id_nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `autores_ibfk_1` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidades` (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Yuval','Noah Harari',11),(2,'John Ronald Reuel','Tolkien',9),(3,'Alexander','Shvets',12),(4,'Julio','Verne',2),(5,'Ian','MacDonald',10),(6,'Marco','Vitruvio',8),(7,'Chip','Heath',7);
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `apellidos` varchar(20) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `cant_ejemplares` int DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `nivel_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Rowe','Baus','3413152853',1,'5618 Park Street','rbaus0@mapquest.com',2),(3,'Noby','Duffield','2406098898',2,'2229 Delaware Pass','nduffield2@huffingtonpost.com',3),(4,'Bethanne','Akister','9991562524',0,'061 Brown Drive','bakister3@google.com',3),(5,'Krishnah','Burwell','7395391417',1,'5 Golf Lane','kburwell4@buzzfeed.com',1),(6,'Ros','Filipychev','4624051093',1,'9 Marcy Plaza','rfilipychev5@csmonitor.com',3),(7,'Paten','Hutchinges','2636007141',1,'193 Leroy Way','phutchinges6@blogtalkradio.com',3),(8,'Alard','Mellmer','1887629195',1,'99187 Iowa Way','amellmer7@1688.com',3),(9,'Jody','Schowenburg','6782392916',0,'6157 Maywood Point','jschowenburg8@fastcompany.com',2),(10,'Theo','Harnett','5223949382',0,'026 Golf View Pass','tharnett9@aol.com',3),(19,'Ivan','Rodriguez','5123421235',1,'52 Flick Street','ivanRo@asdk.com',2);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_clientes_log` AFTER INSERT ON `clientes` FOR EACH ROW begin
	IF NEW.cant_ejemplares > NEW.nivel_cliente THEN
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'No se puede insertar porque su nivel no admite la cantidad de ejemplares en posesión.'; 
	ELSE INSERT INTO log(fecha_actualizacion,tabla_act,operacion) VALUES (now(),'clientes','INSERT');
    END IF;
end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_clientes_check` AFTER UPDATE ON `clientes` FOR EACH ROW begin
	 INSERT INTO log(fecha_actualizacion,tabla_act,operacion,usuario) VALUES (now(),'clientes','UPDATE',SYSTEM_USER());
end */;;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_clientes_check` BEFORE DELETE ON `clientes` FOR EACH ROW begin
	 IF OLD.cant_ejemplares > 0 THEN 
			SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'No se pudo eliminar fila porque todavia tiene ejemplares'; 
	END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoriales` (
  `id_editorial` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'Blazingstar'),(2,'Canarygrass'),(3,'Cliff'),(4,'Deergrass'),(5,'Wedge Leaf-flower'),(6,'Light And Dark'),(7,'Sarmenthypnum Moss'),(8,'Atwood\'s Buckwheat'),(9,'Asian Melastome'),(10,'Lichen');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejemplares`
--

DROP TABLE IF EXISTS `ejemplares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejemplares` (
  `id_ejemplar` int NOT NULL AUTO_INCREMENT,
  `id_libro` int DEFAULT NULL,
  `fecha_tomado` date DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_ejemplar`),
  KEY `id_libro` (`id_libro`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `ejemplares_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  CONSTRAINT `ejemplares_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejemplares`
--

LOCK TABLES `ejemplares` WRITE;
/*!40000 ALTER TABLE `ejemplares` DISABLE KEYS */;
INSERT INTO `ejemplares` VALUES (1,1,'2023-02-15',1),(2,1,'2022-12-16',5);
/*!40000 ALTER TABLE `ejemplares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Ficcion'),(2,'Ciencia Ficcion'),(3,'Terror'),(4,'Misterio'),(5,'Suspenso'),(6,'Comedia'),(7,'Autoayuda'),(8,'Novela'),(9,'No Ficcion'),(10,'Biografia'),(11,'whodunnit');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_generos_log` AFTER INSERT ON `generos` FOR EACH ROW begin
	INSERT INTO log(fecha_actualizacion,tabla_act,operacion,usuario) VALUES (now(),'generos','INSERT',SYSTEM_USER());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(70) DEFAULT NULL,
  `id_autor` int DEFAULT NULL,
  `cant_paginas` int DEFAULT NULL,
  `cant_disponible` int DEFAULT NULL,
  `id_genero` int DEFAULT NULL,
  `id_editorial` int DEFAULT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `FK_EDITORIALES` (`id_editorial`),
  KEY `FK_AUTORES` (`id_autor`),
  KEY `FK_GENEROS` (`id_genero`),
  CONSTRAINT `FK_AUTORES` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`),
  CONSTRAINT `FK_EDITORIALES` FOREIGN KEY (`id_editorial`) REFERENCES `editoriales` (`id_editorial`),
  CONSTRAINT `FK_GENEROS` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'Sapiens: A Brief History of Humankind',1,443,10,9,1),(2,'Lord of The Rings: The Fellowship of the Ring',2,423,20,1,2),(3,'Dive Into Design Patterns',3,409,3,9,3),(4,'Veinte mil leguas de viaje submarino',4,320,7,8,4),(5,'Revolution in the Head: Beatles Records and the Sixties',5,544,23,10,5),(6,'La vuelta al mundo en 80 dias',4,304,53,2,6),(7,'Los diez libros de arquitectura',6,294,2,9,7),(8,'Made to stick: why some ideas survive and others die',7,291,13,9,8);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `fecha_actualizacion` timestamp NULL DEFAULT NULL,
  `tabla_act` varchar(25) DEFAULT NULL,
  `operacion` varchar(15) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT 'unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('2023-03-10 15:00:19','generos','INSERT','root@localhost'),('2023-03-10 15:04:04','clientes','UPDATE','root@localhost'),('2023-03-10 15:24:36','clientes','UPDATE','root@localhost'),('2023-03-10 15:25:08','clientes','UPDATE','root@localhost'),('2023-03-10 15:34:25','clientes','INSERT','unknown'),('2023-03-10 16:40:22','generos','INSERT','root@localhost'),('2023-03-10 16:40:22','generos','INSERT','root@localhost'),('2023-03-10 16:40:22','generos','INSERT','root@localhost'),('2023-03-10 16:40:22','generos','INSERT','root@localhost'),('2023-03-10 16:40:28','generos','INSERT','root@localhost'),('2023-03-10 16:40:28','generos','INSERT','root@localhost'),('2023-03-10 16:40:28','generos','INSERT','root@localhost'),('2023-03-10 16:40:28','generos','INSERT','root@localhost');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidades`
--

DROP TABLE IF EXISTS `nacionalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacionalidades` (
  `id_nacionalidad` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidades`
--

LOCK TABLES `nacionalidades` WRITE;
/*!40000 ALTER TABLE `nacionalidades` DISABLE KEYS */;
INSERT INTO `nacionalidades` VALUES (1,'Argentina'),(2,'Francia'),(3,'Bolivia'),(4,'Chile'),(5,'Colombia'),(6,'Uruguay'),(7,'Estados Unidos'),(8,'Italia'),(9,'Sudafrica'),(10,'Inglaterra'),(11,'Israel'),(12,'Ucrania'),(13,'Peru'),(14,'Ecuador'),(15,'Venezuela');
/*!40000 ALTER TABLE `nacionalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'library'
--

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-18 20:14:18
