<?php
//---------------------------------------------------------------
// Fichier     : homeComponentScript.php
// Date        : 21.12.2018
// Auteurs     : Gilliand Loris - Tutic Mateo - Wachter Luc
// Fonction    : La partie script pour lister chaque composant.
//               Pour chaque type de composant à afficher, on
//               fait appel à ce script en AJAX. Ce dernier va
//               générer les colonnes ainsi que les données à
//               afficher pour le composant en question. Ce
//               script nécessite donc le paramètre composant_id
//               représentant le type du composant. La variable
//               'componentsList' est une variable SESSION et a
//               été créée dans homeScript.php
// PHP version : 7.2.13
//---------------------------------------------------------------

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
            $req = "SELECT no, Composant.nom, CarteMere.nomSocket, CarteMere.typeFacteurForme, nbEmplacementsRAM, capaciteRAMMax, CarteMere.nomTypeMemoireVive, nomConstructeur, prix
                    FROM CarteMere
                      INNER JOIN Composant
                        ON CarteMere.noComposant = Composant.no";

            // Prendre en compte une mémoire vive, un processeur, un refroidisseur, une carte graphique,
            // un boîtier sélectionné
            if (array_key_exists("selected", $_SESSION['componentsList'][2]) ||
                array_key_exists("selected", $_SESSION['componentsList'][0]) ||
                array_key_exists("selected", $_SESSION['componentsList'][4]) ||
                array_key_exists("selected", $_SESSION['componentsList'][3]) ||
                array_key_exists("selected", $_SESSION['componentsList'][7])) {

                $noMemoireVive = $_SESSION['componentsList'][2]['selected'];
                $noProcesseur = $_SESSION['componentsList'][0]['selected'];
                $noRefroidisseur = $_SESSION['componentsList'][4]['selected'];
                $noCarteGraphique = $_SESSION['componentsList'][3]['selected'];
                $noBoitier = $_SESSION['componentsList'][7]['selected'];

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
                if ($noCarteGraphique) {
                    $req .= " INNER JOIN EmplacementCarteGraphique
                                ON CarteMere.typeEmplacementCarteGraphique = EmplacementCarteGraphique.type
                              INNER JOIN CarteGraphique
                                ON EmplacementCarteGraphique.type = CarteGraphique.typeEmplacementCarteGraphique";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "CarteGraphique.noComposant = " . $noCarteGraphique;
                }
                if ($noBoitier) {
                    $req .= " INNER JOIN FacteurForme ON CarteMere.typeFacteurForme = FacteurForme.type
                              INNER JOIN Boitier_FacteurForme
                                ON FacteurForme.type = Boitier_FacteurForme.typeFacteurForme";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") . "noBoitier = " . $noBoitier;
                }

                $req .= $whereClause;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 2: // Mémoire vive
            // Colonnes à afficher pour le tableau des mémoires vives
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Fréquence", "data" => "frequence"],
                ["title" => "Connecteur", "data" => "typeConnecteurMemoireVive"],
                ["title" => "Type", "data" => "nomTypeMemoireVive"],
                ["title" => "ECC", "data" => "ECC"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT no, Composant.nom, frequence, MemoireVive.typeConnecteurMemoireVive, MemoireVive.nomTypeMemoireVive, ECC, prix
                    FROM MemoireVive
                      INNER JOIN Composant
                        ON MemoireVive.noComposant = Composant.no";

            // Prendre en compte une carte mère sélectionnée
            if (array_key_exists("selected", $_SESSION['componentsList'][1])) {
                $noCarteMere = $_SESSION['componentsList'][1]['selected'];
                $req .= " INNER JOIN ConnecteurMemoireVive
                            ON MemoireVive.typeConnecteurMemoireVive = ConnecteurMemoireVive.type
                          INNER JOIN TypeMemoireVive
                            ON MemoireVive.nomTypeMemoireVive = TypeMemoireVive.nom
                          INNER JOIN CarteMere
                            ON ConnecteurMemoireVive.type = CarteMere.typeConnecteurMemoireVive
                              AND TypeMemoireVive.nom = CarteMere.nomTypeMemoireVive
                           WHERE CarteMere.noComposant = " . $noCarteMere;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 3: // Carte graphique
            // Colonnes à afficher pour le tableau des cartes graphiques
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Puce graphique", "data" => "nomPuceGraphique"],
                ["title" => "Mémoire", "data" => "capaciteMemoireGraphique"],
                ["title" => "Fréquence", "data" => "frequencePuceGraphique"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT no, Composant.nom, PuceGraphique.nom AS 'nomPuceGraphique',
                           capaciteMemoireGraphique, frequencePuceGraphique, prix
                    FROM CarteGraphique
                      INNER JOIN Composant
                        ON CarteGraphique.noComposant = Composant.no
                      INNER JOIN PuceGraphique
                        ON CarteGraphique.nomPuceGraphique = PuceGraphique.nom";

            // Prendre en compte une carte mère et une alimentation sélectionnée
            if (array_key_exists("selected", $_SESSION['componentsList'][1]) ||
                array_key_exists("selected", $_SESSION['componentsList'][8])) {

                $noCarteMere = $_SESSION['componentsList'][1]['selected'];
                $noAlimentation = $_SESSION['componentsList'][8]['selected'];

                $whereClause = "";

                if ($noCarteMere) {
                    $req .= " INNER JOIN EmplacementCarteGraphique 
                                ON CarteGraphique.typeEmplacementCarteGraphique = EmplacementCarteGraphique.type
                              INNER JOIN CarteMere
                                ON EmplacementCarteGraphique.type = CarteMere.typeEmplacementCarteGraphique";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "CarteMere.noComposant = " . $noCarteMere;
                }
                if ($noAlimentation) {
                    $req .= " INNER JOIN CarteGraphique_ConnecteurAlim
                                ON CarteGraphique.noComposant = CarteGraphique_ConnecteurAlim.noCarteGraphique
                              INNER JOIN ConnecteurAlim
                                ON CarteGraphique_ConnecteurAlim.typeConnecteurAlim = ConnecteurAlim.type
                              INNER JOIN Alimentation_ConnecteurAlim
                                ON ConnecteurAlim.type = Alimentation_ConnecteurAlim.typeConnecteurAlim";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "noAlimentation = " . $noAlimentation . " AND " .
                                    "Alimentation_ConnecteurAlim.nombre >= CarteGraphique_ConnecteurAlim.nombre";
                }

                $req .= $whereClause;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 4: // Refroidisseur
            // Colonnes à afficher pour le tableau des refroidisseurs
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Hauteur", "data" => "hauteur"],
                ["title" => "Refroidissement liquide", "data" => "refroidissementLiquide"],
                ["title" => "Helice", "data" => "helice"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT no, Composant.nom, hauteur, refroidissementLiquide, helice, prix
                    FROM Refroidisseur
                      INNER JOIN Composant
                        ON Refroidisseur.noComposant = Composant.no";

            // Prendre en compte un processeur et une carte mère sélectionné
            if (array_key_exists("selected", $_SESSION['componentsList'][0]) ||
                array_key_exists("selected", $_SESSION['componentsList'][1])) {

                $noProcesseur = $_SESSION['componentsList'][0]['selected'];
                $noCarteMere = $_SESSION['componentsList'][1]['selected'];

                $whereClause = "";

                if ($noProcesseur || $noCarteMere) {
                    $req .= " INNER JOIN Refroidisseur_Socket
                                ON Refroidisseur.noComposant = Refroidisseur_Socket.noRefroidisseur
                              INNER JOIN Socket
                                ON Refroidisseur_Socket.nomSocket = Socket.nom";
                    if ($noProcesseur) {
                        $req .= " INNER JOIN Processeur
                                    ON Socket.nom = Processeur.nomSocket";
                        $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                        "Processeur.noComposant = " . $noProcesseur;
                    }
                    if ($noCarteMere) {
                        $req .= " INNER JOIN CarteMere
                                    ON Socket.nom = CarteMere.nomSocket";
                        $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                        "CarteMere.noComposant = " . $noCarteMere;
                    }
                }

                $req .= $whereClause;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 5: // SSD
            // Colonnes à afficher pour le tableau des SSD
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Capacité [GB]", "data" => "capacite"],
                ["title" => "Vitesse d'écriture", "data" => "vitesseEcriture"],
                ["title" => "Vitesse de lecture", "data" => "vitesseLecture"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT no, nom, capacite, vitesseEcriture, vitesseLecture, prix
                    FROM SSD
                      INNER JOIN MemoireMorte
                        ON SSD.noComposantMemoireMorte = MemoireMorte.noComposant
                      INNER JOIN Composant
                        ON MemoireMorte.noComposant = Composant.no";

            // Prendre en compte un boitier sélectionné
            if (array_key_exists("selected", $_SESSION['componentsList'][7])) {
                $noBoitier = $_SESSION['componentsList'][7]['selected'];
                $req .= " INNER JOIN EmplacementMemoireMorte
                            ON MemoireMorte.typeEmplacementMemoireMorte = EmplacementMemoireMorte.type
                          INNER JOIN Boitier_EmplacementMemoireMorte
                            ON EmplacementMemoireMorte.type = Boitier_EmplacementMemoireMorte.typeEmplacementMemoireMorte
                          WHERE noBoitier = " . $noBoitier;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 6: // HDD
            // Colonnes à afficher pour le tableau des HDD
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Capacité [GB]", "data" => "capacite"],
                ["title" => "Tours par minute", "data" => "nbToursParMinuteMax"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT no, nom, capacite, nbToursParMinuteMax, prix
                    FROM HDD
                      INNER JOIN MemoireMorte
                        ON HDD.noComposantMemoireMorte = MemoireMorte.noComposant
                      INNER JOIN Composant
                        ON MemoireMorte.noComposant = Composant.no";

            // Prendre en compte un boitier sélectionné
            if (array_key_exists("selected", $_SESSION['componentsList'][7])) {
                $noBoitier = $_SESSION['componentsList'][7]['selected'];
                $req .= " INNER JOIN EmplacementMemoireMorte
                            ON MemoireMorte.typeEmplacementMemoireMorte = EmplacementMemoireMorte.type
                          INNER JOIN Boitier_EmplacementMemoireMorte
                            ON EmplacementMemoireMorte.type = Boitier_EmplacementMemoireMorte.typeEmplacementMemoireMorte
                          WHERE noBoitier = " . $noBoitier;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 7: // Boitier
            // Colonnes à afficher pour le tableau des boitiers
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Hauteur", "data" => "hauteur"],
                ["title" => "Largeur", "data" => "largeur"],
                ["title" => "Profondeur", "data" => "profondeur"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT DISTINCT no, nom, hauteur, largeur, profondeur, prix
                    FROM Boitier
                      INNER JOIN Composant
                        ON Boitier.noComposant = Composant.no";

            // Prendre en compte un SSD, HDD, alimentation et une carte mère sélectionné
            if (array_key_exists("selected", $_SESSION['componentsList'][5]) ||
                array_key_exists("selected", $_SESSION['componentsList'][6]) ||
                array_key_exists("selected", $_SESSION['componentsList'][8]) ||
                array_key_exists("selected", $_SESSION['componentsList'][1])) {

                $noSSD = $_SESSION['componentsList'][5]['selected'];
                $noHDD = $_SESSION['componentsList'][6]['selected'];
                $noAlimentation = $_SESSION['componentsList'][8]['selected'];
                $noCarteMere = $_SESSION['componentsList'][1]['selected'];

                $whereClause = "";

                if ($noSSD || $noHDD) {
                    $req .= " INNER JOIN Boitier_EmplacementMemoireMorte 
                                ON Boitier.noComposant = Boitier_EmplacementMemoireMorte.noBoitier 
                              INNER JOIN EmplacementMemoireMorte 
                                ON Boitier_EmplacementMemoireMorte.typeEmplacementMemoireMorte = EmplacementMemoireMorte.type 
                              INNER JOIN MemoireMorte 
                                ON EmplacementMemoireMorte.type = MemoireMorte.typeEmplacementMemoireMorte ";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "MemoireMorte.noComposant IN ('" . $noSSD . "', '" . $noHDD . "')";
                }
                if ($noAlimentation) {
                    $req .= " INNER JOIN Boitier_FacteurForme 
                                ON Boitier.noComposant = Boitier_FacteurForme.noBoitier 
                              INNER JOIN FacteurForme 
                                ON Boitier_FacteurForme.typeFacteurForme = FacteurForme.type 
                              INNER JOIN Alimentation 
                                ON FacteurForme.type = Alimentation.typeFacteurForme";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "Alimentation.noComposant = " . $noAlimentation;
                }

                $req .= $whereClause;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 8: // Alimentation
            // Colonnes à afficher pour le tableau des alimentations
            $columns = [
                ["title" => "Numéro", "data" => "no"],
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Puissance", "data" => "puissance"],
                ["title" => "Prix", "data" => "prix"],
            ];

            // Requête de base
            $req = "SELECT no, nom, puissance, prix
                    FROM Alimentation
                      INNER JOIN Composant
                        ON Alimentation.noComposant = Composant.no";

            // Prendre en compte un boitier et une carte graphique sélectionné
            if (array_key_exists("selected", $_SESSION['componentsList'][7]) ||
                array_key_exists("selected", $_SESSION['componentsList'][3])) {

                $noBoitier = $_SESSION['componentsList'][7]['selected'];
                $noCarteGraphique = $_SESSION['componentsList'][3]['selected'];

                $whereClause = "";

                if ($noBoitier) {
                    $req .= " INNER JOIN FacteurForme ON Alimentation.typeFacteurForme = FacteurForme.type
                              INNER JOIN Boitier_FacteurForme ON FacteurForme.type = Boitier_FacteurForme.typeFacteurForme";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "noBoitier = " . $noBoitier;
                }
                if ($noCarteGraphique) {
                    $req .= " INNER JOIN Alimentation_ConnecteurAlim
                                ON Alimentation.noComposant = Alimentation_ConnecteurAlim.noAlimentation
                              INNER JOIN ConnecteurAlim
                                ON Alimentation_ConnecteurAlim.typeConnecteurAlim = ConnecteurAlim.type
                              INNER JOIN CarteGraphique_ConnecteurAlim
                                ON ConnecteurAlim.type = CarteGraphique_ConnecteurAlim.typeConnecteurAlim";
                    $whereClause .= (empty($whereClause) ? " WHERE " : " AND ") .
                                    "noCarteGraphique = " . $noCarteGraphique . " AND " .
                                    "Alimentation_ConnecteurAlim.nombre >= CarteGraphique_ConnecteurAlim.nombre";
                }

                $req .= $whereClause;
            }

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        default:
            $columns = [["title" => "Nom", "data" => "nom"], ["title" => "Prix", "data" => "prix"]];
            $data = [];
    }

    // Ajout de la dernière colonne contenant le bouton "ajouter"
    array_push($columns, ["title" => "Action"]);

    // Préparation des données à envoyer
    $payload = [
        "data" => $data,
        "columns" => $columns
    ];

    echo json_encode($payload);
} else {
    echo "error cannot get composant id";
}
?>
