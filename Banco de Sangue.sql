-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: trabalho
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Current Database: `trabalho`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `trabalho` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `trabalho`;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `IDDoacao` int DEFAULT NULL,
  `IDMedico` int NOT NULL,
  `DataConsulta` date DEFAULT NULL,
  `HoraConsulta` time DEFAULT NULL,
  `Diagnostico` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IDMedico`),
  KEY `FK_DOACAO` (`IDDoacao`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`IDDoacao`) REFERENCES `doacao` (`IDDoacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doacao`
--

DROP TABLE IF EXISTS `doacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doacao` (
  `IDDoacao` int NOT NULL AUTO_INCREMENT,
  `IDDoador` int NOT NULL,
  `DataDoacao` date DEFAULT NULL,
  `HoraDoacao` time DEFAULT NULL,
  `IDFuncionario` int DEFAULT NULL,
  PRIMARY KEY (`IDDoacao`,`IDDoador`),
  KEY `FK_DOADOR` (`IDDoador`),
  KEY `FK_FUNCIONARIO` (`IDFuncionario`),
  CONSTRAINT `doacao_ibfk_1` FOREIGN KEY (`IDDoador`) REFERENCES `doador` (`IDDoador`),
  CONSTRAINT `doacao_ibfk_2` FOREIGN KEY (`IDFuncionario`) REFERENCES `funcionario` (`IDFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doacao`
--

LOCK TABLES `doacao` WRITE;
/*!40000 ALTER TABLE `doacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `doacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doador`
--

DROP TABLE IF EXISTS `doador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doador` (
  `IDDoador` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `CPF` int DEFAULT NULL,
  `RG` int DEFAULT NULL,
  `TipoSanguineo` varchar(2) DEFAULT NULL,
  `FatorRH` varchar(8) DEFAULT NULL,
  `NomePai` varchar(200) DEFAULT NULL,
  `NomeMae` varchar(200) DEFAULT NULL,
  `Telefone` int DEFAULT NULL,
  `Celular` int DEFAULT NULL,
  `Sexo` varchar(9) DEFAULT NULL,
  `IDEndereco` int DEFAULT NULL,
  `NroEndereco` int DEFAULT NULL,
  PRIMARY KEY (`IDDoador`),
  KEY `FK_ENDERECO` (`IDEndereco`),
  CONSTRAINT `doador_ibfk_1` FOREIGN KEY (`IDEndereco`) REFERENCES `endereco` (`IDEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doador`
--

LOCK TABLES `doador` WRITE;
/*!40000 ALTER TABLE `doador` DISABLE KEYS */;
/*!40000 ALTER TABLE `doador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `IDEndereco` int NOT NULL AUTO_INCREMENT,
  `CEP` int DEFAULT NULL,
  `Rua` varchar(100) DEFAULT NULL,
  `Bairro` varchar(100) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `UF` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade` (
  `IDEspecialidade` int NOT NULL,
  `Nome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IDEspecialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exame_doacao`
--

DROP TABLE IF EXISTS `exame_doacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exame_doacao` (
  `IDExameDoacao` int NOT NULL,
  `Nome` varchar(200) DEFAULT NULL,
  `ValorBaseInferior` int DEFAULT NULL,
  `ValorBaseSuperior` int DEFAULT NULL,
  PRIMARY KEY (`IDExameDoacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exame_doacao`
--

LOCK TABLES `exame_doacao` WRITE;
/*!40000 ALTER TABLE `exame_doacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `exame_doacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exame_triagem`
--

DROP TABLE IF EXISTS `exame_triagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exame_triagem` (
  `IDExameTriagem` int NOT NULL,
  `Nome` varchar(200) DEFAULT NULL,
  `ValorBaseInferior` int DEFAULT NULL,
  `ValorBaseSuperior` int DEFAULT NULL,
  PRIMARY KEY (`IDExameTriagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exame_triagem`
--

LOCK TABLES `exame_triagem` WRITE;
/*!40000 ALTER TABLE `exame_triagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `exame_triagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `IDFuncionario` int NOT NULL,
  `Nome` varchar(200) DEFAULT NULL,
  `DataNascimento` date DEFAULT NULL,
  `CPF` int DEFAULT NULL,
  `RG` int DEFAULT NULL,
  `IDEndereco` int DEFAULT NULL,
  `IDEspecialidade` int DEFAULT NULL,
  `NroRegistro` int DEFAULT NULL,
  PRIMARY KEY (`IDFuncionario`),
  KEY `FK_ENDERECO` (`IDEndereco`),
  KEY `FK_ESPECIALIDADE` (`IDEspecialidade`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`IDEndereco`) REFERENCES `endereco` (`IDEndereco`),
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`IDEspecialidade`) REFERENCES `especialidade` (`IDEspecialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado_doacao`
--

DROP TABLE IF EXISTS `resultado_doacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_doacao` (
  `IDResultadoDoacao` int DEFAULT NULL,
  `IDExameDoacao` int DEFAULT NULL,
  `IDDoacao` int NOT NULL,
  `IDFuncionario` int DEFAULT NULL,
  `DataAnalise` date DEFAULT NULL,
  `HoraAnalise` time DEFAULT NULL,
  `Resultado` varchar(200) DEFAULT NULL,
  `DescrDiagnostico` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IDDoacao`),
  KEY `FK_EXAME_DOACAO` (`IDExameDoacao`),
  KEY `FK_FUNCIONARIO` (`IDFuncionario`),
  CONSTRAINT `resultado_doacao_ibfk_1` FOREIGN KEY (`IDExameDoacao`) REFERENCES `exame_doacao` (`IDExameDoacao`),
  CONSTRAINT `resultado_doacao_ibfk_2` FOREIGN KEY (`IDDoacao`) REFERENCES `doacao` (`IDDoacao`),
  CONSTRAINT `resultado_doacao_ibfk_3` FOREIGN KEY (`IDFuncionario`) REFERENCES `funcionario` (`IDFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_doacao`
--

LOCK TABLES `resultado_doacao` WRITE;
/*!40000 ALTER TABLE `resultado_doacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado_doacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado_triagem`
--

DROP TABLE IF EXISTS `resultado_triagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_triagem` (
  `IDResultadoTriagem` int NOT NULL,
  `IDExameTriagem` int NOT NULL,
  `IDDoacao` int NOT NULL,
  `IDFuncionario` int DEFAULT NULL,
  `DataAnalise` date DEFAULT NULL,
  `HoraAnalise` time DEFAULT NULL,
  `Resultado` varchar(200) DEFAULT NULL,
  `DescrDiagnostico` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IDResultadoTriagem`,`IDExameTriagem`,`IDDoacao`),
  KEY `FK_EXAME_TRIAGEM` (`IDExameTriagem`),
  KEY `FK_DOACAO` (`IDDoacao`),
  KEY `FK_FUNCIONARIO` (`IDFuncionario`),
  CONSTRAINT `resultado_triagem_ibfk_1` FOREIGN KEY (`IDExameTriagem`) REFERENCES `exame_triagem` (`IDExameTriagem`),
  CONSTRAINT `resultado_triagem_ibfk_2` FOREIGN KEY (`IDDoacao`) REFERENCES `doacao` (`IDDoacao`),
  CONSTRAINT `resultado_triagem_ibfk_3` FOREIGN KEY (`IDFuncionario`) REFERENCES `funcionario` (`IDFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_triagem`
--

LOCK TABLES `resultado_triagem` WRITE;
/*!40000 ALTER TABLE `resultado_triagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado_triagem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-31 14:43:58
