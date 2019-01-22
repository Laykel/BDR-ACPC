<?php
//---------------------------------------------------------------
// Fichier     : homeScript.php
// Date        : 21.12.2018
// Auteurs     : Gilliand Loris - Tutic Mateo - Wachter Luc
// Fonction    : La partie script de la page "accueil". Gère
//               principalement le formulaire de filtres, l'ajout
//               et la suppresion d'un composant par
//               l'utilisateur ainsi que la génération de la
//               liste des composants sélectionnés.
// PHP version : 7.2.13
//---------------------------------------------------------------

session_start();

$title = "ACPC - Accueil";

// Flag permettant d'ouvrir ou non le panel des filtres
$showFilters = true;

// Gestion des filtres
if (isset($_POST['PCtype']) && isset($_POST['PCbudget'])) {
    // Une fois le formulaire des filtres saisis, on ferme le panel des filtres
    $showFilters = false;

    // Gestion du budget maximum saisi par l'utilisateur
    $PCBudgetInput = $_POST['PCbudget'];
    $PCBudget = 0;

    if ($PCBudgetInput && is_numeric($PCBudgetInput)) {
        $PCBudget = number_format($PCBudgetInput, 2, '.', '');

        // Ajout du budget dans la session
        $_SESSION['budget'] = $PCBudget;
    } else {
        // Retirer le budget de la session
        unset($_SESSION['budget']);
    }

    // Gestion du type de PC - détermine si PC est pour le gaming
    $PCTypeInput = $_POST['PCtype'];
    $PCGaming = $PCTypeInput == "gaming" ? true : false;

    // Liste des composants d'un PC avec leur "propriétés"
    $componentsList = [
        ["label" => "Processeur", "hide" => false],
        ["label" => "Carte mère", "hide" => false],
        ["label" => "Mémoire vive", "hide" => false],
        ["label" => "Carte graphique", "hide" => false],
        ["label" => "Refroidisseur", "hide" => false],
        ["label" => "SSD", "hide" => false],
        ["label" => "Disque dur", "hide" => false],
        ["label" => "Boitier", "hide" => false],
        ["label" => "Alimentation", "hide" => false]
    ];

    // Cacher la carte graphique si le PC n'est pas gaming (choix d'implémentation)
    $componentsList[3]["hide"] = !$PCGaming ? true : false;

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
        $selectedComponents = ["data" => [], "budget" => $_SESSION['budget']];   // Tableau des composants sélectionnés

        foreach ($_SESSION['componentsList'] as $key => $component) {
            // Ajout du composant dans le tableau des composants sélectionnés
            if ($component['selected']) {
                $noComponent = $component['selected'];  // Id du composant dans la base de données

                // Récupération du nom et du prix du composant sélectionné par l'utilisateur
                $req = "SELECT nom, prix FROM Composant WHERE no = " . $noComponent;
                $response = dbRequest($req, 'select');
                $data = $response->fetchAll();

                // Ajout du label du type de composant
                $data[0]['label'] = $component['label'];

                array_push($selectedComponents["data"], $data[0]);
            }
        }
        echo json_encode($selectedComponents);
    }
}
?>
