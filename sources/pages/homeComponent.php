<!--
/*
-----------------------------------------------------------------------------------
Projet      : ACPC
Fichier     : homeComponent.php
Auteur(s)   : Gilliand Loris - Tutic Mateo - Wachter Luc
Date        : 21.12.2018

But         : Représenter le panel collapsible d'un composant.

Remarque(s) : -

PHP version : 7.2.13
-----------------------------------------------------------------------------------
*/
-->

<p class="font-weight-bold">
  Composant sélectionné :
  <span class="selected-componant-<?php echo $key; ?>">-</span>
  <button type="button"
          class="btn btn-danger btn-xs"
          id="delete-componant-<?php echo $key; ?>"
          data-composant-id=""
          data-composant-nom=""
          style="display: none;">
    Supprimer
  </button>
</p>
<table id="tbl-composant-<?php echo $key; ?>" class="table table-hover"></table>

<script>
  // jquery ready
  $(function() {
    // Charger les données du composant
    getData(<?php echo $key; ?>);
  });
</script>