-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: carloca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `carros`
--

DROP TABLE IF EXISTS `carros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carros` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_VERSAO` int NOT NULL,
  `COR` enum('BRANCO','PRETO','PRATA') NOT NULL,
  `PLACA` varchar(45) NOT NULL,
  `CATEGORIA` enum('HATCH','SEDAN COMPACTO','SEDAN MEDIO','SUV','ECONOMICO','PICAPE','JIPE') NOT NULL,
  `DIARIA_VALOR` decimal(7,2) NOT NULL,
  `KM_ATUAL` decimal(7,2) NOT NULL,
  `STATUS` enum('DISPONIVEL','LOCADO','INATIVO') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_VERSAO_idx` (`ID_VERSAO`),
  CONSTRAINT `ID_VERSAO` FOREIGN KEY (`ID_VERSAO`) REFERENCES `versao` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carros`
--

LOCK TABLES `carros` WRITE;
/*!40000 ALTER TABLE `carros` DISABLE KEYS */;
INSERT INTO `carros` VALUES (1,1,'PRETO','HHH0909','HATCH',100.00,10909.00,'DISPONIVEL'),(2,3,'PRATA','JJJ8923','SEDAN MEDIO',190.00,82371.00,'DISPONIVEL');
/*!40000 ALTER TABLE `carros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) NOT NULL,
  `CPF` varchar(45) NOT NULL,
  `CNH` varchar(45) NOT NULL,
  `ID_ENDERECO` int NOT NULL,
  `ID_CONTATO` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_ENDERECO_idx` (`ID_ENDERECO`),
  KEY `ID_CONTATO_idx` (`ID_CONTATO`),
  CONSTRAINT `ID_CONTATO` FOREIGN KEY (`ID_CONTATO`) REFERENCES `contato` (`ID`),
  CONSTRAINT `ID_ENDERECO` FOREIGN KEY (`ID_ENDERECO`) REFERENCES `enderecos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'ALICE','90387633567\'','999999999',1,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) NOT NULL,
  `TELEFONE PRINCIPAL` varchar(45) NOT NULL,
  `TELEFONE 2` varchar(45) DEFAULT NULL,
  `REDES SOCIAIS` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
INSERT INTO `contato` VALUES (1,'alice@gmail.com','19996488998','199567789','@alice'),(2,'carlocaubatuba@gmailcom','12997786677',NULL,'@carlocaubatuba'),(3,'carlocaitapira@gmail.com','19997863452',NULL,'@carlocaitapira');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao`
--

DROP TABLE IF EXISTS `devolucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_LOCACAO` int NOT NULL,
  `ID_FRANQUIA_DEVOLUCAO` int NOT NULL,
  `DATA_DEVOLUCAO` date NOT NULL,
  `TOTAL_DIARIAS` int NOT NULL,
  `KM_ATUAL` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_LOCACAO_idx` (`ID_LOCACAO`),
  KEY `ID_FRANQUIA_LOC_idx` (`ID_FRANQUIA_DEVOLUCAO`),
  CONSTRAINT `ID_FRANQUIA_LOCA` FOREIGN KEY (`ID_FRANQUIA_DEVOLUCAO`) REFERENCES `franquia` (`ID`),
  CONSTRAINT `ID_LOCACAO` FOREIGN KEY (`ID_LOCACAO`) REFERENCES `locacao` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao`
--

LOCK TABLES `devolucao` WRITE;
/*!40000 ALTER TABLE `devolucao` DISABLE KEYS */;
INSERT INTO `devolucao` VALUES (1,1,2,'2022-12-17',5,11909);
/*!40000 ALTER TABLE `devolucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CEP` varchar(45) NOT NULL,
  `LOGRADOURO` varchar(255) NOT NULL,
  `NUMERO` varchar(45) NOT NULL,
  `CIDADE` varchar(255) NOT NULL,
  `ESTADO` varchar(255) NOT NULL,
  `COMPLEMENTO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,'11680000','Rua Brasil','90','Ubatuba','SP',NULL),(2,'11680000','Rua Jorge Amado','87','Ubatuba','SP',NULL),(3,'13976217','Rua Padre Ferraz','543','Itapira','SP',NULL);
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franquia`
--

DROP TABLE IF EXISTS `franquia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `franquia` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) NOT NULL,
  `ID_ENDERECO` int NOT NULL,
  `ID_CONTATO` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_ENDERECO_idx` (`ID_ENDERECO`),
  KEY `ID_CONTATO_FRANQUIA_idx` (`ID_CONTATO`),
  CONSTRAINT `ID_CONTATO_FRANQUIA` FOREIGN KEY (`ID_CONTATO`) REFERENCES `contato` (`ID`),
  CONSTRAINT `ID_ENDERECO_FRANQUIA` FOREIGN KEY (`ID_ENDERECO`) REFERENCES `enderecos` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franquia`
--

LOCK TABLES `franquia` WRITE;
/*!40000 ALTER TABLE `franquia` DISABLE KEYS */;
INSERT INTO `franquia` VALUES (1,'CARLOCA UBATUBA',2,2),(2,'CARLOCA ITAPIRA',3,3);
/*!40000 ALTER TABLE `franquia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_locacao`
--

DROP TABLE IF EXISTS `historico_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_locacao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_DEVOLUCAO` int NOT NULL,
  `STATUS_LOCACAO` enum('EM ABERTO','CONCLUIDA','CANCELADA') NOT NULL,
  `KM_PERCORRIDA` int NOT NULL,
  `VALOR_TOTAL` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_DEVOLUCAO_idx` (`ID_DEVOLUCAO`),
  CONSTRAINT `ID_DEVOLUCAO` FOREIGN KEY (`ID_DEVOLUCAO`) REFERENCES `devolucao` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_locacao`
--

LOCK TABLES `historico_locacao` WRITE;
/*!40000 ALTER TABLE `historico_locacao` DISABLE KEYS */;
INSERT INTO `historico_locacao` VALUES (1,1,'CONCLUIDA',1000,500);
/*!40000 ALTER TABLE `historico_locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locacao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` int NOT NULL,
  `ID_CARRO` int NOT NULL,
  `ID_FRANQUIA_RETIRADA` int NOT NULL,
  `DATA_RETIRADA` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_CARRO_LOC_idx` (`ID_CARRO`),
  KEY `ID_FRANQUIA_LOC_idx` (`ID_FRANQUIA_RETIRADA`),
  KEY `ID_CLIENTE_LOC_idx` (`ID_CLIENTE`),
  CONSTRAINT `ID_CARRO_LOC` FOREIGN KEY (`ID_CARRO`) REFERENCES `carros` (`ID`),
  CONSTRAINT `ID_CLIENTE_LOC` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID`),
  CONSTRAINT `ID_FRANQUIA_LOC` FOREIGN KEY (`ID_FRANQUIA_RETIRADA`) REFERENCES `franquia` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
INSERT INTO `locacao` VALUES (1,1,1,1,'2022-12-12');
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_MONTADORA` int NOT NULL,
  `MODELO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_MONTADORA_idx` (`ID_MONTADORA`),
  CONSTRAINT `ID_MONTADORA` FOREIGN KEY (`ID_MONTADORA`) REFERENCES `montadora` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,1,'GOL'),(2,2,'ONIX'),(3,3,'CIVIC'),(4,4,'TUCSON'),(5,5,'COROLLA'),(6,6,'UNO'),(7,7,'KA');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `montadora`
--

DROP TABLE IF EXISTS `montadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `montadora` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MONTADORA` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montadora`
--

LOCK TABLES `montadora` WRITE;
/*!40000 ALTER TABLE `montadora` DISABLE KEYS */;
INSERT INTO `montadora` VALUES (1,'VOLKSWAGEN'),(2,'CHEVROLET'),(3,'HONDA'),(4,'HYUNDAI'),(5,'TOYOTA'),(6,'FIAT'),(7,'FORD');
/*!40000 ALTER TABLE `montadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versao`
--

DROP TABLE IF EXISTS `versao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versao` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_MODELO` int NOT NULL,
  `VERSAO` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_MODELO_idx` (`ID_MODELO`),
  CONSTRAINT `ID_MODELO` FOREIGN KEY (`ID_MODELO`) REFERENCES `modelo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versao`
--

LOCK TABLES `versao` WRITE;
/*!40000 ALTER TABLE `versao` DISABLE KEYS */;
INSERT INTO `versao` VALUES (1,1,'LAST EDITION'),(2,1,'G8'),(3,2,'LT TURBO MT'),(4,2,'RS AT');
/*!40000 ALTER TABLE `versao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'carloca'
--

--
-- Dumping routines for database 'carloca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-24 23:03:55
