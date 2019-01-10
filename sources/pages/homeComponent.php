<p class="font-weight-bold">Composant sélectionné : -</p>

<table id="tbl-composant-<?php echo $key; ?>" class="table table-hover"></table>

<script>
  $(function() {
    //// Création du datatable
    //var table = $('#tbl-composant-<?php //echo $key; ?>//').DataTable({
    //  "processing": true,
    //  "serverSide": true,
    //  "autoWidth": false,
    //  "ajax": {
    //    "url": "<?php //echo ROOT."/sources/scripts/homeComponentScript.php"; ?>//",
    //    "data": {
    //      "composant_id": <?php //echo $key ?>
    //    }
    //  }
    //});

    function getData() {
      $.ajax({
        url: '<?php echo ROOT."/sources/scripts/homeComponentScript.php"; ?>',
        type: 'GET',
        data: 'composant_id='+<?php echo $key ?>,
        success: function(data) {
          console.log(data);
          data = JSON.parse(data);

          // Création des tableaux pour chaque composant
          if (!$.fn.DataTable.isDataTable('#tbl-composant-<?php echo $key; ?>')) {
            $('#tbl-composant-<?php echo $key; ?>').DataTable({
              "autoWidth": false,
              "data": data.data,
              "columns": data.columns,
              "columnDefs": [{
                "targets": -1,
                "orderable": false,
              }]
            });
          }
        }
      });
    }
    // TODO : Reload les données en rappelant getData() lorsqu'un composant est sélectionné par l'utilisateur
    getData();

    // Ouverture d'un panel collapsible d'un composant
    var panel = $('.composant').on('show.bs.collapse', function () {
      // Fermeture des autres composants déjà ouverts
      panel.find('.collapse.show').collapse('hide');
    });
  });
</script>