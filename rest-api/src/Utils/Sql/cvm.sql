-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 02 mars 2021 à 19:00
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cvm`
--
CREATE DATABASE IF NOT EXISTS `cvm` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cvm`;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0(Disable), 1(Enable)',
  `id_user` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `address_id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `enable`, `id_user`, `slug`, `date_add`, `date_update`) VALUES
(1, 1, 1, 'ANTETEZANAFOVOANY', '2021-02-21 15:07:55', '2021-02-21 15:07:55'),
(2, 1, 1, 'BERAVINA', '2021-02-21 15:08:22', '2021-02-21 15:08:22');

-- --------------------------------------------------------

--
-- Structure de la table `address_lang`
--

DROP TABLE IF EXISTS `address_lang`;
CREATE TABLE IF NOT EXISTS `address_lang` (
  `id_address` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `value` varchar(256) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_address`,`id_lang`),
  KEY `address_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `address_lang`
--

INSERT INTO `address_lang` (`id_address`, `id_lang`, `value`, `date_add`, `date_update`) VALUES
(1, 1, 'Lot 120M L Antentezanafovoany, Tananarive, Madagascar FR', '2021-02-21 15:23:29', '2021-02-21 15:23:29'),
(1, 2, 'Lot 120M L Antentezanafovoany, Tananarive, Madagascar EN', '2021-02-21 15:23:29', '2021-02-21 15:23:29'),
(2, 1, 'Lot 3305C/BA, Beravina Fianarantsoa, Madagascar FR', '2021-02-21 15:23:52', '2021-02-21 15:23:52'),
(2, 2, 'Lot 3305C/BA, Beravina Fianarantsoa, Madagascar EN', '2021-02-21 15:23:52', '2021-02-21 15:23:52');

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`id`, `slug`, `date_add`, `date_update`) VALUES
(1, 'ETECH', '2021-02-18 20:06:56', '2021-02-18 20:06:56'),
(2, 'FREELANCE', '2021-02-18 20:07:27', '2021-02-18 20:07:27');

-- --------------------------------------------------------

--
-- Structure de la table `companies_lang`
--

DROP TABLE IF EXISTS `companies_lang`;
CREATE TABLE IF NOT EXISTS `companies_lang` (
  `id_company` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_company`,`id_lang`),
  KEY `companies_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `companies_lang`
--

INSERT INTO `companies_lang` (`id_company`, `id_lang`, `name`, `description`, `date_add`, `date_update`) VALUES
(1, 1, 'eTech Consulting - Groupe ArkeUp', 'eTech Consulting - Groupe ArkeUp', '2021-02-21 16:57:50', '2021-02-21 16:57:50'),
(1, 2, 'eTech Consulting - ArkeUp Group', 'eTech Consulting - ArkeUp Group desc', '2021-02-27 21:45:22', '2021-02-27 21:45:22'),
(2, 1, 'Independant', 'Independant', '2021-02-21 16:59:18', '2021-02-21 16:59:18'),
(2, 2, 'Independent', 'Independent desc', '2021-02-27 21:45:22', '2021-02-27 21:45:22');

-- --------------------------------------------------------

--
-- Structure de la table `company_positions`
--

DROP TABLE IF EXISTS `company_positions`;
CREATE TABLE IF NOT EXISTS `company_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Positions for any companies';

--
-- Déchargement des données de la table `company_positions`
--

INSERT INTO `company_positions` (`id`, `slug`, `date_add`, `date_update`) VALUES
(1, 'dev-internship', '2021-02-24 18:49:13', '2021-02-24 18:49:01'),
(2, 'dev-junior', '2021-02-26 16:47:35', '2021-02-26 16:47:35'),
(3, 'dev-confirmed', '2021-02-27 08:50:00', '2021-02-27 08:50:34'),
(4, 'dev-senior', '2021-02-27 08:50:01', '2021-02-27 08:50:01');

-- --------------------------------------------------------

--
-- Structure de la table `company_positions_lang`
--

DROP TABLE IF EXISTS `company_positions_lang`;
CREATE TABLE IF NOT EXISTS `company_positions_lang` (
  `id_company_positions` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_company_positions`,`id_lang`),
  KEY `company_positions_lang.id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `company_positions_lang`
--

INSERT INTO `company_positions_lang` (`id_company_positions`, `id_lang`, `title`, `description`) VALUES
(1, 1, 'Stagiaire Developpeur', 'Stagiaire Developpeur desc'),
(1, 2, 'Developer Internship', 'Developer Internship desc'),
(2, 1, 'Développeur Junior', 'Développeur Junior Descr'),
(2, 2, 'Junior Developer', 'Junior Developer'),
(3, 1, 'Developpeur Confirmé', 'Developpeur Confirmé desc'),
(3, 2, 'Confirmed Developer', 'Confirmed Developer desc'),
(4, 1, 'Developpeur Senior', 'Developpeur Senior desc'),
(4, 2, 'Senior Developer', 'Senior Developer desc');

-- --------------------------------------------------------

--
-- Structure de la table `cv`
--

DROP TABLE IF EXISTS `cv`;
CREATE TABLE IF NOT EXISTS `cv` (
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
  KEY `cv.id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv`
--

INSERT INTO `cv` (`id`, `id_template`, `id_user`, `slug`, `id_address`, `date_add`, `date_update`) VALUES
(1, 1, 1, 'LEAD_TECHNICAL', 1, '2021-02-18 20:01:36', '2021-02-18 20:01:36'),
(2, 1, 1, 'DEV_PRESTASHOP', 1, '2021-02-18 20:08:12', '2021-02-18 20:08:12'),
(3, 1, 1, 'DEV_SYMFONY', 1, '2021-02-18 20:08:37', '2021-02-18 20:08:37'),
(4, 1, 1, 'DEV_LARAVEL', 1, '2021-02-18 20:09:10', '2021-02-18 20:09:10'),
(5, 1, 1, 'DEV_ECOMMERCE', 1, '2021-02-18 20:09:22', '2021-02-18 20:09:22'),
(6, 1, 1, 'DEV_BACKEND', 1, '2021-02-18 20:09:41', '2021-02-18 20:09:41'),
(7, 1, 1, 'DEV_FULLSTACK', 1, '2021-02-18 20:09:53', '2021-02-18 20:09:53');

-- --------------------------------------------------------

--
-- Structure de la table `cv_educations`
--

DROP TABLE IF EXISTS `cv_educations`;
CREATE TABLE IF NOT EXISTS `cv_educations` (
  `id_cv` int(11) NOT NULL,
  `id_education` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_education`),
  KEY `cv_educations.id_education` (`id_education`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv_educations`
--

INSERT INTO `cv_educations` (`id_cv`, `id_education`, `date_add`, `date_update`) VALUES
(1, 1, '2021-02-22 15:15:35', '2021-02-22 15:15:35'),
(1, 2, '2021-02-22 17:58:25', '2021-02-22 17:58:25');

-- --------------------------------------------------------

--
-- Structure de la table `cv_experiences`
--

DROP TABLE IF EXISTS `cv_experiences`;
CREATE TABLE IF NOT EXISTS `cv_experiences` (
  `id_cv` int(11) NOT NULL,
  `id_experience` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_experience`),
  KEY `cv_experiences.id_experience` (`id_experience`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv_experiences`
--

INSERT INTO `cv_experiences` (`id_cv`, `id_experience`, `date_add`, `date_update`) VALUES
(1, 1, '2021-02-24 18:54:28', '2021-02-24 18:54:28'),
(1, 2, '2021-02-26 16:53:35', '2021-02-26 16:53:35'),
(1, 3, '2021-02-27 10:09:40', '2021-02-27 10:09:40');

-- --------------------------------------------------------

--
-- Structure de la table `cv_lang`
--

DROP TABLE IF EXISTS `cv_lang`;
CREATE TABLE IF NOT EXISTS `cv_lang` (
  `id_cv` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title_backend` varchar(256) NOT NULL,
  `title_frontend` varchar(256) NOT NULL,
  `auto_biography` varchar(1024) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_lang`),
  KEY `cv_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv_lang`
--

INSERT INTO `cv_lang` (`id_cv`, `id_lang`, `title_backend`, `title_frontend`, `auto_biography`, `date_add`, `date_update`) VALUES
(1, 1, 'CV Lead Technique', 'Lead Technique', 'Ayant 4 ans d\'expérience en développement de logiciels professionnels dans les domaines des applications multiniveaux utilisant les technologies Java, J2EE comme les servlets, JSP, Struts, JDBC, Hibernate, XML et Oracle PL / SQL.\r\nmanaging people, it’s also managing projects, and managing a crisis', '2021-02-21 17:09:57', '2021-02-21 17:09:57'),
(1, 2, 'CV Technical Lead', 'Technical Lead', 'Having 4 years of strong professional software development experience in the areas of Multi-tier applications using Java, J2EE technologies like Servlets, JSP, Struts, JDBC, Hibernate, XML and Oracle PL/SQL.', '2021-02-21 17:09:57', '2021-02-21 17:09:57'),
(2, 1, 'CV Prestashop Developer', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR', '2021-02-21 17:45:34', '2021-02-21 17:45:34'),
(3, 1, 'CV Symfony Developer', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR', '2021-02-21 17:48:27', '2021-02-21 17:48:27'),
(4, 1, 'CV Laravel Developer', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR', '2021-02-21 17:48:42', '2021-02-21 17:48:42'),
(5, 1, 'CV eCommerce Developer', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR', '2021-02-21 17:48:54', '2021-02-21 17:48:54'),
(6, 1, 'CV Backend Developer', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR', '2021-02-21 17:49:07', '2021-02-21 17:49:07'),
(7, 1, 'CV Fullstack Developer', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus. FR', '2021-02-21 17:49:20', '2021-02-21 17:49:20');

-- --------------------------------------------------------

--
-- Structure de la table `cv_projects`
--

DROP TABLE IF EXISTS `cv_projects`;
CREATE TABLE IF NOT EXISTS `cv_projects` (
  `id_cv` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_project`),
  KEY `cv_projects.id_project` (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv_projects`
--

INSERT INTO `cv_projects` (`id_cv`, `id_project`, `date_add`, `date_update`) VALUES
(1, 1, '2021-02-28 09:25:08', '2021-02-28 09:25:08');

-- --------------------------------------------------------

--
-- Structure de la table `cv_skills`
--

DROP TABLE IF EXISTS `cv_skills`;
CREATE TABLE IF NOT EXISTS `cv_skills` (
  `id_cv` int(11) NOT NULL,
  `id_skills` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_skills`),
  KEY `cv_skills.id_skills` (`id_skills`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv_skills`
--

INSERT INTO `cv_skills` (`id_cv`, `id_skills`, `date_add`, `date_update`) VALUES
(1, 1, '2021-02-23 21:18:29', '2021-02-23 21:18:29'),
(1, 2, '2021-02-24 13:46:05', '2021-02-24 13:46:05'),
(1, 3, '2021-02-24 15:26:16', '2021-02-24 15:26:16'),
(1, 4, '2021-02-28 12:35:55', '2021-02-28 12:35:55'),
(1, 5, '2021-02-28 14:07:08', '2021-02-28 14:07:08'),
(1, 6, '2021-02-28 14:36:59', '2021-02-28 14:36:59'),
(1, 7, '2021-02-28 15:13:41', '2021-02-28 15:13:41'),
(1, 8, '2021-02-28 15:23:10', '2021-02-28 15:23:10'),
(1, 9, '2021-02-28 15:25:07', '2021-02-28 15:25:07'),
(1, 10, '2021-03-02 18:58:38', '2021-03-02 18:58:38'),
(1, 11, '2021-03-02 18:58:38', '2021-03-02 18:58:38');

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_iso` varchar(6) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_iso` (`code_iso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`id`, `code_iso`, `date_add`, `date_update`) VALUES
(1, 'FR', '2021-02-21 15:17:49', '2021-02-21 15:17:49'),
(2, 'EN', '2021-02-21 15:17:57', '2021-02-21 15:17:57'),
(3, 'DE', '2021-02-21 15:18:09', '2021-02-21 15:18:09');

-- --------------------------------------------------------

--
-- Structure de la table `languages_lang`
--

DROP TABLE IF EXISTS `languages_lang`;
CREATE TABLE IF NOT EXISTS `languages_lang` (
  `id_lang` int(11) NOT NULL,
  `id_lang_translate` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_lang`,`id_lang_translate`),
  KEY `languages_lang.id_lang_translate` (`id_lang_translate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `languages_lang`
--

INSERT INTO `languages_lang` (`id_lang`, `id_lang_translate`, `name`) VALUES
(1, 1, 'Francais'),
(1, 2, 'French'),
(2, 1, 'Anglais'),
(2, 2, 'English');

-- --------------------------------------------------------

--
-- Structure de la table `part_educations`
--

DROP TABLE IF EXISTS `part_educations`;
CREATE TABLE IF NOT EXISTS `part_educations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `part_educations.id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `part_educations`
--

INSERT INTO `part_educations` (`id`, `id_user`, `slug`, `date_begin`, `date_end`, `date_add`, `date_update`) VALUES
(1, 1, 'ENI_LICENCE', '2012-01-11', '2016-06-22', '2021-02-22 14:37:34', '2021-02-22 14:37:34'),
(2, 1, 'ENI_MASTER', '2014-09-15', '2016-02-05', '2021-02-22 17:57:22', '2021-02-22 17:57:22');

-- --------------------------------------------------------

--
-- Structure de la table `part_educations_lang`
--

DROP TABLE IF EXISTS `part_educations_lang`;
CREATE TABLE IF NOT EXISTS `part_educations_lang` (
  `id_part_educations` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(512) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_part_educations`,`id_lang`),
  KEY `part_educations_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `part_educations_lang`
--

INSERT INTO `part_educations_lang` (`id_part_educations`, `id_lang`, `title`, `description`, `date_add`, `date_update`) VALUES
(1, 1, 'Ecole Nationale de l\'Informatique, Madagascar', 'Licence en Science Informatique', '2021-02-22 14:38:19', '2021-02-22 14:38:19'),
(1, 2, 'National School of Computer Science, Madagascar', 'Bachelor of Computer Science', '2021-02-22 14:38:19', '2021-02-22 14:38:19'),
(2, 1, 'Ecole Nationale de l\'Informatique, Madagascar', 'Master en Science Informatique', '2021-02-22 17:57:48', '2021-02-22 17:57:48'),
(2, 2, 'National School of Computer Science, Madagascar', 'Master in Computer Science', '2021-02-22 17:57:48', '2021-02-22 17:57:48');

-- --------------------------------------------------------

--
-- Structure de la table `part_experiences`
--

DROP TABLE IF EXISTS `part_experiences`;
CREATE TABLE IF NOT EXISTS `part_experiences` (
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
  KEY `part_experiences.id_company_position` (`id_company_position`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='User presence in the company';

--
-- Déchargement des données de la table `part_experiences`
--

INSERT INTO `part_experiences` (`id`, `id_user`, `id_company`, `id_company_position`, `slug`, `date_begin`, `date_end`, `date_add`, `date_update`) VALUES
(1, 1, 1, 1, 'etech-intern-dev', '2016-06-08', '2016-12-08', '2021-02-24 18:49:44', '2021-02-24 18:49:44'),
(2, 1, 1, 2, 'etech-junior-dev', '2016-12-09', '2018-04-24', '2021-02-26 16:50:57', '2021-02-26 16:50:57'),
(3, 1, 2, 4, 'freelance-artizeo-dev-senior', '2019-08-02', '2020-11-05', '2021-02-27 10:05:15', '2021-02-27 10:05:15');

-- --------------------------------------------------------

--
-- Structure de la table `part_experiences_lang`
--

DROP TABLE IF EXISTS `part_experiences_lang`;
CREATE TABLE IF NOT EXISTS `part_experiences_lang` (
  `id_part_experiences` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id_part_experiences`,`id_lang`),
  KEY `part_experiences_lang.id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `part_experiences_lang`
--

INSERT INTO `part_experiences_lang` (`id_part_experiences`, `id_lang`, `description`) VALUES
(1, 1, 'Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere FR'),
(1, 2, 'Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere EN'),
(2, 1, 'Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere FR'),
(2, 2, 'Sed fermentum sollicitudin interdum. Etiam imperdiet sapien in dolor rhoncus a semper tortor posuere EN'),
(3, 1, '<ul>\r\n<li> Établit d\'excellentes relations de travail avec le personnel \"Marketing\" et \"RD & amp; E\" </li>\r\n<li> Est un \"excellent auditeur\" avec son manager, ses collègues, ses pairs et ses clients </li>\r\n<li> Travaille en étroite collaboration & amp; collabore bien avec le Sr. Tech Lead - South Rockies & amp; le Rocky Mt. Responsable technique régional </li>\r\n<li> Conduit / guide les \"Projets & amp; Travail de type RFP\" jusqu\'à leur achèvement - à temps / à chaque fois </li>\r\n<li> Un excellent \"communicateur QUOTIDIEN\" - pour les ventes, les clients, les représentants techniques, les pairs et amp; Gestionnaire </li>\r\n<li> Hiérarchisation des projets et / ou des travaux de type RFP dans les Rocheuses du Sud avec les ventes, les clients et amp; Représentants techniques - dirigez efficacement le trafic </li>\r\n<li> Conduit des \"feuilles de calcul de valeur\" hebdomadaires / trimestrielles à l\'achèvement et à la visibilité de l\'équipe de gestion des ventes dans la région </li>\r\n</ul>'),
(3, 2, '<ul>\r\n<li>Establishes excellent working relationships with both \"Marketing\" and \"RD &amp; E\" Personal</li>\r\n<li>Is an \"Excellent Listener\" with manager, co-workers, peers, and customers</li>\r\n<li>Works closely &amp; collaborates well with the Sr. Tech Lead - South Rockies &amp; the Rocky Mt. Regional Technical Manager</li>\r\n<li>Drives/Guides \"Projects &amp; RFP Type Work\" to completion - on time/every time</li>\r\n<li>An excellent \"DAILY Communicator\" - to Sales, Customers, Tech Reps, Peers, &amp; Manager</li>\r\n<li>Prioritization of Projects and/or RFP Type Work within the Southern Rockies with Sales, Customers, &amp; Technical Reps - efficiently direct traffic</li>\r\n<li>Drives weekly/quarterly \"Value Spreadsheets\" to completion and visibility to Sales Management Team in the Region</li>\r\n</ul>');

-- --------------------------------------------------------

--
-- Structure de la table `part_projects`
--

DROP TABLE IF EXISTS `part_projects`;
CREATE TABLE IF NOT EXISTS `part_projects` (
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
  KEY `part_projects.id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `part_projects`
--

INSERT INTO `part_projects` (`id`, `company_id`, `id_user`, `slug`, `show_in_portfolio`, `url_access`, `url_preview`, `date_begin`, `date_end`, `date_add`, `date_update`) VALUES
(1, 2, 1, 'PRB-API', 1, NULL, NULL, NULL, NULL, '2021-02-28 09:16:58', '2021-02-28 09:16:58');

-- --------------------------------------------------------

--
-- Structure de la table `part_projects_lang`
--

DROP TABLE IF EXISTS `part_projects_lang`;
CREATE TABLE IF NOT EXISTS `part_projects_lang` (
  `id_part_projects` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_part_projects`,`id_lang`),
  KEY `part_projects_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `part_projects_lang`
--

INSERT INTO `part_projects_lang` (`id_part_projects`, `id_lang`, `title`, `description`, `date_add`, `date_update`) VALUES
(1, 1, 'PRB - API reliant un site ecommerce prestashop et un base de donn&eacute;e des fournisseur ', '<p>Contexte:</p>\r\n<ul>\r\n<li>Partie IHM : HTML5, CSS3, jQuery</li>\r\n<li>Base de donn&eacute;es : MySql</li>\r\n<li>Framework : Prestashop / Laravel</li>\r\n<li>Gestion de codes sources avec Git (Clone/Branch/Pull/Merge/Gestion conflit)</li>\r\n<li>Mise en place de services web</li>\r\n<li>D&eacute;veloppement de plugin</li>\r\n<li>Mise en place syst&egrave;me de connecteur entre prestashop et les fournisseurs</li>\r\n</ul>\r\n<p><strong>ENVIRONNEMENT TECHNIQUE :</strong></p>\r\n<p>Prestashop, Laravel, XML, MySql, JQuery, JavaScript, Jira, Git, Confluence, API</p>', '2021-02-28 09:23:13', '2021-02-28 09:23:13'),
(1, 2, 'PRB - API connecting a prestashop ecommerce site and a supplier database', '<p> Context: </p>\r\n<ul>\r\n<li> GUI part: HTML5, CSS3, jQuery </li>\r\n<li> Database: MySql </li>\r\n<li> Framework: Prestashop / Laravel </li>\r\n<li> Source code management with Git (Clone / Branch / Pull / Merge / Conflict management) </li>\r\n<li> Setting up web services </li>\r\n<li> Plugin development </li>\r\n<li> Establishment of a connector system between prestashop and suppliers </li>\r\n</ul>\r\n<p> <strong> TECHNICAL ENVIRONMENT: </strong> </p>\r\n<p> Prestashop, Laravel, XML, MySql, JQuery, JavaScript, Jira, Git, Confluence, API </p>', '2021-02-28 09:23:13', '2021-02-28 09:23:13');

-- --------------------------------------------------------

--
-- Structure de la table `part_skills`
--

DROP TABLE IF EXISTS `part_skills`;
CREATE TABLE IF NOT EXISTS `part_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_skills_group` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `part_skills.id_user` (`id_user`),
  KEY `part_skills.id_skills_group` (`id_skills_group`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `part_skills`
--

INSERT INTO `part_skills` (`id`, `id_user`, `id_skills_group`, `slug`, `date_add`, `date_update`) VALUES
(1, 1, 2, 'PHP', '2021-02-23 21:04:18', '2021-02-23 21:04:18'),
(2, 1, 2, 'JS', '2021-02-24 13:43:52', '2021-02-24 13:43:52'),
(3, 1, 2, 'PYTHON', '2021-02-24 15:24:48', '2021-02-24 15:24:48'),
(4, 1, 3, 'MANAGMENT', '2021-02-28 12:32:39', '2021-02-28 12:32:39'),
(5, 1, 4, 'LEADERSHIP', '2021-02-28 14:06:34', '2021-02-28 14:06:34'),
(6, 1, 3, 'JIRA', '2021-02-28 14:21:15', '2021-02-28 14:21:15'),
(7, 1, 3, 'ESTIMATING', '2021-02-28 15:12:34', '2021-02-28 15:12:34'),
(8, 1, 1, 'AWS', '2021-02-28 15:21:48', '2021-02-28 15:21:48'),
(9, 1, 1, 'NODEJS', '2021-02-28 15:24:25', '2021-02-28 15:24:25'),
(10, 1, 2, 'JAVA', '2021-03-02 18:54:47', '2021-03-02 18:54:47'),
(11, 1, 1, 'SPRINGBOOT', '2021-03-02 18:56:34', '2021-03-02 18:56:34');

-- --------------------------------------------------------

--
-- Structure de la table `part_skills_lang`
--

DROP TABLE IF EXISTS `part_skills_lang`;
CREATE TABLE IF NOT EXISTS `part_skills_lang` (
  `id_part_skills` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(256) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_part_skills`,`id_lang`),
  KEY `part_skills_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `part_skills_lang`
--

INSERT INTO `part_skills_lang` (`id_part_skills`, `id_lang`, `title`, `description`, `date_add`, `date_update`) VALUES
(1, 1, 'PHP', 'PHP Desc FR', '2021-02-23 21:05:46', '2021-02-23 21:05:46'),
(1, 2, 'PHP', 'PHP Desc EN', '2021-02-23 21:05:46', '2021-02-23 21:05:46'),
(2, 1, 'Javascript', 'Javascript FR', '2021-02-24 13:44:23', '2021-02-24 13:44:23'),
(2, 2, 'Javascript', 'Javascript EN', '2021-02-24 13:44:23', '2021-02-24 13:44:23'),
(3, 1, 'Python', 'Python desc', '2021-02-24 15:25:08', '2021-02-24 15:25:08'),
(3, 2, 'Python', 'Python desc', '2021-02-24 15:25:21', '2021-02-24 15:25:21'),
(4, 1, 'Management', '', '2021-02-28 12:34:35', '2021-02-28 12:34:35'),
(4, 2, 'Managment', '', '2021-02-28 12:34:35', '2021-02-28 12:34:35'),
(5, 1, 'Leadership', '', '2021-02-28 14:06:55', '2021-02-28 14:06:55'),
(5, 2, 'Leadership', '', '2021-02-28 14:06:55', '2021-02-28 14:06:55'),
(6, 1, 'Jira', '', '2021-02-28 14:23:01', '2021-02-28 14:23:01'),
(6, 2, 'Jira', '', '2021-02-28 14:23:01', '2021-02-28 14:23:01'),
(7, 1, 'Estimation', '', '2021-02-28 15:13:01', '2021-02-28 15:13:01'),
(7, 2, 'Estimating', '', '2021-02-28 15:13:01', '2021-02-28 15:13:01'),
(8, 1, 'AWS', 'Amazon Web Services', '2021-02-28 15:22:27', '2021-02-28 15:22:27'),
(8, 2, 'AWS', 'Amazon Web Services', '2021-02-28 15:22:27', '2021-02-28 15:22:27'),
(9, 1, 'Node.js', '', '2021-02-28 15:24:54', '2021-02-28 15:24:54'),
(9, 2, 'Node.js', '', '2021-02-28 15:24:54', '2021-02-28 15:24:54'),
(10, 1, 'Java', 'Java', '2021-03-02 18:55:26', '2021-03-02 18:55:26'),
(10, 2, 'Java', '', '2021-03-02 18:55:26', '2021-03-02 18:55:26'),
(11, 1, 'SpringBoot', '', '2021-03-02 18:58:01', '2021-03-02 18:58:01'),
(11, 2, 'SpringBoot', '', '2021-03-02 18:58:01', '2021-03-02 18:58:01');

-- --------------------------------------------------------

--
-- Structure de la table `preferences_users`
--

DROP TABLE IF EXISTS `preferences_users`;
CREATE TABLE IF NOT EXISTS `preferences_users` (
  `user_id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `users_preferences_template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `skills_group`
--

DROP TABLE IF EXISTS `skills_group`;
CREATE TABLE IF NOT EXISTS `skills_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` char(128) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `skills_group`
--

INSERT INTO `skills_group` (`id`, `slug`, `date_add`, `date_update`) VALUES
(1, 'TECHNO_TOOLS', '2021-02-23 21:35:23', '2021-02-23 21:35:23'),
(2, 'LANGUAGES', '2021-02-24 15:23:26', '2021-02-24 15:23:26'),
(3, 'PROJECT_MANAGMENT', '2021-02-28 12:29:27', '2021-02-28 12:29:27'),
(4, 'LEADERSHIP', '2021-02-28 14:05:48', '2021-02-28 14:05:48');

-- --------------------------------------------------------

--
-- Structure de la table `skills_group_lang`
--

DROP TABLE IF EXISTS `skills_group_lang`;
CREATE TABLE IF NOT EXISTS `skills_group_lang` (
  `id_skills_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`id_skills_group`,`id_lang`),
  KEY `skills_group_lang.id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `skills_group_lang`
--

INSERT INTO `skills_group_lang` (`id_skills_group`, `id_lang`, `title`, `description`) VALUES
(1, 1, 'Technologies / Outils', 'Software Knowledge Descr FR'),
(1, 2, 'Technologies / Tools', 'Software Knowledge Descr EN'),
(2, 1, 'Langages', 'Langages Desc'),
(2, 2, 'Languages', 'Languages desc'),
(3, 1, 'Gestion de projet', ''),
(3, 2, 'Project Managment', ''),
(4, 1, 'Leadership', 'Leadership desc fr'),
(4, 2, 'Leadership', 'Leadership desc en');

-- --------------------------------------------------------

--
-- Structure de la table `skills_level`
--

DROP TABLE IF EXISTS `skills_level`;
CREATE TABLE IF NOT EXISTS `skills_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_skill` int(11) NOT NULL,
  `level_per_5` tinyint(4) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`,`id_skill`),
  KEY `skills_level_id_skill` (`id_skill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `socials_link`
--

DROP TABLE IF EXISTS `socials_link`;
CREATE TABLE IF NOT EXISTS `socials_link` (
  `user_id` int(11) NOT NULL,
  `github_url` varchar(256) DEFAULT NULL,
  `linkedin_url` varchar(256) DEFAULT NULL,
  `skype_id` varchar(64) DEFAULT NULL,
  `website_url` varchar(256) DEFAULT NULL,
  `zoom_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `socials_link`
--

INSERT INTO `socials_link` (`user_id`, `github_url`, `linkedin_url`, `skype_id`, `website_url`, `zoom_id`) VALUES
(1, 'https://github.com/MahefaAbel', 'https://www.linkedin.com/in/mahefa-abel/', 'mahefa.ram', 'http://mahefa.pro', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `templates`
--

DROP TABLE IF EXISTS `templates`;
CREATE TABLE IF NOT EXISTS `templates` (
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

--
-- Déchargement des données de la table `templates`
--

INSERT INTO `templates` (`id`, `name`, `description`, `contents`, `type`, `preview_url`, `date_add`, `date_update`) VALUES
(1, 'Simple CV, Black & White', 'Simple CV, Black & White', '', '', NULL, '2021-02-18 20:04:19', '2021-02-18 20:04:19');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
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

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `firstname`, `lastname`, `date_birth`, `phone`, `url_profile`, `date_add`, `date_update`) VALUES
(1, 'abelmahefa@gmail.com', 'Razafinirina', 'Mahefa Abel', '1994-07-21', '+261 34 84 586 05', '/public/Images/Users/1-mahefa-abel.jpeg', '2021-02-10 08:03:24', '2021-02-10 08:03:24');

-- --------------------------------------------------------

--
-- Structure de la table `users_lang`
--

DROP TABLE IF EXISTS `users_lang`;
CREATE TABLE IF NOT EXISTS `users_lang` (
  `id_user` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `auto_description` varchar(1024) NOT NULL,
  `auto_biography` varchar(1024) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`id_lang`),
  KEY `users_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users_lang`
--

INSERT INTO `users_lang` (`id_user`, `id_lang`, `auto_description`, `auto_biography`, `date_add`, `date_update`) VALUES
(1, 1, 'Lorem lupsum Desc FR', 'Lorem lupsum BIO FR', '2021-02-21 18:14:21', '2021-02-21 18:14:21'),
(1, 2, 'Lorem lupsum Desc EN', 'Lorem lupsum AutoBio EN', '2021-02-23 18:38:24', '2021-02-23 18:38:24');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `address_lang`
--
ALTER TABLE `address_lang`
  ADD CONSTRAINT `address_lang_id_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `address_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `companies_lang`
--
ALTER TABLE `companies_lang`
  ADD CONSTRAINT `companies_lang_id_company` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `companies_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `company_positions_lang`
--
ALTER TABLE `company_positions_lang`
  ADD CONSTRAINT `company_positions_lang.id_company_positions` FOREIGN KEY (`id_company_positions`) REFERENCES `company_positions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `company_positions_lang.id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv.id_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv.id_template` FOREIGN KEY (`id_template`) REFERENCES `templates` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv_educations`
--
ALTER TABLE `cv_educations`
  ADD CONSTRAINT `cv_educations.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_educations.id_education` FOREIGN KEY (`id_education`) REFERENCES `part_educations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv_experiences`
--
ALTER TABLE `cv_experiences`
  ADD CONSTRAINT `cv_experiences.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_experiences.id_experience` FOREIGN KEY (`id_experience`) REFERENCES `part_experiences` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv_lang`
--
ALTER TABLE `cv_lang`
  ADD CONSTRAINT `cv_lang_id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv_projects`
--
ALTER TABLE `cv_projects`
  ADD CONSTRAINT `cv_projects.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_projects.id_project` FOREIGN KEY (`id_project`) REFERENCES `part_projects` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv_skills`
--
ALTER TABLE `cv_skills`
  ADD CONSTRAINT `cv_skills.id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_skills.id_skills` FOREIGN KEY (`id_skills`) REFERENCES `part_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `languages_lang`
--
ALTER TABLE `languages_lang`
  ADD CONSTRAINT `languages_lang.id_lang_translate` FOREIGN KEY (`id_lang_translate`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `languages_langid_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_educations`
--
ALTER TABLE `part_educations`
  ADD CONSTRAINT `part_educations.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_educations_lang`
--
ALTER TABLE `part_educations_lang`
  ADD CONSTRAINT `part_educations_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_educations_lang_id_part_educations` FOREIGN KEY (`id_part_educations`) REFERENCES `part_educations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_experiences`
--
ALTER TABLE `part_experiences`
  ADD CONSTRAINT `part_experiences.id_company` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_experiences.id_company_position` FOREIGN KEY (`id_company_position`) REFERENCES `company_positions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_experiences.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_experiences_lang`
--
ALTER TABLE `part_experiences_lang`
  ADD CONSTRAINT `part_experiences_lang.id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_experiences_lang.id_part_experiences` FOREIGN KEY (`id_part_experiences`) REFERENCES `part_experiences` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_projects`
--
ALTER TABLE `part_projects`
  ADD CONSTRAINT `part_projects.company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_projects.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_projects_lang`
--
ALTER TABLE `part_projects_lang`
  ADD CONSTRAINT `part_projects_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_projects_lang_id_part_projects` FOREIGN KEY (`id_part_projects`) REFERENCES `part_projects` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_skills`
--
ALTER TABLE `part_skills`
  ADD CONSTRAINT `part_skills.id_skills_group` FOREIGN KEY (`id_skills_group`) REFERENCES `skills_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_skills.id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_skills_lang`
--
ALTER TABLE `part_skills_lang`
  ADD CONSTRAINT `part_skills_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_skills_lang_id_part_skills` FOREIGN KEY (`id_part_skills`) REFERENCES `part_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `preferences_users`
--
ALTER TABLE `preferences_users`
  ADD CONSTRAINT `users_preferences_template_id` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_preferences_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `skills_group_lang`
--
ALTER TABLE `skills_group_lang`
  ADD CONSTRAINT `skills_group_lang.id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `skills_group_lang.id_skills_group` FOREIGN KEY (`id_skills_group`) REFERENCES `skills_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `skills_level`
--
ALTER TABLE `skills_level`
  ADD CONSTRAINT `skills_level_id_skill` FOREIGN KEY (`id_skill`) REFERENCES `part_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `skills_level_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `socials_link`
--
ALTER TABLE `socials_link`
  ADD CONSTRAINT `socials_link_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_lang`
--
ALTER TABLE `users_lang`
  ADD CONSTRAINT `users_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_lang_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
