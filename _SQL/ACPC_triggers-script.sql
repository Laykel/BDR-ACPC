-- ***************************************************
-- * SQL triggers creation requests
-- *--------------------------------------------------
-- * Authors: Loris Gilliand, Mateo Tutic, Luc Wachter
-- * Group: 8
-- * Creation date: 20.01.2018
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
