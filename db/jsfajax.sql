-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.51-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema jsfajax
--

CREATE DATABASE IF NOT EXISTS jsfajax;
USE jsfajax;

--
-- Definition of table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `id_departamento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_departamento` varchar(45) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departamento`
--

/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`id_departamento`,`nome_departamento`) VALUES 
 (1,'Formacao'),
 (2,'Higiene e Limpeza'),
 (3,'Recursos Humanos'),
 (4,'Comunicacao e Imagem');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;


--
-- Definition of table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `id_funcionario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_funcionario` varchar(45) NOT NULL,
  `sobrenome_funcionario` varchar(45) NOT NULL,
  `salario_funcionario` double NOT NULL,
  `id_departamento` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `FK_funcionario_departamento` (`id_departamento`),
  CONSTRAINT `FK_funcionario_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `funcionario`
--

/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;


--
-- Definition of table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `releaseyear` char(4) NOT NULL,
  `genre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`,`title`,`releaseyear`,`genre`) VALUES 
 (1,'The Godfather','1972','Drama'),
 (2,'The Shawshank Redemption','1994','Drama'),
 (3,'The Godfather: Part II','1974','Drama'),
 (4,'The Lord of the Rings: The Return of the King','2003','Fantasy'),
 (5,'The Lord of the Rings: The Two Towers','2002','Fantasy'),
 (6,'Shindler\'s List','1998','Drama'),
 (7,'Shichinin no samurai','1954','Action'),
 (8,'Casablanca','1942','Drama'),
 (9,'The Lord of the Rings: The Fellowship of the Ring','2001','Fantasy'),
 (10,'Star Wars','1977','Sci-Fi'),
 (11,'Citizen Kane','1941','Mystery'),
 (12,'One Flew Over the Cuckoo\'s Nest','1975','Drama'),
 (13,'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb','1964','Comedy'),
 (14,'Rear Window','1954','Thriller'),
 (15,'Star Wars: Episode V - The Empire Strikes Back','1980','Sci-Fi'),
 (16,'Raiders of the Lost Ark','1981','Action'),
 (17,'The Usual Suspects','1995','Mystery'),
 (18,'Pulp Fiction','1994','Crime'),
 (19,'Memento','2000','Mystery'),
 (20,'The Shutter Island','2010','Mystery');
INSERT INTO `item` (`id`,`title`,`releaseyear`,`genre`) VALUES 
 (21,'American Pie','1999','Comedy'),
 (22,'The Battlefiled Earth','2000','Sci-Fi'),
 (23,'The Nest','2002','Action'),
 (24,'Scary Movie','2005','Comedy'),
 (25,'State Of Play','2009','Mystery'),
 (26,'Behind Enemy Lines','2001','Action'),
 (27,'Live Flesh','1997','Drama'),
 (28,'Shanghai','2010','Mystery'),
 (29,'Almost Famous','2000','Drama'),
 (30,'Home Alone','1990','Comedy'),
 (31,'The Mystic River','2002','Drama'),
 (32,'Peacemaker','1990','Sci-Fi'),
 (33,'The Hangover','2009','Comedy'),
 (34,'Shrek Forever After','2010','Fantasy');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
