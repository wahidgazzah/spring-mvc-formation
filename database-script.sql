--
-- Base de données: `dihawdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `CITY`
--

CREATE TABLE IF NOT EXISTS `CITY` (
  `CITY_ID` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `CITY_NAME` varchar(10) DEFAULT NULL
);

--
-- Contenu de la table `CITY`
--

INSERT INTO `CITY` (`CITY_ID`, `CITY_NAME`) VALUES
(1, 'Tunis'),
(2, 'Sousse'),
(3, 'Monastir'),
(4, 'Msaken'),
(5, 'Sfax'),
(6, 'Bizerte');

-- --------------------------------------------------------

--
-- Structure de la table USERS
--

CREATE TABLE IF NOT EXISTS `USERS` (
  `ID` 					int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `EMAIL` 				varchar(50) NOT NULL,
  `PASSWORD` 			varchar(50) NOT NULL,
  `FIRST_NAME` 			varchar(10) NOT NULL,
  `USERNAME` 			varchar(10) NOT NULL,
  `LAST_CONNECTION` 	date DEFAULT NULL,
  `CREATION_DATE` 		date DEFAULT NULL,
  `GENDER` 				varchar(10) NOT NULL,
  `CITY_ID` 			int(10) NOT NULL,
  `STATUS`				varchar(10) NOT NULL,
  `ACCOUNT_NON_EXPIRED` int(11) NOT NULL DEFAULT '1',
  `ACCOUNT_NON_LOKED` 	int(11) NOT NULL DEFAULT '1',
  `CREDENTIALS_NON_EXPIRED` int(11) NOT NULL DEFAULT '1',
  FOREIGN KEY (CITY_ID) REFERENCES CITY(CITY_ID)
);

--
-- Structure de la table USER_AUTHORIZATION
--

CREATE TABLE IF NOT EXISTS `USER_AUTHORIZATION` (
  `USER_ROLE_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `USER_ID` int(10) DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL,
  FOREIGN KEY (USER_ID) REFERENCES USERS(ID)
);

--
-- Structure de la table `USER_ATTEMPTS`
--

CREATE TABLE IF NOT EXISTS `USER_ATTEMPTS` (
  `ID` 				int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `USERNAME` 		varchar(45) NOT NULL,
  `ATTEMPTS` 		int(11) NOT NULL,
  `LAST_MODIFIED` 	datetime NOT NULL
);

--
-- Contenu de la table USERS
--

INSERT INTO `USERS` (`ID`, `EMAIL`, `PASSWORD`, `FIRST_NAME`, `USERNAME`, `LAST_CONNECTION`, `CREATION_DATE`, `GENDER`, `CITY_ID`, `STATUS`,`ACCOUNT_NON_EXPIRED`, `ACCOUNT_NON_LOKED`, `CREDENTIALS_NON_EXPIRED`) VALUES
	(1, 'admin@email.com', 'password', 'admin', 'admin',  '2015-03-25', '2015-03-26', 'Male', 4, 'Enabled', 1, 1, 1),
	(2, 'user@email.com', 'password', 'user', 'user', '2015-03-26', '2015-03-30', 'Male', 3, 'Enabled', 1, 1, 1),
	(3, 'wahid@email.com', 'password', 'wahid', 'Gazzah', '2015-03-27', NULL, 'Male', 4, 'Enabled', 1, 1, 1),
	(4, 'test@email.com', 'password', 'test', 'test', '2015-03-27', NULL, 'Male', 5, 'Enabled', 1, 1, 1);

--
-- Contenu de la table USER_AUTHORIZATION
--

INSERT INTO `USER_AUTHORIZATION` (`USER_ROLE_ID`, `USER_ID`, `ROLE`) VALUES
	(1, 1, 'ROLE_ADMIN'),
	(2, 2, 'ROLE_USER'),
	(3, 3, 'ROLE_ADMIN');
	
	
	
