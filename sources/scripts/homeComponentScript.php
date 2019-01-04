<?php
require "../model/dbRequest.php";

if (isset($_GET['composant_id'])) {
    $composantId = $_GET['composant_id'];

    // Le composantId est à traiter en fonction du tableau $listeComposant dans homeScript.php
    switch ($composantId) {
        case 1: // Carte mère
            $columns = [
                ["title" => "Nom", "data" => "nom"],
                ["title" => "Socket", "data" => "nomSocket"],
                ["title" => "Facteur de forme", "data" => "typeFacteurForme"],
                ["title" => "RAM slots", "data" => "nbEmplacementsRAM"],
                ["title" => "Max RAM", "data" => "capaciteRAMMax"],
                ["title" => "Constructeur", "data" => "nomConstructeur"],
                ["title" => "Prix", "data" => "prix"],
            ];

            $req = "SELECT nom, nomSocket, typeFacteurForme, nbEmplacementsRAM, capaciteRAMMax, nomConstructeur, prix 
                    FROM CarteMere 
                      INNER JOIN Composant 
                        ON CarteMere.noComposant = Composant.no";

            $response = dbRequest($req, 'select');
            $data = $response->fetchAll();
            break;
        default:
            $columns = [["title" => "Nom", "data" => "nom"], ["title" => "Prix", "data" => "prix"]];
            $data = [];
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
