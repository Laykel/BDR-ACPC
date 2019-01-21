<?php
//---------------------------------------------------------------
//Filename: homeScript.php
//Creation date: 09.05.2017
//Author: Luc Wachter
//Function: The script part of the home page:
//			gets projects and tasks data, execute changes in DB.
//---------------------------------------------------------------
session_start();

$title = "ACPC - Accueil";

// Flag permettant d'ouvrir ou non le panel des filtres
$showFilters = true;

// Gestion des filtres
if (isset($_POST['PCtype']) && isset($_POST['PCbudget'])) {
    // TODO Prendre en compte les champs du formulaire

    // Une fois le formulaire des filtres saisis, on ferme le panel des filtres
    $showFilters = false;

    // Liste des composants d'un PC avec leur "propriétés"
    $componentsList = [
        ["label" => "Processeur"],
        ["label" => "Carte mère"],
        ["label" => "Mémoire vive"],
        ["label" => "Carte graphique"],
        ["label" => "Refroidisseur"],
        ["label" => "SSD"],
        ["label" => "Disque dur"],
        ["label" => "Boitier"],
        ["label" => "Alimentation"]
    ];

    // Ajout de la liste dans la session pour pouvoir y accéder ailleur
    $_SESSION['componentsList'] = $componentsList;
}

// Gestion de l'ajout/suppression d'un composant dans la configuration du PC ainsi que la génération de la liste
if (isset($_POST['action'])) {
    // Sélection d'un composant dans la configuration du PC
    if ($_POST['action'] == "add" && isset($_POST['component-id']) && isset($_POST['component-no'])) {
        $componentId = $_POST['component-id'];
        $componentNo = $_POST['component-no'];

        // Ajout du composant sélectionné dans la liste des composants
        $_SESSION['componentsList'][$componentId]['selected'] = $componentNo;

    } // Suppresion d'un composant dans la configuration du PC
    else if ($_POST['action'] == "delete" && isset($_POST['component-id'])) {
        $componentId = $_POST['component-id'];

        // Suppression du composant sélectionné
        unset($_SESSION['componentsList'][$componentId]['selected']);
        var_dump($_SESSION['componentsList'][$componentId]);
    } // Génération de la liste des composants sélectionnés
    else if ($_POST['action'] == "generate") {
        require "../model/dbRequest.php";
        $selectedComponents = [];   // Tableau des composants sélectionnés

        foreach ($_SESSION['componentsList'] as $key => $component) {
            // Ajout du composant dans le tableau des composants sélectionnés
            if ($component['selected']) {
                $noComponent = $component['selected'];  // Id du composant dans la base de données

                // Récupération du nom et du prix du composant sélectionné par l'utilisateur
                $req = "SELECT nom, prix FROM Composant WHERE no = " . $noComponent;
                $response = dbRequest($req, 'select');
                $data = $response->fetchAll();

                // Ajout du label
                $data[0]['label'] = $component['label'];

                array_push($selectedComponents, $data[0]);
            }
        }
        echo json_encode($selectedComponents);
    }
}
?>
