-- ***************************************************
-- *
-- *        Assistant de configuration PC
-- *
-- ***************************************************
-- * Loris Gilliand, Mateo Tutic, Luc Wachter
-- * Groupe 8
-- * 07.01.2019
-- ***************************************************
-- * Le script ci-présent est divisé en trois parties
-- * La première partie crée la base de données et
-- * les differentes tables.
-- * La deuxième partie concerne les triggers.
-- * La troisième partie peuple la base de données.
-- ***************************************************

-- ***************************************************
-- * Partie 1 : Création de la base de données
-- ***************************************************

-- Database Section
-- ________________

DROP DATABASE IF EXISTS ACPC;
CREATE DATABASE ACPC;
USE ACPC;


-- Tables Section
-- _____________

CREATE TABLE Alimentation (
     noComposant INTEGER UNSIGNED AUTO_INCREMENT,
     puissance INTEGER NOT NULL,
     typeFacteurForme VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Alimentation PRIMARY KEY (noComposant));

CREATE TABLE Alimentation_ConnecteurAlim (
     noAlimentation INTEGER UNSIGNED,
     typeConnecteurAlim VARCHAR(20) NOT NULL,
     nombre INTEGER NOT NULL,
     CONSTRAINT PK_Alimentation_ConnecteurAlim PRIMARY KEY (typeConnecteurAlim, noAlimentation));

CREATE TABLE Boitier (
     noComposant INTEGER UNSIGNED AUTO_INCREMENT,
     hauteur INTEGER NOT NULL,
     largeur INTEGER NOT NULL,
     profondeur INTEGER NOT NULL,
     CONSTRAINT PK_Boitier PRIMARY KEY (noComposant));

CREATE TABLE Boitier_EmplacementMemoireMorte (
     noBoitier INTEGER UNSIGNED,
     typeEmplacementMemoireMorte DECIMAL(3,2) NOT NULL,
     nombre INTEGER NOT NULL,
     CONSTRAINT PK_Boitier_EmplacementMemoireMorte PRIMARY KEY (noBoitier, typeEmplacementMemoireMorte));

CREATE TABLE Boitier_FacteurForme (
     noBoitier INTEGER UNSIGNED,
     typeFacteurForme VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Boitier_FacteurForme PRIMARY KEY (typeFacteurForme, noBoitier));

CREATE TABLE CarteGraphique (
     noComposant INTEGER UNSIGNED AUTO_INCREMENT,
     frequencePuceGraphique INTEGER NOT NULL,
     typeMemoireGraphique VARCHAR(20) NOT NULL,
     capaciteMemoireGraphique INTEGER NOT NULL,
     largeur INTEGER NOT NULL,
     profondeur INTEGER NOT NULL,
     nbEmplacementSurBoitier INTEGER NOT NULL,
     typeEmplacementCarteGraphique VARCHAR(20) NOT NULL,
     nomPuceGraphique VARCHAR(20) NOT NULL,
     CONSTRAINT PK_CarteGraphique PRIMARY KEY (noComposant));

CREATE TABLE CarteGraphique_Port (
     noCarteGraphique INTEGER UNSIGNED,
     nomPort VARCHAR(20) NOT NULL,
     nombre INTEGER NOT NULL,
     CONSTRAINT PK_CarteGraphique_Port PRIMARY KEY (noCarteGraphique, nomPort));

CREATE TABLE CarteGraphique_ConnecteurAlim (
     noCarteGraphique INTEGER UNSIGNED,
     typeConnecteurAlim VARCHAR(20) NOT NULL,
     nombre INTEGER NOT NULL,
     CONSTRAINT PK_CarteGraphique_ConnecteurAlim PRIMARY KEY (noCarteGraphique, typeConnecteurAlim));

CREATE TABLE CarteMere (
     noComposant INTEGER UNSIGNED AUTO_INCREMENT,
     nbEmplacementsRAM INTEGER NOT NULL,
     capaciteRAMMax INTEGER NOT NULL,
     chipset VARCHAR(20) NOT NULL,
     frequenceRAMMax INTEGER NOT NULL,
     nbEmplacementsPCIe INTEGER NOT NULL,
     nomTypeMemoireVive VARCHAR(20) NOT NULL,
     typeConnecteurMemoireVive VARCHAR(20) NOT NULL,
     typeEmplacementCarteGraphique VARCHAR(20) NOT NULL,
     typeFacteurForme VARCHAR(20) NOT NULL,
     nomSocket VARCHAR(20) NOT NULL,
     CONSTRAINT PK_CarteMere PRIMARY KEY (noComposant));

CREATE TABLE CarteMere_Port (
     noCarteMere INTEGER UNSIGNED,
     nomPort VARCHAR(20) NOT NULL,
     nombre INTEGER NOT NULL,
     CONSTRAINT PK_CarteMere_Port PRIMARY KEY (noCarteMere, nomPort));

CREATE TABLE Composant (
     no INTEGER UNSIGNED AUTO_INCREMENT,
     nom VARCHAR(200) NOT NULL,
     prix DECIMAL(7,2) NOT NULL,
     nomConstructeur VARCHAR(100),
     CONSTRAINT PK_Composant PRIMARY KEY (no));

CREATE TABLE ConnecteurAlim (
     type VARCHAR(20) NOT NULL,
     CONSTRAINT PK_ConnecteurAlim PRIMARY KEY (type));

CREATE TABLE ConnecteurMemoireVive (
     type VARCHAR(20) NOT NULL,
     CONSTRAINT PK_ConnecteurMemoireVive PRIMARY KEY (type));

CREATE TABLE Constructeur (
     nom VARCHAR(100) NOT NULL,
     CONSTRAINT PK_Constructeur PRIMARY KEY (nom));

CREATE TABLE EmplacementCarteGraphique (
     type VARCHAR(20) NOT NULL,
     CONSTRAINT PK_EmplacementCarteGraphique PRIMARY KEY (type));

CREATE TABLE EmplacementMemoireMorte (
     type DECIMAL(3,2) NOT NULL,
     CONSTRAINT PK_EmplacementMemoireMorte PRIMARY KEY (type));

CREATE TABLE FacteurForme (
     type VARCHAR(20) NOT NULL,
     CONSTRAINT PK_FacteurForme PRIMARY KEY (type));

CREATE TABLE HDD (
     noComposantMemoireMorte INTEGER UNSIGNED AUTO_INCREMENT,
     nbToursParMinuteMax INTEGER,
     CONSTRAINT PK_HDD PRIMARY KEY (noComposantMemoireMorte));

CREATE TABLE MemoireMorte (
     noComposant INTEGER UNSIGNED AUTO_INCREMENT,
     capacite INTEGER NOT NULL,
     typeEmplacementMemoireMorte DECIMAL(3,2) NOT NULL,
     typeConnecteurAlim VARCHAR(20) NOT NULL,
     CONSTRAINT PK_MemoireMorte PRIMARY KEY (noComposant));

CREATE TABLE MemoireVive (
     noComposant INTEGER UNSIGNED AUTO_INCREMENT,
     nomTypeMemoireVive VARCHAR(20) NOT NULL,
     frequence INTEGER NOT NULL,
     ECC TINYINT NOT NULL DEFAULT 0,
     typeConnecteurMemoireVive VARCHAR(20) NOT NULL,
     CONSTRAINT PK_MemoireVive PRIMARY KEY (noComposant));

CREATE TABLE Port (
     nom VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Port PRIMARY KEY (nom));

CREATE TABLE Processeur (
     noComposant INTEGER UNSIGNED AUTO_INCREMENT,
     nbCoeurs INTEGER NOT NULL,
     frequence DECIMAL(5,3) NOT NULL,
     frequenceMax DECIMAL(5,3) NOT NULL,
     ECC TINYINT NOT NULL DEFAULT 0,
     multithreading TINYINT NOT NULL DEFAULT 0,
     nomSocket VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Processeur PRIMARY KEY (noComposant));

CREATE TABLE PuceGraphique (
     nom VARCHAR(20) NOT NULL,
     nomConstructeur VARCHAR(100),
     CONSTRAINT PK_PuceGraphique PRIMARY KEY (nom));

CREATE TABLE Refroidisseur (
     noComposant INTEGER UNSIGNED AUTO_INCREMENT,
     hauteur INTEGER NOT NULL,
     refroidissementLiquide TINYINT NOT NULL DEFAULT 0,
     helice TINYINT NOT NULL DEFAULT 0,
     CONSTRAINT PK_Refroidisseur PRIMARY KEY (noComposant));

CREATE TABLE Refroidisseur_Socket (
     noRefroidisseur INTEGER UNSIGNED,
     nomSocket VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Refroidisseur_Socket PRIMARY KEY (nomSocket, noRefroidisseur));

CREATE TABLE Socket (
     nom VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Socket PRIMARY KEY (nom));

CREATE TABLE SSD (
     noComposantMemoireMorte INTEGER UNSIGNED AUTO_INCREMENT,
     vitesseEcriture INTEGER,
     vitesseLecture INTEGER,
     CONSTRAINT PK_SSD PRIMARY KEY (noComposantMemoireMorte));

CREATE TABLE TypeMemoireVive (
     nom VARCHAR(20) NOT NULL,
     CONSTRAINT PK_TypeMemoireVive PRIMARY KEY (nom));


-- Constraints Section
-- ___________________

ALTER TABLE Alimentation ADD CONSTRAINT FK_Alimentation_noComposant
     FOREIGN KEY (noComposant)
     REFERENCES Composant (no)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Alimentation ADD CONSTRAINT FK_Alimentation_typeFacteurForme
     FOREIGN KEY (typeFacteurForme)
     REFERENCES FacteurForme (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE Alimentation_ConnecteurAlim ADD CONSTRAINT FK_Alimentation_ConnecteurAlim_typeConnecteurAlim
     FOREIGN KEY (typeConnecteurAlim)
     REFERENCES ConnecteurAlim (type)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Alimentation_ConnecteurAlim ADD CONSTRAINT FK_Alimentation_ConnecteurAlim_noAlimentation
     FOREIGN KEY (noAlimentation)
     REFERENCES Alimentation (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier ADD CONSTRAINT FK_Boitier_noComposant
     FOREIGN KEY (noComposant)
     REFERENCES Composant (no)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier_EmplacementMemoireMorte ADD CONSTRAINT FK_Boitier_EmplacementMemoireMorte_typeEmplacementMemoireMorte
     FOREIGN KEY (typeEmplacementMemoireMorte)
     REFERENCES EmplacementMemoireMorte (type)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier_EmplacementMemoireMorte ADD CONSTRAINT FK_Boitier_EmplacementMemoireMorte_noBoitier
     FOREIGN KEY (noBoitier)
     REFERENCES Boitier (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier_FacteurForme ADD CONSTRAINT FK_Boitier_FacteurForme_typeFacteurForme
     FOREIGN KEY (typeFacteurForme)
     REFERENCES FacteurForme (type)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier_FacteurForme ADD CONSTRAINT FK_Boitier_FacteurForme_noBoitier
     FOREIGN KEY (noBoitier)
     REFERENCES Boitier (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique ADD CONSTRAINT FK_CarteGraphique_noComposant
     FOREIGN KEY (noComposant)
     REFERENCES Composant (no)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique ADD CONSTRAINT FK_CarteGraphique_connecteurEmplacementCarteGraphique
     FOREIGN KEY (typeEmplacementCarteGraphique)
     REFERENCES EmplacementCarteGraphique (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique ADD CONSTRAINT FK_CarteGraphique_nomPuceGraphique
     FOREIGN KEY (nomPuceGraphique)
     REFERENCES PuceGraphique (nom)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique_Port ADD CONSTRAINT FK_CarteGraphique_Port_nomPort
     FOREIGN KEY (nomPort)
     REFERENCES Port (nom)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique_Port ADD CONSTRAINT FK_CarteGraphique_Port_noCarteGraphique
     FOREIGN KEY (noCarteGraphique)
     REFERENCES CarteGraphique (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique_ConnecteurAlim ADD CONSTRAINT FK_CarteGraphique_ConnecteurAlim_typeConnecteurAlim
     FOREIGN KEY (typeConnecteurAlim)
     REFERENCES ConnecteurAlim (type)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique_ConnecteurAlim ADD CONSTRAINT FK_CarteGraphique_ConnecteurAlim_noCarteGraphique
     FOREIGN KEY (noCarteGraphique)
     REFERENCES CarteGraphique (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_noComposant
     FOREIGN KEY (noComposant)
     REFERENCES Composant (no)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_nomTypeMemoireVive
     FOREIGN KEY (nomTypeMemoireVive)
     REFERENCES TypeMemoireVive (nom)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_typeFacteurForme
     FOREIGN KEY (typeFacteurForme)
     REFERENCES FacteurForme (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_typeConnecteurMemoireVive
     FOREIGN KEY (typeConnecteurMemoireVive)
     REFERENCES ConnecteurMemoireVive (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_typeEmplacementCarteGraphique
     FOREIGN KEY (typeEmplacementCarteGraphique)
     REFERENCES EmplacementCarteGraphique (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_nomSocket
     FOREIGN KEY (nomSocket)
     REFERENCES Socket (nom)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteMere_Port ADD CONSTRAINT FK_CarteMere_Port_nomPort
     FOREIGN KEY (nomPort)
     REFERENCES Port (nom)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteMere_Port ADD CONSTRAINT FK_CarteMere_Port_noCarteMere
     FOREIGN KEY (noCarteMere)
     REFERENCES CarteMere (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Composant ADD CONSTRAINT FK_Composant_nomConstructeur
     FOREIGN KEY (nomConstructeur)
     REFERENCES Constructeur (nom)
     ON DELETE SET NULL
     ON UPDATE CASCADE;

ALTER TABLE HDD ADD CONSTRAINT FK_HDD_noComposantMemoireMorte
     FOREIGN KEY (noComposantMemoireMorte)
     REFERENCES MemoireMorte (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE MemoireMorte ADD CONSTRAINT FK_MemoireMorte_noComposant
     FOREIGN KEY (noComposant)
     REFERENCES Composant (no)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE MemoireMorte ADD CONSTRAINT FK_MemoireMorte_typeEmplacementMemoireMorte
     FOREIGN KEY (typeEmplacementMemoireMorte)
     REFERENCES EmplacementMemoireMorte (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE MemoireMorte ADD CONSTRAINT FK_MemoireMorte_typeConnecteurAlim
     FOREIGN KEY (typeConnecteurAlim)
     REFERENCES ConnecteurAlim (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE MemoireVive ADD constraint FK_MemoireVive_nomTypeMemoireVive
     FOREIGN KEY (nomTypeMemoireVive)
     REFERENCES TypeMemoireVive (nom)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE MemoireVive ADD CONSTRAINT FK_MemoireVive_noComposant
     FOREIGN KEY (noComposant)
     REFERENCES Composant (no)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE MemoireVive ADD CONSTRAINT FK_MemoireVive_typeConnecteurMemoireVive
     FOREIGN KEY (typeConnecteurMemoireVive)
     REFERENCES ConnecteurMemoireVive (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE Processeur ADD CONSTRAINT FK_Processeur_noComposant
     FOREIGN KEY (noComposant)
     REFERENCES Composant (no)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Processeur ADD CONSTRAINT FK_Processeur_nomSocket
     FOREIGN KEY (nomSocket)
     REFERENCES Socket (nom)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE PuceGraphique ADD CONSTRAINT FK_PuceGraphique_nomConstructeur
     FOREIGN KEY (nomConstructeur)
     REFERENCES Constructeur (nom)
     ON DELETE SET NULL
     ON UPDATE CASCADE;

ALTER TABLE Refroidisseur ADD CONSTRAINT FK_Refroidisseur_noComposant
     FOREIGN KEY (noComposant)
     REFERENCES Composant (no)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Refroidisseur_Socket ADD CONSTRAINT FK_Refroidisseur_Socket_nomSocket
     FOREIGN KEY (nomSocket)
     REFERENCES Socket (nom)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Refroidisseur_Socket ADD CONSTRAINT FK_Refroidisseur_Socket_noRefroidisseur
     FOREIGN KEY (noRefroidisseur)
     REFERENCES Refroidisseur (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE SSD ADD CONSTRAINT FK_SSD_noComposantMemoireMorte
     FOREIGN KEY (noComposantMemoireMorte)
     REFERENCES MemoireMorte (noComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;


-- Unicity constraints
-- ___________

ALTER TABLE Composant ADD CONSTRAINT UC_Composant_nom
     UNIQUE (nom);


-- Index Section
-- _____________

CREATE UNIQUE INDEX FKCom_Ali_IND
     ON Alimentation (noComposant);

CREATE INDEX FKqualifie_IND
     ON Alimentation (typeFacteurForme);

CREATE UNIQUE INDEX ID_offre_IND
     ON Alimentation_ConnecteurAlim (typeConnecteurAlim, noAlimentation);

CREATE INDEX FKoff_Ali_IND
     ON Alimentation_ConnecteurAlim (noAlimentation);

CREATE UNIQUE INDEX FKCom_Boi_IND
     ON Boitier (noComposant);

CREATE UNIQUE INDEX ID_contient_IND
     ON Boitier_EmplacementMemoireMorte (noBoitier, typeEmplacementMemoireMorte);

CREATE INDEX FKcon_Emp_IND
     ON Boitier_EmplacementMemoireMorte (typeEmplacementMemoireMorte);

CREATE UNIQUE INDEX ID_decrit_IND
     ON Boitier_FacteurForme (typeFacteurForme, noBoitier);

CREATE INDEX FKdec_Boi_IND
     ON Boitier_FacteurForme (noBoitier);

CREATE UNIQUE INDEX FKCom_Car_IND
     ON CarteGraphique (noComposant);

CREATE INDEX FKs_introduit_IND
     ON CarteGraphique (typeEmplacementCarteGraphique);

CREATE INDEX FKimplemente_IND
     ON CarteGraphique (nomPuceGraphique);

CREATE UNIQUE INDEX ID_propose_IND
     ON CarteGraphique_Port (noCarteGraphique, nomPort);

CREATE INDEX FKpro_por_IND
     ON CarteGraphique_Port (nomPort);

CREATE UNIQUE INDEX ID_demande_IND
     ON CarteGraphique_ConnecteurAlim (noCarteGraphique, typeConnecteurAlim);

CREATE INDEX FKdem_Con_IND
     ON CarteGraphique_ConnecteurAlim (typeConnecteurAlim);

CREATE UNIQUE INDEX FKCom_Car_1_IND
     ON CarteMere (noComposant);

CREATE INDEX FKcaracterise_IND
     ON CarteMere (typeFacteurForme);

CREATE INDEX FKcomprend_IND
     ON CarteMere (typeConnecteurMemoireVive);

CREATE INDEX FKmet_a_disposition_IND
     ON CarteMere (typeEmplacementCarteGraphique);

CREATE INDEX FKfournit_IND
     ON CarteMere (nomSocket);

CREATE UNIQUE INDEX ID_dispose_IND
     ON CarteMere_Port (noCarteMere, nomPort);

CREATE INDEX FKdis_por_IND
     ON CarteMere_Port (nomPort);

CREATE UNIQUE INDEX ID_Composant_IND
     ON Composant (no);

CREATE INDEX FKfabrique_IND
     ON Composant (nomConstructeur);

CREATE UNIQUE INDEX ID_ConnecteurAlim_IND
     ON ConnecteurAlim (type);

CREATE UNIQUE INDEX ID_ConnecteurMemoireVive_IND
     ON ConnecteurMemoireVive (type);

CREATE UNIQUE INDEX ID_Constructeur_IND
     ON Constructeur (nom);

CREATE UNIQUE INDEX ID_EmplacementCarteGraphique_IND
     ON EmplacementCarteGraphique (type);

CREATE UNIQUE INDEX ID_EmplacementMemoireMorte_IND
     ON EmplacementMemoireMorte (type);

CREATE UNIQUE INDEX ID_FacteurForme_IND
     ON FacteurForme (type);

CREATE UNIQUE INDEX FKMem_HDD_IND
     ON HDD (noComposantMemoireMorte);

CREATE UNIQUE INDEX FKCom_Mem_IND
     ON MemoireMorte (noComposant);

CREATE INDEX FKva_dans_IND
     ON MemoireMorte (typeEmplacementMemoireMorte);

CREATE INDEX FKpossede_IND
     ON MemoireMorte (typeConnecteurAlim);

CREATE UNIQUE INDEX FKCom_Mem_1_IND
     ON MemoireVive (noComposant);

CREATE INDEX FKa_IND
     ON MemoireVive (typeConnecteurMemoireVive);

CREATE UNIQUE INDEX ID_port_IND
     ON Port (nom);

CREATE UNIQUE INDEX FKCom_Pro_IND
     ON Processeur (noComposant);

CREATE INDEX FKs_insere_IND
     ON Processeur (nomSocket);

CREATE UNIQUE INDEX ID_PuceGraphique_IND
     ON PuceGraphique (nom);

CREATE INDEX FKconstruit_IND
     ON PuceGraphique (nomConstructeur);

CREATE UNIQUE INDEX FKCom_Ref_IND
     ON Refroidisseur (noComposant);

CREATE UNIQUE INDEX ID_va_sur_IND
     ON Refroidisseur_Socket (nomSocket, noRefroidisseur);

CREATE INDEX FKva__Ref_IND
     ON Refroidisseur_Socket (noRefroidisseur);

CREATE UNIQUE INDEX ID_Socket_IND
     ON Socket (nom);

CREATE UNIQUE INDEX FKMem_SSD_IND
     ON SSD (noComposantMemoireMorte);

CREATE UNIQUE INDEX ID_TypeMemoireVive_IND
     ON TypeMemoireVive (nom);

-- ***************************************************
-- * Partie 2 : Implementation des triggers
-- ***************************************************

-- Les triggers qui suivent permettent de vérifier avant
-- chaque insertion que les héritages de la base de
-- données restent disjoints.

DELIMITER $$

-- Vérifie que le nouveau SSD n'est pas déjà un HDD
CREATE TRIGGER `before_SSD_insert`
BEFORE INSERT ON `SSD`
FOR EACH ROW
BEGIN
    IF NEW.noComposantMemoireMorte IN
            (SELECT noComposantMemoireMorte
             FROM HDD)
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Inheritance on MemoireMorte is disjoint, cannot add an SSD that is an HDD.';
    END IF;
END$$

-- Vérifie que le nouveau HDD n'est pas déjà un SSD
CREATE TRIGGER `before_HDD_insert`
BEFORE INSERT ON `HDD`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposantMemoireMorte IN
                (SELECT noComposantMemoireMorte
                 FROM SSD)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on MemoireMorte is disjoint, cannot add an HDD that is an SSD.';
        END IF;
END$$

-- Vérifie que la nouvelle carte mère n'est pas aussi un autre composant
CREATE TRIGGER `before_CarteMere_insert`
BEFORE INSERT ON `CarteMere`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposant IN (SELECT noComposant
                               FROM Processeur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM CarteGraphique)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireVive)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireMorte)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Alimentation)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Refroidisseur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Boitier)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on Composant is disjoint, a component cannot be of two subtypes.';
        END IF;
END$$

-- Vérifie que le nouveau processeur n'est pas aussi un autre composant
CREATE TRIGGER `before_Processeur_insert`
BEFORE INSERT ON `Processeur`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposant IN (SELECT noComposant
                               FROM CarteMere)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM CarteGraphique)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireVive)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireMorte)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Alimentation)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Refroidisseur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Boitier)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on Composant is disjoint, a component cannot be of two subtypes.';
        END IF;
END$$

-- Vérifie que la nouvelle carte graphique n'est pas aussi un autre composant
CREATE TRIGGER `before_CarteGraphique_insert`
BEFORE INSERT ON `CarteGraphique`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposant IN (SELECT noComposant
                               FROM CarteMere)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Processeur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireVive)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireMorte)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Alimentation)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Refroidisseur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Boitier)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on Composant is disjoint, a component cannot be of two subtypes.';
        END IF;
END$$

-- Vérifie que la nouvelle RAM n'est pas aussi un autre composant
CREATE TRIGGER `before_MemoireVive_insert`
BEFORE INSERT ON `MemoireVive`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposant IN (SELECT noComposant
                               FROM CarteMere)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Processeur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM CarteGraphique)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireMorte)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Alimentation)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Refroidisseur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Boitier)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on Composant is disjoint, a component cannot be of two subtypes.';
        END IF;
END$$

-- Vérifie que la nouvelle mémoire morte n'est pas aussi un autre composant
CREATE TRIGGER `before_MemoireMorte_insert`
BEFORE INSERT ON `MemoireMorte`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposant IN (SELECT noComposant
                               FROM CarteMere)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Processeur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM CarteGraphique)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireVive)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Alimentation)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Refroidisseur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Boitier)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on Composant is disjoint, a component cannot be of two subtypes.';
        END IF;
END$$

-- Vérifie que la nouvelle alimentation n'est pas aussi un autre composant
CREATE TRIGGER `before_Alimentation_insert`
BEFORE INSERT ON `Alimentation`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposant IN (SELECT noComposant
                               FROM CarteMere)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Processeur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM CarteGraphique)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireVive)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireMorte)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Refroidisseur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Boitier)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on Composant is disjoint, a component cannot be of two subtypes.';
        END IF;
END$$

-- Vérifie que le nouveau refroidisseur n'est pas aussi un autre composant
CREATE TRIGGER `before_Refroidisseur_insert`
BEFORE INSERT ON `Refroidisseur`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposant IN (SELECT noComposant
                               FROM CarteMere)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Processeur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM CarteGraphique)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireVive)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireMorte)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Alimentation)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Boitier)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on Composant is disjoint, a component cannot be of two subtypes.';
        END IF;
END$$

-- Vérifie que le nouveau boitier n'est pas aussi un autre composant
CREATE TRIGGER `before_Boitier_insert`
BEFORE INSERT ON `Boitier`
    FOR EACH ROW
    BEGIN
        IF NEW.noComposant IN (SELECT noComposant
                               FROM CarteMere)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Processeur)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM CarteGraphique)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireVive)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM MemoireMorte)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Alimentation)
        OR NEW.noComposant IN (SELECT noComposant
                               FROM Refroidisseur)
        THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Inheritance on Composant is disjoint, a component cannot be of two subtypes.';
        END IF;
END$$

DELIMITER ;

-- ***************************************************
-- * Partie 3 : Insertion des données dans les tables
-- ***************************************************

INSERT INTO `ACPC`.`Constructeur`
(`nom`)
VALUES
('MSI'), ('Cooler Master'), ('Asus'), ('Intel'), ('NVidia'), ('HyperX'),
('Samsung'), ('Western Digital'), ('BitFenix'), ('AMD'), ('Gigabyte'),
('Corsair'), ('Toshiba'), ('EVGA'), ('ARTIC'), ('NZXT'), ('Kingston'),
('ASRock'), ('PowerColor'), ('G.Skill'), ('Plextor'), ('Lian-Li'),
('Be Quiet!'), ('SanDisk'), ('Seagate'), ('Silverstone'), ('Rosewill'),
('KFA2'), ('CRYORIG'), ('Team'), ('Deepcool');

INSERT INTO `ACPC`.`Composant`
(`nom`,
 `prix`,
 `nomConstructeur`)
VALUES
('Z97S SLI Krait Edition', 132, 'MSI'),            -- 1 carte mère
('Core i5 4690K', 257, 'Intel'),                   -- 2 CPU
('GeForce GTX 1070 STRIX 8G-GAMING', 508, 'ASUS'), -- 3 carte graphique
('Fury', 135, 'HyperX'),                           -- 4 RAM
('850 EVO Basic', 51.3, 'Samsung'),                -- 5 SSD
('Blue', 54, 'Western Digital'),                   -- 6 HDD
('G750M', 97.9, 'Cooler Master'),                  -- 7 Alim
('Hyper 212 Evo', 42.9, 'Cooler Master'),          -- 8 Refroidisseur
('Nova Window', 46.9, 'BitFenix'),                 -- 9 Boitier

('X470 Gaming Plus', 129.46, 'MSI'),               -- 10 carte mère
('Rysen 7 2700X', 379.9, 'AMD'),                   -- 11 CPU
('Radeon RX 580 Gaming', 284.90, 'Gigabyte'),      -- 12 carte graphique
('Vengeance LPX', 49.90, 'Corsair'),               -- 13 RAM
('A400', 64.90, 'Kingston'),                       -- 14 SSD
('PH2300U', 75, 'Toshiba'),                        -- 15 HDD
('SuperNova 850', 99.90, 'EVGA'),                  -- 16 Alim
('Freezer Xtreme', 31.80, 'ARTIC'),                -- 17 Refroidisseur
('H500', 76.90, 'NZXT'),                           -- 18 Boitier

('X99', 229.9, 'ASRock'),                          -- 19 carte mère
('Xeon E5 2620', 409, 'Intel'),                    -- 20 CPU
('AXRX 570', 119.9, 'PowerColor'),                 -- 21 carte graphique
('Trident Z RGB', 124.9, 'G.Skill'),               -- 22 RAM
('PX-128M6V', 86.00, 'Plextor'),                   -- 23 SSD
('WD20EZRZ', 61.9, 'Western Digital'),             -- 24 HDD
('BN215', 135.3, 'Be Quiet!'),                     -- 25 Alim
('H60', 64.9, 'Corsair'),                          -- 26 Refroidisseur
('PC-O10 WX', 230.00, 'Lian-Li'),                  -- 27 Boitier

('H310M', 55.9, 'Gigabyte'),                       -- 28 carte mère
('Core i3 8100', 118.9, 'Intel'),                  -- 29 CPU
('Aegis', 169.9, 'G.Skill'),                       -- 30 RAM
('SSD PLUS', 28, 'SanDisk'),                       -- 31 SSD
('SkyHawk', 52.7, 'Seagate'),                      -- 32 HDD
('ST30SF', 54.9, 'Silverstone'),                   -- 33 Alim
('FMB-X1', 19.9, 'Rosewill'),                      -- 34 Boitier

('B350 Tomahawk Arctic', 119.9, 'MSI'),            -- 35 carte mère
('Rysen 5 1600', 158.9, 'AMD'),                    -- 36 CPU
('GeForce GTX 1050 Ti', 228.8, 'KFA2'),            -- 37 carte graphique
('Ripjaws V Series', 125, 'G.Skill'),              -- 38 RAM
('Ultra II', 87.10, 'SanDisk'),                    -- 39 SSD
('ST2000VN004', 75.8, 'Seagate'),                  -- 40 HDD
('RM750x', 85.6, 'Corsair'),                       -- 41 Alim
('C7', 48.7, 'CRYORIG'),                           -- 42 Refroidisseur
('S340 Elite', 107.4, 'NZXT'),                     -- 43 Boitier

('GA-Z170N Gaming 5', 177, 'Gigabyte'),            -- 44 carte mère
('Core i5 6600K', 289.9, 'Intel'),                 -- 45 CPU
('GeForce GTX 1080', 570, 'EVGA'),                 -- 46 carte graphique
('Vulcan', 110, 'Team'),                           -- 47 RAM
('Force LE', 325.8, 'Corsair'),                    -- 48 SSD
('MQ01ABD100', 45.9, 'Toshiba'),                   -- 49 HDD
('SF450', 70, 'Corsair'),                          -- 50 Alim
('GABRIEL', 30.7, 'Deepcool'),                     -- 51 Refroidisseur
('ML08B HTPC', 80.00, 'Silverstone');              -- 52 Boitier

INSERT INTO `ACPC`.`FacteurForme`
(`type`)
VALUES
('ATX'), ('mATX'), ('Mini ITX'), ('SFX12V'), ('EATX');

INSERT INTO `ACPC`.`ConnecteurAlim`
(`type`)
VALUES
('20+4-pin ATX'), ('4+4-pin 12V'), ('4-pin Molex'), ('4-pin Floppy'),
('15-pin S-ATA'), ('6+2 broches PCIe');

INSERT INTO `ACPC`.`Alimentation`
(`noComposant`,
 `puissance`,
 `typeFacteurForme`)
VALUES
(7, 750, 'ATX'),
(16, 850, 'ATX'),
(25, 600, 'SFX12V'),
(33, 300, 'SFX12V'),
(41, 750, 'ATX'),
(50, 450, 'SFX12V');

INSERT INTO `ACPC`.`Alimentation_ConnecteurAlim`
(`noAlimentation`,
 `typeConnecteurAlim`,
 `nombre`)
VALUES
(7, '20+4-pin ATX', 1), (7, '4+4-pin 12V', 1), (7, '4-pin Molex', 6),
(7, '4-pin Floppy', 1), (7, '15-pin S-ATA', 8), (7, '6+2 broches PCIe', 4),
(16, '20+4-pin ATX', 1), (16, '4+4-pin 12V', 2), (16, '4-pin Molex', 4),
(16, '4-pin Floppy', 1), (16, '15-pin S-ATA', 10), (16, '6+2 broches PCIe', 4),
(25, '20+4-pin ATX', 1), (25, '4+4-pin 12V', 1), (25, '4-pin Molex', 4),
(25, '15-pin S-ATA', 6), (25, '6+2 broches PCIe', 4),
(33,'20+4-pin ATX',1), (33,'4+4-pin 12V',1), (33,'4-pin Molex', 2), 
(33, '4-pin Floppy', 1),(33, '15-pin S-ATA', 3), (33, '6+2 broches PCIe', 1),
(41, '20+4-pin ATX',1), (41, '4+4-pin 12V', 2), (41, '4-pin Floppy', 1),
(41, '15-pin S-ATA', 8), (41, '6+2 broches PCIe', 4),
(50,'20+4-pin ATX',1), (50,'4+4-pin 12V', 1), (50,'4-pin Molex', 4),
(50, '15-pin S-ATA', 4), (50, '6+2 broches PCIe', 2);

INSERT INTO `ACPC`.`EmplacementMemoireMorte`
(`type`)
VALUES
(2.5), (3.5), (5.25);

INSERT INTO `ACPC`.`Boitier`
(`noComposant`,
 `hauteur`,
 `largeur`,
 `profondeur`)
VALUES
(9, 437, 465, 183),
(18, 428, 460, 210),
(27, 376, 493, 242),
(34, 352, 360, 175),
(43, 432, 474, 203),
(52, 380, 370, 87);

INSERT INTO `ACPC`.`Boitier_FacteurForme`
(`noBoitier`,
 `typeFacteurForme`)
VALUES
(9, 'ATX'), (9, 'mATX'), (9, 'Mini ITX'),
(18, 'ATX'), (18, 'mATX'), (18, 'Mini ITX'),
(27, 'ATX'), (27, 'SFX12V'), (27, 'mATX'), (27, 'EATX'),
(34, 'mATX'), (34, 'SFX12V'), (34, 'Mini ITX'),
(43, 'ATX'), (43, 'mATX'), (43, 'Mini ITX'),
(52, 'Mini ITX');

INSERT INTO `ACPC`.`Boitier_EmplacementMemoireMorte`
(`noBoitier`,
 `typeEmplacementMemoireMorte`,
 `nombre`)
VALUES
(9, 2.5, 2), (9, 3.5, 4), (9, 5.25, 1),
(18, 2.5, 2), (18, 3.5, 2),
(27, 2.5, 3), (27, 3.5, 4),
(34, 2.5, 1), (34, 3.5, 1),
(43, 2.5, 4), (43, 3.5, 2),
(52, 2.5, 2), (52, 5.25, 1);

INSERT INTO `ACPC`.`PuceGraphique`
(`nom`,
 `nomConstructeur`)
VALUES
('GeForce GTX 1070', 'NVidia'),
('Radeon RX 580', 'AMD'),
('Radeon RX 570', 'AMD'),
('GeForce GTX 1050 Ti', 'NVidia'),
('GeForce GTX 1080', 'NVidia');

INSERT INTO `ACPC`.`Port`
(`nom`)
VALUES
('HDMI'), ('DVI-D'), ('DisplayPort'), ('VGA');

INSERT INTO `ACPC`.`EmplacementCarteGraphique`
(`type`)
VALUES
('PCIe x16'), ('PCIe x8');

INSERT INTO `ACPC`.`CarteGraphique`
(`noComposant`,
 `frequencePuceGraphique`,
 `typeMemoireGraphique`,
 `capaciteMemoireGraphique`,
 `largeur`,
 `profondeur`,
 `nbEmplacementSurBoitier`,
 `typeEmplacementCarteGraphique`,
 `nomPuceGraphique`)
VALUES
(3, 1657, 'GDDR5', 8, 298, 134, 2, 'PCIe x16', 'GeForce GTX 1070'),
(12, 1340, 'GDDR5', 4, 232, 116, 2, 'PCIe x16', 'Radeon RX 580'),
(21, 1168, 'GDDR5', 4, 255, 137, 2, 'PCIe x16', 'Radeon RX 570'),
(37, 1303, 'GDDR5', 4, 196, 126, 2, 'PCIe x16', 'GeForce GTX 1050 Ti'),
(46, 1607, 'GDDR5X', 8, 267, 111, 2, 'PCIe x16', 'GeForce GTX 1080');

INSERT INTO `ACPC`.`CarteGraphique_ConnecteurAlim`
(`noCarteGraphique`,
 `typeConnecteurAlim`,
 `nombre`)
VALUES
(3, '6+2 broches PCIe', 1),
(12, '6+2 broches PCIe', 1),
(21, '6+2 broches PCIe', 1);

INSERT INTO `ACPC`.`CarteGraphique_Port`
(`noCarteGraphique`,
 `nomPort`,
 `nombre`)
VALUES
(3, 'HDMI', 2), (3, 'DisplayPort', 2), (3, 'DVI-D', 1),
(12, 'HDMI', 1), (12, 'DisplayPort', 3), (12, 'DVI-D', 1),
(21, 'HDMI', 1), (21, 'DisplayPort', 3), (21, 'DVI-D', 1),
(37, 'HDMI', 1), (37, 'DisplayPort', 1), (37, 'DVI-D', 1),
(46, 'HDMI', 1), (46, 'DisplayPort', 3), (46, 'DVI-D', 1);

INSERT INTO `ACPC`.`Socket`
(`nom`)
VALUES
('LGA 775'), ('LGA 1366'), ('FM1'), ('LGA 1156'), ('LGA 1155'), ('LGA 2011'),
('LGA 1150'), ('LGA 2011-v3'), ('LGA 1151'), ('AM4'), ('AM2'), ('AM2+'), ('AM3'),
('AM3+'), ('FM2'), ('FM2+'), ('LGA 2066');

INSERT INTO `ACPC`.`TypeMemoireVive`
(`nom`)
VALUES
('DDR3'), ('DDR4');

INSERT INTO `ACPC`.`ConnecteurMemoireVive`
(`type`)
VALUES
('DIMM 184'), ('DIMM 240'), ('SODIMM 200'), ('DIMM 288');

INSERT INTO `ACPC`.`CarteMere`
(`noComposant`,
 `nbEmplacementsRAM`,
 `capaciteRAMMax`,
 `chipset`,
 `frequenceRAMMax`,
 `nbEmplacementsPCIe`,
 `typeFacteurForme`,
 `nomTypeMemoireVive`,
 `typeConnecteurMemoireVive`,
 `typeEmplacementCarteGraphique`,
 `nomSocket`)
VALUES
(1, 4, 32, 'Z97', 3200, 5, 'ATX', 'DDR3', 'DIMM 240', 'PCIe x16', 'LGA 1150'),
(10, 4, 64, 'X470', 3466, 6, 'ATX', 'DDR4', 'DIMM 240', 'PCIe x16', 'AM4'),
(19, 8, 128, 'X99', 3400, 5, 'EATX', 'DDR4', 'DIMM 288', 'PCIe x16', 'LGA 2011-v3'),
(28, 2, 32, 'H310', 2666, 1, 'mATX', 'DDR4', 'DIMM 288', 'PCIe x16', 'LGA 1151'),
(35, 4, 64, 'B350', 3200, 4, 'ATX', 'DDR4', 'DIMM 288', 'PCIe x16', 'AM4'),
(44, 2, 32, 'Z170', 3333, 1, 'Mini ITX', 'DDR4', 'DIMM 288','PCIe x16', 'LGA 1151');

INSERT INTO `ACPC`.`CarteMere_Port`
(`noCarteMere`,
 `nomPort`,
 `nombre`)
VALUES
(1, 'HDMI', 1), (1, 'DVI-D', 1), (1, 'VGA', 1),
(10, 'DVI-D', 1), (10, 'HDMI', 1),
(28, 'DVI-D', 1), (28, 'HDMI', 2),
(35, 'DVI-D', 1), (35, 'HDMI', 1), (35, 'VGA', 1),
(44, 'DVI-D', 1), (44, 'HDMI', 1);

INSERT INTO `ACPC`.`MemoireMorte`
(`noComposant`,
 `capacite`,
 `typeEmplacementMemoireMorte`,
 `typeConnecteurAlim`)
VALUES
(5, 120, 2.5, '15-pin S-ATA'),
(6, 1000, 3.5, '15-pin S-ATA'),
(14, 480, 2.5, '15-pin S-ATA'),
(15, 1000, 3.5, '15-pin S-ATA'),
(23, 128, 2.5, '15-pin S-ATA'),
(24, 2000, 3.5, '15-pin S-ATA'),
(31, 120, 2.5, '15-pin S-ATA'),
(32, 1000, 3.5, '15-pin S-ATA'),
(39, 480, 2.5, '15-pin S-ATA'),
(40, 2000, 3.5, '15-pin S-ATA'),
(48, 960, 2.5, '15-pin S-ATA'),
(49, 1000, 2.5, '15-pin S-ATA');

INSERT INTO `ACPC`.`HDD`
(`noComposantMemoireMorte`,
 `nbToursParMinuteMax`)
VALUES
(6, 7200),
(15, 7200),
(24, 5400),
(32, 5900),
(40, 5900),
(49, 5400);

INSERT INTO `ACPC`.`SSD`
(`noComposantMemoireMorte`,
 `vitesseEcriture`,
 `vitesseLecture`)
VALUES
(5, 520, 550),
(14, 450, 500),
(23, 170, 535),
(31, 450, 535),
(39, 500, 550),
(48, 530, 560);

INSERT INTO `ACPC`.`MemoireVive`
(`noComposant`,
 `nomTypeMemoireVive`,
 `frequence`,
 `ECC`,
 `typeConnecteurMemoireVive`)
VALUES
(4, 'DDR3', 1600, 0, 'DIMM 240'),
(13, 'DDR4', 3000, 0, 'DIMM 288'),
(22, 'DDR4', 3000, 0, 'DIMM 288'),
(30, 'DDR4', 2666, 0, 'DIMM 288'),
(38, 'DDR4', 3200, 0, 'DIMM 288'),
(47, 'DDR4', 3000, 0, 'DIMM 288');

INSERT INTO `ACPC`.`Processeur`
(`noComposant`,
 `nbCoeurs`,
 `frequence`,
 `frequenceMax`,
 `ECC`,
 `multithreading`,
 `nomSocket`)
VALUES
(2, 4, 3.5, 3.9, 0, 0, 'LGA 1150'),
(11, 8, 3.7, 4.3, 0, 1, 'AM4'),
(20, 8, 2.1, 3, 1, 1, 'LGA 2011-v3'),
(29, 4, 3.6, 3.9, 0, 1, 'LGA 1151'),
(36, 6, 3.2, 3.6, 0, 1, 'AM4'),
(45, 4, 3.5, 3.9, 0, 0, 'LGA 1151');

INSERT INTO `ACPC`.`Refroidisseur`
(`noComposant`,
 `hauteur`,
 `refroidissementLiquide`,
 `helice`)
VALUES
(8, 159, 0, 1),
(17, 131, 1, 0),
(26, 120, 1, 1),
(42, 47, 0, 1),
(51, 60, 0, 1);

INSERT INTO `ACPC`.`Refroidisseur_Socket`
(`noRefroidisseur`,
 `nomSocket`)
VALUES
(8, 'LGA 775'), (8, 'LGA 1366'), (8, 'FM1'), (8, 'LGA 1156'), (8, 'LGA 1155'),
(8, 'LGA 2011'), (8, 'LGA 1150'), (8, 'LGA 2011-v3'), (8, 'LGA 1151'),
(17, 'AM2'), (17, 'AM2+'), (17, 'AM3'), (17, 'AM3+'), (17, 'AM4'), (17, 'FM1'),
(17, 'FM2'), (17, 'FM2+'), (17, 'LGA 775'), (17, 'LGA 1150'), (17, 'LGA 1151'),
(17, 'LGA 1155'), (17, 'LGA 1156'), (17, 'LGA 1366'),
(26, 'AM2'), (26, 'AM2+'), (26, 'AM3'), (26, 'AM3+'), (26, 'AM4'), (26, 'FM1'),
(26, 'FM2'), (26, 'FM2+'), (26, 'LGA 1150'), (26, 'LGA 1151'), (26, 'LGA 1155'),
(26, 'LGA 1156'), (26, 'LGA 1366'), (26, 'LGA 2011'), (26, 'LGA 2011-v3'),
(26, 'LGA 2066'),
(42, 'AM2'), (42, 'AM2+'), (42, 'AM3'), (42, 'AM3+'), (42, 'AM4'), (42, 'FM1'),
(42, 'FM2'), (42, 'FM2+'), (42, 'LGA 1150'), (42, 'LGA 1151'), (42, 'LGA 1155'),
(42, 'LGA 1156'),
(51, 'AM2'), (51, 'AM2+'), (51, 'AM3'), (51, 'AM3+'), (51, 'AM4'), (51, 'FM1'),
(51, 'FM2'), (51, 'FM2+'), (51, 'LGA 1150'), (51, 'LGA 1151'), (51, 'LGA 1155'),
(51, 'LGA 1156');