<?php

session_start();
require "../model/dbRequest.php";

if (isset($_GET['composant_id'])) {
    $componentId = $_GET['composant_id'];   // Id du composant (correspond à l'index de la liste $componentsList)

    // Le $componentId est à traiter en fonction du tableau $componentsList dans homeScript.php
    switch ($componentId) {
        case 0: // Processeur
            // Colonnes à afficher pour le tableau des processseurs
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Vitesse", "data" => "frequence"],
                ["title" => "Nombre de coeurs", "data" => "nbCoeurs"],
                ["title" => "ECC", "data" => "ECC"],
                ["title" => "Multi threading", "data" => "multithreading"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT no, Composant.nom, frequence, nbCoeurs, ECC, multithreading, prix
                    FROM Processeur
                      INNER JOIN Composant
                        ON Processeur.noComposant = Composant.no";

            // Prendre en compte une carte mère et/ou un refroidisseur sélectionné
            if (array_key_exists("selected", $_SESSION['componentsList'][1]) ||
                array_key_exists("selected", $_SESSION['componentsList'][4])) {

                $noCarteMere = $_SESSION['componentsList'][1]['selected'];
                $noRefroidisseur = $_SESSION['componentsList'][4]['selected'];

                $req .= " INNER JOIN Socket ON Processeur.nomSocket = Socket.nom";

                // Par défaut, il n'y pas de clause WHERE
                $whereClause = "";

                if ($noCarteMere) {
                    $req .= " INNER JOIN CarteMere ON Socket.nom = CarteMere.nomSocket";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "CarteMere.noComposant = " . $noCarteMere;
                }
                if ($noRefroidisseur) {
                    $req .= " INNER JOIN Refroidisseur_Socket ON Socket.nom = Refroidisseur_Socket.nomSocket
                              INNER JOIN Refroidisseur 
                                ON Refroidisseur_Socket.noRefroidisseur = Refroidisseur.noComposant";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "noRefroidisseur = " . $noRefroidisseur;
                }

                $req .= $whereClause;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 1: // Carte mère
            // Colonnes à afficher pour le tableau des cartes mères
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Socket", "data" => "nomSocket"],
                ["title" => "Facteur de forme", "data" => "typeFacteurForme"],
                ["title" => "RAM slots", "data" => "nbEmplacementsRAM"],
                ["title" => "Max RAM", "data" => "capaciteRAMMax"],
                ["title" => "Type RAM", "data" => "nomTypeMemoireVive"],
                ["title" => "Constructeur", "data" => "nomConstructeur"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT no, Composant.nom, CarteMere.nomSocket, typeFacteurForme, nbEmplacementsRAM, capaciteRAMMax, CarteMere.nomTypeMemoireVive, nomConstructeur, prix
                    FROM CarteMere
                      INNER JOIN Composant
                        ON CarteMere.noComposant = Composant.no";

            // Prendre en compte une mémoire vive, un processeur, un refroidisseur et une carte graphique sélectionné
            if (array_key_exists("selected", $_SESSION['componentsList'][2]) ||
                array_key_exists("selected", $_SESSION['componentsList'][0]) ||
                array_key_exists("selected", $_SESSION['componentsList'][4]) ||
                array_key_exists("selected", $_SESSION['componentsList'][3])) {

                $noMemoireVive = $_SESSION['componentsList'][2]['selected'];
                $noProcesseur = $_SESSION['componentsList'][0]['selected'];
                $noRefroidisseur = $_SESSION['componentsList'][4]['selected'];
                $noCarteGraphique = $_SESSION['componentsList'][3]['selected'];

                $whereClause = "";

                if ($noMemoireVive) {
                    $req .= " INNER JOIN ConnecteurMemoireVive 
                                ON CarteMere.typeConnecteurMemoireVive = ConnecteurMemoireVive.type
                              INNER JOIN TypeMemoireVive 
                                ON CarteMere.nomTypeMemoireVive = TypeMemoireVive.nom
                              INNER JOIN MemoireVive
                                ON ConnecteurMemoireVive.type = MemoireVive.typeConnecteurMemoireVive
                                  AND TypeMemoireVive.nom = MemoireVive.nomTypeMemoireVive";

                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "MemoireVive.noComposant = " . $noMemoireVive;
                }
                if ($noProcesseur || $noRefroidisseur) {
                    $req .= " INNER JOIN Socket ON CarteMere.nomSocket = Socket.nom";
                    if ($noProcesseur) {
                        $req .= " INNER JOIN Processeur ON Socket.nom = Processeur.nomSocket";
                        $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                        "Processeur.noComposant = " . $noProcesseur;
                    }
                    if ($noRefroidisseur) {
                        $req .= " INNER JOIN Refroidisseur_Socket ON Socket.nom = Refroidisseur_Socket.nomSocket
                                  INNER JOIN Refroidisseur 
                                    ON Refroidisseur_Socket.noRefroidisseur = Refroidisseur.noComposant";
                        $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                        "noRefroidisseur = " . $noRefroidisseur;
                    }
                }

                $req .= $whereClause;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 2: // Mémoire vive
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Fréquence", "data" => "frequence"],
                ["title" => "Connecteur", "data" => "typeConnecteurMemoireVive"],
                ["title" => "Type", "data" => "nomTypeMemoireVive"],
                ["title" => "ECC", "data" => "ECC"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT no, nom, frequence, typeConnecteurMemoireVive, nomTypeMemoireVive, ECC, prix
                    FROM MemoireVive
                      INNER JOIN Composant
                        ON MemoireVive.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 3: // Carte graphique
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Puce graphique", "data" => "nomPuceGraphique"],
                ["title" => "Mémoire", "data" => "capaciteMemoireGraphique"],
                ["title" => "Fréquence", "data" => "frequencePuceGraphique"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT no, Composant.nom, PuceGraphique.nom AS 'nomPuceGraphique',
                           capaciteMemoireGraphique, frequencePuceGraphique, prix
                    FROM CarteGraphique
                      INNER JOIN Composant
                        ON CarteGraphique.noComposant = Composant.no
                      INNER JOIN PuceGraphique
                        ON CarteGraphique.nomPuceGraphique = PuceGraphique.nom";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 4: // Refroidisseur
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Hauteur", "data" => "hauteur"],
                ["title" => "Refroidissement liquide", "data" => "refroidissementLiquide"],
                ["title" => "Helice", "data" => "helice"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT no, nom, hauteur, refroidissementLiquide, helice, prix
                    FROM Refroidisseur
                      INNER JOIN Composant
                        ON Refroidisseur.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 5: // SSD
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Capacité [GB]", "data" => "capacite"],
                ["title" => "Vitesse d'écriture", "data" => "vitesseEcriture"],
                ["title" => "Vitesse de lecture", "data" => "vitesseLecture"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT no, nom, capacite, vitesseEcriture, vitesseLecture, prix
                    FROM SSD
                      INNER JOIN MemoireMorte
                        ON SSD.noComposantMemoireMorte = MemoireMorte.noComposant
                      INNER JOIN Composant
                        ON MemoireMorte.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 6: // HDD
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Capacité [GB]", "data" => "capacite"],
                ["title" => "Tours par minute", "data" => "nbToursParMinuteMax"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT no, nom, capacite, nbToursParMinuteMax, prix
                    FROM HDD
                      INNER JOIN MemoireMorte
                        ON HDD.noComposantMemoireMorte = MemoireMorte.noComposant
                      INNER JOIN Composant
                        ON MemoireMorte.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 7: // Boitier
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Hauteur", "data" => "hauteur"],
                ["title" => "Largeur", "data" => "largeur"],
                ["title" => "Profondeur", "data" => "profondeur"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT no, nom, hauteur, largeur, profondeur, prix
                    FROM Boitier
                      INNER JOIN Composant
                        ON Boitier.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 8:
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Puissance", "data" => "puissance"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT no, nom, puissance, prix
                    FROM Alimentation
                      INNER JOIN Composant
                        ON Alimentation.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        default:
            $columns = [["title" => "Nom", "data" => "nom"], ["title" => "Prix", "data" => "prix"]];
            $data = [];
    }

    // Ajout de la dernière colonne avec le bouton "ajouter"
    array_push($columns, ["title" => "Action"]);

    // Send data
    $payload = [
        "data" => $data,
        "columns" => $columns
    ];

    echo json_encode($payload);
} else {
    echo "error cannot get composant id";
}
?>
