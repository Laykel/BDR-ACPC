<!--
---------------------------------------------------------------
Fichier     : homeComponent.php
Date        : 21.12.2018
Auteurs     : Gilliand Loris - Tutic Mateo - Wachter Luc
Fonction    : Représenter le panel collapsible d'un composant
PHP version : 7.2.13
---------------------------------------------------------------
-->

<p class="font-weight-bold">
  Composant sélectionné :
  <span class="selected-component-<?php echo $key; ?>">-</span>
  <button type="button"
          class="btn btn-danger btn-xs"
          id="delete-component-<?php echo $key; ?>"
          data-component-id=""
          style="display: none;">
    Supprimer
  </button>
</p>
<table id="tbl-component-<?php echo $key; ?>" class="table table-hover"></table>

<script>
  // jquery ready
  $(function() {
    // Charger les données du composant
    getData(<?php echo $key; ?>);
  });
</script>