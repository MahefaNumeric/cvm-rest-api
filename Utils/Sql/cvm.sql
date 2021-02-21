-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 21 fév. 2021 à 20:31
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
(1, 1, 'Lot 120M L Antentezanafovoany, Tananarive, Madagascar', '2021-02-21 15:23:29', '2021-02-21 15:23:29'),
(2, 1, 'Lot 3305C/BA, Beravina Fianarantsoa, Madagascar', '2021-02-21 15:23:52', '2021-02-21 15:23:52');

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
(2, 1, 'Independant', 'Independant', '2021-02-21 16:59:18', '2021-02-21 16:59:18');

-- --------------------------------------------------------

--
-- Structure de la table `cv`
--

DROP TABLE IF EXISTS `cv`;
CREATE TABLE IF NOT EXISTS `cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_template` int(11) DEFAULT NULL,
  `slug` varchar(64) NOT NULL,
  `id_address` int(11) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cv_id_template` (`id_template`),
  KEY `cv_id_address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv`
--

INSERT INTO `cv` (`id`, `id_template`, `slug`, `id_address`, `date_add`, `date_update`) VALUES
(1, 1, 'LEAD_TECHNICAL', 1, '2021-02-18 20:01:36', '2021-02-18 20:01:36'),
(2, 1, 'DEV_PRESTASHOP', 1, '2021-02-18 20:08:12', '2021-02-18 20:08:12'),
(3, 1, 'DEV_SYMFONY', 1, '2021-02-18 20:08:37', '2021-02-18 20:08:37'),
(4, 1, 'DEV_LARAVEL', 1, '2021-02-18 20:09:10', '2021-02-18 20:09:10'),
(5, 1, 'DEV_ECOMMERCE', 1, '2021-02-18 20:09:22', '2021-02-18 20:09:22'),
(6, 1, 'DEV_BACKEND', 1, '2021-02-18 20:09:41', '2021-02-18 20:09:41'),
(7, 1, 'DEV_FULLSTACK', 1, '2021-02-18 20:09:53', '2021-02-18 20:09:53');

-- --------------------------------------------------------

--
-- Structure de la table `cv_educations`
--

DROP TABLE IF EXISTS `cv_educations`;
CREATE TABLE IF NOT EXISTS `cv_educations` (
  `id_cv` int(11) NOT NULL,
  `id_users_education` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_users_education`),
  KEY `cv_educations_id_users_education` (`id_users_education`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cv_experiences`
--

DROP TABLE IF EXISTS `cv_experiences`;
CREATE TABLE IF NOT EXISTS `cv_experiences` (
  `id_cv` int(11) NOT NULL,
  `id_users_experience` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_users_experience`),
  KEY `cv_experiences_id_users_experience` (`id_users_experience`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cv_lang`
--

DROP TABLE IF EXISTS `cv_lang`;
CREATE TABLE IF NOT EXISTS `cv_lang` (
  `id_cv` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `auto_biography` varchar(1024) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_lang`),
  KEY `cv_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv_lang`
--

INSERT INTO `cv_lang` (`id_cv`, `id_lang`, `title`, `auto_biography`, `date_add`, `date_update`) VALUES
(1, 1, 'CV Lead Technique', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus.', '2021-02-21 17:09:57', '2021-02-21 17:09:57'),
(2, 1, 'CV Prestashop Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus.', '2021-02-21 17:45:34', '2021-02-21 17:45:34'),
(3, 1, 'CV Symfony Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus.', '2021-02-21 17:48:27', '2021-02-21 17:48:27'),
(4, 1, 'CV Laravel Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus.', '2021-02-21 17:48:42', '2021-02-21 17:48:42'),
(5, 1, 'CV eCommerce Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus.', '2021-02-21 17:48:54', '2021-02-21 17:48:54'),
(6, 1, 'CV Backend Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus.', '2021-02-21 17:49:07', '2021-02-21 17:49:07'),
(7, 1, 'CV Fullstack Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim viverra nibh sed varius. Proin bibendum nunc in sem ultrices posuere. Aliquam ut aliquam lacus.', '2021-02-21 17:49:20', '2021-02-21 17:49:20');

-- --------------------------------------------------------

--
-- Structure de la table `cv_projects`
--

DROP TABLE IF EXISTS `cv_projects`;
CREATE TABLE IF NOT EXISTS `cv_projects` (
  `id_cv` int(11) NOT NULL,
  `id_users_project` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_users_project`),
  KEY `cv_projects_id_users_project` (`id_users_project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cv_skills`
--

DROP TABLE IF EXISTS `cv_skills`;
CREATE TABLE IF NOT EXISTS `cv_skills` (
  `id_cv` int(11) NOT NULL,
  `id_users_skills` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cv`,`id_users_skills`),
  KEY `cv_skills_id_users_skills` (`id_users_skills`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `code_iso` varchar(6) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code_iso`, `date_add`, `date_update`) VALUES
(1, 'Francais', 'FR', '2021-02-21 15:17:49', '2021-02-21 15:17:49'),
(2, 'English', 'EN', '2021-02-21 15:17:57', '2021-02-21 15:17:57'),
(3, 'Deutch', 'DE', '2021-02-21 15:18:09', '2021-02-21 15:18:09');

-- --------------------------------------------------------

--
-- Structure de la table `part_educations`
--

DROP TABLE IF EXISTS `part_educations`;
CREATE TABLE IF NOT EXISTS `part_educations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(128) NOT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Structure de la table `part_experiences`
--

DROP TABLE IF EXISTS `part_experiences`;
CREATE TABLE IF NOT EXISTS `part_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_company` int(11) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `part_experiences_id_company` (`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `part_experiences_lang`
--

DROP TABLE IF EXISTS `part_experiences_lang`;
CREATE TABLE IF NOT EXISTS `part_experiences_lang` (
  `id_part_experiences` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(256) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_part_experiences`,`id_lang`),
  KEY `part_experiences_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `part_projects`
--

DROP TABLE IF EXISTS `part_projects`;
CREATE TABLE IF NOT EXISTS `part_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `show_in_portfolio` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0|1',
  `url_access` varchar(256) DEFAULT NULL,
  `url_preview` varchar(256) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `part_projects_lang`
--

DROP TABLE IF EXISTS `part_projects_lang`;
CREATE TABLE IF NOT EXISTS `part_projects_lang` (
  `id_part_projects` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(256) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_part_projects`,`id_lang`),
  KEY `part_projects_lang_id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `part_skills`
--

DROP TABLE IF EXISTS `part_skills`;
CREATE TABLE IF NOT EXISTS `part_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'https://github.com/MahefaAbel', 'https://www.linkedin.com/in/mahefa-abel/', 'mahefa.ram', 'http://mahefa.pro/', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `firstname`, `lastname`, `date_birth`, `phone`, `date_add`, `date_update`) VALUES
(1, 'abelmahefa@gmail.com', 'Razafinirina', 'Mahefa Abel', '1994-07-21', '+261 34 84 586 05', '2021-02-10 08:03:24', '2021-02-10 08:03:24');

-- --------------------------------------------------------

--
-- Structure de la table `users_companies`
--

DROP TABLE IF EXISTS `users_companies`;
CREATE TABLE IF NOT EXISTS `users_companies` (
  `id_company` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `users_companies_id_company` (`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users_educations`
--

DROP TABLE IF EXISTS `users_educations`;
CREATE TABLE IF NOT EXISTS `users_educations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_education` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_educations_unique_key` (`id_user`,`id_education`) USING BTREE,
  KEY `users_educations_id_education` (`id_education`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users_experiences`
--

DROP TABLE IF EXISTS `users_experiences`;
CREATE TABLE IF NOT EXISTS `users_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_experience` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_experiences_unique` (`id_user`,`id_experience`) USING BTREE,
  KEY `users_experiences_id_experience` (`id_experience`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 1, 'Lorem lupsum Desc', 'Lorem lupsum BIO', '2021-02-21 18:14:21', '2021-02-21 18:14:21');

-- --------------------------------------------------------

--
-- Structure de la table `users_projects`
--

DROP TABLE IF EXISTS `users_projects`;
CREATE TABLE IF NOT EXISTS `users_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_projects_unique` (`id_user`,`id_project`) USING BTREE,
  KEY `users_projects_id_project` (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users_skills`
--

DROP TABLE IF EXISTS `users_skills`;
CREATE TABLE IF NOT EXISTS `users_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_skills` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_skills_unique` (`id_user`,`id_skills`) USING BTREE,
  KEY `users_skills_id_skills` (`id_skills`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Contraintes pour la table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `cv_id_address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_id_template` FOREIGN KEY (`id_template`) REFERENCES `templates` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv_educations`
--
ALTER TABLE `cv_educations`
  ADD CONSTRAINT `cv_educations_id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_educations_id_users_education` FOREIGN KEY (`id_users_education`) REFERENCES `users_educations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv_experiences`
--
ALTER TABLE `cv_experiences`
  ADD CONSTRAINT `cv_experiences_id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_experiences_id_users_experience` FOREIGN KEY (`id_users_experience`) REFERENCES `users_experiences` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `cv_projects_id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_projects_id_users_project` FOREIGN KEY (`id_users_project`) REFERENCES `users_projects` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cv_skills`
--
ALTER TABLE `cv_skills`
  ADD CONSTRAINT `cv_skills_id_cv` FOREIGN KEY (`id_cv`) REFERENCES `cv` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cv_skills_id_users_skills` FOREIGN KEY (`id_users_skills`) REFERENCES `users_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `part_experiences_id_company` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_experiences_lang`
--
ALTER TABLE `part_experiences_lang`
  ADD CONSTRAINT `part_experiences_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_experiences_lang_id_part_experiences` FOREIGN KEY (`id_part_experiences`) REFERENCES `part_experiences` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_projects`
--
ALTER TABLE `part_projects`
  ADD CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_projects_lang`
--
ALTER TABLE `part_projects_lang`
  ADD CONSTRAINT `part_projects_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `part_projects_lang_id_part_projects` FOREIGN KEY (`id_part_projects`) REFERENCES `part_projects` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
-- Contraintes pour la table `users_companies`
--
ALTER TABLE `users_companies`
  ADD CONSTRAINT `users_companies_id_company` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_educations`
--
ALTER TABLE `users_educations`
  ADD CONSTRAINT `users_educations_id_education` FOREIGN KEY (`id_education`) REFERENCES `users_educations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_educations_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_experiences`
--
ALTER TABLE `users_experiences`
  ADD CONSTRAINT `users_experiences_id_experience` FOREIGN KEY (`id_experience`) REFERENCES `users_experiences` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_experiences_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_lang`
--
ALTER TABLE `users_lang`
  ADD CONSTRAINT `users_lang_id_lang` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_lang_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_projects`
--
ALTER TABLE `users_projects`
  ADD CONSTRAINT `users_projects_id_project` FOREIGN KEY (`id_project`) REFERENCES `part_projects` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_projects_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users_skills`
--
ALTER TABLE `users_skills`
  ADD CONSTRAINT `users_skills_id_skills` FOREIGN KEY (`id_skills`) REFERENCES `part_skills` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_skills_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
