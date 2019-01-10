<?php
require "../model/dbRequest.php";

if (isset($_GET['composant_id'])) {
    $composantId = $_GET['composant_id'];

    // Le composantId est à traiter en fonction du tableau $listeComposant dans homeScript.php
    switch ($composantId) {
        case 0: // Processeur
            $columns =[
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Vitesse", "data" => "frequence"],
                ["title" => "Nombre de coeurs", "data" => "nbCoeurs"],
                ["title" => "ECC", "data" => "ECC"],
                ["title" => "Multi threading", "data" => "multithreading"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, frequence, nbCoeurs, ECC, multithreading, prix
                    FROM Processeur
                      INNER JOIN Composant
                        ON Processeur.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 1: // Carte mère
            $columns = [
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Socket", "data" => "nomSocket"],
                ["title" => "Facteur de forme", "data" => "typeFacteurForme"],
                ["title" => "RAM slots", "data" => "nbEmplacementsRAM"],
                ["title" => "Max RAM", "data" => "capaciteRAMMax"],
                ["title" => "Type RAM", "data" => "nomTypeMemoireVive"],
                ["title" => "Constructeur", "data" => "nomConstructeur"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, nomSocket, typeFacteurForme, nbEmplacementsRAM, capaciteRAMMax, nomTypeMemoireVive, nomConstructeur, prix
                    FROM CarteMere
                      INNER JOIN Composant
                        ON CarteMere.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 2: // Mémoire vive
            $columns = [
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Fréquence", "data" => "frequence"],
                ["title" => "Connecteur", "data" => "typeConnecteurMemoireVive"],
                ["title" => "Type", "data" => "nomTypeMemoireVive"],
                ["title" => "ECC", "data" => "ECC"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, frequence, typeConnecteurMemoireVive, nomTypeMemoireVive, ECC, prix
                    FROM MemoireVive
                      INNER JOIN Composant
                        ON MemoireVive.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 3: // Carte graphique
            $columns = [
                ["title" => "Nom", "data" => "nomComposant"],
                ["title" => "Puce graphique", "data" => "nomPuceGraphique"],
                ["title" => "Mémoire", "data" => "capaciteMemoireGraphique"],
                ["title" => "Fréquence", "data" => "frequencePuceGraphique"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT Composant.nom AS 'nomComposant', PuceGraphique.nom AS 'nomPuceGraphique',
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
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Hauteur", "data" => "hauteur"],
                ["title" => "Refroidissement liquide", "data" => "refroidissementLiquide"],
                ["title" => "Helice", "data" => "helice"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, hauteur, refroidissementLiquide, helice, prix
                    FROM Refroidisseur
                      INNER JOIN Composant
                        ON Refroidisseur.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 5: // SSD
            $columns = [
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Capacité [GB]", "data" => "capacite"],
                ["title" => "Vitesse d'écriture", "data" => "vitesseEcriture"],
                ["title" => "Vitesse de lecture", "data" => "vitesseLecture"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, capacite, vitesseEcriture, vitesseLecture, prix
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
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Capacité [GB]", "data" => "capacite"],
                ["title" => "Tours par minute", "data" => "nbToursParMinuteMax"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, capacite, nbToursParMinuteMax, prix
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
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Hauteur", "data" => "hauteur"],
                ["title" => "Largeur", "data" => "largeur"],
                ["title" => "Profondeur", "data" => "profondeur"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, hauteur, largeur, profondeur, prix
                    FROM Boitier
                      INNER JOIN Composant
                        ON Boitier.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        case 8:
            $columns = [
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Puissance", "data" => "puissance"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, puissance, prix
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
    array_push($columns, ["title" => "Action", "data" => "action"]);
    if (!empty($data)) {
        $data[0]["action"] = "<button type=\"button\" class=\"btn btn-info btn-xs\">Ajouter</button>";
    }

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
