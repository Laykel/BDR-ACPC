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
(50, 'Mini ITX');

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
(50, 2.5, 2), (50, 5.25, 1);

INSERT INTO `ACPC`.`PuceGraphique`
(`nom`,
 `nomConstructeur`)
VALUES
('GeForce GTX 1070', 'NVidia'),
('Radeon RX 580', 'AMD'),
('Radeon RX 570', 'AMD'),
('GeForce GTX 1050 Ti', 'NVidia');

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