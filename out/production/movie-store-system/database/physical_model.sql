
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


CREATE DATABASE `db_movie_store`;
USE `db_movie_store`;

DROP TABLE IF EXISTS `tb_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_clients` (
  `cli_login` varchar(30) NOT NULL DEFAULT '',
  `cli_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cli_login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `tb_clients` WRITE;
/*!40000 ALTER TABLE `tb_clients` DISABLE KEYS */;
INSERT INTO `tb_clients` VALUES ('aline','aline mariana'),('joca','jonas carmelo'),('lucas','lucas silveiro'),('phsb','phabiano');
/*!40000 ALTER TABLE `tb_clients` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tb_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_movies` (
  `mov_id` int(11) NOT NULL,
  `mov_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `tb_movies` WRITE;
/*!40000 ALTER TABLE `tb_movies` DISABLE KEYS */;
INSERT INTO `tb_movies` VALUES (1,'Titanic'),(2,'Eu sou o numero 4'),(3,'o poder do seis 6'),(4,'Veronika decide morrer'),(5,'crepusculo'),(6,'a lagoa azul'),(7,'esqueceram de mim'),(8,'velocidade maxima'),(9,'o meu primeiro amor'),(10,'coragem, o cão covarde');
/*!40000 ALTER TABLE `tb_movies` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tb_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_languages` (
  `lan_id` int(11) NOT NULL,
  `lan_name` varchar(45) NOT NULL,
  PRIMARY KEY (`lan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `tb_languages` WRITE;
/*!40000 ALTER TABLE `tb_languages` DISABLE KEYS */;
INSERT INTO `tb_languages` VALUES (1,'Português'),(2,'Inglês');
/*!40000 ALTER TABLE `tb_languages` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tb_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_purchases` (
  `pur_purchase_date` date NOT NULL DEFAULT '0000-00-00',
  `pur_return_date` date DEFAULT NULL,
  `pur_cli_login` varchar(30) NOT NULL DEFAULT '',
  `pur_uni_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pur_purchase_date`,`pur_cli_login`,`pur_uni_id`),
  KEY `pur_cli_login` (`pur_cli_login`),
  KEY `pur_uni_id` (`pur_uni_id`),
  CONSTRAINT `tb_purchases_ibfk_1` FOREIGN KEY (`pur_cli_login`) REFERENCES `tb_clients` (`cli_login`),
  CONSTRAINT `tb_purchases_ibfk_2` FOREIGN KEY (`pur_uni_id`) REFERENCES `tb_units` (`uni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `tb_purchases` WRITE;
/*!40000 ALTER TABLE `tb_purchases` DISABLE KEYS */;
INSERT INTO `tb_purchases` VALUES ('2011-12-02','2011-01-12','aline',3),('2011-12-02','2011-01-12','aline',4),('2011-12-02','2011-01-12','joca',1),('2011-12-02','2011-01-12','joca',2),('2011-12-02','2011-01-12','joca',3),('2011-12-02','2011-01-12','lucas',1),('2011-12-02','2011-01-12','phsb',1),('2011-12-02','2011-01-12','phsb',3),('2011-12-02','2011-01-12','phsb',4);
/*!40000 ALTER TABLE `tb_purchases` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tb_units_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_units_audio` (
  `aud_lan_id` int(11) NOT NULL,
  `aud_uni_id` int(11) NOT NULL,
  PRIMARY KEY (`aud_lan_id`,`aud_uni_id`),
  KEY `fk_tb_units_audio_2_idx` (`aud_uni_id`),
  CONSTRAINT `fk_tb_units_audio_1` FOREIGN KEY (`aud_lan_id`) REFERENCES `tb_languages` (`lan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_possuir_audio_2` FOREIGN KEY (`aud_uni_id`) REFERENCES `tb_units` (`uni_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `tb_units_audio` WRITE;
/*!40000 ALTER TABLE `tb_units_audio` DISABLE KEYS */;
INSERT INTO `tb_units_audio` VALUES (1,1),(2,1),(1,2),(2,3),(2,4),(1,5),(2,6),(1,7),(1,8),(2,8),(2,9),(1,10),(2,10);
/*!40000 ALTER TABLE `tb_units_audio` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tb_units_subtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_units_subtitle` (
  `sub_lan_id` int(11) NOT NULL,
  `sub_uni_id` int(11) NOT NULL,
  PRIMARY KEY (`sub_lan_id`,`sub_uni_id`),
  KEY `fk_tb_units_subtitle_2_idx` (`sub_uni_id`),
  CONSTRAINT `fk_tb_units_subtitle_1` FOREIGN KEY (`sub_lan_id`) REFERENCES `tb_languages` (`lan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_units_subtitle_2` FOREIGN KEY (`sub_uni_id`) REFERENCES `tb_units` (`uni_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `tb_units_subtitle` WRITE;
/*!40000 ALTER TABLE `tb_units_subtitle` DISABLE KEYS */;
INSERT INTO `tb_units_subtitle` VALUES (1,1),(2,1),(2,2),(1,3),(1,4),(2,5),(1,6),(2,7),(1,8),(2,8),(1,9),(1,10),(2,10);
/*!40000 ALTER TABLE `tb_units_subtitle` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tb_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_units` (
  `uni_id` int(11) NOT NULL,
  `uni_mov_id` int(11) NOT NULL,
  `uni_price` float DEFAULT NULL,
  PRIMARY KEY (`uni_id`),
  KEY `uni_mov_id` (`uni_mov_id`),
  CONSTRAINT `tb_units_ibfk_1` FOREIGN KEY (`uni_mov_id`) REFERENCES `tb_movies` (`mov_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `tb_units` WRITE;
/*!40000 ALTER TABLE `tb_units` DISABLE KEYS */;
INSERT INTO `tb_units` VALUES (1,1,2),(2,2,2.5),(3,3,2.5),(4,4,2.5),(5,5,2.5),(6,6,2.5),(7,7,2.5),(8,8,2.5),(9,9,2.5),(10,10,2.5);
/*!40000 ALTER TABLE `tb_units` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
