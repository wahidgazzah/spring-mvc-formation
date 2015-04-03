-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Ven 03 Avril 2015 à 16:07
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dihawdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `CITY_ID` int(10) NOT NULL AUTO_INCREMENT,
  `CITY_NAME` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CITY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `city`
--

INSERT INTO `city` (`CITY_ID`, `CITY_NAME`) VALUES
(1, 'Tunis'),
(2, 'Sousse'),
(3, 'Monastir'),
(4, 'Msaken'),
(5, 'Sfax'),
(6, 'Bizerte');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3580769128426C` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `role`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 3),
(4, 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `FIRST_NAME` varchar(10) NOT NULL,
  `USERNAME` varchar(10) NOT NULL,
  `LAST_CONNECTION` date DEFAULT NULL,
  `CREATION_DATE` date DEFAULT NULL,
  `GENDER` varchar(10) NOT NULL,
  `CITY_ID` int(10) NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  `ACCOUNT_NON_EXPIRED` int(11) NOT NULL DEFAULT '1',
  `ACCOUNT_NON_LOKED` int(11) NOT NULL DEFAULT '1',
  `CREDENTIALS_NON_EXPIRED` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `CITY_ID` (`CITY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID`, `EMAIL`, `PASSWORD`, `FIRST_NAME`, `USERNAME`, `LAST_CONNECTION`, `CREATION_DATE`, `GENDER`, `CITY_ID`, `STATUS`, `ACCOUNT_NON_EXPIRED`, `ACCOUNT_NON_LOKED`, `CREDENTIALS_NON_EXPIRED`) VALUES
(1, 'admin@email.com', 'password', 'admin', 'admin', '2015-03-25', '2015-03-26', 'Male', 4, 'Enabled', 1, 1, 1),
(2, 'user@email.com', 'password', 'user', 'user', '2015-03-26', '2015-03-30', 'Male', 3, 'Enabled', 1, 1, 1),
(3, 'wahid@email.com', 'password', 'wahid', 'wahid', '2015-03-27', NULL, 'Male', 4, 'Enabled', 1, 1, 1),
(6, 'test@email.com', 'password', 'test', 'wahid', NULL, NULL, 'Female', 4, 'Disabled', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_attempts`
--

CREATE TABLE IF NOT EXISTS `user_attempts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `ATTEMPTS` int(11) NOT NULL,
  `LAST_MODIFIED` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `user_attempts`
--


-- --------------------------------------------------------

--
-- Structure de la table `user_authorization`
--

CREATE TABLE IF NOT EXISTS `user_authorization` (
  `USER_ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `user_authorization`
--

INSERT INTO `user_authorization` (`USER_ROLE_ID`, `USER_ID`, `ROLE`) VALUES
(1, 1, 'ROLE_ADMIN'),
(2, 2, 'ROLE_USER'),
(3, 3, 'ROLE_ADMIN');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`);

--
-- Contraintes pour la table `user_authorization`
--
ALTER TABLE `user_authorization`
  ADD CONSTRAINT `user_authorization_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`);
