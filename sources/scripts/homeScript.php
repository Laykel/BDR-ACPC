<?php
//---------------------------------------------------------------
//Filename: homeScript.php
//Creation date: 09.05.2017
//Author: Luc Wachter
//Function: The script part of the home page:
//			gets projects and tasks data, execute changes in DB.
//---------------------------------------------------------------

var_dump($_POST);
$title = "ACPC - Accueil";

// Gestion des filtres
if (isset($_POST['PCtype']) && isset($_POST['PCbudget'])) {
    // TODO Prendre en compte les champs du formulaire

    // Liste des composants d'un PC
    $listeComposant = array('Processeur', 'Carte mère', 'Mémoire vive', 'Carte graphique', 'Refroidisseur',
                            'SSD', 'Disque dur', 'Boitier', 'Alimentation');

}

$req = "SELECT * FROM Composant";
$test = dbRequest($req, 'select');
?>
