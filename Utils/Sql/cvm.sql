-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 18 fév. 2021 à 20:28
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
-- Structure de la table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`id`, `name`, `description`, `date_add`, `date_update`) VALUES
(1, 'eTech Consulting - Groupe ArkeUp', 'eTech Consulting - Groupe ArkeUp', '2021-02-18 20:06:56', '2021-02-18 20:06:56'),
(2, 'Independant', 'Independant', '2021-02-18 20:07:27', '2021-02-18 20:07:27');

-- --------------------------------------------------------

--
-- Structure de la table `cv`
--

DROP TABLE IF EXISTS `cv`;
CREATE TABLE IF NOT EXISTS `cv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_template` int(11) DEFAULT NULL,
  `title` varchar(68) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cv_id_template` (`id_template`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cv`
--

INSERT INTO `cv` (`id`, `id_template`, `title`, `date_add`, `date_update`) VALUES
(1, 1, 'CV Lead Technique', '2021-02-18 20:01:36', '2021-02-18 20:01:36'),
(2, 1, 'CV Prestashop Developer', '2021-02-18 20:08:12', '2021-02-18 20:08:12'),
(3, 1, 'CV Symfony Developer', '2021-02-18 20:08:37', '2021-02-18 20:08:37'),
(4, 1, 'CV Laravel Developer', '2021-02-18 20:09:10', '2021-02-18 20:09:10'),
(5, 1, 'CV eCommerce Developer', '2021-02-18 20:09:22', '2021-02-18 20:09:22'),
(6, 1, 'CV Backend Developer', '2021-02-18 20:09:41', '2021-02-18 20:09:41'),
(7, 1, 'CV Fullstack Developer', '2021-02-18 20:09:53', '2021-02-18 20:09:53');

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
-- Structure de la table `part_educations`
--

DROP TABLE IF EXISTS `part_educations`;
CREATE TABLE IF NOT EXISTS `part_educations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `part_experiences`
--

DROP TABLE IF EXISTS `part_experiences`;
CREATE TABLE IF NOT EXISTS `part_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_company` int(11) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `part_experiences_id_company` (`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `part_projects`
--

DROP TABLE IF EXISTS `part_projects`;
CREATE TABLE IF NOT EXISTS `part_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `part_skills`
--

DROP TABLE IF EXISTS `part_skills`;
CREATE TABLE IF NOT EXISTS `part_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(48) NOT NULL,
  `description` varchar(128) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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

-- --------------------------------------------------------

--
-- Structure de la table `templates`
--

DROP TABLE IF EXISTS `templates`;
CREATE TABLE IF NOT EXISTS `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `preview_url` varchar(128) DEFAULT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `templates`
--

INSERT INTO `templates` (`id`, `name`, `description`, `preview_url`, `date_add`, `date_update`) VALUES
(1, 'Simple CV, Black & White', 'Simple CV, Black & White', NULL, '2021-02-18 20:04:19', '2021-02-18 20:04:19');

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
  `auto_desc` text NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `firstname`, `lastname`, `date_birth`, `auto_desc`, `date_add`, `date_update`) VALUES
(1, 'abelmahefa@gmail.com', 'Razafinirina', 'Mahefa Abel', '1994-07-21', 'Lorem lupsum', '2021-02-10 08:03:24', '2021-02-10 08:03:24');

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
-- Contraintes pour la table `cv`
--
ALTER TABLE `cv`
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
-- Contraintes pour la table `part_experiences`
--
ALTER TABLE `part_experiences`
  ADD CONSTRAINT `part_experiences_id_company` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `part_projects`
--
ALTER TABLE `part_projects`
  ADD CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

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
