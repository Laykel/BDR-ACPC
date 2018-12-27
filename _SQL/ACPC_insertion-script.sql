-- ***************************************************
-- * SQL insert requests
-- *--------------------------------------------------
-- * Authors: Loris Gilliand, Mateo Tutic, Luc Wachter
-- * Group: 8
-- * Creation date: 27.12.2018
-- ***************************************************

INSERT INTO `ACPC`.`Composant`
(`noSerie`,
`nom`,
`prix`,
`nomConstructeur`)
VALUES
();

INSERT INTO `ACPC`.`FacteurForme`
(`type`)
VALUES
();

INSERT INTO `ACPC`.`ConnecteurAlim`
(`type`)
VALUES
();

INSERT INTO `ACPC`.`Alimentation`
(`noSerieComposant`,
`puissance`,
`typeFacteurForme`)
VALUES
();

INSERT INTO `ACPC`.`Alimentation_ConnecteurAlim`
(`noSerieAlimentation`,
`typeConnecteurAlim`)
VALUES
();

INSERT INTO `ACPC`.`EmplacementMemoireMorte`
(`type`)
VALUES
();

INSERT INTO `ACPC`.`Boitier`
(`noSerieComposant`,
`hauteur`,
`largeur`,
`profondeur`)
VALUES
();

INSERT INTO `ACPC`.`Boitier_FacteurForme`
(`noSerieBoitier`,
`typeFacteurForme`)
VALUES
();

INSERT INTO `ACPC`.`Boitier_EmplacementMemoireMorte`
(`noSerieBoitier`,
`typeEmplacementMemoireMorte`)
VALUES
();

INSERT INTO `ACPC`.`PuceGraphique`
(`nom`,
`nomConstructeur`)
VALUES
();

INSERT INTO `ACPC`.`Port`
(`nom`)
VALUES
();

INSERT INTO `ACPC`.`CarteGraphique`
(`noSerieComposant`,
`frequencePuceGraphique`,
`typeMemoireGraphique`,
`capaciteMemoireGraphique`,
`largeur`,
`profondeur`,
`nbEmplacementSurBoitier`,
`connecteurEmplacementCarteGraphique`,
`nomPuceGraphique`)
VALUES
();

INSERT INTO `ACPC`.`CarteGraphique_ConnecteurAlim`
(`noSerieCarteGraphique`,
`typeConnecteurAlim`)
VALUES
();

INSERT INTO `ACPC`.`CarteGraphique_Port`
(`noSerieCarteGraphique`,
`nomPort`)
VALUES
();

INSERT INTO `ACPC`.`CarteMere`
(`noSerieComposant`,
`nbEmplacementsRAM`,
`capaciteRAMMax`,
`chipset`,
`frequenceRAMMax`,
`nbEmplacementsPCIe`,
`typeFacteurForme`,
`connecteurConnecteurMemoireVive`,
`connecteurEmplacementCarteGraphique`,
`nomSocket`)
VALUES
();

INSERT INTO `ACPC`.`CarteMere_Port`
(`noSerieCarteMere`,
`nomPort`)
VALUES
();

INSERT INTO `ACPC`.`ConnecteurMemoireVive`
(`connecteur`)
VALUES
();

INSERT INTO `ACPC`.`Constructeur`
(`nom`)
VALUES
();

INSERT INTO `ACPC`.`EmplacementCarteGraphique`
(`connecteur`)
VALUES
();

INSERT INTO `ACPC`.`MemoireMorte`
(`noSerieComposant`,
`type`,
`capacite`,
`typeEmplacementMemoireMorte`,
`typeConnecteurAlim`)
VALUES
();

INSERT INTO `ACPC`.`HDD`
(`noSerieComposantMemoireMorte`,
`nbToursParMinuteMax`)
VALUES
();

INSERT INTO `ACPC`.`SSD`
(`noSerieComposantMemoireMorte`,
`vitesseEcriture`,
`vitesseLecture`)
VALUES
();

INSERT INTO `ACPC`.`TypeRAM`
(`noSerieCarteMere`,
`typeRAM`)
VALUES
();

INSERT INTO `ACPC`.`MemoireVive`
(`noSerieComposant`,
`type`,
`frequence`,
`ECC`,
`connecteurConnecteurMemoireVive`)
VALUES
();

INSERT INTO `ACPC`.`Socket`
(`nom`)
VALUES
();

INSERT INTO `ACPC`.`Processeur`
(`noSerieComposant`,
`nbCoeurs`,
`frequence`,
`frequenceMax`,
`ECC`,
`mutliThreading`,
`nomSocket`)
VALUES
();

INSERT INTO `ACPC`.`Refroidisseur`
(`noSerieComposant`,
`hauteur`,
`refroidissementLiquide`,
`helice`)
VALUES
();

INSERT INTO `ACPC`.`Refroidisseur_Socket`
(`noSerieRefroidisseur`,
`nomSocket`)
VALUES
();
