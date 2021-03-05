-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cvm
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0(Disable), 1(Enable)',
  `id_user` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `address_id_user` (`id_user`),
  CONSTRAINT `address_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,1,'ANTETEZANAFOVOANY','2021-02-21 15:07:55','2021-02-21 15:07:55'),(2,1,1,'BERAVINA','2021-02-21 15:08:22','2021-02-21 15:08:22');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_lang`
--

DROP TABLE IF EXISTS `address_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_lang` (
  `id_address` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `value` varchar(256) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_address`,`id_lang`),
  KEY `address_lang_id_lang` (`id_lang`),
  CONSTRAINT `address_lang_id_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `address_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_lang`
--

LOCK TABLES `address_lang` WRITE;
/*!40000 ALTER TABLE `address_lang` DISABLE KEYS */;
INSERT INTO `address_lang` VALUES (1,1,'Lot 120M L Antentezanafovoany, Tananarive, Madagascar FR','2021-02-21 15:23:29','2021-02-21 15:23:29'),(1,2,'Lot 120M L Antentezanafovoany, Tananarive, Madagascar EN','2021-02-21 15:23:29','2021-02-21 15:23:29'),(2,1,'Lot 3305C/BA, Beravina Fianarantsoa, Madagascar FR','2021-02-21 15:23:52','2021-02-21 15:23:52'),(2,2,'Lot 3305C/BA, Beravina Fianarantsoa, Madagascar EN','2021-02-21 15:23:52','2021-02-21 15:23:52');
/*!40000 ALTER TABLE `address_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'ETECH','2021-02-18 20:06:56','2021-02-18 20:06:56'),(2,'FREELANCE','2021-02-18 20:07:27','2021-02-18 20:07:27');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies_lang`
--

DROP TABLE IF EXISTS `companies_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_lang` (
  `id_company` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_company`,`id_lang`),
  KEY `companies_lang_id_lang` (`id_lang`),
  CONSTRAINT `companies_lang_id_company` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `companies_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies_lang`
--

LOCK TABLES `companies_lang` WRITE;
/*!40000 ALTER TABLE `companies_lang` DISABLE KEYS */;
INSERT INTO `companies_lang` VALUES (1,1,'eTech Consulting - Groupe ArkeUp','eTech Consulting - Groupe ArkeUp','2021-02-21 16:57:50','2021-02-21 16:57:50'),(1,2,'eTech Consulting - ArkeUp Group','eTech Consulting - ArkeUp Group desc','2021-02-27 21:45:22','2021-02-27 21:45:22'),(2,1,'Independant','Independant','2021-02-21 16:59:18','2021-02-21 16:59:18'),(2,2,'Independent','Independent desc','2021-02-27 21:45:22','2021-02-27 21:45:22');
/*!40000 ALTER TABLE `companies_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_positions`
--

DROP TABLE IF EXISTS `company_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Positions for any companies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_positions`
--

LOCK TABLES `company_positions` WRITE;
/*!40000 ALTER TABLE `company_positions` DISABLE KEYS */;
INSERT INTO `company_positions` VALUES (1,'dev-internship','2021-02-24 18:49:13','2021-02-24 18:49:01'),(2,'dev-junior','2021-02-26 16:47:35','2021-02-26 16:47:35'),(3,'dev-confirmed','2021-02-27 08:50:00','2021-02-27 08:50:34'),(4,'dev-senior','2021-02-27 08:50:01','2021-02-27 08:50:01'),(5,'dev-lead','2021-03-05 13:29:49','2021-03-05 13:29:49');
/*!40000 ALTER TABLE `company_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_positions_lang`
--

DROP TABLE IF EXISTS `company_positions_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_positions_lang` (
  `id_company_positions` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_company_positions`,`id_lang`),
  KEY `company_positions_lang.id_lang` (`id_lang`),
  CONSTRAINT `company_positions_lang.id_company_positions` FOREIGN KEY (`id_company_positions`) REFERENCES `company_positions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `company_positions_lang.id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_positions_lang`
--

LOCK TABLES `company_positions_lang` WRITE;
/*!40000 ALTER TABLE `company_positions_lang` DISABLE KEYS */;
INSERT INTO `company_positions_lang` VALUES (1,1,'Stagiaire Developpeur','Stagiaire Developpeur desc'),(1,2,'Developer Internship','Developer Internship desc'),(2,1,'D├⌐veloppeur Junior','D├⌐veloppeur Junior Descr'),(2,2,'Junior Developer','Junior Developer'),(3,1,'Developpeur Confirm├⌐','Developpeur Confirm├⌐ desc'),(3,2,'Confirmed Developer','Confirmed Developer desc'),(4,1,'Developpeur Senior','Developpeur Senior desc'),(4,2,'Senior Developer','Senior Developer desc'),(5,1,'Lead Developpeur','Lead Developpeur desc'),(5,2,'Lead Developer','Lead Developer desc');
/*!40000 ALTER TABLE `company_positions_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv`
--

DROP TABLE IF EXISTS `cv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_template` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `id_address` int(11) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cv.id_address` (`id_address`),
  KEY `cv.id_template` (`id_template`),
  KEY `cv.id_user` (`id_user`),
  CONSTRAINT `cv.id_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cv.id_template` FOREIGN KEY (`id_template`) REFERENCES `templates` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `cv.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv`
--

LOCK TABLES `cv` WRITE;
/*!40000 ALTER TABLE `cv` DISABLE KEYS */;
INSERT INTO `cv` VALUES (1,1,1,'LEAD_TECHNICAL',1,'2021-02-18 20:01:36','2021-02-18 20:01:36'),(2,1,1,'DEV_PRESTASHOP',1,'2021-02-18 20:08:12','2021-02-18 20:08:12'),(3,1,1,'DEV_SYMFONY',1,'2021-02-18 20:08:37','2021-02-18 20:08:37'),(4,1,1,'DEV_LARAVEL',1,'2021-02-18 20:09:10','2021-02-18 20:09:10'),(5,1,1,'DEV_ECOMMERCE',1,'2021-02-18 20:09:22','2021-02-18 20:09:22'),(6,1,1,'DEV_BACKEND',1,'2021-02-18 20:09:41','2021-02-18 20:09:41'),(7,1,1,'DEV_FULLSTACK',1,'2021-02-18 20:09:53','2021-02-18 20:09:53');
/*!40000 ALTER TABLE `cv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_educations`
--

DROP TABLE IF EXISTS `cv_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_educations` (
  `id_cv` int(11) NOT NULL,
  `id_education` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_education`),
  KEY `cv_educations.id_education` (`id_education`) USING BTREE,
  CONSTRAINT `cv_educations.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cv_educations.id_education` FOREIGN KEY (`id_education`) REFERENCES `part_educations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_educations`
--

LOCK TABLES `cv_educations` WRITE;
/*!40000 ALTER TABLE `cv_educations` DISABLE KEYS */;
INSERT INTO `cv_educations` VALUES (1,1,'2021-02-22 15:15:35','2021-02-22 15:15:35'),(1,2,'2021-02-22 17:58:25','2021-02-22 17:58:25');
/*!40000 ALTER TABLE `cv_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_experiences`
--

DROP TABLE IF EXISTS `cv_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_experiences` (
  `id_cv` int(11) NOT NULL,
  `id_experience` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_experience`),
  KEY `cv_experiences.id_experience` (`id_experience`),
  CONSTRAINT `cv_experiences.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cv_experiences.id_experience` FOREIGN KEY (`id_experience`) REFERENCES `part_experiences` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_experiences`
--

LOCK TABLES `cv_experiences` WRITE;
/*!40000 ALTER TABLE `cv_experiences` DISABLE KEYS */;
INSERT INTO `cv_experiences` VALUES (1,1,'2021-02-24 18:54:28','2021-02-24 18:54:28'),(1,2,'2021-02-26 16:53:35','2021-02-26 16:53:35'),(1,3,'2021-02-27 10:09:40','2021-02-27 10:09:40'),(1,4,'2021-03-05 13:40:40','2021-03-05 13:40:40'),(1,5,'2021-03-05 13:56:59','2021-03-05 13:56:59'),(1,6,'2021-03-05 13:56:59','2021-03-05 13:56:59');
/*!40000 ALTER TABLE `cv_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_lang`
--

DROP TABLE IF EXISTS `cv_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_lang` (
  `id_cv` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title_backend` varchar(256) NOT NULL,
  `title_frontend` varchar(256) NOT NULL,
  `auto_biography` varchar(1024) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_lang`),
  KEY `cv_lang_id_lang` (`id_lang`),
  CONSTRAINT `cv_lang_id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cv_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_lang`
--

LOCK TABLES `cv_lang` WRITE;
/*!40000 ALTER TABLE `cv_lang` DISABLE KEYS */;
INSERT INTO `cv_lang` VALUES (1,1,'CV Lead Technique','Lead Technique','Ayant 4 ans d\'exp├⌐rience en d├⌐veloppement de logiciels professionnels dans les domaines des applications multiniveaux utilisant les technologies Java, J2EE comme les servlets, JSP, Struts, JDBC, Hibernate, XML et Oracle PL / SQL.\r\nmanaging people, itΓÇÖs also managing projects, and managing a crisis','2021-02-21 17:09:57','2021-02-21 17:09:57'),(1,2,'CV Technical Lead','Technical Lead','Having 4 years of strong professional software development experience in the areas of Multi-tier applications using Java, J2EE technologies like Servlets, JSP, Struts, JDBC, Hibernate, XML and Oracle PL/SQL.','2021-02-21 17:09:57','2021-02-21 17:09:57'),(2,1,'CV Prestashop Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR','2021-02-21 17:45:34','2021-02-21 17:45:34'),(3,1,'CV Symfony Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR','2021-02-21 17:48:27','2021-02-21 17:48:27'),(4,1,'CV Laravel Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR','2021-02-21 17:48:42','2021-02-21 17:48:42'),(5,1,'CV eCommerce Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR','2021-02-21 17:48:54','2021-02-21 17:48:54'),(6,1,'CV Backend Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR','2021-02-21 17:49:07','2021-02-21 17:49:07'),(7,1,'CV Fullstack Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR','2021-02-21 17:49:20','2021-02-21 17:49:20');
/*!40000 ALTER TABLE `cv_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_projects`
--

DROP TABLE IF EXISTS `cv_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_projects` (
  `id_cv` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_project`),
  KEY `cv_projects.id_project` (`id_project`),
  CONSTRAINT `cv_projects.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cv_projects.id_project` FOREIGN KEY (`id_project`) REFERENCES `part_projects` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_projects`
--

LOCK TABLES `cv_projects` WRITE;
/*!40000 ALTER TABLE `cv_projects` DISABLE KEYS */;
INSERT INTO `cv_projects` VALUES (1,1,'2021-02-28 09:25:08','2021-02-28 09:25:08');
/*!40000 ALTER TABLE `cv_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_skills`
--

DROP TABLE IF EXISTS `cv_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_skills` (
  `id_cv` int(11) NOT NULL,
  `id_skills` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_skills`),
  KEY `cv_skills.id_skills` (`id_skills`),
  CONSTRAINT `cv_skills.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cv_skills.id_skills` FOREIGN KEY (`id_skills`) REFERENCES `part_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_skills`
--

LOCK TABLES `cv_skills` WRITE;
/*!40000 ALTER TABLE `cv_skills` DISABLE KEYS */;
INSERT INTO `cv_skills` VALUES (1,1,'2021-02-23 21:18:29','2021-02-23 21:18:29'),(1,2,'2021-02-24 13:46:05','2021-02-24 13:46:05'),(1,3,'2021-02-24 15:26:16','2021-02-24 15:26:16'),(1,4,'2021-02-28 12:35:55','2021-02-28 12:35:55'),(1,5,'2021-02-28 14:07:08','2021-02-28 14:07:08'),(1,6,'2021-02-28 14:36:59','2021-02-28 14:36:59'),(1,7,'2021-02-28 15:13:41','2021-02-28 15:13:41'),(1,8,'2021-02-28 15:23:10','2021-02-28 15:23:10'),(1,9,'2021-02-28 15:25:07','2021-02-28 15:25:07'),(1,10,'2021-03-02 18:58:38','2021-03-02 18:58:38'),(1,11,'2021-03-02 18:58:38','2021-03-02 18:58:38');
/*!40000 ALTER TABLE `cv_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_iso` varchar(6) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_iso` (`code_iso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'FR','2021-02-21 15:17:49','2021-02-21 15:17:49'),(2,'EN','2021-02-21 15:17:57','2021-02-21 15:17:57'),(3,'DE','2021-02-21 15:18:09','2021-02-21 15:18:09');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages_lang`
--

DROP TABLE IF EXISTS `languages_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages_lang` (
  `id_lang` int(11) NOT NULL,
  `id_lang_translate` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_lang`,`id_lang_translate`),
  KEY `languages_lang.id_lang_translate` (`id_lang_translate`),
  CONSTRAINT `languages_lang.id_lang_translate` FOREIGN KEY (`id_lang_translate`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `languages_langid_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages_lang`
--

LOCK TABLES `languages_lang` WRITE;
/*!40000 ALTER TABLE `languages_lang` DISABLE KEYS */;
INSERT INTO `languages_lang` VALUES (1,1,'Francais'),(1,2,'French'),(2,1,'Anglais'),(2,2,'English');
/*!40000 ALTER TABLE `languages_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_educations`
--

DROP TABLE IF EXISTS `part_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_educations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `part_educations.id_user` (`id_user`),
  CONSTRAINT `part_educations.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_educations`
--

LOCK TABLES `part_educations` WRITE;
/*!40000 ALTER TABLE `part_educations` DISABLE KEYS */;
INSERT INTO `part_educations` VALUES (1,1,'ENI_LICENCE','2012-01-11','2016-06-22','2021-02-22 14:37:34','2021-02-22 14:37:34'),(2,1,'ENI_MASTER','2014-09-15','2016-02-05','2021-02-22 17:57:22','2021-02-22 17:57:22');
/*!40000 ALTER TABLE `part_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_educations_lang`
--

DROP TABLE IF EXISTS `part_educations_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_educations_lang` (
  `id_part_educations` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(512) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_part_educations`,`id_lang`),
  KEY `part_educations_lang_id_lang` (`id_lang`),
  CONSTRAINT `part_educations_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_educations_lang_id_part_educations` FOREIGN KEY (`id_part_educations`) REFERENCES `part_educations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_educations_lang`
--

LOCK TABLES `part_educations_lang` WRITE;
/*!40000 ALTER TABLE `part_educations_lang` DISABLE KEYS */;
INSERT INTO `part_educations_lang` VALUES (1,1,'Ecole Nationale de l\'Informatique, Madagascar','Licence en Science Informatique','2021-02-22 14:38:19','2021-02-22 14:38:19'),(1,2,'National School of Computer Science, Madagascar','Bachelor of Computer Science','2021-02-22 14:38:19','2021-02-22 14:38:19'),(2,1,'Ecole Nationale de l\'Informatique, Madagascar','Master en Science Informatique','2021-02-22 17:57:48','2021-02-22 17:57:48'),(2,2,'National School of Computer Science, Madagascar','Master in Computer Science','2021-02-22 17:57:48','2021-02-22 17:57:48');
/*!40000 ALTER TABLE `part_educations_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_experiences`
--

DROP TABLE IF EXISTS `part_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `id_company_position` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `date_begin` date NOT NULL COMMENT 'Date of entry into the company',
  `date_end` date NOT NULL COMMENT 'Date of leave from the company',
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user-id_company-id_company_position` (`id_user`,`id_company`,`id_company_position`) USING BTREE,
  KEY `part_experiences.id_company` (`id_company`),
  KEY `part_experiences.id_company_position` (`id_company_position`),
  CONSTRAINT `part_experiences.id_company` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_experiences.id_company_position` FOREIGN KEY (`id_company_position`) REFERENCES `company_positions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_experiences.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='User presence in the company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_experiences`
--

LOCK TABLES `part_experiences` WRITE;
/*!40000 ALTER TABLE `part_experiences` DISABLE KEYS */;
INSERT INTO `part_experiences` VALUES (1,1,1,1,'etech-dev-intern','2016-06-08','2016-12-08','2021-02-24 18:49:44','2021-02-24 18:49:44'),(2,1,1,2,'etech-dev-junior','2016-12-09','2017-04-24','2021-02-26 16:50:57','2021-02-26 16:50:57'),(3,1,2,4,'freelance-artizeo-dev-senior','2020-06-02','2021-02-05','2021-02-27 10:05:15','2021-02-27 10:05:15'),(4,1,1,5,'etech-dev-lead','2019-04-02','2020-06-02','2021-03-05 13:38:56','2021-03-05 13:38:56'),(5,1,1,3,'etech-dev-confirmed','2017-04-02','2018-04-02','2021-03-05 13:48:38','2021-03-05 13:48:38'),(6,1,1,4,'etech-dev-senior','2018-04-02','2019-04-02','2021-03-05 13:48:39','2021-03-05 13:48:39');
/*!40000 ALTER TABLE `part_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_experiences_lang`
--

DROP TABLE IF EXISTS `part_experiences_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_experiences_lang` (
  `id_part_experiences` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id_part_experiences`,`id_lang`),
  KEY `part_experiences_lang.id_lang` (`id_lang`),
  CONSTRAINT `part_experiences_lang.id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_experiences_lang.id_part_experiences` FOREIGN KEY (`id_part_experiences`) REFERENCES `part_experiences` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_experiences_lang`
--

LOCK TABLES `part_experiences_lang` WRITE;
/*!40000 ALTER TABLE `part_experiences_lang` DISABLE KEYS */;
INSERT INTO `part_experiences_lang` VALUES (1,1,'Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere FR'),(1,2,'Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere EN'),(2,1,'Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere FR'),(2,2,'Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere EN'),(3,1,'<ul>\r\n<li> ├ëtablit d\'excellentes relations de travail avec le personnel \"Marketing\" et \"RD & amp; E\" </li>\r\n<li> Est un \"excellent auditeur\" avec son manager, ses coll├¿gues, ses pairs et ses clients </li>\r\n<li> Travaille en ├⌐troite collaboration & amp; collabore bien avec le Sr. Tech Lead - South Rockies & amp; le Rocky Mt. Responsable technique r├⌐gional </li>\r\n<li> Conduit / guide les \"Projets & amp; Travail de type RFP\" jusqu\'├á leur ach├¿vement - ├á temps / ├á chaque fois </li>\r\n<li> Un excellent \"communicateur QUOTIDIEN\" - pour les ventes, les clients, les repr├⌐sentants techniques, les pairs et amp; Gestionnaire </li>\r\n<li> Hi├⌐rarchisation des projets et / ou des travaux de type RFP dans les Rocheuses du Sud avec les ventes, les clients et amp; Repr├⌐sentants techniques - dirigez efficacement le trafic </li>\r\n<li> Conduit des \"feuilles de calcul de valeur\" hebdomadaires / trimestrielles ├á l\'ach├¿vement et ├á la visibilit├⌐ de l\'├⌐quipe de gestion des ventes dans la r├⌐gion </li>\r\n</ul>'),(3,2,'<ul>\r\n<li>Establishes excellent working relationships with both \"Marketing\" and \"RD &amp; E\" Personal</li>\r\n<li>Is an \"Excellent Listener\" with manager, co-workers, peers, and customers</li>\r\n<li>Works closely &amp; collaborates well with the Sr. Tech Lead - South Rockies &amp; the Rocky Mt. Regional Technical Manager</li>\r\n<li>Drives/Guides \"Projects &amp; RFP Type Work\" to completion - on time/every time</li>\r\n<li>An excellent \"DAILY Communicator\" - to Sales, Customers, Tech Reps, Peers, &amp; Manager</li>\r\n<li>Prioritization of Projects and/or RFP Type Work within the Southern Rockies with Sales, Customers, &amp; Technical Reps - efficiently direct traffic</li>\r\n<li>Drives weekly/quarterly \"Value Spreadsheets\" to completion and visibility to Sales Management Team in the Region</li>\r\n</ul>'),(4,1,'desc fr'),(4,2,'desc en'),(5,1,'desc fr'),(5,2,'desc en'),(6,1,'<p>Conception, estimation, d&eacute;veloppement et d&eacute;ploiement des applications utilisant Symfony 3+, Laravel 5+, Angular 2+, Prestashop 1.5+, Wordpress, React.js. </p>\n<p>Conduite et pilotage de projet, mise en place de bonne pratique.</p>'),(6,2,'<p>Design, estimation, development and deployment of applications using Symfony 3+, Laravel 5+, Angular 2+, Prestashop 1.5+, Wordpress, React.js.</p>\n<p>Project lead and management, implementation of good practice.</p>');
/*!40000 ALTER TABLE `part_experiences_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_projects`
--

DROP TABLE IF EXISTS `part_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `show_in_portfolio` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0|1',
  `url_access` varchar(256) DEFAULT NULL,
  `url_preview` varchar(256) DEFAULT NULL,
  `date_begin` date DEFAULT NULL COMMENT 'Date of you begin the project (in the past)',
  `date_end` date DEFAULT NULL COMMENT 'Date of you end the project (in the past). If null, you are in the project actually',
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `part_projects.company_id` (`company_id`),
  KEY `part_projects.id_user` (`id_user`),
  CONSTRAINT `part_projects.company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `part_projects.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_projects`
--

LOCK TABLES `part_projects` WRITE;
/*!40000 ALTER TABLE `part_projects` DISABLE KEYS */;
INSERT INTO `part_projects` VALUES (1,2,1,'PRB-API',1,NULL,NULL,NULL,NULL,'2021-02-28 09:16:58','2021-02-28 09:16:58');
/*!40000 ALTER TABLE `part_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_projects_lang`
--

DROP TABLE IF EXISTS `part_projects_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_projects_lang` (
  `id_part_projects` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_part_projects`,`id_lang`),
  KEY `part_projects_lang_id_lang` (`id_lang`),
  CONSTRAINT `part_projects_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_projects_lang_id_part_projects` FOREIGN KEY (`id_part_projects`) REFERENCES `part_projects` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_projects_lang`
--

LOCK TABLES `part_projects_lang` WRITE;
/*!40000 ALTER TABLE `part_projects_lang` DISABLE KEYS */;
INSERT INTO `part_projects_lang` VALUES (1,1,'PRB - API reliant un site ecommerce prestashop et un base de donn&eacute;e des fournisseur ','<p>Contexte:</p>\r\n<ul>\r\n<li>Partie IHM : HTML5, CSS3, jQuery</li>\r\n<li>Base de donn&eacute;es : MySql</li>\r\n<li>Framework : Prestashop / Laravel</li>\r\n<li>Gestion de codes sources avec Git (Clone/Branch/Pull/Merge/Gestion conflit)</li>\r\n<li>Mise en place de services web</li>\r\n<li>D&eacute;veloppement de plugin</li>\r\n<li>Mise en place syst&egrave;me de connecteur entre prestashop et les fournisseurs</li>\r\n</ul>\r\n<p><strong>ENVIRONNEMENT TECHNIQUE :</strong></p>\r\n<p>Prestashop, Laravel, XML, MySql, JQuery, JavaScript, Jira, Git, Confluence, API</p>','2021-02-28 09:23:13','2021-02-28 09:23:13'),(1,2,'PRB - API connecting a prestashop ecommerce site and a supplier database','<p> Context: </p>\r\n<ul>\r\n<li> GUI part: HTML5, CSS3, jQuery </li>\r\n<li> Database: MySql </li>\r\n<li> Framework: Prestashop / Laravel </li>\r\n<li> Source code management with Git (Clone / Branch / Pull / Merge / Conflict management) </li>\r\n<li> Setting up web services </li>\r\n<li> Plugin development </li>\r\n<li> Establishment of a connector system between prestashop and suppliers </li>\r\n</ul>\r\n<p> <strong> TECHNICAL ENVIRONMENT: </strong> </p>\r\n<p> Prestashop, Laravel, XML, MySql, JQuery, JavaScript, Jira, Git, Confluence, API </p>','2021-02-28 09:23:13','2021-02-28 09:23:13');
/*!40000 ALTER TABLE `part_projects_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_skills`
--

DROP TABLE IF EXISTS `part_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_skills_group` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `part_skills.id_user` (`id_user`),
  KEY `part_skills.id_skills_group` (`id_skills_group`),
  CONSTRAINT `part_skills.id_skills_group` FOREIGN KEY (`id_skills_group`) REFERENCES `skills_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_skills.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_skills`
--

LOCK TABLES `part_skills` WRITE;
/*!40000 ALTER TABLE `part_skills` DISABLE KEYS */;
INSERT INTO `part_skills` VALUES (1,1,2,'PHP','2021-02-23 21:04:18','2021-02-23 21:04:18'),(2,1,2,'JS','2021-02-24 13:43:52','2021-02-24 13:43:52'),(3,1,2,'PYTHON','2021-02-24 15:24:48','2021-02-24 15:24:48'),(4,1,3,'MANAGMENT','2021-02-28 12:32:39','2021-02-28 12:32:39'),(5,1,4,'LEADERSHIP','2021-02-28 14:06:34','2021-02-28 14:06:34'),(6,1,3,'JIRA','2021-02-28 14:21:15','2021-02-28 14:21:15'),(7,1,3,'ESTIMATING','2021-02-28 15:12:34','2021-02-28 15:12:34'),(8,1,1,'AWS','2021-02-28 15:21:48','2021-02-28 15:21:48'),(9,1,1,'NODEJS','2021-02-28 15:24:25','2021-02-28 15:24:25'),(10,1,2,'JAVA','2021-03-02 18:54:47','2021-03-02 18:54:47'),(11,1,1,'SPRINGBOOT','2021-03-02 18:56:34','2021-03-02 18:56:34');
/*!40000 ALTER TABLE `part_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_skills_lang`
--

DROP TABLE IF EXISTS `part_skills_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_skills_lang` (
  `id_part_skills` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(256) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_part_skills`,`id_lang`),
  KEY `part_skills_lang_id_lang` (`id_lang`),
  CONSTRAINT `part_skills_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_skills_lang_id_part_skills` FOREIGN KEY (`id_part_skills`) REFERENCES `part_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_skills_lang`
--

LOCK TABLES `part_skills_lang` WRITE;
/*!40000 ALTER TABLE `part_skills_lang` DISABLE KEYS */;
INSERT INTO `part_skills_lang` VALUES (1,1,'PHP','PHP Desc FR','2021-02-23 21:05:46','2021-02-23 21:05:46'),(1,2,'PHP','PHP Desc EN','2021-02-23 21:05:46','2021-02-23 21:05:46'),(2,1,'Javascript','Javascript FR','2021-02-24 13:44:23','2021-02-24 13:44:23'),(2,2,'Javascript','Javascript EN','2021-02-24 13:44:23','2021-02-24 13:44:23'),(3,1,'Python','Python desc','2021-02-24 15:25:08','2021-02-24 15:25:08'),(3,2,'Python','Python desc','2021-02-24 15:25:21','2021-02-24 15:25:21'),(4,1,'Management','','2021-02-28 12:34:35','2021-02-28 12:34:35'),(4,2,'Managment','','2021-02-28 12:34:35','2021-02-28 12:34:35'),(5,1,'Leadership','','2021-02-28 14:06:55','2021-02-28 14:06:55'),(5,2,'Leadership','','2021-02-28 14:06:55','2021-02-28 14:06:55'),(6,1,'Jira','','2021-02-28 14:23:01','2021-02-28 14:23:01'),(6,2,'Jira','','2021-02-28 14:23:01','2021-02-28 14:23:01'),(7,1,'Estimation','','2021-02-28 15:13:01','2021-02-28 15:13:01'),(7,2,'Estimating','','2021-02-28 15:13:01','2021-02-28 15:13:01'),(8,1,'AWS','Amazon Web Services','2021-02-28 15:22:27','2021-02-28 15:22:27'),(8,2,'AWS','Amazon Web Services','2021-02-28 15:22:27','2021-02-28 15:22:27'),(9,1,'Node.js','','2021-02-28 15:24:54','2021-02-28 15:24:54'),(9,2,'Node.js','','2021-02-28 15:24:54','2021-02-28 15:24:54'),(10,1,'Java','Java','2021-03-02 18:55:26','2021-03-02 18:55:26'),(10,2,'Java','','2021-03-02 18:55:26','2021-03-02 18:55:26'),(11,1,'SpringBoot','','2021-03-02 18:58:01','2021-03-02 18:58:01'),(11,2,'SpringBoot','','2021-03-02 18:58:01','2021-03-02 18:58:01');
/*!40000 ALTER TABLE `part_skills_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences_users`
--

DROP TABLE IF EXISTS `preferences_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences_users` (
  `user_id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `users_preferences_template_id` (`template_id`),
  CONSTRAINT `users_preferences_template_id` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `users_preferences_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences_users`
--

LOCK TABLES `preferences_users` WRITE;
/*!40000 ALTER TABLE `preferences_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_group`
--

DROP TABLE IF EXISTS `skills_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` char(128) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_group`
--

LOCK TABLES `skills_group` WRITE;
/*!40000 ALTER TABLE `skills_group` DISABLE KEYS */;
INSERT INTO `skills_group` VALUES (1,'TECHNO_TOOLS','2021-02-23 21:35:23','2021-02-23 21:35:23'),(2,'LANGUAGES','2021-02-24 15:23:26','2021-02-24 15:23:26'),(3,'PROJECT_MANAGMENT','2021-02-28 12:29:27','2021-02-28 12:29:27'),(4,'LEADERSHIP','2021-02-28 14:05:48','2021-02-28 14:05:48');
/*!40000 ALTER TABLE `skills_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_group_lang`
--

DROP TABLE IF EXISTS `skills_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills_group_lang` (
  `id_skills_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`id_skills_group`,`id_lang`),
  KEY `skills_group_lang.id_lang` (`id_lang`),
  CONSTRAINT `skills_group_lang.id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `skills_group_lang.id_skills_group` FOREIGN KEY (`id_skills_group`) REFERENCES `skills_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_group_lang`
--

LOCK TABLES `skills_group_lang` WRITE;
/*!40000 ALTER TABLE `skills_group_lang` DISABLE KEYS */;
INSERT INTO `skills_group_lang` VALUES (1,1,'Technologies / Outils','Software Knowledge Descr FR'),(1,2,'Technologies / Tools','Software Knowledge Descr EN'),(2,1,'Langages','Langages Desc'),(2,2,'Languages','Languages desc'),(3,1,'Gestion de projet',''),(3,2,'Project Managment',''),(4,1,'Leadership','Leadership desc fr'),(4,2,'Leadership','Leadership desc en');
/*!40000 ALTER TABLE `skills_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills_level`
--

DROP TABLE IF EXISTS `skills_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_skill` int(11) NOT NULL,
  `level_per_5` tinyint(4) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`,`id_skill`),
  KEY `skills_level_id_skill` (`id_skill`),
  CONSTRAINT `skills_level_id_skill` FOREIGN KEY (`id_skill`) REFERENCES `part_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `skills_level_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_level`
--

LOCK TABLES `skills_level` WRITE;
/*!40000 ALTER TABLE `skills_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socials_link`
--

DROP TABLE IF EXISTS `socials_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socials_link` (
  `user_id` int(11) NOT NULL,
  `github_url` varchar(256) DEFAULT NULL,
  `linkedin_url` varchar(256) DEFAULT NULL,
  `skype_id` varchar(64) DEFAULT NULL,
  `website_url` varchar(256) DEFAULT NULL,
  `zoom_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `socials_link_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socials_link`
--

LOCK TABLES `socials_link` WRITE;
/*!40000 ALTER TABLE `socials_link` DISABLE KEYS */;
INSERT INTO `socials_link` VALUES (1,'https://github.com/MahefaAbel','https://www.linkedin.com/in/mahefa-abel/','mahefa.ram','http://mahefa.pro',NULL);
/*!40000 ALTER TABLE `socials_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `contents` longtext NOT NULL,
  `type` varchar(12) NOT NULL COMMENT 'Types : url, html',
  `preview_url` varchar(128) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Not yet done, ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'Simple CV, Black & White','Simple CV, Black & White','','',NULL,'2021-02-18 20:04:19','2021-02-18 20:04:19');
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `date_birth` date NOT NULL,
  `phone` varchar(19) DEFAULT NULL,
  `url_profile` varchar(256) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abelmahefa@gmail.com','Razafinirina','Mahefa Abel','1994-07-21','+261 34 84 586 05','/public/Images/Users/1-mahefa-abel.jpeg','2021-02-10 08:03:24','2021-02-10 08:03:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_lang`
--

DROP TABLE IF EXISTS `users_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_lang` (
  `id_user` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `auto_description` varchar(1024) NOT NULL,
  `auto_biography` varchar(1024) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`id_lang`),
  KEY `users_lang_id_lang` (`id_lang`),
  CONSTRAINT `users_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `users_lang_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_lang`
--

LOCK TABLES `users_lang` WRITE;
/*!40000 ALTER TABLE `users_lang` DISABLE KEYS */;
INSERT INTO `users_lang` VALUES (1,1,'Lorem lupsum Desc FR','Lorem lupsum BIO FR','2021-02-21 18:14:21','2021-02-21 18:14:21'),(1,2,'Lorem lupsum Desc EN','Lorem lupsum AutoBio EN','2021-02-23 18:38:24','2021-02-23 18:38:24');
/*!40000 ALTER TABLE `users_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-05 18:10:40
