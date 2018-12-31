<?php
//------------------------------------------------------------------------
// Filename: dbRequest.php
// Creation date: 26.12.2018
// Author: Luc Wachter
// Function: Handles request to the database
//------------------------------------------------------------------------

// Function to handle every DB call, through PDO
// Returns DB data in case of SELECT, ID in case of insert
function dbRequest($req, $type_req) {
    try {
        // Connection to the tasking database
        $connect = new PDO('mysql:host=172.17.0.2; dbname=ACPC;charset=utf8', 'acpcUser', 'AcPcP455w0rd');

        // Allows to get more information from errors
        $connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (Exception $e) {
        echo 'There was an error : '.$e->getMessage();
        die();
    }

    // Execution of the request
    if ($type_req == 'select') {
        // Execute a select request
        $res = $connect->query($req);
    }
    else {
        // Execute a non-select request
        if (false === $connect->exec($req)) {
            return false;
        }
        // Set return value to the last inserted ID
        $res = $connect->lastInsertId();
    }

    return $res;
}
