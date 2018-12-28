-- ***************************************************
-- * SQL MySQL generation
-- *--------------------------------------------------
-- * Authors: Loris Gilliand, Mateo Tutic, Luc Wachter
-- * Group: 8
-- * DB-MAIN version: 10.0.3
-- * Generation date: Fri Dec  7 11:35:44 2018
-- * Schema: ACPC/1-1
-- ***************************************************

-- Database Section
-- ________________

DROP DATABASE IF EXISTS ACPC;
CREATE DATABASE ACPC;
USE ACPC;


-- Tables Section
-- _____________

CREATE TABLE Alimentation (
     noSerieComposant INTEGER UNSIGNED AUTO_INCREMENT,
     puissance INTEGER NOT NULL,
     typeFacteurForme VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Alimentation PRIMARY KEY (noSerieComposant));

CREATE TABLE Alimentation_ConnecteurAlim (
     noSerieAlimentation INTEGER UNSIGNED,
     typeConnecteurAlim VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Alimentation_ConnecteurAlim PRIMARY KEY (typeConnecteurAlim, noSerieAlimentation));

CREATE TABLE Boitier (
     noSerieComposant INTEGER UNSIGNED AUTO_INCREMENT,
     hauteur INTEGER NOT NULL,
     largeur INTEGER NOT NULL,
     profondeur INTEGER NOT NULL,
     CONSTRAINT PK_Boitier PRIMARY KEY (noSerieComposant));

CREATE TABLE Boitier_EmplacementMemoireMorte (
     noSerieBoitier INTEGER UNSIGNED,
     typeEmplacementMemoireMorte DECIMAL(3,2) NOT NULL,
     CONSTRAINT PK_Boitier_EmplacementMemoireMorte PRIMARY KEY (noSerieBoitier, typeEmplacementMemoireMorte));

CREATE TABLE Boitier_FacteurForme (
     noSerieBoitier INTEGER UNSIGNED,
     typeFacteurForme VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Boitier_FacteurForme PRIMARY KEY (typeFacteurForme, noSerieBoitier));

CREATE TABLE CarteGraphique (
     noSerieComposant INTEGER UNSIGNED AUTO_INCREMENT,
     frequencePuceGraphique INTEGER NOT NULL,
     typeMemoireGraphique VARCHAR(20) NOT NULL,
     capaciteMemoireGraphique INTEGER NOT NULL,
     largeur INTEGER NOT NULL,
     profondeur INTEGER NOT NULL,
     nbEmplacementSurBoitier INTEGER NOT NULL,
     connecteurEmplacementCarteGraphique VARCHAR(20) NOT NULL,
     nomPuceGraphique VARCHAR(20) NOT NULL,
     CONSTRAINT PK_CarteGraphique PRIMARY KEY (noSerieComposant));

CREATE TABLE CarteGraphique_Port (
     noSerieCarteGraphique INTEGER UNSIGNED,
     nomPort VARCHAR(20) NOT NULL,
     CONSTRAINT PK_CarteGraphique_Port PRIMARY KEY (noSerieCarteGraphique, nomPort));

CREATE TABLE CarteGraphique_ConnecteurAlim (
     noSerieCarteGraphique INTEGER UNSIGNED,
     typeConnecteurAlim VARCHAR(20) NOT NULL,
     CONSTRAINT PK_CarteGraphique_ConnecteurAlim PRIMARY KEY (noSerieCarteGraphique, typeConnecteurAlim));

CREATE TABLE CarteMere (
     noSerieComposant INTEGER UNSIGNED AUTO_INCREMENT,
     nbEmplacementsRAM INTEGER NOT NULL,
     capaciteRAMMax INTEGER NOT NULL,
     chipset VARCHAR(20) NOT NULL,
     frequenceRAMMax INTEGER NOT NULL,
     nbEmplacementsPCIe INTEGER NOT NULL,
     typeFacteurForme VARCHAR(20) NOT NULL,
     connecteurConnecteurMemoireVive VARCHAR(20) NOT NULL,
     connecteurEmplacementCarteGraphique VARCHAR(20) NOT NULL,
     nomSocket VARCHAR(20) NOT NULL,
     CONSTRAINT PK_CarteMere PRIMARY KEY (noSerieComposant));

CREATE TABLE CarteMere_Port (
     noSerieCarteMere INTEGER UNSIGNED,
     nomPort VARCHAR(20) NOT NULL,
     CONSTRAINT PK_CarteMere_Port PRIMARY KEY (noSerieCarteMere, nomPort));

CREATE TABLE Composant (
     noSerie INTEGER UNSIGNED AUTO_INCREMENT,
     nom VARCHAR(200) NOT NULL,
     prix DECIMAL(7,2) NOT NULL,
     nomConstructeur VARCHAR(100),
     CONSTRAINT PK_Composant PRIMARY KEY (noSerie));

CREATE TABLE ConnecteurAlim (
     type VARCHAR(20) NOT NULL,
     CONSTRAINT PK_ConnecteurAlim PRIMARY KEY (type));

CREATE TABLE ConnecteurMemoireVive (
     connecteur VARCHAR(20) NOT NULL,
     CONSTRAINT PK_ConnecteurMemoireVive PRIMARY KEY (connecteur));

CREATE TABLE Constructeur (
     nom VARCHAR(100) NOT NULL,
     CONSTRAINT PK_Constructeur PRIMARY KEY (nom));

CREATE TABLE EmplacementCarteGraphique (
     connecteur VARCHAR(20) NOT NULL,
     CONSTRAINT PK_EmplacementCarteGraphique PRIMARY KEY (connecteur));

CREATE TABLE EmplacementMemoireMorte (
     type DECIMAL(3,2) NOT NULL,
     CONSTRAINT PK_EmplacementMemoireMorte PRIMARY KEY (type));

CREATE TABLE FacteurForme (
     type VARCHAR(20) NOT NULL,
     CONSTRAINT PK_FacteurForme PRIMARY KEY (type));

CREATE TABLE HDD (
     noSerieComposantMemoireMorte INTEGER UNSIGNED AUTO_INCREMENT,
     nbToursParMinuteMax INTEGER,
     CONSTRAINT PK_HDD PRIMARY KEY (noSerieComposantMemoireMorte));

CREATE TABLE MemoireMorte (
     noSerieComposant INTEGER UNSIGNED AUTO_INCREMENT,
     type VARCHAR(20) NOT NULL,
     capacite INTEGER NOT NULL,
     typeEmplacementMemoireMorte DECIMAL(3,2) NOT NULL,
     typeConnecteurAlim VARCHAR(20) NOT NULL,
     CONSTRAINT PK_MemoireMorte PRIMARY KEY (noSerieComposant));

CREATE TABLE MemoireVive (
     noSerieComposant INTEGER UNSIGNED AUTO_INCREMENT,
     type VARCHAR(20) NOT NULL,
     frequence INTEGER NOT NULL,
     ECC TINYINT NOT NULL DEFAULT 0,
     connecteurConnecteurMemoireVive VARCHAR(20) NOT NULL,
     CONSTRAINT PK_MemoireVive PRIMARY KEY (noSerieComposant));

CREATE TABLE Port (
     nom VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Port PRIMARY KEY (nom));

CREATE TABLE Processeur (
     noSerieComposant INTEGER UNSIGNED AUTO_INCREMENT,
     nbCoeurs INTEGER NOT NULL,
     frequence DECIMAL(5,3) NOT NULL,
     frequenceMax DECIMAL(5,3) NOT NULL,
     ECC TINYINT NOT NULL DEFAULT 0,
     mutliThreading TINYINT NOT NULL DEFAULT 0,
     nomSocket VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Processeur PRIMARY KEY (noSerieComposant));

CREATE TABLE PuceGraphique (
     nom VARCHAR(20) NOT NULL,
     nomConstructeur VARCHAR(100),
     CONSTRAINT PK_PuceGraphique PRIMARY KEY (nom));

CREATE TABLE Refroidisseur (
     noSerieComposant INTEGER UNSIGNED AUTO_INCREMENT,
     hauteur INTEGER NOT NULL,
     refroidissementLiquide TINYINT NOT NULL DEFAULT 0,
     helice TINYINT NOT NULL DEFAULT 0,
     CONSTRAINT PK_Refroidisseur PRIMARY KEY (noSerieComposant));

CREATE TABLE Refroidisseur_Socket (
     noSerieRefroidisseur INTEGER UNSIGNED,
     nomSocket VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Refroidisseur_Socket PRIMARY KEY (nomSocket, noSerieRefroidisseur));

CREATE TABLE Socket (
     nom VARCHAR(20) NOT NULL,
     CONSTRAINT PK_Socket PRIMARY KEY (nom));

CREATE TABLE SSD (
     noSerieComposantMemoireMorte INTEGER UNSIGNED AUTO_INCREMENT,
     vitesseEcriture INTEGER,
     vitesseLecture INTEGER,
     CONSTRAINT PK_SSD PRIMARY KEY (noSerieComposantMemoireMorte));

CREATE TABLE TypeRAM (
     noSerieCarteMere INTEGER UNSIGNED,
     typeRAM VARCHAR(20) NOT NULL,
     CONSTRAINT PK_TypeRAM PRIMARY KEY (noSerieCarteMere, typeRAM));


-- Constraints Section
-- ___________________

ALTER TABLE Alimentation ADD CONSTRAINT FK_Alimentation_noSerieComposant
     FOREIGN KEY (noSerieComposant)
     REFERENCES Composant (noSerie)
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

ALTER TABLE Alimentation_ConnecteurAlim ADD CONSTRAINT FK_Alimentation_ConnecteurAlim_noSerieAlimentation
     FOREIGN KEY (noSerieAlimentation)
     REFERENCES Alimentation (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier ADD CONSTRAINT FK_Boitier_noSerieComposant
     FOREIGN KEY (noSerieComposant)
     REFERENCES Composant (noSerie)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier_EmplacementMemoireMorte ADD CONSTRAINT FK_Boitier_EmplacementMemoireMorte_typeEmplacementMemoireMorte
     FOREIGN KEY (typeEmplacementMemoireMorte)
     REFERENCES EmplacementMemoireMorte (type)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier_EmplacementMemoireMorte ADD CONSTRAINT FK_Boitier_EmplacementMemoireMorte_noSerieBoitier
     FOREIGN KEY (noSerieBoitier)
     REFERENCES Boitier (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier_FacteurForme ADD CONSTRAINT FK_Boitier_FacteurForme_typeFacteurForme
     FOREIGN KEY (typeFacteurForme)
     REFERENCES FacteurForme (type)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Boitier_FacteurForme ADD CONSTRAINT FK_Boitier_FacteurForme_noSerieBoitier
     FOREIGN KEY (noSerieBoitier)
     REFERENCES Boitier (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique ADD CONSTRAINT FK_CarteGraphique_noSerieComposant
     FOREIGN KEY (noSerieComposant)
     REFERENCES Composant (noSerie)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique ADD CONSTRAINT FK_CarteGraphique_connecteurEmplacementCarteGraphique
     FOREIGN KEY (connecteurEmplacementCarteGraphique)
     REFERENCES EmplacementCarteGraphique (connecteur)
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

ALTER TABLE CarteGraphique_Port ADD CONSTRAINT FK_CarteGraphique_Port_noSerieCarteGraphique
     FOREIGN KEY (noSerieCarteGraphique)
     REFERENCES CarteGraphique (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique_ConnecteurAlim ADD CONSTRAINT FK_CarteGraphique_ConnecteurAlim_typeConnecteurAlim
     FOREIGN KEY (typeConnecteurAlim)
     REFERENCES ConnecteurAlim (type)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteGraphique_ConnecteurAlim ADD CONSTRAINT FK_CarteGraphique_ConnecteurAlim_noSerieCarteGraphique
     FOREIGN KEY (noSerieCarteGraphique)
     REFERENCES CarteGraphique (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_noSerieComposant
     FOREIGN KEY (noSerieComposant)
     REFERENCES Composant (noSerie)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_typeFacteurForme
     FOREIGN KEY (typeFacteurForme)
     REFERENCES FacteurForme (type)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_connecteurConnecteurMemoireVive
     FOREIGN KEY (connecteurConnecteurMemoireVive)
     REFERENCES ConnecteurMemoireVive (connecteur)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE CarteMere ADD CONSTRAINT FK_CarteMere_connecteurEmplacementCarteGraphique
     FOREIGN KEY (connecteurEmplacementCarteGraphique)
     REFERENCES EmplacementCarteGraphique (connecteur)
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

ALTER TABLE CarteMere_Port ADD CONSTRAINT FK_CarteMere_Port_noSerieCarteMere
     FOREIGN KEY (noSerieCarteMere)
     REFERENCES CarteMere (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Composant ADD CONSTRAINT FK_Composant_nomConstructeur
     FOREIGN KEY (nomConstructeur)
     REFERENCES Constructeur (nom)
     ON DELETE SET NULL
     ON UPDATE CASCADE;

ALTER TABLE HDD ADD CONSTRAINT FK_HDD_noSerieComposantMemoireMorte
     FOREIGN KEY (noSerieComposantMemoireMorte)
     REFERENCES MemoireMorte (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE MemoireMorte ADD CONSTRAINT FK_MemoireMorte_noSerieComposant
     FOREIGN KEY (noSerieComposant)
     REFERENCES Composant (noSerie)
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

ALTER TABLE MemoireVive ADD CONSTRAINT FK_MemoireVive_noSerieComposant
     FOREIGN KEY (noSerieComposant)
     REFERENCES Composant (noSerie)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE MemoireVive ADD CONSTRAINT FK_MemoireVive_connecteurConnecteurMemoireVive
     FOREIGN KEY (connecteurConnecteurMemoireVive)
     REFERENCES ConnecteurMemoireVive (connecteur)
     ON DELETE RESTRICT
     ON UPDATE CASCADE;

ALTER TABLE Processeur ADD CONSTRAINT FK_Processeur_noSerieComposant
     FOREIGN KEY (noSerieComposant)
     REFERENCES Composant (noSerie)
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

ALTER TABLE Refroidisseur ADD CONSTRAINT FK_Refroidisseur_noSerieComposant
     FOREIGN KEY (noSerieComposant)
     REFERENCES Composant (noSerie)
	 ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Refroidisseur_Socket ADD CONSTRAINT FK_Refroidisseur_Socket_nomSocket
     FOREIGN KEY (nomSocket)
     REFERENCES Socket (nom)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE Refroidisseur_Socket ADD CONSTRAINT FK_Refroidisseur_Socket_noSerieRefroidisseur
     FOREIGN KEY (noSerieRefroidisseur)
     REFERENCES Refroidisseur (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE SSD ADD CONSTRAINT FK_SSD_noSerieComposantMemoireMorte
     FOREIGN KEY (noSerieComposantMemoireMorte)
     REFERENCES MemoireMorte (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;

ALTER TABLE TypeRAM ADD CONSTRAINT FK_TypeRAM_noSerieCarteMere
     FOREIGN KEY (noSerieCarteMere)
     REFERENCES CarteMere (noSerieComposant)
     ON DELETE CASCADE
     ON UPDATE CASCADE;


-- Unicity constraints
-- ___________

ALTER TABLE Alimentation ADD CONSTRAINT UC_Alimentation_typeFacteurForme
	 UNIQUE (typeFacteurForme);

ALTER TABLE Alimentation_ConnecteurAlim ADD CONSTRAINT UC_Alimentation_typeConnecteurAlim
	 UNIQUE (typeConnecteurAlim);

ALTER TABLE Boitier_EmplacementMemoireMorte ADD CONSTRAINT UC_Boitier_EmplacementMemoireMorte_typeEmplacementMemoireMorte
     UNIQUE (typeEmplacementMemoireMorte);

ALTER TABLE Boitier_FacteurForme ADD CONSTRAINT UC_Boitier_FacteurForme_typeFacteurForme
     UNIQUE (typeFacteurForme);

ALTER TABLE CarteGraphique ADD CONSTRAINT UC_CarteGraphique_connecteurEmplacementCarteGraphique
     UNIQUE (connecteurEmplacementCarteGraphique);

ALTER TABLE CarteGraphique ADD CONSTRAINT UC_CarteGraphique_nomPuceGraphique
     UNIQUE (nomPuceGraphique);

ALTER TABLE CarteGraphique_Port ADD CONSTRAINT UC_CarteGraphique_Port_nomPort
     UNIQUE (nomPort);

ALTER TABLE CarteGraphique_ConnecteurAlim ADD CONSTRAINT UC_CarteGraphique_ConnecteurAlim_typeConnecteurAlim
     UNIQUE (typeConnecteurAlim);

ALTER TABLE CarteMere ADD CONSTRAINT UC_CarteMere_typeFacteurForme
     UNIQUE (typeFacteurForme);

ALTER TABLE CarteMere ADD CONSTRAINT UC_CarteMere_connecteurConnecteurMemoireVive
     UNIQUE (connecteurConnecteurMemoireVive);

ALTER TABLE CarteMere ADD CONSTRAINT UC_CarteMere_connecteurEmplacementCarteGraphique
     UNIQUE (connecteurEmplacementCarteGraphique);

ALTER TABLE CarteMere ADD CONSTRAINT UC_CarteMere_nomSocket
     UNIQUE (nomSocket);

ALTER TABLE CarteMere_Port ADD CONSTRAINT UC_CarteMere_Port_nomPort
     UNIQUE (nomPort);

-- POURQUOI ?
-- ALTER TABLE Composant ADD CONSTRAINT UC_Composant_nomConstructeur
--     UNIQUE (nomConstructeur);

ALTER TABLE MemoireMorte ADD CONSTRAINT UC_MemoireMorte_typeEmplacementMemoireMorte
     UNIQUE (typeEmplacementMemoireMorte);

-- POURQUOI ?
-- ALTER TABLE MemoireMorte ADD CONSTRAINT UC_MemoireMorte_typeConnecteurAlim
       UNIQUE (typeConnecteurAlim);

ALTER TABLE MemoireVive ADD CONSTRAINT UC_MemoireVive_connecteurConnecteurMemoireVive
     UNIQUE (connecteurConnecteurMemoireVive);

ALTER TABLE Processeur ADD CONSTRAINT UC_Processeur_nomSocket
     UNIQUE (nomSocket);

ALTER TABLE PuceGraphique ADD CONSTRAINT UC_PuceGraphique_nomConstructeur
     UNIQUE (nomConstructeur);

ALTER TABLE Refroidisseur_Socket ADD CONSTRAINT UC_Refroidisseur_Socket_nomSocket
     UNIQUE (nomSocket);


-- Index Section
-- _____________

CREATE UNIQUE INDEX FKCom_Ali_IND
     ON Alimentation (noSerieComposant);

CREATE INDEX FKqualifie_IND
     ON Alimentation (typeFacteurForme);

CREATE UNIQUE INDEX ID_offre_IND
     ON Alimentation_ConnecteurAlim (typeConnecteurAlim, noSerieAlimentation);

CREATE INDEX FKoff_Ali_IND
     ON Alimentation_ConnecteurAlim (noSerieAlimentation);

CREATE UNIQUE INDEX FKCom_Boi_IND
     ON Boitier (noSerieComposant);

CREATE UNIQUE INDEX ID_contient_IND
     ON Boitier_EmplacementMemoireMorte (noSerieBoitier, typeEmplacementMemoireMorte);

CREATE INDEX FKcon_Emp_IND
     ON Boitier_EmplacementMemoireMorte (typeEmplacementMemoireMorte);

CREATE UNIQUE INDEX ID_decrit_IND
     ON Boitier_FacteurForme (typeFacteurForme, noSerieBoitier);

CREATE INDEX FKdec_Boi_IND
     ON Boitier_FacteurForme (noSerieBoitier);

CREATE UNIQUE INDEX FKCom_Car_IND
     ON CarteGraphique (noSerieComposant);

CREATE INDEX FKs_introduit_IND
     ON CarteGraphique (connecteurEmplacementCarteGraphique);

CREATE INDEX FKimplemente_IND
     ON CarteGraphique (nomPuceGraphique);

CREATE UNIQUE INDEX ID_propose_IND
     ON CarteGraphique_Port (noSerieCarteGraphique, nomPort);

CREATE INDEX FKpro_por_IND
     ON CarteGraphique_Port (nomPort);

CREATE UNIQUE INDEX ID_demande_IND
     ON CarteGraphique_ConnecteurAlim (noSerieCarteGraphique, typeConnecteurAlim);

CREATE INDEX FKdem_Con_IND
     ON CarteGraphique_ConnecteurAlim (typeConnecteurAlim);

CREATE UNIQUE INDEX FKCom_Car_1_IND
     ON CarteMere (noSerieComposant);

CREATE INDEX FKcaracterise_IND
     ON CarteMere (typeFacteurForme);

CREATE INDEX FKcomprend_IND
     ON CarteMere (connecteurConnecteurMemoireVive);

CREATE INDEX FKmet_a_disposition_IND
     ON CarteMere (connecteurEmplacementCarteGraphique);

CREATE INDEX FKfournit_IND
     ON CarteMere (nomSocket);

CREATE UNIQUE INDEX ID_dispose_IND
     ON CarteMere_Port (noSerieCarteMere, nomPort);

CREATE INDEX FKdis_por_IND
     ON CarteMere_Port (nomPort);

CREATE UNIQUE INDEX ID_Composant_IND
     ON Composant (noSerie);

CREATE INDEX FKfabrique_IND
     ON Composant (nomConstructeur);

CREATE UNIQUE INDEX ID_ConnecteurAlim_IND
     ON ConnecteurAlim (type);

CREATE UNIQUE INDEX ID_ConnecteurMemoireVive_IND
     ON ConnecteurMemoireVive (connecteur);

CREATE UNIQUE INDEX ID_Constructeur_IND
     ON Constructeur (nom);

CREATE UNIQUE INDEX ID_EmplacementCarteGraphique_IND
     ON EmplacementCarteGraphique (connecteur);

CREATE UNIQUE INDEX ID_EmplacementMemoireMorte_IND
     ON EmplacementMemoireMorte (type);

CREATE UNIQUE INDEX ID_FacteurForme_IND
     ON FacteurForme (type);

CREATE UNIQUE INDEX FKMem_HDD_IND
     ON HDD (noSerieComposantMemoireMorte);

CREATE UNIQUE INDEX FKCom_Mem_IND
     ON MemoireMorte (noSerieComposant);

CREATE INDEX FKva_dans_IND
     ON MemoireMorte (typeEmplacementMemoireMorte);

CREATE INDEX FKpossede_IND
     ON MemoireMorte (typeConnecteurAlim);

CREATE UNIQUE INDEX FKCom_Mem_1_IND
     ON MemoireVive (noSerieComposant);

CREATE INDEX FKa_IND
     ON MemoireVive (connecteurConnecteurMemoireVive);

CREATE UNIQUE INDEX ID_port_IND
     ON Port (nom);

CREATE UNIQUE INDEX FKCom_Pro_IND
     ON Processeur (noSerieComposant);

CREATE INDEX FKs_insere_IND
     ON Processeur (nomSocket);

CREATE UNIQUE INDEX ID_PuceGraphique_IND
     ON PuceGraphique (nom);

CREATE INDEX FKconstruit_IND
     ON PuceGraphique (nomConstructeur);

CREATE UNIQUE INDEX FKCom_Ref_IND
     ON Refroidisseur (noSerieComposant);

CREATE UNIQUE INDEX ID_va_sur_IND
     ON Refroidisseur_Socket (nomSocket, noSerieRefroidisseur);

CREATE INDEX FKva__Ref_IND
     ON Refroidisseur_Socket (noSerieRefroidisseur);

CREATE UNIQUE INDEX ID_Socket_IND
     ON Socket (nom);

CREATE UNIQUE INDEX FKMem_SSD_IND
     ON SSD (noSerieComposantMemoireMorte);

CREATE UNIQUE INDEX ID_typeRAM_IND
     ON TypeRAM (noSerieCarteMere, typeRAM);
