-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 28 avr. 2022 à 19:42
-- Version du serveur :  8.0.25-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `EtudiantEpsi`
--

-- --------------------------------------------------------

--
-- Structure de la table `Cours`
--

CREATE TABLE `Cours` (
  `idCours` int NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `ProfesseursEPSI_idProfesseursEPSI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Cours`
--

INSERT INTO `Cours` (`idCours`, `nom`, `ProfesseursEPSI_idProfesseursEPSI`) VALUES
(1, 'SQL', 2);

-- --------------------------------------------------------

--
-- Structure de la table `Cours_has_Etudiant`
--

CREATE TABLE `Cours_has_Etudiant` (
  `Cours_idCours` int NOT NULL,
  `Etudiant_numSecSocial` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Cours_has_Etudiant`
--

INSERT INTO `Cours_has_Etudiant` (`Cours_idCours`, `Etudiant_numSecSocial`) VALUES
(1, 1125445657);

-- --------------------------------------------------------

--
-- Structure de la table `Entreprise`
--

CREATE TABLE `Entreprise` (
  `idEntreprise` int NOT NULL,
  `nom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Entreprise`
--

INSERT INTO `Entreprise` (`idEntreprise`, `nom`) VALUES
(1, 'Atos'),
(2, 'ABCConseil'),
(3, 'Eformation');

-- --------------------------------------------------------

--
-- Structure de la table `EtablissementEpsi`
--

CREATE TABLE `EtablissementEpsi` (
  `numEtablissement` int NOT NULL,
  `nom` varchar(32) DEFAULT NULL,
  `codePostal` int DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `EtablissementEpsi`
--

INSERT INTO `EtablissementEpsi` (`numEtablissement`, `nom`, `codePostal`, `ville`) VALUES
(1, 'Epsi MTP', 34000, 'monptellier'),
(2, 'Epsi Paris', 75000, 'paris');

-- --------------------------------------------------------

--
-- Structure de la table `Etudiant`
--

CREATE TABLE `Etudiant` (
  `numSecSocial` int NOT NULL,
  `nom` varchar(32) DEFAULT NULL,
  `prenom` varchar(32) DEFAULT NULL,
  `anneeNaissance` int DEFAULT NULL,
  `EtablissementEpsi_numEtablissement` int NOT NULL,
  `Entreprise_idEntreprise` int NOT NULL,
  `salaire` double DEFAULT '2000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Etudiant`
--

INSERT INTO `Etudiant` (`numSecSocial`, `nom`, `prenom`, `anneeNaissance`, `EtablissementEpsi_numEtablissement`, `Entreprise_idEntreprise`, `salaire`) VALUES
(1, 'Vlade', 'Carmen', 1900, 1, 1, 2200),
(1125445657, 'dupond', 'jean', 2002, 1, 2, 2200),
(1125445658, 'marti', 'jeanne', 2003, 1, 2, 2200),
(1125445659, 'servant', 'antoine', 2002, 1, 3, 2200),
(1225445658, 'Dupont', 'Claine', 1996, 2, 2, 2200);

-- --------------------------------------------------------

--
-- Structure de la table `ProfesseursEPSI`
--

CREATE TABLE `ProfesseursEPSI` (
  `idProfesseursEPSI` int NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `EtablissementEpsi_numEtablissement` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ProfesseursEPSI`
--

INSERT INTO `ProfesseursEPSI` (`idProfesseursEPSI`, `nom`, `prenom`, `EtablissementEpsi_numEtablissement`) VALUES
(1, 'Mathieu', 'Frederique', 1),
(2, 'helene', 'durand', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD PRIMARY KEY (`idCours`),
  ADD KEY `fk_Cours_ProfesseursEPSI1_idx` (`ProfesseursEPSI_idProfesseursEPSI`);

--
-- Index pour la table `Cours_has_Etudiant`
--
ALTER TABLE `Cours_has_Etudiant`
  ADD PRIMARY KEY (`Cours_idCours`,`Etudiant_numSecSocial`),
  ADD KEY `fk_Cours_has_Etudiant_Etudiant1_idx` (`Etudiant_numSecSocial`),
  ADD KEY `fk_Cours_has_Etudiant_Cours1_idx` (`Cours_idCours`);

--
-- Index pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  ADD PRIMARY KEY (`idEntreprise`);

--
-- Index pour la table `EtablissementEpsi`
--
ALTER TABLE `EtablissementEpsi`
  ADD PRIMARY KEY (`numEtablissement`);

--
-- Index pour la table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD PRIMARY KEY (`numSecSocial`),
  ADD KEY `fk_Etudiant_EtablissementEpsi_idx` (`EtablissementEpsi_numEtablissement`),
  ADD KEY `fk_Etudiant_Entreprise1_idx` (`Entreprise_idEntreprise`);

--
-- Index pour la table `ProfesseursEPSI`
--
ALTER TABLE `ProfesseursEPSI`
  ADD PRIMARY KEY (`idProfesseursEPSI`),
  ADD KEY `fk_ProfesseursEPSI_EtablissementEpsi1_idx` (`EtablissementEpsi_numEtablissement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Cours`
--
ALTER TABLE `Cours`
  MODIFY `idCours` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Entreprise`
--
ALTER TABLE `Entreprise`
  MODIFY `idEntreprise` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ProfesseursEPSI`
--
ALTER TABLE `ProfesseursEPSI`
  MODIFY `idProfesseursEPSI` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD CONSTRAINT `fk_Cours_ProfesseursEPSI1` FOREIGN KEY (`ProfesseursEPSI_idProfesseursEPSI`) REFERENCES `ProfesseursEPSI` (`idProfesseursEPSI`);

--
-- Contraintes pour la table `Cours_has_Etudiant`
--
ALTER TABLE `Cours_has_Etudiant`
  ADD CONSTRAINT `fk_Cours_has_Etudiant_Cours1` FOREIGN KEY (`Cours_idCours`) REFERENCES `Cours` (`idCours`),
  ADD CONSTRAINT `fk_Cours_has_Etudiant_Etudiant1` FOREIGN KEY (`Etudiant_numSecSocial`) REFERENCES `Etudiant` (`numSecSocial`);

--
-- Contraintes pour la table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD CONSTRAINT `fk_Etudiant_Entreprise1` FOREIGN KEY (`Entreprise_idEntreprise`) REFERENCES `Entreprise` (`idEntreprise`),
  ADD CONSTRAINT `fk_Etudiant_EtablissementEpsi` FOREIGN KEY (`EtablissementEpsi_numEtablissement`) REFERENCES `EtablissementEpsi` (`numEtablissement`);

--
-- Contraintes pour la table `ProfesseursEPSI`
--
ALTER TABLE `ProfesseursEPSI`
  ADD CONSTRAINT `fk_ProfesseursEPSI_EtablissementEpsi1` FOREIGN KEY (`EtablissementEpsi_numEtablissement`) REFERENCES `EtablissementEpsi` (`numEtablissement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
