CREATE DATABASE  IF NOT EXISTS `edoctor` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `edoctor`;
-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: edoctor
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `edo_aseguradora`
--

DROP TABLE IF EXISTS `edo_aseguradora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_aseguradora` (
  `edo_aseguradora_id` int(11) NOT NULL AUTO_INCREMENT,
  `edo_aseguradora_descripccion` varchar(45) DEFAULT NULL,
  `edo_aseguradora_imagen` varchar(45) DEFAULT NULL,
  `edo_aseguradora_saldo` varchar(45) DEFAULT NULL,
  `edo_aseguradora_rfc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`edo_aseguradora_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_aseguradora`
--

LOCK TABLES `edo_aseguradora` WRITE;
/*!40000 ALTER TABLE `edo_aseguradora` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_aseguradora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_factura`
--

DROP TABLE IF EXISTS `edo_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_factura` (
  `edo_factura_id` int(11) NOT NULL,
  `edo_receta_edo_receta_id` int(11) NOT NULL,
  PRIMARY KEY (`edo_factura_id`,`edo_receta_edo_receta_id`),
  KEY `fk_edo_factura_edo_receta1_idx` (`edo_receta_edo_receta_id`),
  CONSTRAINT `fk_edo_factura_edo_receta1` FOREIGN KEY (`edo_receta_edo_receta_id`) REFERENCES `edo_receta` (`edo_receta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_factura`
--

LOCK TABLES `edo_factura` WRITE;
/*!40000 ALTER TABLE `edo_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_medicamiento`
--

DROP TABLE IF EXISTS `edo_medicamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_medicamiento` (
  `edo_medicamiento_id` int(11) NOT NULL AUTO_INCREMENT,
  `edo_medicamento_nombre` varchar(45) DEFAULT NULL,
  `edo_medicamento_descripcion` varchar(255) DEFAULT NULL,
  `edo_medicamento_precio` varchar(45) DEFAULT NULL,
  `edo_medicamento_fabricante` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`edo_medicamiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_medicamiento`
--

LOCK TABLES `edo_medicamiento` WRITE;
/*!40000 ALTER TABLE `edo_medicamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_medicamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_medico`
--

DROP TABLE IF EXISTS `edo_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_medico` (
  `edo_medico_id` int(11) NOT NULL AUTO_INCREMENT,
  `edo_medico_usuario` varchar(45) DEFAULT NULL,
  `edo_medico_password` varchar(45) DEFAULT NULL,
  `edo_medico_nombre` varchar(45) DEFAULT NULL,
  `edo_medico_direccion` varchar(45) DEFAULT NULL,
  `edo_medico_telefono` varchar(12) DEFAULT NULL,
  `edo_medico_rfc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`edo_medico_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_medico`
--

LOCK TABLES `edo_medico` WRITE;
/*!40000 ALTER TABLE `edo_medico` DISABLE KEYS */;
INSERT INTO `edo_medico` VALUES (1,'admin','tacos','Admin','Tu korazon','666','rfc');
/*!40000 ALTER TABLE `edo_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_medico_has_edo_paciente`
--

DROP TABLE IF EXISTS `edo_medico_has_edo_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_medico_has_edo_paciente` (
  `edo_medico_edo_medico_id` int(11) NOT NULL,
  `edo_paciente_edo_paciente_id` int(11) NOT NULL,
  PRIMARY KEY (`edo_medico_edo_medico_id`,`edo_paciente_edo_paciente_id`),
  KEY `fk_edo_medico_has_edo_paciente_edo_paciente1_idx` (`edo_paciente_edo_paciente_id`),
  KEY `fk_edo_medico_has_edo_paciente_edo_medico1_idx` (`edo_medico_edo_medico_id`),
  CONSTRAINT `fk_edo_medico_has_edo_paciente_edo_medico1` FOREIGN KEY (`edo_medico_edo_medico_id`) REFERENCES `edo_medico` (`edo_medico_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_edo_medico_has_edo_paciente_edo_paciente1` FOREIGN KEY (`edo_paciente_edo_paciente_id`) REFERENCES `edo_paciente` (`edo_paciente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_medico_has_edo_paciente`
--

LOCK TABLES `edo_medico_has_edo_paciente` WRITE;
/*!40000 ALTER TABLE `edo_medico_has_edo_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_medico_has_edo_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_paciente`
--

DROP TABLE IF EXISTS `edo_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_paciente` (
  `edo_paciente_id` int(11) NOT NULL,
  `edo_paciente_direccion` varchar(45) DEFAULT NULL,
  `edo_paciente_telefono` varchar(45) DEFAULT NULL,
  `edo_paciente_edad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`edo_paciente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_paciente`
--

LOCK TABLES `edo_paciente` WRITE;
/*!40000 ALTER TABLE `edo_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_pase`
--

DROP TABLE IF EXISTS `edo_pase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_pase` (
  `edo_paciente_id` int(11) NOT NULL,
  `edo_aseguradora_id` int(11) NOT NULL,
  KEY `edo_paciente_id_idx` (`edo_paciente_id`),
  KEY `edo_aseguradora_id_idx` (`edo_aseguradora_id`),
  CONSTRAINT `edo_aseguradora_id` FOREIGN KEY (`edo_aseguradora_id`) REFERENCES `edo_aseguradora` (`edo_aseguradora_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `edo_paciente_id` FOREIGN KEY (`edo_paciente_id`) REFERENCES `edo_paciente` (`edo_paciente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_pase`
--

LOCK TABLES `edo_pase` WRITE;
/*!40000 ALTER TABLE `edo_pase` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_pase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_receta`
--

DROP TABLE IF EXISTS `edo_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_receta` (
  `edo_receta_id` int(11) NOT NULL AUTO_INCREMENT,
  `edo_medico_id` int(11) NOT NULL,
  `edo_paciente_id` int(11) NOT NULL,
  `edo_tratamiento_id` int(11) NOT NULL,
  `edo_receta_fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`edo_receta_id`),
  KEY `edo_medico_idx` (`edo_medico_id`),
  KEY `edo_paciente_idx` (`edo_paciente_id`),
  KEY `edo_tratamiento_id_idx` (`edo_tratamiento_id`),
  CONSTRAINT `edo_medico` FOREIGN KEY (`edo_medico_id`) REFERENCES `edo_medico` (`edo_medico_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `edo_paciente` FOREIGN KEY (`edo_paciente_id`) REFERENCES `edo_paciente` (`edo_paciente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `edo_tratamiento_id` FOREIGN KEY (`edo_tratamiento_id`) REFERENCES `edo_tratamiento` (`edo_tratamiento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_receta`
--

LOCK TABLES `edo_receta` WRITE;
/*!40000 ALTER TABLE `edo_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_tiposec`
--

DROP TABLE IF EXISTS `edo_tiposec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_tiposec` (
  `edo_aseguradora_edo_aseguradora_id` int(11) NOT NULL,
  `edo_tiposec_id` int(11) NOT NULL,
  `edo_tiposec_nombre` varchar(45) DEFAULT NULL,
  `edo_tiposec_saldo` int(11) DEFAULT NULL,
  PRIMARY KEY (`edo_aseguradora_edo_aseguradora_id`,`edo_tiposec_id`),
  KEY `fk_edo_tiposec_edo_aseguradora1_idx` (`edo_aseguradora_edo_aseguradora_id`),
  CONSTRAINT `fk_edo_tiposec_edo_aseguradora1` FOREIGN KEY (`edo_aseguradora_edo_aseguradora_id`) REFERENCES `edo_aseguradora` (`edo_aseguradora_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_tiposec`
--

LOCK TABLES `edo_tiposec` WRITE;
/*!40000 ALTER TABLE `edo_tiposec` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_tiposec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_tratamiento`
--

DROP TABLE IF EXISTS `edo_tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_tratamiento` (
  `edo_tratamiento_id` int(11) NOT NULL,
  `edo_tratamiento_dosis` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`edo_tratamiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_tratamiento`
--

LOCK TABLES `edo_tratamiento` WRITE;
/*!40000 ALTER TABLE `edo_tratamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edo_tratamiento_has_edo_medicamiento`
--

DROP TABLE IF EXISTS `edo_tratamiento_has_edo_medicamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edo_tratamiento_has_edo_medicamiento` (
  `edo_tratamiento_edo_tratamiento_id` int(11) NOT NULL,
  `edo_medicamiento_edo_medicamiento_id` int(11) NOT NULL,
  PRIMARY KEY (`edo_tratamiento_edo_tratamiento_id`,`edo_medicamiento_edo_medicamiento_id`),
  KEY `fk_edo_tratamiento_has_edo_medicamiento_edo_medicamiento1_idx` (`edo_medicamiento_edo_medicamiento_id`),
  KEY `fk_edo_tratamiento_has_edo_medicamiento_edo_tratamiento1_idx` (`edo_tratamiento_edo_tratamiento_id`),
  CONSTRAINT `fk_edo_tratamiento_has_edo_medicamiento_edo_medicamiento1` FOREIGN KEY (`edo_medicamiento_edo_medicamiento_id`) REFERENCES `edo_medicamiento` (`edo_medicamiento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_edo_tratamiento_has_edo_medicamiento_edo_tratamiento1` FOREIGN KEY (`edo_tratamiento_edo_tratamiento_id`) REFERENCES `edo_tratamiento` (`edo_tratamiento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edo_tratamiento_has_edo_medicamiento`
--

LOCK TABLES `edo_tratamiento_has_edo_medicamiento` WRITE;
/*!40000 ALTER TABLE `edo_tratamiento_has_edo_medicamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `edo_tratamiento_has_edo_medicamiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-07  0:12:58
