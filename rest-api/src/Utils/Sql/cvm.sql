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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,1,'ANTETEZANAFOVOANY','2021-02-21 15:07:55','2021-02-21 15:07:55'),(2,1,1,'BERAVINA','2021-02-21 15:08:22','2021-02-21 15:08:22'),(3,1,1,'ANTANANARIVO','2021-03-12 20:45:38','2021-03-12 20:45:38');
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
INSERT INTO `address_lang` VALUES (1,1,'Lot IVM 102L Antentezanafovoany, Tananarive, Madagascar','2021-02-21 15:23:29','2021-02-21 15:23:29'),(1,2,'Lot IVM 102L Antentezanafovoany, Tananarive, Madagascar','2021-02-21 15:23:29','2021-02-21 15:23:29'),(2,1,'Lot 3305C/BA, Beravina Fianarantsoa, Madagascar','2021-02-21 15:23:52','2021-02-21 15:23:52'),(2,2,'Lot 3305C/BA, Beravina Fianarantsoa, Madagascar','2021-02-21 15:23:52','2021-02-21 15:23:52'),(3,1,'Tananarive, Madagascar','2021-03-12 20:45:59','2021-03-12 20:45:59'),(3,2,'Tananarive, Madagascar','2021-03-12 20:45:59','2021-03-12 20:45:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'ETECH','2021-02-18 20:06:56','2021-02-18 20:06:56'),(2,'FREELANCE-ARTIZEO','2021-02-18 20:07:27','2021-02-18 20:07:27'),(3,'DAGOBUSINESS','2021-03-10 03:17:32','2021-03-10 03:17:32'),(4,'PERSONAL','2021-03-10 16:26:36','2021-03-10 16:26:36'),(5,'FREELANCE-DIGITALUP','2021-03-10 19:34:52','2021-03-10 19:34:52'),(6,'ESTI','2021-03-11 13:26:50','2021-03-11 13:26:50');
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
INSERT INTO `companies_lang` VALUES (1,1,'eTech Consulting - Groupe ArkeUp','eTech Consulting - Groupe ArkeUp','2021-02-21 16:57:50','2021-02-21 16:57:50'),(1,2,'eTech Consulting - ArkeUp Group','eTech Consulting - ArkeUp Group desc','2021-02-27 21:45:22','2021-02-27 21:45:22'),(2,1,'Independant','Independant','2021-02-21 16:59:18','2021-02-21 16:59:18'),(2,2,'Independent','Independent desc','2021-02-27 21:45:22','2021-02-27 21:45:22'),(3,1,'Dago Business','Dago Business desc','2021-03-10 03:18:03','2021-03-10 03:18:03'),(3,2,'Dago Business','Dago Business desc','2021-03-10 03:18:03','2021-03-10 03:18:03'),(4,1,'Personnel','Personnel desc','2021-03-10 16:27:04','2021-03-10 16:27:04'),(4,2,'Personal','Personnel desc','2021-03-10 16:27:04','2021-03-10 16:27:04'),(5,1,'Ind├⌐pendant (Entreprise bas├⌐e en Maurice)','desc','2021-03-10 19:36:46','2021-03-10 19:36:46'),(5,2,'Independent (Company based in Mauritius)','desc','2021-03-10 19:36:46','2021-03-10 19:36:46'),(6,1,'├ëcole sup├⌐rieure des technologies de l\'information (ESTI)','desc','2021-03-11 13:32:19','2021-03-11 13:32:19'),(6,2,'Graduate School of Information Technology (ESTI)','desc','2021-03-11 13:32:19','2021-03-11 13:32:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Positions for any companies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_positions`
--

LOCK TABLES `company_positions` WRITE;
/*!40000 ALTER TABLE `company_positions` DISABLE KEYS */;
INSERT INTO `company_positions` VALUES (1,'dev-internship','2021-02-24 18:49:13','2021-02-24 18:49:01'),(2,'dev-junior','2021-02-26 16:47:35','2021-02-26 16:47:35'),(3,'dev-confirmed','2021-02-27 08:50:00','2021-02-27 08:50:34'),(4,'dev-senior','2021-02-27 08:50:01','2021-02-27 08:50:01'),(5,'dev-lead','2021-03-05 13:29:49','2021-03-05 13:29:49'),(6,'enseignant-vacataire','2021-03-11 13:40:24','2021-03-11 13:40:24');
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
INSERT INTO `company_positions_lang` VALUES (1,1,'Stagiaire Developpeur','Stagiaire Developpeur desc'),(1,2,'Developer Internship','Developer Internship desc'),(2,1,'D├⌐veloppeur Junior','D├⌐veloppeur Junior Descr'),(2,2,'Junior Developer','Junior Developer'),(3,1,'Developpeur Confirm├⌐','Developpeur Confirm├⌐ desc'),(3,2,'Confirmed Developer','Confirmed Developer desc'),(4,1,'Developpeur Senior','Developpeur Senior desc'),(4,2,'Senior Developer','Senior Developer desc'),(5,1,'Lead Developpeur','Lead Developpeur desc'),(5,2,'Lead Developer','Lead Developer desc'),(6,1,'Enseignant vacataire, Consultant','Charg├⌐s d\'enseignement vacataires'),(6,2,'Temporary teaching, Consultant','Temporary teaching staff');
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
INSERT INTO `cv` VALUES (1,1,1,'LEAD_TECHNICAL',3,'2021-02-18 20:01:36','2021-02-18 20:01:36'),(2,1,1,'DEV_PRESTASHOP',1,'2021-02-18 20:08:12','2021-02-18 20:08:12'),(3,1,1,'DEV_SYMFONY',1,'2021-02-18 20:08:37','2021-02-18 20:08:37'),(4,1,1,'DEV_LARAVEL',1,'2021-02-18 20:09:10','2021-02-18 20:09:10'),(5,1,1,'DEV_ECOMMERCE',1,'2021-02-18 20:09:22','2021-02-18 20:09:22'),(6,1,1,'DEV_BACKEND',1,'2021-02-18 20:09:41','2021-02-18 20:09:41'),(7,1,1,'DEV_FULLSTACK',1,'2021-02-18 20:09:53','2021-02-18 20:09:53');
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
  `enable` int(1) NOT NULL DEFAULT '0',
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
INSERT INTO `cv_experiences` VALUES (1,1,0,'2021-02-24 18:54:28','2021-02-24 18:54:28'),(1,2,1,'2021-02-26 16:53:35','2021-02-26 16:53:35'),(1,3,0,'2021-03-10 19:21:10','2021-03-10 19:21:10'),(1,4,1,'2021-03-05 13:40:40','2021-03-05 13:40:40'),(1,5,1,'2021-03-05 13:56:59','2021-03-05 13:56:59'),(1,6,1,'2021-03-05 13:56:59','2021-03-05 13:56:59'),(1,7,1,'2021-02-27 10:09:40','2021-02-27 10:09:40'),(1,8,1,'2021-03-10 03:20:30','2021-03-10 03:20:30'),(1,9,1,'2021-03-10 19:43:04','2021-03-10 19:43:04'),(1,10,1,'2021-03-11 13:44:57','2021-03-11 13:44:57');
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
  `skill_description` text,
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
INSERT INTO `cv_lang` VALUES (1,1,'CV Lead Technique','Lead Technique','Lead Technique et D├⌐veloppeur Senior avec plus de 6 ans d\'exp├⌐rience dans l\'industrie IT dans toutes les phases du cycle de vie du d├⌐veloppement logiciel. Travailler en tant que ressource cl├⌐ et responsable de la collecte des exigences, de la conception fonctionnelle et technique, de la configuration du syst├¿me, des tests du syst├¿me, du d├⌐ploiement et du support post-d├⌐ploiement pour diverses impl├⌐mentations d\'applications. Exp├⌐rience de direction d\'une ├⌐quipe de projet vers la r├⌐ussite du projet.','<ul>\n<li>Capable de penser diff&eacute;remment et poss&egrave;de de solides capacit&eacute;s d\'analyse et de r&eacute;flexion critique</li>\n<li>Puissance intellectuelle et capacit&eacute; &eacute;prouv&eacute;e &agrave; apprendre rapidement de nouveaux processus et outils, domaines commerciaux et applications techniques</li>\n<li>Solide connaissance de la programmation orient&eacute;e objet</li>\n<li>Influence et capacit&eacute; &agrave; faire avancer les choses dans un environnement de travail collaboratif et id&eacute;al</li>\n<li>Capable d\'apprendre rapidement de nouvelles langues / techno et API</li>\n<li>Solides comp&eacute;tences en communication &eacute;crite et orale et en pr&eacute;sentation, y compris la capacit&eacute; de communiquer entre le personnel technique et non technique</li>\n<li>Connaissance des tests unitaires / automatis&eacute;s</li>\n<li>Bonnes comp&eacute;tences en communication et capacit&eacute; &agrave; travailler de mani&egrave;re autonome</li>\n</ul>'),(1,2,'CV Technical Lead','Technical Lead','Technical Lead & Senior Developer with over 6+ years of strong experience in the IT industry across all phases of the Software Development Life Cycle. Working as a key resource responsible for requirement gathering, functional & technical designing, system configuration, system testing, deployment and post-go-live support for various application implementations. Experience in leading project team towards successful completion of the project.','<ul>\n<li>Able to think outside the box, and has strong analytical and critical thinking skills</li>\n<li>Intellectual horsepower and proven ability to quickly learn new processes and tools, business domains and technical applications</li>\n<li>Strong object oriented programming knowledge</li>\n<li>Influence and ability to getting things done in a collaborative and great place to work environment</li>\n<li>Able to learn new languages/techno and API&rsquo;s quickly</li>\n<li>Strong written and oral communication and presentation skills including the ability to communicate between technical and non-technical personnel</li>\n<li>Knowledge in unit/automated testing</li>\n<li>Good communication skills and ability to work independently</li>\n</ul>'),(2,1,'CV Prestashop Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR',NULL),(3,1,'CV Symfony Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR',NULL),(4,1,'CV Laravel Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR',NULL),(5,1,'CV eCommerce Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR',NULL),(6,1,'CV Backend Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR',NULL),(7,1,'CV Fullstack Developer','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR',NULL);
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
INSERT INTO `cv_projects` VALUES (1,1,'2021-02-28 09:25:08','2021-02-28 09:25:08'),(1,2,'2021-03-06 17:01:25','2021-03-06 17:01:25'),(1,3,'2021-03-09 14:57:19','2021-03-09 14:57:19'),(1,4,'2021-03-09 15:15:00','2021-03-09 15:15:00'),(1,5,'2021-03-09 15:28:05','2021-03-09 15:28:05'),(1,6,'2021-03-09 17:03:33','2021-03-09 17:03:33'),(1,7,'2021-03-09 17:09:28','2021-03-09 17:09:28'),(1,8,'2021-03-09 17:15:18','2021-03-09 17:15:18'),(1,9,'2021-03-09 17:23:37','2021-03-09 17:23:37'),(1,10,'2021-03-09 17:28:49','2021-03-09 17:28:49'),(1,11,'2021-03-09 17:38:52','2021-03-09 17:38:52'),(1,12,'2021-03-09 17:45:40','2021-03-09 17:45:40'),(1,13,'2021-03-09 17:49:02','2021-03-09 17:49:02'),(1,14,'2021-03-09 17:53:46','2021-03-09 17:53:46'),(1,15,'2021-03-09 17:58:02','2021-03-09 17:58:02'),(1,16,'2021-03-09 18:02:00','2021-03-09 18:02:00'),(1,17,'2021-03-09 18:05:56','2021-03-09 18:05:56'),(1,18,'2021-03-09 18:10:33','2021-03-09 18:10:33'),(1,19,'2021-03-09 18:13:40','2021-03-09 18:13:40'),(1,20,'2021-03-09 18:17:10','2021-03-09 18:17:10'),(1,21,'2021-03-09 18:24:11','2021-03-09 18:24:11'),(1,22,'2021-03-09 18:28:58','2021-03-09 18:28:58'),(1,23,'2021-03-09 18:32:26','2021-03-09 18:32:26'),(1,24,'2021-03-09 18:35:55','2021-03-09 18:35:55'),(1,25,'2021-03-09 18:57:58','2021-03-09 18:57:58'),(1,26,'2021-03-09 19:00:50','2021-03-09 19:00:50'),(1,27,'2021-03-09 19:04:07','2021-03-09 19:04:07'),(1,28,'2021-03-09 19:07:35','2021-03-09 19:07:35'),(1,29,'2021-03-09 19:10:42','2021-03-09 19:10:42'),(1,30,'2021-03-09 19:13:39','2021-03-09 19:13:39'),(1,31,'2021-03-09 19:16:06','2021-03-09 19:16:06'),(1,32,'2021-03-09 19:19:10','2021-03-09 19:19:10'),(1,33,'2021-03-09 19:22:50','2021-03-09 19:22:50'),(1,34,'2021-03-09 19:25:06','2021-03-09 19:25:06'),(1,35,'2021-03-09 19:27:52','2021-03-09 19:27:52'),(1,36,'2021-03-10 13:07:20','2021-03-10 13:07:20'),(1,37,'2021-03-10 13:11:56','2021-03-10 13:11:56'),(1,38,'2021-03-10 13:15:36','2021-03-10 13:15:36'),(1,39,'2021-03-10 13:20:16','2021-03-10 13:20:16'),(1,40,'2021-03-10 13:23:34','2021-03-10 13:23:34'),(1,41,'2021-03-10 13:26:54','2021-03-10 13:26:54');
/*!40000 ALTER TABLE `cv_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_skills`
--

DROP TABLE IF EXISTS `cv_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_skills` (
  `id_cv_skill` int(11) NOT NULL AUTO_INCREMENT,
  `id_cv` int(11) NOT NULL,
  `id_skills` int(11) NOT NULL,
  `enable` int(1) DEFAULT '0',
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv_skill`),
  UNIQUE KEY `id_cv` (`id_cv`,`id_skills`) USING BTREE,
  KEY `cv_skills.id_skills` (`id_skills`),
  CONSTRAINT `cv_skills.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `cv_skills.id_skills` FOREIGN KEY (`id_skills`) REFERENCES `part_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_skills`
--

LOCK TABLES `cv_skills` WRITE;
/*!40000 ALTER TABLE `cv_skills` DISABLE KEYS */;
INSERT INTO `cv_skills` VALUES (1,1,1,1,'2021-02-23 21:18:29','2021-02-23 21:18:29'),(2,1,2,1,'2021-02-24 13:46:05','2021-02-24 13:46:05'),(3,1,3,1,'2021-02-24 15:26:16','2021-02-24 15:26:16'),(4,1,4,1,'2021-02-28 12:35:55','2021-02-28 12:35:55'),(5,1,5,0,'2021-02-28 14:07:08','2021-02-28 14:07:08'),(6,1,6,1,'2021-02-28 14:36:59','2021-02-28 14:36:59'),(7,1,7,1,'2021-02-28 15:13:41','2021-02-28 15:13:41'),(8,1,8,1,'2021-02-28 15:23:10','2021-02-28 15:23:10'),(9,1,9,1,'2021-02-28 15:25:07','2021-02-28 15:25:07'),(10,1,10,1,'2021-03-02 18:58:38','2021-03-02 18:58:38'),(11,1,11,1,'2021-03-02 18:58:38','2021-03-02 18:58:38'),(12,1,12,1,'2021-03-05 18:40:16','2021-03-05 18:40:16'),(13,1,13,1,'2021-03-05 20:03:10','2021-03-05 20:03:10'),(14,1,14,1,'2021-03-10 21:09:06','2021-03-10 21:09:06'),(15,1,15,1,'2021-03-10 21:10:47','2021-03-10 21:10:47'),(16,1,16,1,'2021-03-10 21:16:02','2021-03-10 21:16:02'),(17,1,17,1,'2021-03-10 21:30:16','2021-03-10 21:30:16'),(18,1,18,1,'2021-03-10 21:31:10','2021-03-10 21:31:10'),(19,1,19,1,'2021-03-10 21:31:57','2021-03-10 21:31:57'),(20,1,20,1,'2021-03-10 21:33:08','2021-03-10 21:33:08'),(21,1,21,1,'2021-03-10 21:33:49','2021-03-10 21:33:49'),(22,1,22,1,'2021-03-10 21:35:32','2021-03-10 21:35:32'),(23,1,23,1,'2021-03-10 21:36:46','2021-03-10 21:36:46'),(24,1,24,1,'2021-03-10 21:38:24','2021-03-10 21:38:24'),(25,1,25,1,'2021-03-11 12:46:40','2021-03-11 12:46:40');
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
INSERT INTO `part_educations` VALUES (1,1,'ENI_LICENCE','2010-03-11','2013-01-15','2021-02-22 14:37:34','2021-02-22 14:37:34'),(2,1,'ENI_MASTER','2013-02-15','2015-01-05','2021-02-22 17:57:22','2021-02-22 17:57:22');
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
  `actual` int(1) DEFAULT '0',
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user-id_company-id_company_position` (`id_user`,`id_company`,`id_company_position`) USING BTREE,
  KEY `part_experiences.id_company` (`id_company`),
  KEY `part_experiences.id_company_position` (`id_company_position`),
  CONSTRAINT `part_experiences.id_company` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_experiences.id_company_position` FOREIGN KEY (`id_company_position`) REFERENCES `company_positions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_experiences.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='User presence in the company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_experiences`
--

LOCK TABLES `part_experiences` WRITE;
/*!40000 ALTER TABLE `part_experiences` DISABLE KEYS */;
INSERT INTO `part_experiences` VALUES (1,1,1,1,'etech-dev-intern','2016-01-08','2016-10-08',0,'2021-02-24 18:49:44','2021-02-24 18:49:44'),(2,1,1,2,'etech-dev-junior','2016-01-09','2017-03-02',0,'2021-02-26 16:50:57','2021-02-26 16:50:57'),(3,1,2,4,'freelance-artizeo-dev-senior','2019-09-12','2020-06-23',0,'2021-02-27 10:05:15','2021-02-27 10:05:15'),(4,1,1,5,'etech-dev-lead','2019-02-02','2019-09-12',0,'2021-03-05 13:38:56','2021-03-05 13:38:56'),(5,1,1,3,'etech-dev-confirmed','2017-03-02','2018-04-02',0,'2021-03-05 13:48:38','2021-03-05 13:48:38'),(6,1,1,4,'etech-dev-senior','2018-04-02','2019-02-02',0,'2021-03-05 13:48:39','2021-03-05 13:48:39'),(7,1,2,5,'freelance-artizeo-dev-lead','2019-09-13','2021-02-05',0,'2021-03-07 20:25:46','2021-03-07 20:25:46'),(8,1,3,1,'dagobusiness-dev-intern','2015-02-04','2015-07-04',0,'2021-03-10 03:19:32','2021-03-10 03:19:32'),(9,1,3,2,'dagobusiness-dev-junior','2015-07-04','2016-01-08',0,'2021-03-10 19:42:37','2021-03-10 19:42:37'),(10,1,6,6,'esti-enseignant-vacataire','2017-01-09','2021-03-11',1,'2021-03-11 13:43:54','2021-03-11 13:43:54');
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
INSERT INTO `part_experiences_lang` VALUES (1,1,'<p>Responsabilit&eacute;s :</p>\n<ul>\n<li>Aider l\'&eacute;quipe avec la documentation, les sp&eacute;cifications, les conceptions, les plans de test, les propositions, la conception, le d&eacute;veloppement et les tests de logiciels</li>\n<li>Aider &agrave; d&eacute;finir, automatiser et ex&eacute;cuter des tests de d&eacute;veloppement &agrave; l\'appui de la fonctionnalit&eacute; / fonctionnalit&eacute; en cours de d&eacute;veloppement</li>\n<li>A suivi de cours en g&eacute;nie logiciel avec un accent sur le d&eacute;veloppement de logiciel r&eacute;el en utilisant des langages de programmation modernes</li>\n<li>Travailler en &eacute;troite collaboration avec l\'&eacute;quipe dans les premi&egrave;res phases du projet pour faciliter la m&eacute;thodologie de d&eacute;veloppement agile</li>\n<li>Effectuer le d&eacute;bogage et l\'analyse des performances du code et des syst&egrave;mes</li>\n<li>Fournir un soutien au d&eacute;veloppement pour tous les produits logiciels du groupe de technologie de s&eacute;curit&eacute;</li>\n<li>Participer au d&eacute;veloppement logiciel en utilisant le processus de d&eacute;veloppement Agile / Scrum</li>\n</ul>'),(1,2,'<p>Responsibilities :</p>\n<ul>\n<li>Assist the team with documentation, specifications, designs, test plans, proposals, software design, development and testing</li>\n<li>Assist in defining, automating, and executing development tests in support of the feature/functionality being developed</li>\n<li>Followed coursework in software engineering with a focus on actual software development using modern programming languages</li>\n<li>Work closely with the team in early project phases to facilitate agile development methodology</li>\n<li>Perform debug and performance analysis of code and systems</li>\n<li>Provide development support across all of the Security Technology Group&rsquo;s software products</li>\n<li>Participate in software development using Agile/Scrum development process</li>\n</ul>'),(2,1,'<p>Mes responsabilit├⌐s incluaient :</p>\n<ul>\n<li>Traite les bogues mineurs et moyens</li>\n<li>R&eacute;dige des rapports sur l\'&eacute;tat des logiciels en cours de d&eacute;veloppement</li>\n<li>Effectue des tests de d&eacute;veloppement</li>\n<li>Surveille les performances des syst&egrave;mes internes</li>\n<li>Assiste aux r&eacute;unions quotidiennes des d&eacute;veloppeurs</li>\n<li>Analyse les besoins des utilisateurs et les exigences logicielles pour &eacute;clairer la conception du syst&egrave;me</li>\n</ul>'),(2,2,'<p>My responsibilities included :</p>\n<ul>\n<li>Works on minor and average bug issues</li>\n<li>Writes reports regarding the state of software under development</li>\n<li>Conducts development tests</li>\n<li>Monitors the performance of internal systems<br />Attends daily developer meetings</li>\n<li>Analyzes user needs and software requirements to inform system design</li>\n</ul>'),(3,1,'desc fr'),(3,2,'desc en'),(4,1,'<p>Mes responsabilit├⌐s incluaient :</p>\n<ul>\n<li>Effectuer des revues de code du code source soumis par d\'autres membres de l\'&eacute;quipe</li>\n<li>Travaille avec les fournisseurs/le service des ventes pour assurer la livraison et les performances en temps opportun des composants utilis&eacute;s dans le d&eacute;veloppement du prototype et du premier produit</li>\n<li>Aide la livraison technique &agrave; cr&eacute;er et ex&eacute;cuter les plans de travail du projet, suivre les progr&egrave;s par rapport aux plans</li>\n<li>&Eacute;tablissez le plan et g&eacute;rez la migration d\'une infrastructure sur site vers la plate-forme bas&eacute;e sur le cloud (AWS / VPC)</li>\n<li>Effectuer une &eacute;valuation des performances et vous assurer que l\'application fonctionne correctement et efficacement</li>\n<li>Diriger une &eacute;quipe de d&eacute;veloppement, travaillant sur diff&eacute;rents sites g&eacute;ographiques</li>\n<li>&Eacute;tablissez la planification et g&eacute;rez la migration d\'une infrastructure interne vers la plate-forme bas&eacute;e sur le cloud (AWS / VPC)</li>\n<li>Collaborez avec d\'autres d&eacute;veloppeurs, analystes commerciaux, responsables des tests, pour planifier, concevoir, d&eacute;velopper, tester et maintenir une applications m&eacute;tier</li>\n</ul>'),(4,2,'<p>My responsibilities included :</p>\n<ul>\n<li>Perform code reviews of source code submitted by other team members</li>\n<li>Works with vendors/purchasing department to ensure timely delivery and performance of components used in prototype and first article development</li>\n<li>Helps technical delivery lead to creates and executes project work plans, tracks progress against plans</li>\n<li>Establish plan and manage the migration from an on premise infrastructure to the cloud based platform (AWS/VPC)</li>\n<li>Conduct performance assessment and make sure the application is running healthily and efficiently</li>\n<li>To lead a development team, working across different geographical locations</li>\n<li>Establish plan and manage the migration from an in-house infrastructure to the cloud based platform (AWS/VPC)</li>\n<li>Collaborate with other developers, business analysts, testing leads, to plan, design, develop, test, and maintain a business applications</li>\n</ul>'),(5,1,'<p>Mes responsabilit├⌐s incluaient :</p>\n<ul>\n<li>S\'assurer que toutes les activit&eacute;s logicielles sont men&eacute;es conform&eacute;ment au cycle de vie du d&eacute;veloppement logiciel</li>\n<li>Responsable de la refactorisation du code existant pour am&eacute;liorer la qualit&eacute; du code</li>\n<li>D&eacute;fi&eacute; les membres de l\'&eacute;quipe</li>\n<li>D&eacute;velopper de nouveaux programmes ou maintenir des programmes existants en fonction des sp&eacute;cifications</li>\n<li>A familiaris&eacute; avec les concepts de composants h&eacute;rit&eacute;s en tant que services Web dans un cadre SOA</li>\n<li>Paradigmes / M&eacute;thodologies: D&eacute;veloppement Scrum / Agile, Principes REST, Mod&egrave;les MVC, Programmation orient&eacute;e objet, Programmation asynchrone, AngularJS Styleguide</li>\n</ul>'),(5,2,'<p>My responsibilities included :</p>\n<ul>\n<li>Ensure all software activities are conducted in accordance with the Software Development Life Cycle</li>\n<li>Responsible to refactoring existing code to improve code quality</li>\n<li>Challenge team members</li>\n<li>Develop new or maintain existing programs based on specifications</li>\n<li>Have familiarised with the concepts components as Web Services within a SOA framework</li>\n<li>Paradigms/Methodologies: Scrum/Agile Development, REST Principles, MVC Patterns, Object-oriented Programming, Asynchronous Programming, AngularJS Styleguide</li>\n</ul>'),(6,1,'<p>Mes responsabilit├⌐s incluaient :</p>\n<ul>\n<li>Aider les autres d&eacute;veloppeurs &agrave; r&eacute;soudre les probl&egrave;mes en fournissant des conseils et une formation</li>\n<li>Conception, estimation, d&eacute;veloppement et d&eacute;ploiement des applications utilisant Symfony 3+, Laravel 5+, Angular 2+, Prestashop 1.5+, Wordpress, React.js.</li>\n<li>Conduite et pilotage de projet, mise en place de bonne pratique.</li>\n<li>Fourniture de services de support (r&eacute;solution d\'incident, ex&eacute;cution de demande de service, fourniture d\'am&eacute;lioration, etc.) par rapport aux accords de niveau de service (SLA) et / ou aux indicateurs de performance cl&eacute;s</li>\n<li>Travailler avec les propri&eacute;taires de produits et les architectes pour d&eacute;velopper des plans de technologie logicielle sur plusieurs trimestres</li>\n<li>Fournir des conseils &agrave; l\'&eacute;quipe de projet travaillant sur des produits en mettant l\'accent sur la qualit&eacute; et les processus</li>\n<li>Soutenir et am&eacute;liorer les outils pour l\'int&eacute;gration continue, les tests automatis&eacute;s et la gestion des versions</li>\n<li>D&eacute;veloppement de scripts back-end int&eacute;grant des sources de donn&eacute;es disparates</li>\n<li>Diriger le d&eacute;veloppement de logiciels avec une forte emphase, le d&eacute;veloppement d\'applications en couches</li>\n<li>Am&eacute;liore les performances des syst&egrave;mes en &eacute;tudiant les probl&egrave;mes, en d&eacute;veloppant des sp&eacute;cifications, en identifiant les tendances technologiques et en recommandant des solutions</li>\n</ul>'),(6,2,'<p>My responsibilities included :</p>\n<ul>\n<li>Assist other developers in resolving issues by providing guidance and training</li>\n<li>Design, estimation, development and deployment of applications using Symfony 3+, Laravel 5+, Angular 2+, Prestashop 1.5+, Wordpress, React.js.</li>\n<li>Project lead and management, implementation of good practice.</li>\n<li>Delivery of support services (incident resolution, service request fulfilment, enhancement delivery, etc.) against Service Level Agreements (SLAs) and/or Key Performance Indicators</li>\n<li>Work with product owners and architects to develop multi quarter software technology plans</li>\n<li>Provide guidance to the project team working on products with strong focus on Quality and Processes</li>\n<li>Support and improve tools for continuous integration, automated testing and release management</li>\n<li>Development back-end scripts that integrates disparate data sources</li>\n<li>Lead software development with strong emphasis, layered application development</li>\n<li>Improves systems performance by investigating problems, developing specifications, identifying trends in technology, and recommending solutions</li>\n</ul>'),(7,1,'<p>Mes responsabilit&eacute;s incluaient :</p>\n<ul>\n<li>Travailler avec les membres de l\'&eacute;quipe pour fournir des estimations opportunes et pr&eacute;cises pour les solutions de d&eacute;veloppement</li>\n<li>Travailler avec l\'&eacute;quipe de direction pour fournir une orientation strat&eacute;gique pour l\'ensemble d\'outils existant</li>\n<li>Diriger une &eacute;quipe d&eacute;veloppant des solutions logicielles de haute qualit&eacute;</li>\n<li>Fournir du mentorat, des conseils, des commentaires et de la formation aux membres de l\'&eacute;quipe</li>\n<li>Analyse, d&eacute;bogue et / ou aide &agrave; la r&eacute;solution de probl&egrave;mes dans les environnements de d&eacute;veloppement et de production</li>\n<li>Supporte le client en d&eacute;veloppant des outils de documentation et d\'assistance</li>\n<li>Travaille en collaboration avec l\'&eacute;quipe sur l\'application Scrum et l\'am&eacute;lioration constante des processus</li>\n<li>R&eacute;sout les plaintes des clients avec le logiciel et r&eacute;pond aux suggestions d\'am&eacute;liorations et d\'am&eacute;liorations</li>\n<li>Assurer la direction d\'&eacute;quipe pour un petit groupe d\'ing&eacute;nieurs et superviser le leadership technique pour les solutions CI / CD dans le Cloud</li>\n<li>Am&eacute;liorer, optimiser et identifier les opportunit&eacute;s d\'am&eacute;lioration du cycle de vie du d&eacute;veloppement logiciel</li>\n<li>Concevoir et d&eacute;velopper des logiciels de test solides &agrave; l\'aide de cadres de test tels que JUnit / TestNG, Jasmine et Selenium</li>\n<li>Processus de conception de d&eacute;veloppement et de test d\'applications Web, d\'outils et / ou de logiciels de commerce &eacute;lectronique &agrave; grande &eacute;chelle</li>\n<li>Cr&eacute;ez des rapports de d&eacute;fauts de haute qualit&eacute;</li>\n<li>Effectuer des tests unitaires de bas niveau, des services Web (REST, SOAP) et des tests syst&egrave;me de haut niveau</li>\n<li>Mentorat pratique de l\'&eacute;quipe</li>\n</ul>'),(7,2,'<p>My responsibilities included :</p>\n<ul>\n<li>Work with team members to provide timely and accurate estimates for development solutions</li>\n<li>Work with leadership team to provide strategic direction for existing toolset</li>\n<li>Lead a team developing high quality software solutions</li>\n<li>Provide mentoring, guidance, feedback and training to team members</li>\n<li>Analyzes, debugs and/or assists in problem solving in both development and production environments</li>\n<li>Supports client by developing documentation and assistance tools</li>\n<li>Collaboratively with the team works on Scrum application and constant process improvement</li>\n<li>Resolves customer complaints with software and responds to suggestions for improvements and enhancements</li>\n<li>Provide team leadership for a small group of engineers plus technical leadership oversight for CI/CD solutions in the Cloud</li>\n<li>Improve, optimize, and identify opportunities for improved software development lifecycle</li>\n<li>Design and develop solid test software using test frameworks such as JUnit/TestNG, Jasmine, and Selenium</li>\n<li>Design process of development as well as testing for large-scale, ecommerce web applications, tools, and/or software</li>\n<li>Create high quality defect reports</li>\n<li>Perform low-level unit testing, to high-level functional, web services (REST, SOAP) and system testing</li>\n<li>Hands-on mentoring of the team</li>\n</ul>'),(8,1,'<p>Mes responsabilit&eacute;s incluaient:</p>\n<ul>\n<li>Participation &agrave; la conception et au d&eacute;veloppement d\'&eacute;crans d\'applications et de son flux de travail &agrave; l\'aide d\'Activity et de Fragments.</li>\n<li>Ecrire la logique d\'application &agrave; l\'aide du SDK Android et d\'Android Studio.</li>\n<li>A travaill&eacute; sur la conception, les am&eacute;liorations, la correction de bugs et la maintenance de l\'application.</li>\n<li>D&eacute;veloppement d\'une interface utilisateur riche pour les modules d\'applications utilisant ListView, Scroll View, View Pager &amp; Navigation Drawer et d&eacute;velopp&eacute; une vue personnalis&eacute;e.</li>\n<li>Diff&eacute;rents widgets personnalis&eacute;s qui incluent des boutons, des toasts et des bo&icirc;tes de dialogue.</li>\n<li>G&eacute;rez les t&acirc;ches dans le cadre Agile et contr&ocirc;lez les flux de travail JIRA.</li>\n<li>Travailler dans un environnement Agile et g&eacute;rer des r&eacute;unions debout quotidiennes.</li>\n<li>Apprenne et utilise Git</li>\n</ul>'),(8,2,'<p>My responsibilities included :</p>\n<ul>\n<li>Participated in Designing and Developing App screens and its workflow using Activity and Fragments.Written application logic using &nbsp;Android SDK and Android Studio.</li>\n<li>Worked on Designing, Enhancements, Bug-fixing, and Maintenance of the Application.</li>\n<li>Developed rich UI for the applications modules using ListView, Scroll View, View Pager &amp; Navigation Drawer and developed Custom View.</li>\n<li>Customized different widgets that include Buttons, Toast\'s and Dialog\'s.</li>\n<li>Manage task with within Agile framework, and controlled JIRA workflows.</li>\n<li>Worked in Agile environment and handled daily standup meetings.</li>\n<li>Learn and use Git</li>\n</ul>'),(9,1,'<p>Mes responsabilit&eacute;s incluaient:</p>\n<ul>\n<li>Travailler avec d\'autres d&eacute;veloppeurs et concepteurs pour d&eacute;velopper le site Web et les applications</li>\n<li>Rendre compte de mon travail de mani&egrave;re proactive &agrave; la direction</li>\n<li>Travailler selon les bonnes pratiques actuelles de d&eacute;veloppement logiciel</li>\n<li>Maintenir un bon processus de d&eacute;veloppement et un bon flux de travail, y compris l\'identification et la mise en &oelig;uvre des optimisations</li>\n</ul>'),(9,2,'<p>My responsibilities included :</p>\n<ul>\n<li>Working with other developers and designers to develop the website and applications</li>\n<li>Proactively report to management about my work</li>\n<li>To work to current good software development practices</li>\n<li>Maintain a good development process and workflow, including identifying and implementing optimizations</li>\n</ul>'),(10,1,'<p>Mes responsabilit├⌐s inclus :</p>\n<ul>\n<li>Charg&eacute; de cours (SOA / Microservice / Cloud Computing[AWS/GCP] / .NET Core) : Pour les niveaux L3, M1 et M2 parcours Dev (MSI)</li>\n<li>Assurer des cours magistraux</li>\n<li>Conduire un atelier de formation</li>\n<li>Assurer des travaux dirig&eacute;s et travaux pratiques</li>\n<li>Conception des sujets d\'examens et correction des copies</li>\n<li>Repr&eacute;senter l\'ESTI lors d\'&eacute;v&egrave;nements (salons professionnels, ...)</li>\n<li>Participe a des sessions de recrutements de nouvel d\'&eacute;tudiant</li>\n<li>Concevoir et Actualiser des outils de formation / p&eacute;dagogiques</li>\n<li>Participer &agrave; des jurys de m&eacute;moires</li>\n<li>R&eacute;aliser un suivi des contrats en alternance (apprentissage et suivi)</li>\n<li>Assurer des relations avec des entreprises d\'alternance</li>\n<li>Participe a des formations des formateurs</li>\n</ul>'),(10,2,'<p>My responsibilities included :</p>\n<ul>\n<li>Lecturer (SOA / Microservice / Cloud Computing [AWS / GCP] / .NET Core) : For levels L3, M1 and M2 Dev course (MSI)</li>\n<li>Provide lectures</li>\n<li>Conduct a training workshop</li>\n<li>Provide tutorials and practical work</li>\n<li>Design of exam papers and correction of copies</li>\n<li>Represent ESTI at events (trade shows, ...)</li>\n<li>Participate in new student recruitment sessions</li>\n<li>Design and Update training / educational tools</li>\n<li>Participate in memoir juries</li>\n<li>Monitor work-study contracts (apprenticeship and follow-up)</li>\n<li>Ensure relationships with work-study companies</li>\n<li>Participate in trainers\' training</li>\n</ul>');
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
  `id_project_group` int(11) DEFAULT NULL,
  `slug` varchar(64) NOT NULL,
  `show_in_portfolio` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0|1',
  `url_access` varchar(256) DEFAULT NULL,
  `url_preview` varchar(256) DEFAULT NULL,
  `dateBegin` date DEFAULT NULL COMMENT 'Date of you begin the project (in the past)',
  `dateEnd` date DEFAULT NULL COMMENT 'Date of you end the project (in the past). If null, you are in the project actually',
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `part_projects.company_id` (`company_id`),
  KEY `part_projects.id_user` (`id_user`),
  KEY `part_projects_id_project_group` (`id_project_group`),
  CONSTRAINT `part_projects.company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `part_projects.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `part_projects_id_project_group` FOREIGN KEY (`id_project_group`) REFERENCES `projects_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_projects`
--

LOCK TABLES `part_projects` WRITE;
/*!40000 ALTER TABLE `part_projects` DISABLE KEYS */;
INSERT INTO `part_projects` VALUES (1,2,1,NULL,'ARTIZEO-PRB-API',1,NULL,NULL,'2019-09-28','2019-12-28','2021-02-28 09:16:58','2021-02-28 09:16:58'),(2,4,1,NULL,'WEBSITE-PERSO',0,'http://www.mahefa.pro/','','2019-09-28','2019-09-28','2021-03-06 17:00:16','2021-03-06 17:00:16'),(3,1,1,NULL,'ETECH-BULY1803',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 14:54:54','2021-03-09 14:54:54'),(4,1,1,NULL,'ETECH-SMARTVRSTUDIO',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 15:13:43','2021-03-09 15:13:43'),(5,1,1,NULL,'ETECH-SPEEDDATINGCOM',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 15:26:47','2021-03-09 15:26:47'),(6,1,1,NULL,'ETECH-MCE-CUSTOMMESSAGE',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:02:01','2021-03-09 17:02:01'),(7,1,1,NULL,'ETECH-CPI',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:08:30','2021-03-09 17:08:30'),(8,1,1,NULL,'ETECH-OLEDCOMM',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:14:20','2021-03-09 17:14:20'),(9,1,1,NULL,'ETECH-EGGTIVITY',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:22:42','2021-03-09 17:22:42'),(10,1,1,NULL,'ETECH-ARTIBIP-V1',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:27:42','2021-03-09 17:27:42'),(11,1,1,NULL,'ETECH-HAIRNET',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:37:59','2021-03-09 17:37:59'),(12,1,1,NULL,'ETECH-HAIRNET-COIFFURE',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:44:43','2021-03-09 17:44:43'),(13,1,1,NULL,'ETECH-MEMEGORGETTE',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:48:18','2021-03-09 17:48:18'),(14,1,1,NULL,'ETECH-FRAIKIN',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:52:52','2021-03-09 17:52:52'),(15,1,1,NULL,'ETECH-AB2BMARKET',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 17:57:11','2021-03-09 17:57:11'),(16,1,1,NULL,'ETECH-ILUMINELLI',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:01:16','2021-03-09 18:01:16'),(17,1,1,NULL,'ETECH-WICLICK',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:05:08','2021-03-09 18:05:08'),(18,1,1,NULL,'ETECH-ODIWI',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:09:48','2021-03-09 18:09:48'),(19,1,1,NULL,'ETECH-PADDOCK',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:12:51','2021-03-09 18:12:51'),(20,1,1,NULL,'ETECH-MADEMOISELLEDPARIS',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:16:18','2021-03-09 18:16:18'),(21,1,1,NULL,'ETECH-DELEGANET',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:23:22','2021-03-09 18:23:22'),(22,1,1,NULL,'ETECH-JOVENA',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:28:04','2021-03-09 18:28:04'),(23,1,1,NULL,'INDEP-UPONE',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:31:39','2021-03-09 18:31:39'),(24,2,1,NULL,'ARTIZEO-GREENRIDER',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:35:03','2021-03-09 18:35:03'),(25,2,1,NULL,'ARTIZEO-OKAZO',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 18:54:40','2021-03-09 18:54:40'),(26,2,1,NULL,'ARTIZEO-DELTAWATT',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 19:00:01','2021-03-09 19:00:01'),(27,2,1,NULL,'ARTIZEO-DYNAMICARD',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 19:03:19','2021-03-09 19:03:19'),(28,2,1,NULL,'ARTIZEO-PRS-HOME',1,NULL,NULL,'2019-09-28','2019-09-28','2021-03-09 19:06:35','2021-03-09 19:06:35'),(29,2,1,NULL,'ARTIZEO-PRS-API',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-09 19:09:33','2021-03-09 19:09:33'),(30,2,1,NULL,'ARTIZEO-TOURCOM',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-09 19:13:00','2021-03-09 19:13:00'),(31,2,1,NULL,'ARTIZEO-UPRADIO-APP',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-09 19:15:27','2021-03-09 19:15:27'),(32,2,1,NULL,'ARTIZEO-UPRADIO-WEB',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-09 19:18:26','2021-03-09 19:18:26'),(33,2,1,NULL,'ARTIZEO-GREENRIDER-APP',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-09 19:21:33','2021-03-09 19:21:33'),(34,2,1,NULL,'ARTIZEO-GREENRIDER-LOCATION',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-09 19:24:22','2021-03-09 19:24:22'),(35,2,1,NULL,'ARTIZEO-GREENRIDER-WEBSITE',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-09 19:27:00','2021-03-09 19:27:00'),(36,2,1,NULL,'ARTIZEO-NOTSHY',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-10 13:06:14','2021-03-10 13:06:14'),(37,2,1,NULL,'ARTIZEO-VOLKSWAGEN-MEDIANEWSKLETTER',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-10 13:11:05','2021-03-10 13:11:05'),(38,2,1,NULL,'ARTIZEO-DOUXFORYOU',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-10 13:14:58','2021-03-10 13:14:58'),(39,2,1,NULL,'ARTIZEO-BTSDESIGNESPACE',1,NULL,NULL,'2019-09-28','2020-04-28','2021-03-10 13:19:36','2021-03-10 13:19:36'),(40,3,1,NULL,'DAGOBUSINESS-ANACONDA',1,NULL,NULL,'2014-07-01','2014-10-01','2021-03-10 13:22:51','2021-03-10 13:22:51'),(41,3,1,NULL,'DAGOBUSINESS-DAGOAGROSOURCIA',1,NULL,NULL,'2015-01-01','2015-06-01','2021-03-10 13:25:58','2021-03-10 13:25:58');
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
INSERT INTO `part_projects_lang` VALUES (1,1,'PRB - API reliant un site ecommerce prestashop et un base de donn&eacute;e des fournisseur ','<p>Contexte:</p>\n<ul>\n<li>Partie IHM : HTML5, CSS3, jQuery</li>\n<li>Base de donn&eacute;es : MySql</li>\n<li>Framework : Prestashop / Laravel</li>\n<li>Gestion de codes sources avec Git (Clone/Branch/Pull/Merge/Gestion conflit)</li>\n<li>Mise en place de services web</li>\n<li>D&eacute;veloppement de plugin</li>\n<li>Mise en place syst&egrave;me de connecteur entre prestashop et les fournisseurs</li>\n<li>Support technique</li>\n</ul>\n<p><strong>Environnement technique :</strong></p>\n<p>Prestashop, Laravel, XML, MySql, JQuery, JavaScript, Jira, Git, Confluence, API</p>','2021-02-28 09:23:13','2021-02-28 09:23:13'),(1,2,'PRB - API connecting a prestashop ecommerce site and a supplier database','<p> Context: </p>\n<ul>\n<li> GUI part: HTML5, CSS3, jQuery </li>\n<li> Database: MySql </li>\n<li> Framework: Prestashop / Laravel </li>\n<li> Source code management with Git (Clone / Branch / Pull / Merge / Conflict management) </li>\n<li> Setting up web services </li>\n<li> Plugin development </li>\n<li> Establishment of a connector system between prestashop and suppliers </li>\n<li>Technical support</li>\n</ul>\n<p> <strong> Technical environment : </strong> </p>\n<p> Prestashop, Laravel, XML, MySql, JQuery, JavaScript, Jira, Git, Confluence, API </p>','2021-02-28 09:23:13','2021-02-28 09:23:13'),(2,1,'Site personnel','Site personnel desc','2021-03-06 17:01:03','2021-03-06 17:01:03'),(2,2,'Personal Website','Personal Website desc','2021-03-06 17:01:03','2021-03-06 17:01:03'),(3,1,'Buly 1803 - www.buly1803.com','<p>Site de vente en ligne internationale, multi-boutique dont Paris, Hong Kong, New York.<br />Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>D&eacute;veloppement du Back Office et Front Office</li>\n<li>Support technique</li>\n</ul>\n<p>Technologies : Prestashop 1.6, HTML, MySQL, jQuery, Ajax,SVN</p>','2021-03-09 14:56:57','2021-03-09 14:56:57'),(3,2,'Buly 1803 - www.buly1803.com','<p>International online sales website, multi-store including Paris, Hong Kong, New York.<br />My responsibilities in this project :</p>\n<ul>\n<li>Back Office and Front Office development</li>\n<li>Technical support</li>\n</ul>\n<p>&nbsp;Technologies: Prestashop 1.6, HTML, MySQL, jQuery, Ajax, SVN</p>','2021-03-09 14:56:57','2021-03-09 14:56:57'),(4,1,'SmartVR Studiok - www.smartvr-studio.com','<p>Site vitrine des outils de 3D r&eacute;alit&eacute; virtuelle.</p>\n<p>Mes responsabilit&eacute;s dans ce projet sont :</p>\n<ul>\n<li>Correction bug et Maintenance</li>\n<li>D&eacute;ploiement sur l\'environement de production</li>\n</ul>\n<p>Ouilts/Technologies : Jira, Git, Wordpress 4, WooCommerce 3, MySql 5, jQuery, Ajax, Cron</p>','2021-03-09 15:14:50','2021-03-09 15:14:50'),(4,2,'SmartVR Studiok - www.smartvr-studio.com','<p>Showcase site for 3D virtual reality tools.</p>\n<p>My responsibilities in this project are:</p>\n<ul>\n<li>Bug fixes and Maintenance</li>\n<li>Deployment on the production environment</li>\n</ul>\n<p>Tools / Technologies: Jira, Git, Wordpress 4, WooCommerce 3, MySql 5, jQuery, Ajax, Cron</p>','2021-03-09 15:14:50','2021-03-09 15:14:50'),(5,1,'Le speeddating - www.lespeeddating.com','<p>Site de rencontres bas&eacute; &agrave; Paris.</p>\n<p>Mes responsabilit&eacute;s dans ce projet sont :</p>\n<ul>\n<li>Conduite du projet</li>\n<li>D&eacute;veloppement des fonctionnalit&eacute;s sur le site web et Application mobile avec Reac Native</li>\n<li>Maintenance Applicative (Site et application mobile)</li>\n</ul>\n<p><strong>Ouilts/Technologies :</strong> Prestashop 1.6, MySql, jQuery, Ajax, SVN, REST</p>','2021-03-09 15:27:53','2021-03-09 15:27:53'),(5,2,'Le speeddating - www.lespeeddating.com','<p>Paris-based dating website.</p>\n<p>My responsibilities in this project are:</p>\n<ul>\n<li>Project management</li>\n<li>Development of functionalities on the website and mobile application with Reac Native</li>\n<li>Application Maintenance (Site and mobile application)</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Prestashop 1.6, MySql, jQuery, Ajax, SVN, REST</p>','2021-03-09 15:27:53','2021-03-09 15:27:53'),(6,1,'Martine Custom Message (MCE)','<p>Outil de gestion de message personnalis&eacute; lors d&rsquo;un<br />&eacute;v&egrave;ne-ment (dans une quelconque &eacute;tape de la vente).</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Etude et conception du module</li>\n<li>D&eacute;veloppement du Back Office, module</li>\n</ul>\n<p>Technologies : Prestashop 1.5, MySql, jQuery, Ajax, Cron,ReactNative</p>','2021-03-09 17:03:22','2021-03-09 17:03:22'),(6,2,'Martine Custom Message (MCE)','<p>Personalized message management tool during a<br />event (at any stage of the sale).</p>\n<p>My responsibilities in this project :</p>\n<ul>\n<li>Study and design of the module</li>\n<li>Back Office development, module</li>\n</ul>\n<p>Technologies: Prestashop 1.5, MySql, jQuery, Ajax, Cron, ReactNative</p>','2021-03-09 17:03:22','2021-03-09 17:03:22'),(7,1,'CPI - www.bbcip.ch','<p>Site de vente de parfums en ligne.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Maintenance du module</li>\n<li>Support technique</li>\n<li>Correction des bugs</li>\n</ul>\n<p>Technologies : Jira, Prestashop 1.5, MySql, jQuery, Ajax, Paypal</p>','2021-03-09 17:09:19','2021-03-09 17:09:19'),(7,2,'CPI - www.bbcip.ch','<p>Online perfume sales site.</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Module maintenance</li>\n<li>Technical support</li>\n<li>Bug fixes</li>\n</ul>\n<p>Technologies: Jira, Prestashop 1.5, MySql, jQuery, Ajax, Paypal</p>','2021-03-09 17:09:19','2021-03-09 17:09:19'),(8,1,'Oledcomm - www.oledcomm.net','<p>Site de vente en ligne des ampoules connect&eacute;es.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Conception et d&eacute;veloppement du module de transport (Module backend)</li>\n<li>Faire evoluer un theme prestashop (Module front)</li>\n</ul>\n<p>Technologies : Prestashop 1.6/1.7, Ajax, VueJs, Mangopay,REST</p>','2021-03-09 17:15:08','2021-03-09 17:15:08'),(8,2,'Oledcomm - www.oledcomm.net','<p>Online sales site for connected light bulbs.</p>\n<p>My responsibilities in this project :</p>\n<ul>\n<li>Design and development of the transport module (backend module)</li>\n<li>Develop a prestashop theme (Front module)</li>\n</ul>\n<p>Technologies: Prestashop 1.6 / 1.7, Ajax, VueJs, Mangopay, REST</p>','2021-03-09 17:15:08','2021-03-09 17:15:08'),(9,1,'Eggtivity','<p>Site de gestion d&rsquo;abonnement et de programme de sport. Le projet est divis&eacute; en deux : React.js pour le front et Symfony pour l\'API.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Conception et d&eacute;veloppement de la partie React.js,</li>\n<li>Piloter le membre de l\'&eacute;quipe</li>\n<li>Supporter techniquement l\'&eacute;quipe Symfony</li>\n</ul>\n<p><strong>Outils/Technologies :</strong> Angular 2+, Symfony, RxJs, Ajax, Elasticsearch, SOA/WSDL, AWS (AmazonWebService)</p>','2021-03-09 17:23:26','2021-03-09 17:23:26'),(9,2,'Eggtivity','<p>Subscription and sports program management site. The project is split into two: React.js for the front end and Symfony for the API.</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Design and development of the React.js part,- Manage the team member</li>\n<li>Technically support the Symfony team</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Angular 2+, Symfony, RxJs, Ajax, Elasticsearch, SOA / WSDL, AWS (AmazonWebService)</p>','2021-03-09 17:23:26','2021-03-09 17:23:26'),(10,1,'Artibip v0.x puis v1.x - www.artibip.fr','<p>Web service pour des clients mobile (Android &amp; iOS).</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Ajout de nouvelles fonctionnalit&eacute;s du Web Service</li>\n<li>Maintenance</li>\n<li>Support technique</li>\n</ul>\n<p>Outils / Technologies : Symfony 2, Doctrine, MySql, SVN, Google Matrix, G&eacute;n&eacute;ration PDF, Twilio, Push Notification Google Firebase, AWS (AmazonWebService)</p>','2021-03-09 17:28:38','2021-03-09 17:28:38'),(10,2,'Artibip v0.x puis v1.x - www.artibip.fr','<p>Web service for mobile customers (Android &amp; iOS).</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Addition of new features of the Web Service</li>\n<li>Maintenance</li>\n<li>Technical support</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Symfony 2, Doctrine, MySql, SVN, Google Matrix, PDF Generation, Twilio, Push Notification Google Firebase, AWS (AmazonWebService)</p>','2021-03-09 17:28:38','2021-03-09 17:28:38'),(11,1,'Hairnet Webservice - lapi.hairnet.fr','<p>WebService de gestion de produit des salons de coiffure.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>D&eacute;veloppement une grande partie de la partie m&eacute;tier de l\'application</li>\n<li>Participer au Daily Metting avec le client</li>\n</ul>\n<p>Outils / Technologies : Laravel 5.4, JSON, GIT, S3</p>','2021-03-09 17:38:43','2021-03-09 17:38:43'),(11,2,'Hairnet Webservice - lapi.hairnet.fr','<p>Hair salon product management web service.</p>\n<p>My responsibilities in this project :</p>\n<ul>\n<li>Development of a large part of the business part of the application</li>\n<li>Participate in Daily Metting with the client</li>\n</ul>\n<p>Tools / Technologies: Laravel 5.4, JSON, GIT, S3</p>','2021-03-09 17:38:43','2021-03-09 17:38:43'),(12,1,'Hairnet Coiffure - www.hairnet.fr, salon.hairnet.fr, admin.hairnet.fr, rendezvous.hairnet.fr','<p>Logiciel d&rsquo;administration et de salon de coiffure.</p>\n<p><strong>Mes responsabilit&eacute;s dans ce projet :</strong></p>\n<ul>\n<li>D&eacute;veloppement des fonctionnalit&eacute;s du site vitrine,</li>\n<li>Implementation d\'une partie m&eacute;tier du salon,</li>\n<li>D&eacute;veloppement des fonctionnalit&eacute;s dans la partie de l\'administration et back office</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> PHP from scratch MVC, PDO, MySql, GIT, G&eacute;n&eacute;ration PDF, Twilio</p>','2021-03-09 17:45:24','2021-03-09 17:45:24'),(12,2,'Hairnet Coiffure - www.hairnet.fr, salon.hairnet.fr, admin.hairnet.fr, rendezvous.hairnet.fr','<p>Administration and hair salon software.</p>\n<p><strong>My responsibilities in this project :</strong></p>\n<ul>\n<li>Development of the functionalities of the showcase site,</li>\n<li>Implementation of a business part of the show,</li>\n<li>Development of functionalities in the administration and back office part</li>\n</ul>\n<p><strong>Tools / Technologies :</strong> PHP from scratch MVC, PDO, MySql, GIT, PDF generation, Twilio</p>','2021-03-09 17:45:24','2021-03-09 17:45:24'),(13,1,'Meme Gorgette - www.memegorgette.com','<p>Site ecommerce import-export pour les professionnels +BackOffice<br />personnalis&eacute; en Symfony 3</p>\n<p><strong>Mes responsabilit&eacute;s dans ce projet :</strong></p>\n<ul>\n<li>Ajout de nouvelles fonctionnalit&eacute;s + Migration</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Prestashop 1.6, PHP5, RESTfull, GIT</p>','2021-03-09 17:48:50','2021-03-09 17:48:50'),(13,2,'Meme Gorgette - www.memegorgette.com','<p>Import-export ecommerce site for professionals + BackOffice<br />customized in Symfony 3</p>\n<p><strong>My responsibilities in this project:</strong></p>\n<ul>\n<li>Added new features + Migration</li>\n</ul>\n<p><strong>Tools / Technologies :</strong> Prestashop 1.6, PHP5, RESTfull, GIT</p>','2021-03-09 17:48:50','2021-03-09 17:48:50'),(14,1,'Fraikin BE - www.fraikin.be','<p>Application (web) m&eacute;tiers du groupe Fraikin.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Ajout de nouvelles fonctionnalit&eacute;s sur la partie Angular (v2)</li>\n<li>Eff&eacute;ctuer une ETL</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Angular 2, RxJs, Symfony 3, Elasticsearch, GIT, SOA/SOAP/WSDL, AWS (AmazonWebService), WSO2 API Management</p>','2021-03-09 17:53:34','2021-03-09 17:53:34'),(14,2,'Fraikin BE - www.fraikin.be','<p>Fraikin group business (web) application.</p>\n<p>My responsibilities in this project :</p>\n<ul>\n<li>Added new features on the Angular part (v2)</li>\n<li>Perform an ETL</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Angular 2, RxJs, Symfony 3, Elasticsearch, GIT, SOA / SOAP / WSDL, AWS (AmazonWebService), WSO2 API Management</p>','2021-03-09 17:53:34','2021-03-09 17:53:34'),(15,1,'Ab2bMarket - www.ab2bmarket.com','<p>Site marketplace import-export pour les professionnels.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Analyse &amp; conception d&rsquo;une module</li>\n<li>Ajout de nouvelles fonctionnalit&eacute;s</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Magento2, PHP7, RESTfull, GIT</p>','2021-03-09 17:57:47','2021-03-09 17:57:47'),(15,2,'Ab2bMarket - www.ab2bmarket.com','<p>Import-export marketplace site for professionals.</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Analysis &amp; design of a module</li>\n<li>Added new features</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Magento2, PHP7, RESTfull, GIT</p>','2021-03-09 17:57:47','2021-03-09 17:57:47'),(16,1,'Iluminelli - www.iluminelli.com','<p>Site de Booking et de r&eacute;servation en ligne.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>R&eacute;diger un audit du site web</li>\n<li>Analyse et Resolution des bugs</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> ColdFusion, RESTfull, GIT</p>','2021-03-09 18:01:49','2021-03-09 18:01:49'),(16,2,'Iluminelli - www.iluminelli.com','<p>Booking and online reservation site.</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Write a website audit</li>\n<li>Analysis and resolution of bugs</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> ColdFusion, RESTfull, GIT</p>','2021-03-09 18:01:49','2021-03-09 18:01:49'),(17,1,'WiClick - www.wiclick.mg','<p>Site de boutique en ligne &agrave; Madagascar.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Analyse et Implementation d&rsquo;une module de paiement&nbsp;Orange Money en colaboration avec Orange Madagascar</li>\n<li>Analyse et Implementation d&rsquo;une module delivraison IBS</li>\n<li>Support technique</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Prestashop 1.7, PHP7, RESTfull, GIT</p>','2021-03-09 18:05:45','2021-03-09 18:05:45'),(17,2,'WiClick - www.wiclick.mg','<p>Online store site in Madagascar.</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Analysis and implementation of a payment module&nbsp;Orange Money in collaboration with Orange Madagascar</li>\n<li>Analysis and implementation of an IBS delivery module</li>\n<li>Technical support</li>\n</ul>\n<p><strong>Tools / Technologies :</strong> Prestashop 1.7, PHP7, RESTfull, GIT</p>','2021-03-09 18:05:45','2021-03-09 18:05:45'),(18,1,'Odiwi - www.odiwi.com','<p>Site vitrine SSII bas&eacute; en France.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<p>- Analyse et Impl&eacute;mentation fonctionnalit&eacute;<br />- D&eacute;velopper une partie du front office<br />- D&eacute;velopper une partie du web service</p>\n<p><strong>Outils / Technologies :</strong> Angular 6, Gitlab</p>','2021-03-09 18:10:23','2021-03-09 18:10:23'),(18,2,'Odiwi - www.odiwi.com','<p>SSII showcase site based in France.</p>\n<p>My responsibilities in this project :</p>\n<p>- Analysis and implementation of functionality<br />- Implement a part of the front office<br />- Implement a part of the web service</p>\n<p><strong>Tools / Technologies:</strong> Angular 6, Gitlab</p>','2021-03-09 18:10:23','2021-03-09 18:10:23'),(19,1,'Paddock sports - www.paddock-sports.com','<p>Site ecommerce de materiel de sport professionnels.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Conception et developpement de module</li>\n<li>Ajout de nouvelles fonctionnalit&eacute;s</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Prestashop 1.6, PHP 5.6, RESTfull, GIT</p>','2021-03-09 18:13:30','2021-03-09 18:13:30'),(19,2,'Paddock sports - www.paddock-sports.com','<p>E-commerce site for professional sports equipment.</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Module design and development</li>\n<li>Added new features</li>\n</ul>\n<p><strong>Tools / Technologies :</strong> Prestashop 1.6, PHP 5.6, RESTfull, GIT</p>','2021-03-09 18:13:30','2021-03-09 18:13:30'),(20,1,'Mademoiselle D Paris - www.mademoiselledparis.com','<p>Site ecommerce de pr&ecirc;t-&agrave;-porter f&eacute;minin.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Analyse, conception et estimation</li>\n<li>Developpement de bundle et plugin m&eacute;tiers</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Symfony 4, PHP7, RESTfull, GIT, SOA/SOAP</p>','2021-03-09 18:16:57','2021-03-09 18:16:57'),(20,2,'Mademoiselle D Paris - www.mademoiselledparis.com','<p>Women\'s ready-to-wear ecommerce site.</p>\n<p>My responsibilities in this project :</p>\n<ul>\n<li>Analysis, design and estimation</li>\n<li>Business bundle and plugin development</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Symfony 4, PHP7, RESTfull, GIT, SOA / SOAP</p>','2021-03-09 18:16:57','2021-03-09 18:16:57'),(21,1,'Deleganet - www.deleganet.com','<p>Une agence e-marketing sp&eacute;cialis&eacute; dans l&rsquo;accompagnement<br />e-commerce,le marketing digital et web ing&eacute;nierie.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Analyse et correction de bug fonctionnalit&eacute;</li>\n<li>Ajout de fonctionnalit&eacute;</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Symfony 3, React.js, Gitlab</p>','2021-03-09 18:24:01','2021-03-09 18:24:01'),(21,2,'Deleganet - www.deleganet.com','<p>An e-marketing agency specializing in support e-commerce, digital marketing and web engineering.</p>\n<p>My responsibilities in this project :</p>\n<ul>\n<li>Functional bug analysis and correction</li>\n<li>Added functionality</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Symfony 3, React.js, Gitlab</p>','2021-03-09 18:24:02','2021-03-09 18:24:02'),(22,1,'Jovena - *.jovena.mg','<p>Site de Gestion/BackOffice d&rsquo;administration interne.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Analyse &amp; conception site web et Application Android</li>\n<li>Ajout de nouvelles fonctionnalit&eacute;s</li>\n<li>Maintenance sur intervention.jovena.mg:8083</li>\n<li>Maintenance sur inspection.jovena.mg:8083</li>\n<li>Maintenance sur formation.jovena.mg:8083</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Symfony3, PHP7, RESTfull, ElasticSearch, GIT, SOA/SOAP, React Native</p>','2021-03-09 18:28:50','2021-03-09 18:28:50'),(22,2,'Jovena - *.jovena.mg','<p>Management Site / Internal Administration BackOffice.</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Website and Android application analysis &amp; design</li>\n<li>Added new features</li>\n<li>Maintenance on intervention.jovena.mg:8083</li>\n<li>Maintenance on inspection.jovena.mg:8083</li>\n<li>Maintenance on formation.jovena.mg:8083</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Symfony3, PHP7, RESTfull, ElasticSearch, GIT, SOA / SOAP, React Native</p>','2021-03-09 18:28:50','2021-03-09 18:28:50'),(23,1,'Upone','<p>Application desktop, permet d&rsquo;&eacute;tudier la rentabilit&eacute; d&rsquo;une activit&eacute; donn&eacute;e, dot&eacute;e de Machine Learning coupl&eacute; avec le Syst&egrave;me Multi-Agent (SMA).</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Direction strat&eacute;gique et technique de la plateforme</li>\n<li>Concevoir et d&eacute;velopper le coeur de l\'application</li>\n<li>Mod&eacute;lisation, impl&eacute;mentation et entra&icirc;nement du mod&egrave;le de la Machine Learning de mani&egrave;re supervis&eacute;e.</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Symfony, Angular 5, MySQL, Git, TensorFlow</p>','2021-03-09 18:32:13','2021-03-09 18:32:13'),(23,2,'Upone','<p>Desktop application, allows to study the profitability of a given activity, equipped with Machine Learning coupled with the Multi-Agent System (SMA).</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Strategic and technical management of the platform</li>\n<li>Design and develop the core of the application</li>\n<li>Modeling, implementation and training of the Machine Learning model in a supervised manner.</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Symfony, Angular 5, MySQL, Git, TensorFlow</p>','2021-03-09 18:32:13','2021-03-09 18:32:13'),(24,1,'GreenRider - www.green-riders.fr','<p>Site, application mobile de Gestion/BackOffice pour trottinette en France.</p>\n<p>Mes responsabilit&eacute;s dans ce projet :</p>\n<ul>\n<li>Analyse &amp; conception</li>\n<li>Ajout de nouvelles fonctionnalit&eacute;s</li>\n<li>Implementation Web Service</li>\n<li>Implementation Web Socket</li>\n<li>Implementation Application mobile (Android et iOS)</li>\n<li>Support technique</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Laravel 5.7, PHP7, RESTfull, ElasticSearch, GIT,<br />WebSocket, Twilio, React Native</p>','2021-03-09 18:35:43','2021-03-09 18:35:43'),(24,2,'GreenRider - www.green-riders.fr','<p>Site, Management / BackOffice mobile application for scooters in France.</p>\n<p>My responsibilities in this project:</p>\n<ul>\n<li>Analysis &amp; design</li>\n<li>Added new features</li>\n<li>Implementation Web Service</li>\n<li>Web Socket implementation</li>\n<li>Mobile application implementation (Android and iOS)</li>\n<li>Technical support</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Laravel 5.7, PHP7, RESTfull, ElasticSearch, GIT,<br />WebSocket, Twilio, React Native</p>','2021-03-09 18:35:43','2021-03-09 18:35:43'),(25,1,'Okazo - eCommerce','<ul>\n<li>R&eacute;alisation de site web de vente en Prestashop</li>\n<li>Creation de plusieurs modules necessaire (Mise en place Blog, Related products/articles, Action postpayment, etc...)</li>\n<li>Optimisation SEO (Temps de charge, Images)</li>\n<li>Mise en place de Rich Snippets de Google sur le site</li>\n<li>Mise en place de systeme de lazy loading relatif au produit</li>\n<li>Utilisation de Docker v19.03</li>\n</ul>\n<p><strong>Outils / Technologies :</strong>Prestashop 1.7, Webpack (file loader, scss loader, asset loader)</p>','2021-03-09 18:57:48','2021-03-09 18:57:48'),(25,2,'Okazo - eCommerce','<ul>\n<li>Realization of sales website in Prestashop</li>\n<li>Creation of several necessary modules (Blog setup, Related products / articles, Postpayment action, etc ...)</li>\n<li>SEO optimization (Load times, Images)</li>\n<li>Implementation of Google Rich Snippets on the site</li>\n<li>Implementation of a lazy loading system relating to the product</li>\n<li>Use of Docker v19.03</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Prestashop 1.7, Webpack (file loader, scss loader, asset loader)</p>','2021-03-09 18:57:48','2021-03-09 18:57:48'),(26,1,'Delta Watt - Site web','<ul>\n<li>R&eacute;alisation de site web vitrine avec OctoberCMS</li>\n<li>Creation de plusieurs modules necessaire (Mise en place de formulaire de contact, etc...)</li>\n<li>Optimisation SEO</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> OctoberCMS Build 468 (Laravel)</p>','2021-03-09 19:00:39','2021-03-09 19:00:39'),(26,2,'Delta Watt - Site web','<ul>\n<li>Realization of showcase website with OctoberCMS</li>\n<li>Creation of several modules necessary (Implementation of contact form, etc ...)</li>\n<li>SEO optimization</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> OctoberCMS Build 468 (Laravel)</p>','2021-03-09 19:00:39','2021-03-09 19:00:39'),(27,1,'ovh-r-sbm-web.dynamicard.fr - eCommerce','<ul>\n<li>R&eacute;alisation de site ecommerce en Prestashop</li>\n<li>Creation de plusieurs modules necessaire (Mise en place Personnalisation de carte de paiement, etc...)</li>\n<li>Debogage soucis de paiement</li>\n<li>Integration des pages</li>\n<li>Debogage d\'un fonctionnalit&eacute; dans le processus de vente</li>\n<li>Relation client</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Prestashop 1.6</p>','2021-03-09 19:03:57','2021-03-09 19:03:57'),(27,2,'ovh-r-sbm-web.dynamicard.fr - eCommerce','<ul>\n<li>Creation of e-commerce site in Prestashop</li>\n<li>Creation of several modules required (Implementation of payment card customization, etc ...)</li>\n<li>Debugging payment concerns</li>\n<li>Integration of pages</li>\n<li>Debugging a feature in the sales process</li>\n<li>customer relationship</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Prestashop 1.6</p>','2021-03-09 19:03:57','2021-03-09 19:03:57'),(28,1,'www.phonerecyclesolution.com - eCommerce','<ul>\n<li>R&eacute;alisation de site vitrine en Wordpress</li>\n<li>Creation de plusieurs plugin necessaire (plugin de gestion de numero SAV)</li>\n<li>Optimisation SEO</li>\n<li>Integration des pages</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Wordpress 4</p>','2021-03-09 19:07:20','2021-03-09 19:07:20'),(28,2,'www.phonerecyclesolution.com - eCommerce','<ul>\n<li>Creation of a showcase website in Wordpress</li>\n<li>Creation of several plugin required (after-sales service number management plugin)</li>\n<li>SEO optimization</li>\n<li>Integration of pages</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Wordpress 4</p>','2021-03-09 19:07:20','2021-03-09 19:07:20'),(29,1,'api.phonerecyclesolution.com - API','<ul>\n<li>R&eacute;alisation d\'API</li>\n<li>R&eacute;alisation de dashboard</li>\n<li>Ajout de plusieurs fonctionnalit&eacute;s</li>\n<li>Support technique</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Laravel 5, Laravel Nova, Laravel Forge</p>','2021-03-09 19:10:32','2021-03-09 19:10:32'),(29,2,'api.phonerecyclesolution.com - API','<ul>\n<li>API realization</li>\n<li>Realization of dashboard</li>\n<li>Added several features</li>\n<li>Technical support</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Laravel 5, Laravel Nova, Laravel Forge</p>','2021-03-09 19:10:32','2021-03-09 19:10:32'),(30,1,'Tourcom - Site vitrine','<ul>\n<li>R&eacute;alisation de site vitrine</li>\n<li>Creation de qlq plugin necessaire (plugin de formulaire de contact, affichage image instagram, etc)</li>\n<li>Integration des pages en respectant les maquettes</li>\n<li>Optimisation SEO</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> OctoberCMS</p>','2021-03-09 19:13:30','2021-03-09 19:13:30'),(30,2,'Tourcom - Site vitrine','<ul>\n<li>Realization of showcase site</li>\n<li>Creation of qlq plugin required (contact form plugin, instagram image display, etc.)</li>\n<li>Integration of pages respecting the models</li>\n<li>SEO optimization</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> OctoberCMS</p>','2021-03-09 19:13:30','2021-03-09 19:13:30'),(31,1,'Upradio - Application','<ul>\n<li>R&eacute;alisation de l\'application</li>\n<li>Realisation de fonctionnalit&eacute; radio</li>\n<li>Creation des fonctionnalit&eacute;s necessaire</li>\n<li>Integration des pages</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> React Native 0.54 (Expo)</p>','2021-03-09 19:15:56','2021-03-09 19:15:56'),(31,2,'Upradio - Application','<ul>\n<li>Realization of the application</li>\n<li>Realization of radio functionality</li>\n<li>Creation of the necessary functionalities</li>\n<li>Integration of pages</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> React Native 0.54 (Expo)</p>','2021-03-09 19:15:56','2021-03-09 19:15:56'),(32,1,'Upradio - Site Web radio','<ul>\n<li>R&eacute;alisation de site vitrine en Wordpress</li>\n<li>Mise en place d\'un web radio</li>\n<li>Creation de plusieurs plugin necessaire</li>\n<li>Optimisation SEO</li>\n<li>Integration des pages</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Wordpress 4</p>','2021-03-09 19:18:59','2021-03-09 19:18:59'),(32,2,'Upradio - Site Web radio','<ul>\n<li>Creation of a showcase website in Wordpress</li>\n<li>Establishment of a web radio</li>\n<li>Creation of several plugin required</li>\n<li>SEO optimization</li>\n<li>Integration of pages</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Wordpress 4</p>','2021-03-09 19:18:59','2021-03-09 19:18:59'),(33,1,'Green Rider - Application mobile','<ul>\n<li>R&eacute;alisation d&rsquo;applications de g&eacute;olocalisation de<br />trotinnette en ReactNative en utilisant Websocket avec<br />Laravel.</li>\n<li>Implementation d\'envoie de notification SMS via Twilio</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> ReacNative 0.61 coupl&eacute; avec Laravel 5,<br />WebSocket, Mapbox, Calcule de distance Matrix API</p>','2021-03-09 19:22:40','2021-03-09 19:22:40'),(33,2,'Green Rider - Application mobile','<ul>\n<li>Realization of geolocation applications of<br />scooter in ReactNative using Websocket with<br />Laravel.</li>\n<li>Implementation of SMS notification sending via Twilio</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> ReacNative 0.61 coupled with Laravel 5,<br />WebSocket, Mapbox, Matrix API distance calculator</p>','2021-03-09 19:22:40','2021-03-09 19:22:40'),(34,1,'Green Rider Location - Site web','<p>R&eacute;alisation de site web vitrine de location en PHP / Html / Css sans framework</p>','2021-03-09 19:24:56','2021-03-09 19:24:56'),(34,2,'Green Rider Location - Site web','<p>Realization of rental showcase website in PHP / Html / Css without framework</p>','2021-03-09 19:24:56','2021-03-09 19:24:56'),(35,1,'Green Rider - Main Site web','<ul>\n<li>R&eacute;alisation de site web</li>\n<li>Creation de plusieurs modules necessaire</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Wordpress 4</p>','2021-03-09 19:27:40','2021-03-09 19:27:40'),(35,2,'Green Rider - Main Site web','<ul>\n<li>Website creation</li>\n<li>Creation of several modules required</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Wordpress 4</p>','2021-03-09 19:27:40','2021-03-09 19:27:40'),(36,1,'Notshy - notshy.fr','<p>Realisation de site ecommerce sous Prestrashop</p>\n<p>Missions :</p>\n<ul>\n<li>Integration de site</li>\n<li>Correction bug</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Prestashop 1.6, Gitlab</p>','2021-03-10 13:07:09','2021-03-10 13:07:09'),(36,2,'Notshy - notshy.fr','<p>Realization of ecommerce site under Prestrashop</p>\n<p>Missions:</p>\n<ul>\n<li>Site integration</li>\n<li>Bug fix</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Prestashop 1.6, Gitlab</p>','2021-03-10 13:07:09','2021-03-10 13:07:09'),(37,1,'Media Newsletter - volkswagen.medianewsletter.fr','<p>R&eacute;alisation de site web sous Joomla</p>\n<p>Missions :</p>\n<ul>\n<li>Maintenance (TMA)</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Joomla 3.8, Gitlab</p>','2021-03-10 13:11:46','2021-03-10 13:11:46'),(37,2,'Media Newsletter - volkswagen.medianewsletter.fr','<p>Website creation under Joomla</p>\n<p>Missions:</p>\n<ul>\n<li>Maintenance (TMA)</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Joomla 3.8, Gitlab</p>','2021-03-10 13:11:46','2021-03-10 13:11:46'),(38,1,'Doux for you - www.douxforyou.fr','<p>R&eacute;alisation de site eCommerce sous Prestashop 1.7</p>\n<p>Missions :</p>\n<ul>\n<li>Int&eacute;gration du site</li>\n<li>Ajout de produit</li>\n<li>Cr&eacute;ation/installation de plusieurs modules n&eacute;cessaire</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Prestashop 1.7, Gitlab</p>','2021-03-10 13:15:28','2021-03-10 13:15:28'),(38,2,'Doux for you - www.douxforyou.fr','<p>Creation of eCommerce site under Prestashop 1.7</p>\n<p>Missions:</p>\n<ul>\n<li>Site integration</li>\n<li>Product addition</li>\n<li>Creation / installation of several modules required</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Prestashop 1.7, Gitlab</p>','2021-03-10 13:15:28','2021-03-10 13:15:28'),(39,1,'Bts design d\'espace - www.btsdesigndespace.fr','<p>R&eacute;alisation de site web vitrine PHP/HTML/CSS</p>\n<p>Missions :</p>\n<ul>\n<li>Analyse et int&eacute;gration de contenu et design</li>\n<li>Mise en production</li>\n</ul>\n<p><strong>Outils / Technologies :</strong> Symfony, Gitlab</p>','2021-03-10 13:20:05','2021-03-10 13:20:05'),(39,2,'Bts design d\'espace - www.btsdesigndespace.fr','<p>PHP / HTML / CSS showcase website creation</p>\n<p>Missions:</p>\n<ul>\n<li>Analysis and integration of content and design</li>\n<li>Start of production</li>\n</ul>\n<p><strong>Tools / Technologies:</strong> Symfony, Gitlab</p>','2021-03-10 13:20:05','2021-03-10 13:20:05'),(40,1,'Anaconda - Site Vitrine','<ul>\n<li>R&eacute;alisation du site web vitrine</li>\n</ul>\n<p><strong>Techos :</strong> Symfony 2</p>','2021-03-10 13:23:26','2021-03-10 13:23:26'),(40,2,'Anaconda - Site Vitrine','<ul>\n<li>Realization of the showcase website</li>\n</ul>\n<p><strong>Techos:</strong> Symfony 2</p>','2021-03-10 13:23:26','2021-03-10 13:23:26'),(41,1,'Dago Agro Sourcia - Vente en ligne','<p>D&eacute;veloppement Android et Symfony.</p>\n<ul>\n<li>R&eacute;alisation de l\'application mobile de vente</li>\n<li>R&eacute;alisation du web service</li>\n</ul>\n<p><strong>Outils / Techos :</strong> Android Java, Symfony 2 Restfull</p>','2021-03-10 13:26:32','2021-03-10 13:26:32'),(41,2,'Dago Agro Sourcia - Vente en ligne','<p>Android and Symfony development.</p>\n<ul>\n<li>Realization of the mobile sales application</li>\n<li>Realization of the web service</li>\n</ul>\n<p><strong>Tools / Techos:</strong> Android Java, Symfony 2 Restfull</p>','2021-03-10 13:26:32','2021-03-10 13:26:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_skills`
--

LOCK TABLES `part_skills` WRITE;
/*!40000 ALTER TABLE `part_skills` DISABLE KEYS */;
INSERT INTO `part_skills` VALUES (1,1,2,'PHP','2021-02-23 21:04:18','2021-02-23 21:04:18'),(2,1,2,'JS','2021-02-24 13:43:52','2021-02-24 13:43:52'),(3,1,2,'PYTHON','2021-02-24 15:24:48','2021-02-24 15:24:48'),(4,1,3,'MANAGMENT','2021-02-28 12:32:39','2021-02-28 12:32:39'),(5,1,4,'LEADERSHIP','2021-02-28 14:06:34','2021-02-28 14:06:34'),(6,1,3,'JIRA','2021-02-28 14:21:15','2021-02-28 14:21:15'),(7,1,3,'ESTIMATING','2021-02-28 15:12:34','2021-02-28 15:12:34'),(8,1,1,'AWS','2021-02-28 15:21:48','2021-02-28 15:21:48'),(9,1,1,'NODEJS','2021-02-28 15:24:25','2021-02-28 15:24:25'),(10,1,2,'JAVA','2021-03-02 18:54:47','2021-03-02 18:54:47'),(11,1,1,'SPRINGBOOT','2021-03-02 18:56:34','2021-03-02 18:56:34'),(12,1,1,'FLUTTER','2021-03-05 18:36:12','2021-03-05 18:36:12'),(13,1,1,'GRAPHQL','2021-03-05 20:02:06','2021-03-05 20:02:06'),(14,1,5,'MYSQL','2021-03-10 21:07:55','2021-03-10 21:07:55'),(15,1,5,'ORACLE','2021-03-10 21:10:05','2021-03-10 21:10:05'),(16,1,5,'SQLSERVER','2021-03-10 21:15:26','2021-03-10 21:15:26'),(17,1,1,'SYMFONY','2021-03-10 21:29:31','2021-03-10 21:29:31'),(18,1,1,'LARAVEL','2021-03-10 21:30:36','2021-03-10 21:30:36'),(19,1,1,'PRESTASHOP','2021-03-10 21:31:26','2021-03-10 21:31:26'),(20,1,1,'REACT','2021-03-10 21:32:39','2021-03-10 21:32:39'),(21,1,1,'REACT-NATIVE','2021-03-10 21:33:22','2021-03-10 21:33:22'),(22,1,3,'REPORTING','2021-03-10 21:35:09','2021-03-10 21:35:09'),(23,1,3,'MONDAY-COM','2021-03-10 21:36:20','2021-03-10 21:36:20'),(24,1,3,'GANTT','2021-03-10 21:37:50','2021-03-10 21:37:50'),(25,1,5,'MANGODB','2021-03-11 12:46:00','2021-03-11 12:46:00');
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
INSERT INTO `part_skills_lang` VALUES (1,1,'PHP','PHP Desc FR','2021-02-23 21:05:46','2021-02-23 21:05:46'),(1,2,'PHP','PHP Desc EN','2021-02-23 21:05:46','2021-02-23 21:05:46'),(2,1,'Javascript','Javascript FR','2021-02-24 13:44:23','2021-02-24 13:44:23'),(2,2,'Javascript','Javascript EN','2021-02-24 13:44:23','2021-02-24 13:44:23'),(3,1,'Python','Python desc','2021-02-24 15:25:08','2021-02-24 15:25:08'),(3,2,'Python','Python desc','2021-02-24 15:25:21','2021-02-24 15:25:21'),(4,1,'Management','','2021-02-28 12:34:35','2021-02-28 12:34:35'),(4,2,'Managment','','2021-02-28 12:34:35','2021-02-28 12:34:35'),(5,1,'Leadership','','2021-02-28 14:06:55','2021-02-28 14:06:55'),(5,2,'Leadership','','2021-02-28 14:06:55','2021-02-28 14:06:55'),(6,1,'Jira','','2021-02-28 14:23:01','2021-02-28 14:23:01'),(6,2,'Jira','','2021-02-28 14:23:01','2021-02-28 14:23:01'),(7,1,'Estimation','','2021-02-28 15:13:01','2021-02-28 15:13:01'),(7,2,'Estimating','','2021-02-28 15:13:01','2021-02-28 15:13:01'),(8,1,'AWS','Amazon Web Services','2021-02-28 15:22:27','2021-02-28 15:22:27'),(8,2,'AWS','Amazon Web Services','2021-02-28 15:22:27','2021-02-28 15:22:27'),(9,1,'Node.js','','2021-02-28 15:24:54','2021-02-28 15:24:54'),(9,2,'Node.js','','2021-02-28 15:24:54','2021-02-28 15:24:54'),(10,1,'Java','Java','2021-03-02 18:55:26','2021-03-02 18:55:26'),(10,2,'Java','','2021-03-02 18:55:26','2021-03-02 18:55:26'),(11,1,'SpringBoot','','2021-03-02 18:58:01','2021-03-02 18:58:01'),(11,2,'SpringBoot','','2021-03-02 18:58:01','2021-03-02 18:58:01'),(12,1,'Flutter',' ','2021-03-05 18:39:49','2021-03-05 18:39:49'),(12,2,'Flutter',' ','2021-03-05 18:39:49','2021-03-05 18:39:49'),(13,1,'GraphQL','GraphQL','2021-03-05 20:02:38','2021-03-05 20:02:38'),(13,2,'GraphQL','GraphQL','2021-03-05 20:02:38','2021-03-05 20:02:38'),(14,1,'MySQL','MySQL','2021-03-10 21:08:17','2021-03-10 21:08:17'),(14,2,'MySQL','MySQL','2021-03-10 21:08:17','2021-03-10 21:08:17'),(15,1,'Oracle','Oracle','2021-03-10 21:10:33','2021-03-10 21:10:33'),(15,2,'Oracle','Oracle','2021-03-10 21:10:33','2021-03-10 21:10:33'),(16,1,'SqlServer','SqlServer','2021-03-10 21:15:52','2021-03-10 21:15:52'),(16,2,'SqlServer','SqlServer','2021-03-10 21:15:52','2021-03-10 21:15:52'),(17,1,'Symfony','Symfony','2021-03-10 21:29:48','2021-03-10 21:29:48'),(17,2,'Symfony','Symfony','2021-03-10 21:29:48','2021-03-10 21:29:48'),(18,1,'Laravel','Laravel','2021-03-10 21:30:58','2021-03-10 21:30:58'),(18,2,'Laravel','Laravel','2021-03-10 21:30:58','2021-03-10 21:30:58'),(19,1,'Prestashop','Prestashop','2021-03-10 21:31:45','2021-03-10 21:31:45'),(19,2,'Prestashop','Prestashop','2021-03-10 21:31:45','2021-03-10 21:31:45'),(20,1,'React.js','React.js','2021-03-10 21:32:56','2021-03-10 21:32:56'),(20,2,'React.js','React.js','2021-03-10 21:32:56','2021-03-10 21:32:56'),(21,1,'React Native','React Native','2021-03-10 21:33:39','2021-03-10 21:33:39'),(21,2,'React Native','React Native','2021-03-10 21:33:39','2021-03-10 21:33:39'),(22,1,'Reporting','Reporting','2021-03-10 21:35:25','2021-03-10 21:35:25'),(22,2,'Reporting','Reporting','2021-03-10 21:35:25','2021-03-10 21:35:25'),(23,1,'Monday.com','Monday.com','2021-03-10 21:36:38','2021-03-10 21:36:38'),(23,2,'Monday.com','Monday.com','2021-03-10 21:36:38','2021-03-10 21:36:38'),(24,1,'Gantt','Gantt','2021-03-10 21:38:07','2021-03-10 21:38:07'),(24,2,'Gantt','Gantt','2021-03-10 21:38:07','2021-03-10 21:38:07'),(25,1,'MongoDB','MongoDB','2021-03-11 12:46:22','2021-03-11 12:46:22'),(25,2,'MongoDB','MongoDB','2021-03-11 12:46:22','2021-03-11 12:46:22');
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
-- Table structure for table `projects_group`
--

DROP TABLE IF EXISTS `projects_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_group` (
  `id` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp(6) NULL DEFAULT NULL,
  `date_update` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_group`
--

LOCK TABLES `projects_group` WRITE;
/*!40000 ALTER TABLE `projects_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_group_lang`
--

DROP TABLE IF EXISTS `projects_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_group_lang` (
  `id_project_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_project_group`,`id_lang`),
  UNIQUE KEY `id_project_group` (`id_project_group`,`id_lang`),
  KEY `projects_group_lang_id_lang` (`id_lang`),
  CONSTRAINT `projects_group_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `projects_group_lang_id_project_group` FOREIGN KEY (`id_project_group`) REFERENCES `projects_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_group_lang`
--

LOCK TABLES `projects_group_lang` WRITE;
/*!40000 ALTER TABLE `projects_group_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_group_lang` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills_group`
--

LOCK TABLES `skills_group` WRITE;
/*!40000 ALTER TABLE `skills_group` DISABLE KEYS */;
INSERT INTO `skills_group` VALUES (1,'TECHNO_TOOLS','2021-02-23 21:35:23','2021-02-23 21:35:23'),(2,'LANGUAGES','2021-02-24 15:23:26','2021-02-24 15:23:26'),(3,'PROJECT_MANAGMENT','2021-02-28 12:29:27','2021-02-28 12:29:27'),(4,'LEADERSHIP','2021-02-28 14:05:48','2021-02-28 14:05:48'),(5,'DATABASE','2021-03-10 21:06:56','2021-03-10 21:06:56');
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
INSERT INTO `skills_group_lang` VALUES (1,1,'Technologies / Outils','Software Knowledge Descr FR'),(1,2,'Technologies / Tools','Software Knowledge Descr EN'),(2,1,'Langages','Langages Desc'),(2,2,'Languages','Languages desc'),(3,1,'Gestion de projet',''),(3,2,'Project Managment',''),(4,1,'Leadership','Leadership desc fr'),(4,2,'Leadership','Leadership desc en'),(5,1,'Base de donn├⌐es','Base de donn├⌐es'),(5,2,'Database','Database');
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
INSERT INTO `socials_link` VALUES (1,'https://www.github.com/MahefaAbel','https://www.linkedin.com/in/mahefa-abel/','mahefa.ram','https://www.mahefa.pro',NULL);
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
INSERT INTO `users` VALUES (1,'abelmahefa@gmail.com','Razafinirina','Mahefa Abel','1994-07-21','+261 34 84 586 05','/public/Images/Users/1-mahefa-abel.png','2021-02-10 08:03:24','2021-02-10 08:03:24');
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

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(32) NOT NULL,
  `date_add` timestamp(1) NULL DEFAULT NULL,
  `date_update` timestamp(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES (1,'professsional_summary',NULL,NULL),(2,'education',NULL,NULL),(3,'experience',NULL,NULL),(4,'skills',NULL,NULL),(5,'works',NULL,NULL);
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words_lang`
--

DROP TABLE IF EXISTS `words_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `words_lang` (
  `id_words` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `value` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_words`,`id_lang`),
  KEY `words_lang_id_lang` (`id_lang`),
  CONSTRAINT `words_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `words_lang_id_words` FOREIGN KEY (`id_words`) REFERENCES `words` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words_lang`
--

LOCK TABLES `words_lang` WRITE;
/*!40000 ALTER TABLE `words_lang` DISABLE KEYS */;
INSERT INTO `words_lang` VALUES (1,1,'R├⌐sum├⌐'),(1,2,'Summary'),(2,1,'Education'),(2,2,'Education'),(3,1,'Exp├⌐rience'),(3,2,'Experience'),(4,1,'Comp├⌐tences'),(4,2,'Skills'),(5,1,'Travaux'),(5,2,'Works');
/*!40000 ALTER TABLE `words_lang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-13 18:15:53
