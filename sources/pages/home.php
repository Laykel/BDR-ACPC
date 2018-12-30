<!--
Filename: home.php
Description: Projects page: Projects and tasks, timers, update details.
-->

<div class="wrapper center-block">
  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    <div class="panel panel-default">
      <div class="panel-heading active" role="tab" id="headingOne">
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
      <div id="collapseFiltre" class="panel-collapse collapse in show" role="tabpanel">
        <div class="panel-body">
          <form  id="filtre-form">
            <div class="form-group row">
              <label for="PCTypeRadio" class="col-sm-6 col-form-label text-right">Sélectionnez le type de PC : </label>
              <div class="col-sm-6">
                <div class="custom-radio form-check form-check-inline">
                  <input type="radio" id="radio-bureautique" name="PCTypeRadio"
                         class="custom-control-input form-check-input" checked="">
                  <label class="custom-control-label form-check-label" for="radio-bureautique">Bureautique</label>
                </div>
                <div class="custom-radio form-check form-check-inline">
                  <input type="radio" id="radio-gaming" name="PCTypeRadio"
                         class="custom-control-input form-check-input">
                  <label class="custom-control-label form-check-label" for="radio-gaming">Gaming</label>
                </div>
              </div>
            </div>
            <div class="form-group row">
              <label for="PCBudgetInput" class="col-sm-6 col-form-label text-right">Budget maximum (CHF) : </label>
              <input type="text" class="form-control col-sm-5 col-lg-3 col-md-4"
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

<div class="row">
  <h1>Holà mundo</h1>
  <?php var_dump($test->fetchAll()); ?>
</div>

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