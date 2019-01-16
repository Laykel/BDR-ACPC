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
('MSI'), ('Cooler Master'), ('Asus'), ('Intel'), ('NVidia'), ('HyperX'),
('Samsung'), ('Western Digital'), ('BitFenix'), ('AMD'), ('Gigabyte'),
('Corsair'), ('Toshiba'), ('EVGA'), ('ARTIC'), ('NZXT'), ('Kingston'),
('ASRock'), ('PowerColor'), ('G.Skill'), ('Plextor'), ('Lian-Li');

INSERT INTO `ACPC`.`Composant`
(`nom`,
 `prix`,
 `nomConstructeur`)
VALUES
('Z97S SLI Krait Edition', 132, 'MSI'),            -- carte mère
('Core i5 4690K', 257, 'Intel'),                   -- CPU
('GeForce GTX 1070 STRIX 8G-GAMING', 508, 'ASUS'), -- carte graphique
('Fury', 135, 'HyperX'),                           -- RAM
('850 EVO Basic', 51.3, 'Samsung'),                -- SSD
('Blue', 54, 'Western Digital'),                   -- HDD
('G750M', 97.9, 'Cooler Master'),                  -- Alim
('Hyper 212 Evo', 42.9, 'Cooler Master'),          -- Refroidisseur
('Nova Window', 46.9, 'BitFenix'),                 -- Boitier

('X470 Gaming Plus', 129.46, 'MSI'),               -- carte mère
('Rysen 7 2700X', 379.9, 'AMD'),                   -- CPU
('Radeon RX 580 Gaming', 284.90, 'Gigabyte'),      -- carte graphique
('Vengeance LPX', 49.90, 'Corsair'),               -- RAM
('A400', 64.90, 'Kingston'),                       -- SSD
('PH2300U', 75, 'Toshiba'),                        -- HDD
('SuperNova 850', 99.90, 'EVGA'),                  -- Alim
('Freezer Xtreme', 31.80, 'ARTIC'),                -- Refroidisseur
('H500', 76.90, 'NZXT');                           -- Boitier

('X99', 229.9, 'ASRock'),                          -- carte mère
('Xeon E5 2620', 409, 'Intel'),                    -- CPU
('AXRX 570', 119.9, 'PowerColor'),                 -- carte graphique
('Trident Z RGB', 124.9, 'G.Skill'),               -- RAM
('PX-128M6V', 86.00, 'Plextor'),                   -- SSD
('WD20EZRZ', 61.9, 'Western Digital'),             -- HDD
('BN215', 135.3, 'Be Quiet!'),                     -- Alim
('H60', 64.9, 'Corsair'),                          -- Refroidisseur
('PC-O10 WX', 230.00, 'Lian-Li');                  -- Boitier
/*
('', , ''), -- carte mère
('', , ''), -- CPU
('', , ''), -- carte graphique
('', , ''), -- RAM
('', , ''), -- SSD
('', , ''), -- HDD
('', , ''), -- Alim
('', , ''), -- Refroidisseur
('', , ''); -- Boitier
*/

INSERT INTO `ACPC`.`FacteurForme`
(`type`)
VALUES
('ATX'), ('mATX'), ('Mini ITX'), ('SFX12V');

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
(25, 600, 'SFX12V');

INSERT INTO `ACPC`.`Alimentation_ConnecteurAlim`
(`noAlimentation`,
 `typeConnecteurAlim`,
 `nombre`)
VALUES
(7, '20+4-pin ATX', 1), (7, '4+4-pin 12V', 1), (7, '4-pin Molex', 6),
(7, '4-pin Floppy', 1), (7, '15-pin S-ATA', 8), (7, '6+2 broches PCIe', 4),
(16, '20+4-pin ATX', 1), (16, '4+4-pin 12V', 2), (16, '4-pin Molex', 4),
(16, '4-pin Floppy', 1), (16, '15-pin S-ATA', 10), (16, '6+2 broches PCIe', 4)
(25, '20+4-pin ATX', 1), (25, '4+4-pin 12V', 1), (25, '4-pin Molex', 4),
(25, '15-pin S-ATA', 6), (25, '6+2 broches PCIe', 4);

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
(9, 43.7, 46.5, 18.3),
(18, 42.8, 46, 21),
(27, 37.6, 49.3, 24.2);

INSERT INTO `ACPC`.`Boitier_FacteurForme`
(`noBoitier`,
 `typeFacteurForme`)
VALUES
(9, 'ATX'), (9, 'mATX'), (9, 'Mini ITX'),
(18, 'ATX'), (18, 'mATX'), (18, 'Mini ITX'),
(27, 'ATX'), (27, 'SFX12V'), (27, 'mATX'), (27, 'EATX');

INSERT INTO `ACPC`.`Boitier_EmplacementMemoireMorte`
(`noBoitier`,
 `typeEmplacementMemoireMorte`,
 `nombre`)
VALUES
(9, 2.5, 2), (9, 3.5, 4), (9, 5.25, 1),
(18, 2.5, 2), (18, 3.5, 2),
(27, 2.5, 3), (27, 3.5, 4);

INSERT INTO `ACPC`.`PuceGraphique`
(`nom`,
 `nomConstructeur`)
VALUES
('GeForce GTX 1070', 'NVidia'),
('Radeon RX 580', 'AMD');

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
(3, 1657, 'GDDR5', 8, 29.8, 13.4, 2, 'PCIe x16', 'GeForce GTX 1070'),
(12, 1340, 'GDDR5', 4, 23.2, 11.6, 2, 'PCIe x16', 'Radeon RX 580'),
(21, 1168, 'GDDR5', 4, 25.5, 137, 2, 'PCIe x16', 'Radeon RX 570');

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
(21, 'HDMI', 1), (21, 'DisplayPort', 3), (21, 'DVI-D', 1);

INSERT INTO `ACPC`.`Socket`
(`nom`)
VALUES
('LGA 775'), ('LGA 1366'), ('FM1'), ('LGA 1156'), ('LGA 1155'), ('LGA 2011'),
('LGA 1150'), ('LGA 2011-v3'), ('LGA 1151'), ('AM4'), ('AM2'), ('AM2+'), ('AM3'),
('AM3+'), ('FM2'), ('FM2+');

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
(19, 8, 128, 'X99', 3400, 5, 'EATX', 'DDR4', 'DIMM 288', 'PCIe x16', 'LGA 2011-v3');

INSERT INTO `ACPC`.`CarteMere_Port`
(`noCarteMere`,
 `nomPort`,
 `nombre`)
VALUES
(1, 'HDMI', 1), (1, 'DVI-D', 1), (1, 'VGA', 1),
(10, 'DVI-D', 1), (10, 'HDMI', 1);

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
(24, 2000, 3.5, '15-pin S-ATA');

INSERT INTO `ACPC`.`HDD`
(`noComposantMemoireMorte`,
 `nbToursParMinuteMax`)
VALUES
(6, 7200),
(15, 7200),
(24, 5400);

INSERT INTO `ACPC`.`SSD`
(`noComposantMemoireMorte`,
 `vitesseEcriture`,
 `vitesseLecture`)
VALUES
(5, 520, 550),
(14, 500, 450),
(23, 170, 535);

INSERT INTO `ACPC`.`MemoireVive`
(`noComposant`,
 `nomTypeMemoireVive`,
 `frequence`,
 `ECC`,
 `typeConnecteurMemoireVive`)
VALUES
(4, 'DDR3', 1600, 0, 'DIMM 240'),
(13, 'DDR4', 3000, 0, 'DIMM 288'),
(22, 'DDR4', 3000, 0, 'DIMM 288');

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
(20, 8, 2.1, 3, 1, 1, 'LGA 2011-v3');

INSERT INTO `ACPC`.`Refroidisseur`
(`noComposant`,
 `hauteur`,
 `refroidissementLiquide`,
 `helice`)
VALUES
(8, 15.9, 0, 1),
(17, 13.1, 1, 0)
(26, 12.0, 1, 1);

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
(26, 'LGA 1156'), (26, 'LGA 1366'), (26, 'LGA 2011'), (26, 'LGA 2011-v3'), (26, 'LGA 2066');