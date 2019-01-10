<!--
Filename: home.php
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
      <div id="collapseFiltre" class="panel-collapse collapse in show" role="tabpanel" aria-labelledby="heading-filter">
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
  $(function() {
    $('.panel-collapse').on('show.bs.collapse', function () {
      $(this).siblings('.panel-heading').addClass('active');
    });

    $('.panel-collapse').on('hide.bs.collapse', function () {
      $(this).siblings('.panel-heading').removeClass('active');
    });
  });
</script>
