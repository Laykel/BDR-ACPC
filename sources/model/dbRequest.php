<?php
/*
-----------------------------------------------------------------------------------
Projet      : ACPC
Fichier     : dbRequest.php
Auteur(s)   : Gilliand Loris - Tutic Mateo - Wachter Luc
Date        : 26.12.2018

But         : Définit la fonction gérant les requêtes à la base de données

Remarque(s) : La valeur de retour de dbRequest est un objet PDOStatement dans
              le cas d'un insert, mais un simple int sinon

PHP version : 7.2.13
-----------------------------------------------------------------------------------
*/

// Retourne les données de la BD dans le cas d'un SELECT
// et l'id du résultat dans le cas d'un INSERT ou d'un UPDATE
function dbRequest($req, $type_req) {
    $host   = "mysql001";
    $dbname = "ACPC";
    $user   = "acpcUser";
    $pwd    = "AcPcP455w0rd";

    try {
        // Connection à la base de données avec le driver PDO
        $connection = new PDO("mysql:host=$host; dbname=$dbname; charset=utf8", $user, $pwd);

        // Traiter les erreurs comme des exceptions
        $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // Les résultats sont sous la forme d'un tableau associatif
        $connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    }
    catch (Exception $e) {
        echo "Erreur lors de la connexion à la base de données : ".$e->getMessage();
        die();
    }

    // Exécution de la requête
    if ($type_req == "select") {
        // Exécution d'une requête SELECT
        $res = $connection->query($req);
    }
    else {
        // Exécution d'une requête non SELECT
        if (false === $connection->exec($req)) {
            return false;
        }
        // La valeur de retour est l'id de la ligne insérée
        $res = $connection->lastInsertId();
    }

    return $res;
}
