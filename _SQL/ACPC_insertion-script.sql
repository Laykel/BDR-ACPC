-- ***************************************************
-- * SQL insert requests
-- *--------------------------------------------------
-- * Authors: Loris Gilliand, Mateo Tutic, Luc Wachter
-- * Group: 8
-- * Creation date: 27.12.2018
-- ***************************************************

INSERT INTO `ACPC`.`Constructeur`
(`nom`)
VALUES
('MSI'), ('Cooler Master'), ('Asus'), ('Intel'), ('NVidia'), ('HyperX'), ('Samsung'),
('Western Digital'), ('BitFenix');

-- J'utilise ici noSerie comme un ID auto-incrémenté... à voir.
INSERT INTO `ACPC`.`Composant`
(`nom`,
`prix`,
`nomConstructeur`)
VALUES
('Z97S SLI Krait Edition', 132, 'MSI'),
('Core i5 4690K', 257, 'Intel'),
('GeForce GTX 1070 STRIX 8G-GAMING', 508, 'ASUS'),
('Fury', 135, 'HyperX'),
('850 EVO Basic', 51.3, 'Samsung'),
('Blue', 54, 'Western Digital'),
('G750M', 97.9, 'Cooler Master'),
('Hyper 212 Evo', 42.9, 'Cooler Master'),
('Nova Window', 46.9, 'BitFenix');

INSERT INTO `ACPC`.`FacteurForme`
(`type`)
VALUES
('ATX'), ('mATX'), ('Mini ITX');

INSERT INTO `ACPC`.`ConnecteurAlim`
(`type`)
VALUES
('20+4-pin ATX'), ('4+4-pin 12V'), ('4-pin Molex'), ('4-pin Floppy'), ('15-pin S-ATA'), ('6+2 broches PCIe');

INSERT INTO `ACPC`.`Alimentation`
(`noSerieComposant`,
`puissance`,
`typeFacteurForme`)
VALUES
(7, 750, 'ATX');

-- Il faut un champ nbrConnecteur pour le nombre de connecteurs de ce type !!
-- On a 8 (7, '15-pin S-ATA')...
INSERT INTO `ACPC`.`Alimentation_ConnecteurAlim`
(`noSerieAlimentation`,
`typeConnecteurAlim`)
VALUES
(7, '20+4-pin ATX'), (7, '4+4-pin 12V'), (7, '4-pin Molex'), (7, '4-pin Floppy'),
(7, '15-pin S-ATA'), (7, '6+2 broches PCIe');

INSERT INTO `ACPC`.`EmplacementMemoireMorte`
(`type`)
VALUES
(2.5), (3.5), (5.25);

INSERT INTO `ACPC`.`Boitier`
(`noSerieComposant`,
`hauteur`,
`largeur`,
`profondeur`)
VALUES
(9, 43.7, 46.5, 18.3);

INSERT INTO `ACPC`.`Boitier_FacteurForme`
(`noSerieBoitier`,
`typeFacteurForme`)
VALUES
(9, 'ATX'), (9, 'mATX'), (9, 'Mini ITX');

-- Pareil, nbrEmplacement !!
INSERT INTO `ACPC`.`Boitier_EmplacementMemoireMorte`
(`noSerieBoitier`,
`typeEmplacementMemoireMorte`)
VALUES
(9, 2.5), (9, 3.5), (9, 5.25);

INSERT INTO `ACPC`.`PuceGraphique`
(`nom`,
`nomConstructeur`)
VALUES
('GeForce GTX 1070', 'NVidia');

INSERT INTO `ACPC`.`Port`
(`nom`)
VALUES
('HDMI'), ('DVI-D'), ('DisplayPort'), ('VGA');

INSERT INTO `ACPC`.`EmplacementCarteGraphique`
(`connecteur`)
VALUES
('PCIe x16'), ('PCIe x8');

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
(3, 1657, 'GDDR5', 8, 29.8, 13.4, 2, 'PCIe x16', 'GeForce GTX 1070');

INSERT INTO `ACPC`.`CarteGraphique_ConnecteurAlim`
(`noSerieCarteGraphique`,
`typeConnecteurAlim`)
VALUES
(3, '6+2 broches PCIe');

-- Pareil, nbrPorts !!
INSERT INTO `ACPC`.`CarteGraphique_Port`
(`noSerieCarteGraphique`,
`nomPort`)
VALUES
(3, 'HDMI'), (3, 'DisplayPort'), (3, 'DVI-D');

INSERT INTO `ACPC`.`Socket`
(`nom`)
VALUES
('LGA 775'), ('LGA 1366'), ('FM1'), ('LGA 1156'), ('LGA 1155'), ('LGA 2011'), ('LGA 1150'),
('LGA 2011-v3'), ('LGA 1151');

INSERT INTO `ACPC`.`ConnecteurMemoireVive`
(`connecteur`)
VALUES
('DIMM 184'), ('DIMM 240'), ('SODIMM 200');

-- On ne stocke pas quel type d'emplacements carte graphique la carte mère a.
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
(1, 4, 32, 'Z97', 3200, 5, 'ATX', 'DIMM 240', 'PCIe x16', 'LGA 1150');

-- Pareil, nbrPorts !!
-- Est-ce qu'on met les autres ports (ethernet, USB, ...) ?
INSERT INTO `ACPC`.`CarteMere_Port`
(`noSerieCarteMere`,
`nomPort`)
VALUES
(1, 'HDMI'), (1, 'DVI-D'), (1, 'VGA');

-- Cette table n'a pas le bon nom, si ?
-- En plus, on n'a pas de table avec les types de mémoires vives.
INSERT INTO `ACPC`.`TypeRAM`
(`noSerieCarteMere`,
`typeRAM`)
VALUES
(1, 'DDR3');

INSERT INTO `ACPC`.`MemoireMorte`
(`noSerieComposant`,
`type`,
`capacite`,
`typeEmplacementMemoireMorte`,
`typeConnecteurAlim`)
VALUES
(5, 'SSD', 120, 2.5, '15-pin S-ATA'), (6, 'HDD', 1000, 3.5, '15-pin S-ATA');

INSERT INTO `ACPC`.`HDD`
(`noSerieComposantMemoireMorte`,
`nbToursParMinuteMax`)
VALUES
(6, 7200);

INSERT INTO `ACPC`.`SSD`
(`noSerieComposantMemoireMorte`,
`vitesseEcriture`,
`vitesseLecture`)
VALUES
(5, 520, 550);

INSERT INTO `ACPC`.`MemoireVive`
(`noSerieComposant`,
`type`,
`frequence`,
`ECC`,
`connecteurConnecteurMemoireVive`)
VALUES
(4, 'DDR3', 1600, 0, 'DIMM 240');

INSERT INTO `ACPC`.`Processeur`
(`noSerieComposant`,
`nbCoeurs`,
`frequence`,
`frequenceMax`,
`ECC`,
`mutliThreading`,
`nomSocket`)
VALUES
(2, 4, 3.5, 3.9, 0, 0, 'LGA 1150');

INSERT INTO `ACPC`.`Refroidisseur`
(`noSerieComposant`,
`hauteur`,
`refroidissementLiquide`,
`helice`)
VALUES
(8, 15.9, 0, 1);

INSERT INTO `ACPC`.`Refroidisseur_Socket`
(`noSerieRefroidisseur`,
`nomSocket`)
VALUES
(8, 'LGA 775'), (8, 'LGA 1366'), (8, 'FM1'), (8, 'LGA 1156'), (8, 'LGA 1155'), (8, 'LGA 2011'),
(8, 'LGA 1150'), (8, 'LGA 2011-v3'), (8, 'LGA 1151');
