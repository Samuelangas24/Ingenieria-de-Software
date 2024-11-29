-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: alquiler
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `appaterno` varchar(100) DEFAULT NULL,
  `apmaterno` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Samuel','Pérez','Carrasco');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `iddetalle` int NOT NULL AUTO_INCREMENT,
  `fkfactura` int DEFAULT NULL,
  `fkproducto` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precioVenta` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`iddetalle`),
  KEY `fkfactura` (`fkfactura`),
  KEY `fkproducto` (`fkproducto`),
  CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`fkfactura`) REFERENCES `factura` (`idfactura`),
  CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`fkproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `fechaFactura` date DEFAULT NULL,
  `fkcliente` int DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `fkcliente` (`fkcliente`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`fkcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (2,'2024-11-27',1);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `precioProducto` decimal(25,0) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'SILLAS METALICAS',5,1000),(2,'SILLAS PLASTICAS',5,1000),(3,'SILLAS MADERA',15,1000),(4,'SILLAS TIFANY',20,1000),(5,'SILLAS ACOJINADAS',15,1000),(6,'SILLAS INFANTILES',5,1000),(7,'MESAS RECTANGULARES',70,100),(8,'MESAS CIRCULARES',70,100),(9,'MESAS CUADRADAS',70,100),(10,'MESAS INFANTILES',70,100),(11,'MANTELES MULTI COLOR',40,150),(12,'CUBRE MANTELES',30,100),(13,'PLATOS EXT/ TP GOURMET',5,200),(14,'PLATOS / TP GSOPA',5,200),(15,'PLATOS P/ PASTEL',5,200),(16,'TAZONES P/ CHOCOLATE',5,200),(17,'TAZAS CH ',5,200),(18,'VASOS CRISTAL/ TP JAM',5,200),(19,'COPAS VIDRIO/ TP BRINDIS ',5,200),(20,'CUCHARAS SOPERAS ',5,200),(21,'TENEDORES',5,200),(23,'MODULO 4X8',700,2),(24,'MODULO 6X10',1200,2),(25,'MODULO 10X15',2000,2),(26,'ADD /CIELO BLNACO PARA MODULOS',500,6),(27,'CORTINAS P/MODULO 4X8',300,1),(28,'CORTINAS P/MODULO 6X10',300,1),(29,'CORTINAS P/MODULO 10X15',300,1),(30,'ILUMINACION P/ MODULO D LUJO',300,1),(31,'LONA 4X8',600,2),(32,'LONA 6X8',800,2),(33,'LONA 8X10',1000,2),(34,'LONA 10X15',1500,2),(35,'LONA 20X30',3000,2),(36,'CHAROLAS P/ MESEROS',50,10),(37,'HIELERA GRANDE',500,2),(38,'HIELERA CHICA',250,2),(39,'ILUMINACION GENERAL',1500,4),(40,'FORRAJE DE LUJO P/SILLAS',30,1000);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'alquiler'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 22:32:18
