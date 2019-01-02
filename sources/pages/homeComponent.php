<p>Composant sélectionné : -</p>

<table id="tbl-composant-<?php echo $key; ?>" class="table table-hover">
    <thead>
        <tr>
            <th>Nom</th>
            <th>Prix</th>
        </tr>
    </thead>
    <tbody>

    </tbody>
</table>

<script>
    // TODO Ajouter un data attribut à panel collapsible qui représente l'ID du composant et l'envoyer au script
    // pour remplir les tableaux --> homeComponentScript.php

  $(function() {
    // Lorsqu'un panel collapsible d'un composant est ouvert, fermer celui déjà ouvert
    var $this = $('.composant').on('show.bs.collapse', function () {
      $this.find('.collapse.show').collapse('hide');
    });

    // Tableau des composants
    $('#tbl-composant-<?php echo $key; ?>').DataTable({
      "processing": true,
      "serverSide": true,
      "autoWidth": false,
      "ajax": "<?php echo ROOT."/sources/scripts/homeComponentScript.php"; ?>"
    });
  });
</script>