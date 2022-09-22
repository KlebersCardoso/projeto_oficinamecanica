CREATE DATABASE  IF NOT EXISTS `oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oficina`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------


 Table structure for table `cliente`



CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `telefone` char(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)



INSERT INTO `cliente` VALUES (1,'Murilo da Silva','Rua Margarida n. 154','11996654548'),
(2,'Roberto Novaes','Rua 15 n. 154','11996654748'),
(3,'Carlos Feliciano','Rua São Teodoro n. 154','11996655012'),
(4,'Sergio Cardoso','Rua 13 n. 154','11996654112');


 Table structure for table `laudotecnico`



CREATE TABLE `laudotecnico` (
  `idlaudotec` int NOT NULL AUTO_INCREMENT,
  `tecnicoServ` varchar(30) DEFAULT NULL,
  `servicoExec` varchar(70) DEFAULT NULL,
  `garantia` varchar(70) DEFAULT NULL,
  `valorPeca` float DEFAULT NULL,
  `maoObra` float DEFAULT NULL,
  PRIMARY KEY (`idlaudotec`)



INSERT INTO `laudotecnico` VALUES (1,'Marcio Alves','Freio','1 mes',48.5,94.5),
(2,'Fabio Feliciano','Roda','3 meses',50,90),
(3,'Luis','Pastilha','6 meses',45.5,95.4),
(4,'Kleber','Motor','1 ano',540,745.5);

 Table structure for table `mecanico`



CREATE TABLE `mecanico` (
  `idMecanico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  PRIMARY KEY (`idMecanico`)




INSERT INTO `mecanico` VALUES (1,'Oswaldo Cardoso','Rua Celso Garcia n. 145'),
(2,'Marcio Cardoso','Rua Celso Garcia n. 14'),
(3,'Kleber Cardoso','Rua Celso Garcia n. 45'),
(4,'Celso Cardoso','Rua Celso Garcia n. 10');


 Table structure for table `ordem_servico`



CREATE TABLE `ordem_servico` (
  `idmecanicoOrd` int NOT NULL,
  `idlaudoTec` int NOT NULL,
  `numero` int DEFAULT NULL,
  `dataEmissao` date DEFAULT NULL,
  `proximaRev` varchar(70) DEFAULT NULL,
  `defeitoRec` varchar(70) DEFAULT NULL,
  `valorTotal` float DEFAULT NULL,
  PRIMARY KEY (`idmecanicoOrd`,`idlaudoTec`),
  KEY `idlaudoTec` (`idlaudoTec`),
  CONSTRAINT `ordem_servico_ibfk_1` FOREIGN KEY (`idmecanicoOrd`)
 REFERENCES `mecanico` (`idMecanico`),
  CONSTRAINT `ordem_servico_ibfk_2` FOREIGN KEY (`idlaudoTec`) 
 REFERENCES `laudotecnico` (`idlaudotec`)



 Table structure for table `veiculo`



CREATE TABLE `veiculo` (
  `idclienteVeic` int NOT NULL,
  `idmecanicoVeic` int NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `chassi` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`idclienteVeic`,`idmecanicoVeic`),
  UNIQUE KEY `chassi` (`chassi`),
  UNIQUE KEY `chassi_2` (`chassi`),
  UNIQUE KEY `placa` (`placa`),
  UNIQUE KEY `ano` (`ano`),
  UNIQUE KEY `placa_2` (`placa`),
  UNIQUE KEY `placa_3` (`placa`),
  KEY `idmecanicoVeic` (`idmecanicoVeic`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`idclienteVeic`) 
  REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`idmecanicoVeic`) 
  REFERENCES `mecanico` (`idMecanico`)



INSERT INTO `veiculo` VALUES (1,1,'Corsa Sedan 1.0','GM','OIU2145',NULL,'12525425625815714'),
(2,2,'Nissan Sedan 1.0','Nissan','JHG2145',2010,'45825425625815714'),
(3,3,'Ka Sedan 1.0','Ford','DSA1415',2012,'85475425625815714'),
(4,4,'Nissan','Smart','JHG5458',2014,'45825425625815457');

 Dump completed on 2022-09-22 11:31:29
