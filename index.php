<?php
/*
-----------------------------------------------------------------------------------
Projet      : ACPC
Fichier     : index.php
Auteur(s)   : Gilliand Loris - Tutic Mateo - Wachter Luc
Date        : 21.12.2018

But         : Page principale de l'application web

Remarque(s) : Inclus les différents scripts et pages secondaires

PHP version : 7.2.13
-----------------------------------------------------------------------------------
*/

// AFFICHAGE DES ERREURS PHP - A SUPPRIMER
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();

// Définition du chemin d'accès au document racine
define('ROOT', dirname('index.php'));

// Définition du chemin d'accès à l'index du site
define('URL', "http://acpc.test");

// Définition de la page courante
$page = 'home';
if (isset($_GET['page']) && $_GET['page'] != '') {
    $page = htmlspecialchars($_GET['page']);
}

// Inclusion de la fonction de connection à la base de données
include(ROOT."/sources/model/dbRequest.php");

// Inclusion du script associé à la page courante
$script = ROOT."/sources/scripts/".$page."Script.php";
if (file_exists($script)) {
    include($script);
}
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title;?></title>

    <link href="<?php echo ROOT;?>/assets/css/bootstrap-flatly.min.css" rel="stylesheet" type="text/css"/>
    <link href="<?php echo ROOT;?>/assets/css/ACPC-style.css" rel="stylesheet" type="text/css"/>

    <!-- JavaScript libraries -->
    <script type="text/javascript" src="<?php echo ROOT;?>/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo ROOT;?>/assets/js/bootstrap.bundle.min.js" defer></script>
  </head>
  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
      <a class="navbar-brand" href="#">
        <img src="<?php echo ROOT; ?>/assets/img/logo.png" width="30" height="30" alt="logo">
      </a>
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="navbar-collapse collapse w-100 order-3 dual-collapse2" id="navbarColor03">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home<?php if($page=='home') : ?><span class="sr-only">(current)</span><?php endif; ?></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Features</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Pricing</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End of navigation -->

    <!-- Content of the page -->
    <div class="container">
      <?php
        // Set the path to the page to include
        $pagePath = ROOT."/sources/pages/".$page.".php";

        // If the file exists, include the page, if not show unknown message
        if (file_exists($pagePath)) {
            include($pagePath);
        } else {
            header("location:".URL."?page=unknown");
        }
      ?>
    </div>
    <!-- End of the page -->

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-sm-12 text-center">
            <hr>
            <small>HEIG-VD - Loris Gilliand, Mateo Tutic, Luc Wachter</small><br>
            <small>Built with Bootstrap and the Flatly Bootswatch theme</small>
          </div>
        </div>
      </div>
    </footer>
    <!-- End of footer -->
  </body>
</html>
