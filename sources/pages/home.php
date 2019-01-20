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
if (isset($listeComposant)) {
?>
    <h4 id="composant-titre">Liste des composants</h4>
<?php
    foreach($listeComposant as $key=>$composant) {
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
                    <?php echo $composant; ?>
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
}
?>

<script>
  /**
   * Permet de charger les données d'un composant en AJAX.
   * @param id id du composant en question (correspond à l'index de la liste $listeComposant)
   */
  function getData(id) {
    $.ajax({
      url: '<?php echo ROOT."/sources/scripts/homeComponentScript.php"; ?>',
      type: 'GET',
      data: 'composant_id='+id,
      success: function(data) {
        console.log(data);
        data = JSON.parse(data);

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
            }]
          });
        } else {
          // TODO clear DataTable
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

      // Afficher le bouton "supprimer"
      var del_button = $('#delete-component-'+component_id).show();
      del_button.attr("data-component-id", component_id);
      del_button.attr("data-component-nom", data["nom"]);

      // TODO : Reload les données en rappelant getData() lorsqu'un composant est sélectionné par l'utilisateur

    });

    // Suppresion d'un composant par l'utilisateur
    $("button[id^='delete-component-']").click(function() {
      // Récupérer l'id du composant pour savoir lequel on manipule
      var component_id = $(this).data('component-id');

      // Récupérer le nom du composant (correspond à l'id dans la base de données cette fois)
      var component_name = $(this).data('component-nom');

      // "Désélectionner" le composant
      $('.selected-component-'+component_id).text("-");

      // Cacher le bouton "supprimer"
      $('#delete-component-'+component_id).hide();
    })
  });
</script>
