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

// Flag permettant d'ouvrir ou non le panel des filtres
$showFilters = true;

// Gestion des filtres
if (isset($_POST['PCtype']) && isset($_POST['PCbudget'])) {
    // TODO Prendre en compte les champs du formulaire

    // Une fois le formulaire des filtres saisis, on ferme le panel des filtres
    $showFilters = false;

    // Liste des composants d'un PC
    $listeComposant = array('Processeur', 'Carte mère', 'Mémoire vive', 'Carte graphique', 'Refroidisseur',
                            'SSD', 'Disque dur', 'Boitier', 'Alimentation');

}
?>
