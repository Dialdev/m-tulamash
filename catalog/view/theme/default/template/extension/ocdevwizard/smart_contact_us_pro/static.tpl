<div class="panel panel-default" id="<?php echo $_code; ?>-static-data-<?php echo $form_id ?>">
  <!--
  ##==================================================================##
  ## @author    : OCdevWizard                                         ##
  ## @contact   : ocdevwizard@gmail.com                               ##
  ## @support   : http://help.ocdevwizard.com                         ##
  ## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf ##
  ## @copyright : (c) OCdevWizard. Smart Contact Us Pro, 2017         ##
  ##==================================================================##
  -->
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <?php if ($fields_data) { ?>
    <div class="list-group">
      <?php if (isset($text_info) && $hide_info_message == 1) { ?>
      <div class="list-group-item">
        <div class="info-text-block pos-1"><?php echo $text_info; ?></div>
      </div>
      <?php } ?>
      <form id="<?php echo $_code; ?>-form-<?php echo $form_id ?>">
        <input name="form_id" type="hidden" value="<?php echo $form_id ?>" />
        <div class="<?php echo $_code; ?>-center-body">
          <!-- FIELDS DATA -->
          <?php foreach ($fields_data as $field) { ?>
            <div class="list-group-item">
              <h4 class="list-group-item-heading"><label><b><?php echo $field['title']; ?></b></label></h4>
              <?php if ($field['type'] == 'textarea') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> class="form-group <?php echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <textarea name="<?php echo $field['name']; ?>" placeholder="<?php echo $field['title']; ?>" class="form-control"></textarea>
                </div>
              <?php } elseif ($field['type'] == 'radio') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="form-group <?php echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <?php if ($field['view_fields']) { ?>
                    <?php foreach ($field['view_fields'] as $value) { ?>
                      <div class="radio">
                        <label>
                          <input name="<?php echo $field['name']; ?>" type="<?php echo $field['type']; ?>" value="<?php echo $value; ?>" />
                          <span style="display:inline-block;"><?php echo $value; ?></span>
                        </label>
                      </div>
                    <?php } ?>
                  <?php } ?>
                </div>
              <?php } elseif ($field['type'] == 'checkbox') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="form-group <?php echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <?php if ($field['view_fields']) { ?>
                    <?php foreach ($field['view_fields'] as $value) { ?>
                      <div class="checkbox">
                        <label>
                          <input name="<?php echo $field['name']; ?>[]" type="<?php echo $field['type']; ?>" value="<?php echo $value; ?>" />
                          <span style="display:inline-block;"><?php echo $value; ?></span>
                        </label>
                      </div>
                    <?php } ?>
                  <?php } ?>
                </div>
              <?php } elseif ($field['type'] == 'select') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="form-group <?php echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <select name="<?php echo $field['name']; ?>" class="form-control">
                    <option value=""><?php echo $text_make_a_choice; ?></option>
                    <?php if ($field['view_fields']) { ?>
                      <?php foreach ($field['view_fields'] as $value) { ?>
                        <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              <?php } elseif ($field['type'] == 'date') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="form-group <?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <input type="text" name="<?php echo $field['name']; ?>" value="" class="<?php echo $_code; ?>-static-date-field form-control" placeholder="<?php echo $field['title']; ?>"/>
                </div>
              <?php } elseif ($field['type'] == 'time') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="form-group <?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <input type="text" name="<?php echo $field['name']; ?>" value="" class="<?php echo $_code; ?>-static-time-field form-control" placeholder="<?php echo $field['title']; ?>"/>
                </div>
              <?php } elseif ($field['type'] == 'date_and_time') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="form-group <?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <input type="text" name="<?php echo $field['name']; ?>" value="" class="<?php echo $_code; ?>-static-date-and-time-field form-control" placeholder="<?php echo $field['title']; ?>"/>
                </div>
              <?php } else { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="form-group <?php echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <input name="<?php echo $field['name']; ?>" type="<?php echo $field['type']; ?>" placeholder="<?php echo $field['title']; ?>" class="form-control" />
                </div>
              <?php } ?>
              <?php if ($field['mask']) { ?>
                <script type="text/javascript">
                  $("#<?php echo $_code; ?>-form-<?php echo $form_id ?> [name='<?php echo $field['name']; ?>']").inputmask('<?php echo $field['mask']; ?>');
                </script>
              <?php } ?>
            </div>
          <?php } ?>
          <?php if ($informations) { ?>
            <div class="list-group-item">
              <div class="static-require-information" data-error-name="require_information"><?php echo $informations; ?> <input type="checkbox" name="require_information" value="<?php echo $require_information ? 1 : 0; ?>" /></div>
            </div>
          <?php } ?>
        </div>
      </form>
      <?php if (isset($text_info) && $hide_info_message == 2) { ?>
      <div class="list-group-item">
        <div class="info-text-block pos-2"><?php echo $text_info; ?></div>
      </div>
      <?php } ?>
    </div>
    <!-- BUTTONS -->
    <div class="panel-footer text-right">
      <button type="button" onclick="<?php echo $_code; ?>_static_save_record('<?php echo $form_id ?>');" class="btn btn-primary"><?php echo $button_save; ?></button>
    </div>
  <?php } else { ?>
    <div class="panel-body"><?php echo $text_empty_form; ?></div>
  <?php } ?>
  <script type="text/javascript">
    flatpickr.localize(flatpickr.l10ns.<?php echo $_language_code; ?>);

    flatpickr('.<?php echo $_code; ?>-static-date-field', {
      dateFormat: "Y-m-d",
      allowInput: true
    });
    
    flatpickr('.<?php echo $_code; ?>-static-date-and-time-field', {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      time_24hr: true,
      allowInput: true
    });
    
    flatpickr('.<?php echo $_code; ?>-static-time-field', {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true,
      allowInput: true
    });
  </script>
</div>