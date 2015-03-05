--
-- Base de donn�es: 'userdb'
--

-- --------------------------------------------------------

--
-- Structure de la table 'city'
--

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `city_name` varchar(10) DEFAULT NULL
);

--
-- Contenu de la table 'city'
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
-- Structure de la table 'user'
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `city_id` int(10) NOT NULL,
  FOREIGN KEY (city_id) REFERENCES city(city_id)
  );

--
-- Contenu de la table 'user'
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `gender`, `city_id`) VALUES
(1, 'Wahid', 'Gazzah', 'Male', 4),
(2, 'Sadok', 'Rouis', 'Male', 4),
(3, 'Wael', 'Boukadida', 'Male', 1),
(4, 'Amin', 'Bergiga', 'Male', 3),
(5, 'Hammed', 'Majouri', 'Male', 1),
(6, 'Oussama', 'Boudhri', 'Male', 3),
(7, 'Khadija', 'Ben Salah', 'Female', 1),
(8, 'Zakariya', 'Abd Allah', 'Male', 5);
