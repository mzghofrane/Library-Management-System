-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 31 mai 2023 à 10:00
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bib`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

CREATE TABLE `abonne` (
  `idab` int(11) NOT NULL,
  `nomab` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `abonne`
--

INSERT INTO `abonne` (`idab`, `nomab`) VALUES
(1, 'TARGOTO CHRISTIAN'),
(2, 'NGARKIRA HYACINTHE'),
(3, 'KOURABE YVES'),
(4, 'ZENABA YOUNOUS'),
(5, 'FATIME DAGO'),
(6, 'JEANNINE ROUTOUANG'),
(7, 'RAISSA BETEL');

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `idab` int(11) NOT NULL,
  `idlivre` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`idab`, `idlivre`) VALUES
(1, 1),
(1, 2),
(4, 8),
(5, 2),
(5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `idlivre` int(11) NOT NULL,
  `titre` varchar(90) NOT NULL,
  `autheur` varchar(50) DEFAULT NULL,
  `disponible` varchar(10) NOT NULL DEFAULT 'OUI',
  `idabonne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`idlivre`, `titre`, `autheur`, `disponible`, `idabonne`) VALUES
(1, 'Les mains sales', NULL, 'NON', NULL),
(2, 'Tragedie', NULL, 'NON', NULL),
(3, 'le soleil des independance', NULL, 'OUI', NULL),
(4, 'Republique à vendre', NULL, 'OUI', NULL),
(5, 'Tartarin de Tarascon', NULL, 'OUI', 4),
(6, 'Etudiant de soweto', NULL, 'OUI', 5),
(7, 'une vie de boy', NULL, 'OUI', NULL),
(8, 'call me', NULL, 'NON', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `pret`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `pret` (
`idlivre` int(11)
,`titre` varchar(90)
,`nomab` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure de la vue `pret`
--
DROP TABLE IF EXISTS `pret`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pret`  AS SELECT `livre`.`idlivre` AS `idlivre`, `livre`.`titre` AS `titre`, `abonne`.`nomab` AS `nomab` FROM (`livre` join `abonne` on(`livre`.`idabonne` = `abonne`.`idab`)) WHERE `livre`.`disponible` = 'NON\'NON''NON\'NON'  ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonne`
--
ALTER TABLE `abonne`
  ADD PRIMARY KEY (`idab`);

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`idab`,`idlivre`),
  ADD KEY `fk_constraint_livre` (`idlivre`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`idlivre`),
  ADD KEY `fk1` (`idabonne`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `fk_constraint_abonne` FOREIGN KEY (`idab`) REFERENCES `abonne` (`idab`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_constraint_livre` FOREIGN KEY (`idlivre`) REFERENCES `livre` (`idlivre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`idabonne`) REFERENCES `abonne` (`idab`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
