-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 31 Mars 2015 à 16:31
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `userdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(10) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Tunis'),
(2, 'Sousse'),
(3, 'Monastir'),
(4, 'Msaken'),
(5, 'Sfax'),
(6, 'Bizerte');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `city_id` int(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `gender`, `city_id`) VALUES
(1, 'Wahid', 'Gazzah', 'Male', 4),
(2, 'Sadok', 'Rouis', 'Male', 4),
(3, 'Wael', 'Boukadida', 'Male', 1),
(4, 'Amin', 'Bergiga', 'Male', 3),
(5, 'Hammed', 'Majouri', 'Male', 2),
(6, 'Oussama', 'Boudhri', 'Male', 3),
(7, 'Khadija', 'Ben Salah', 'Female', 1),
(8, 'Zakariya', 'Abd Allah', 'Male', 5),
(12, 'Mohamed', 'Ben Salah', 'Male', 4);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(30) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `FIRST_NAME` varchar(10) NOT NULL,
  `LAST_NAME` varchar(10) NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `LAST_CONNECTION` date DEFAULT NULL,
  `CREATION_DATE` date DEFAULT NULL,
  `GENDER` varchar(10) NOT NULL,
  `CITY_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID`, `EMAIL`, `PASSWORD`, `FIRST_NAME`, `LAST_NAME`, `STATUS`, `LAST_CONNECTION`, `CREATION_DATE`, `GENDER`, `CITY_ID`) VALUES
(1, 'admin@emai', '09e4c1f52343b51a5c92211a29bcb2144c25b27d', 'admin', 'admin', 'Enabled', '2015-03-26', '2015-03-26', 'Male', 4),
(2, 'user@email', '09e4c1f52343b51a5c92211a29bcb2144c25b27d', 'user', 'user', 'Enabled', '2015-03-25', '2015-03-30', 'Male', 3),
(4, 'wahid@em', 'password', 'wahid', 'Gazzah', 'Disabled', NULL, NULL, 'Male', 4),
(5, 'test@email.com', 'password', 'test', 'test', 'Enabled', NULL, NULL, 'Male', 5);

-- --------------------------------------------------------

--
-- Structure de la table `user_authentication`
--

CREATE TABLE IF NOT EXISTS `user_authentication` (
  `USER_ID` int(11) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_authentication`
--

INSERT INTO `user_authentication` (`USER_ID`, `USERNAME`, `PASSWORD`, `ENABLED`) VALUES
(1, 'admin', 'password', 1),
(2, 'user', 'password', 1),
(4, 'wahid', 'password', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_authorization`
--

CREATE TABLE IF NOT EXISTS `user_authorization` (
  `USER_ROLE_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_authorization`
--

INSERT INTO `user_authorization` (`USER_ROLE_ID`, `USER_ID`, `ROLE`) VALUES
(1, 1, 'ROLE_ADMIN'),
(2, 2, 'ROLE_USER'),
(3, 4, 'ROLE');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);
