<!--
/*
-----------------------------------------------------------------------------------
Projet      : ACPC
Fichier     : home.php
Auteur(s)   : Gilliand Loris - Tutic Mateo - Wachter Luc
Date        : 21.12.2018

But         : Page home. Permet de réaliser une configuration d'un PC.

Remarque(s) : -

PHP version : 7.2.13
-----------------------------------------------------------------------------------
*/
-->

<div class="center-block">
  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    <div class="panel panel-default">
      <div class="panel-heading active" role="tab" id="heading-filter">
        <h4 class="panel-title">
          <a role="button"
             data-toggle="collapse"
             data-parent="#accordion"
             href="#collapseFiltre"
             aria-expanded="true"
             aria-controls="collapseFiltre">
            Filtres
          </a>
        </h4>
      </div>
      <div id="collapseFiltre"
           class="panel-collapse collapse in <?php if($showFilters) echo show; ?>"
           role="tabpanel"
           aria-labelledby="heading-filter">
        <div class="panel-body">
          <form  id="filtre-form" method="post">
            <div class="form-group row">
              <label for="PCTypeRadio" class="col-sm-6 col-form-label text-right">Sélectionnez le type de PC : </label>
              <div class="col-sm-6">
                <div class="custom-radio form-check form-check-inline">
                  <input type="radio" id="radio-bureautique" name="PCtype"
                         class="custom-control-input form-check-input" checked="">
                  <label class="custom-control-label form-check-label" for="radio-bureautique">Bureautique</label>
                </div>
                <div class="custom-radio form-check form-check-inline">
                  <input type="radio" id="radio-gaming" name="PCtype"
                         class="custom-control-input form-check-input">
                  <label class="custom-control-label form-check-label" for="radio-gaming">Gaming</label>
                </div>
              </div>
            </div>
            <div class="form-group row">
              <label for="PCBudgetInput" class="col-sm-6 col-form-label text-right">Budget maximum (CHF) : </label>
              <input type="text" class="form-control col-sm-5 col-lg-3 col-md-4" name="PCbudget"
                     placeholder="Aucune limite fixée" id="PCBudgetInput">
            </div>
            <div class="row">
              <div class="col-md-6 col-sm-6 offset-md-6 offset-sm-6" style="padding: 10px 0 0 0;">
                <button type="submit" class="btn btn-primary">Appliquer</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<?php
if (isset($componentsList)) {
?>
    <h4 id="composant-titre">Liste des composants</h4>
<?php
    foreach($componentsList as $key=>$component) {
?>
        <div class="center-block composant">
          <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="heading-composant-<?php echo $key; ?>">
                <h4 class="panel-title">
                  <a role="button"
                     data-toggle="collapse"
                     data-parent="#accordion"
                     href="#collapseComposant<?php echo $key; ?>"
                     aria-expanded="true"
                     aria-controls="collapseComposant<?php echo $key; ?>">
                    <?php echo $component['label']; ?>
                    <span id="selected-icon-<?php echo $key; ?>" style="display: none;"></span>
                  </a>
                </h4>
              </div>
              <div id="collapseComposant<?php echo $key; ?>" class="panel-collapse collapse in"
                   role="tabpanel" aria-labelledby="heading-composant-<?php echo $key; ?>">
                <div class="panel-body">
                  <?php include(ROOT."/sources/pages/homeComponent.php"); ?>
                </div>
              </div>
            </div>
          </div>
        </div>
<?php
    }
?>
  <!-- Bouton pour générer la configuration du PC -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalConfigPC" id="genereListe">
    Générer
  </button>

  <!-- Fenêtre popup permettant d'afficher la configuration du PC -->
  <div class="modal fade" id="modalConfigPC" tabindex="-1" role="dialog" aria-labelledby="modalConfigPC" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Votre ordinateur</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Aucun composant sélectionné</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
        </div>
      </div>
    </div>
  </div>
<?php
}
?>

<script>
  /**
   * Permet de charger les données d'un composant en AJAX.
   * @param id id du composant en question (correspond à l'index de la liste $componentsList)
   */
  function getData(id) {
    $.ajax({
      url: '<?php echo ROOT."/sources/scripts/homeComponentScript.php"; ?>',
      type: 'GET',
      data: 'composant_id='+id,
      success: function(data) {
        data = JSON.parse(data);
        console.log(data + "\n\n");

        // Création des tableaux pour chaque composant
        if (!$.fn.DataTable.isDataTable('#tbl-component-'+id)) {
          $('#tbl-component-'+id).DataTable({
            "autoWidth": false,
            "data": data.data,
            "columns": data.columns,
            "columnDefs": [{
              "targets": -1,
              "orderable": false,
              "data": null,
              "defaultContent": "<button type=\"button\" " +
                                        "class=\"btn btn-info btn-xs\"" +
                                        "data-component-id=\""+id+"\">" +
                                  "Ajouter" +
                                "</button>",
            },
            {
              "targets": [0],
              "visible": false,
            }],
            "language": {
              "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/French.json"
            }
          });
        } else {
          // Rechargement des données dans le DataTable (car un composant a été sélectionné)
          $('#tbl-component-'+id).DataTable().clear().rows.add(data.data).draw();
        }
      }
    });
  }

  // jquery ready
  $(function() {
    // Ouverture d'un panel collapsible
    $('.panel-collapse').on('show.bs.collapse', function () {
      $(this).siblings('.panel-heading').addClass('active');
    });

    // Fermeture d'un panel collapsible
    $('.panel-collapse').on('hide.bs.collapse', function () {
      $(this).siblings('.panel-heading').removeClass('active');
    });

    // Ouverture d'un panel collapsible d'un composant
    var panel = $('.composant').on('show.bs.collapse', function () {
      // Fermeture des autres composants déjà ouverts
      panel.find('.collapse.show').collapse('hide');
    });

    // Sélection d'un composant par l'utilisateur
    $('.composant .panel-body table').on('click', 'button', function() {
      // Récupérer l'id du composant pour savoir lequel on manipule
      var component_id = $(this).data('component-id');

      // Récupérer le DataTable contenant le bouton "ajouter"
      var table = $('#tbl-component-'+component_id).DataTable();

      // Récupérer les données du composant à ajouter
      var data = table.row($(this).parents('tr')).data();
      console.log(data);

      // Marqué le composant en tant que sélectionné
      $('.selected-component-'+component_id).text(data["nom"]);
      $('#selected-icon-'+component_id).show();

      // Afficher le bouton "supprimer"
      $('#delete-component-'+component_id).show().attr("data-component-id", component_id);

      // Recharger les données de chaque composant en fonction du composant sélectionné
      $.ajax({
        url: '<?php echo ROOT."/sources/scripts/homeScript.php"; ?>',
        type: 'POST',
        data: 'action=add&component-id='+component_id+'&component-no='+data["no"],
        success: function() {
          <?php if (isset($componentsList)) { foreach($componentsList as $key=>$component) { ?>
            getData(<?php echo $key; ?>);
          <?php }} ?>
        }
      });

    });

    // Suppresion d'un composant par l'utilisateur
    $("button[id^='delete-component-']").click(function() {
      // Récupérer l'id du composant pour savoir lequel on manipule
      var component_id = $(this).data('component-id');

      // "Désélectionner" le composant
      $('.selected-component-'+component_id).text("-");
      $('#selected-icon-'+component_id).hide();

      // Cacher le bouton "supprimer"
      $('#delete-component-'+component_id).hide();

      // Recharger les données de chaque composant en fonction du composant sélectionné
      $.ajax({
        url: '<?php echo ROOT."/sources/scripts/homeScript.php"; ?>',
        type: 'POST',
        data: 'action=delete&component-id='+component_id,
        success: function() {
          <?php if (isset($componentsList)) { foreach($componentsList as $key=>$component) { ?>
            getData(<?php echo $key; ?>);
          <?php }} ?>
        }
      });
    });

    // Génération de la liste des composants sélectionnés par l'utilisateur
    // Les données sont générées dans homeScript.php
    $('button#genereListe').click(function() {
      $.ajax({
        url: '<?php echo ROOT."/sources/scripts/homeScript.php"; ?>',
        type: 'POST',
        data: 'action=generate',
        success: function(data) {
          var data = JSON.parse(data);
          var html = "<ul>";
          var total = 0;  // Prix total de la configuration du PC

          // Création de la liste à puce
          $.each(data, function(index, value) {
            // Ajout du composant dans la fenêtre popup
            html += "<li><b>" + value["label"] + "</b> : " + value["nom"] + ", <b>prix</b> : " + value["prix"] + " </li>";
            total += parseFloat(value["prix"]);
          });

          html += "</ul>";
          html += "<p><b>Prix total : </b>" + total.toFixed(2) + "</p>";

          // Si aucun composant sélectionné, réinitialisé html
          if (data.length === 0) {
              html = "<p>Aucun composant sélectionné</p>";
          }

          $('div#modalConfigPC .modal-body').html(html);
        }
      })
    })
  });
</script>
