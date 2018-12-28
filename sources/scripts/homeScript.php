<?php
//---------------------------------------------------------------
//Filename: homeScript.php
//Creation date: 09.05.2017
//Author: Luc Wachter
//Function: The script part of the home page:
//			gets projects and tasks data, execute changes in DB.
//---------------------------------------------------------------

$title = "ACPC - Accueil";

$req = "SELECT * FROM Composant";
$test = dbRequest($req, 'select');
?>
