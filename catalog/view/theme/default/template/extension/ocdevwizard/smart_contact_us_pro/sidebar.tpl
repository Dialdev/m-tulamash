<div id="<?php echo $_code; ?>-sidebar-body">
  <!--
  ##==================================================================##
  ## @author    : OCdevWizard                                         ##
  ## @contact   : ocdevwizard@gmail.com                               ##
  ## @support   : http://help.ocdevwizard.com                         ##
  ## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf ##
  ## @copyright : (c) OCdevWizard. Smart Contact Us Pro, 2017         ##
  ##==================================================================##
  -->
  <div class="sidebar-heading">
    <div>
      <?php echo $heading_title; ?>
      <span class="sidebar-close" onclick="<?php echo $_code; ?>_sidebar_close('<?php echo $form_info['form_id'] ?>', '<?php echo $form_info['sidebar_type'] ?>');"></span>
    </div>
  </div>
  <div id="check-data" >
    <div id="<?php echo $_code; ?>-sidebar-data" class="sidebar-body">
      <?php if (isset($text_info) && $hide_info_message == 1) { ?>
      <div class="info-text-block pos-1"><?php echo $text_info; ?></div>
      <?php } ?>
      <form id="<?php echo $_code; ?>-form-<?php echo $form_info['form_id'] ?>">
        <input name="form_id" type="hidden" value="<?php echo $form_info['form_id'] ?>" />
        <?php if ($fields_data) { ?>
          <!-- FIELDS DATA -->
          <div class="<?php echo $_code; ?>-module-fields">
            <?php foreach ($fields_data as $field) { ?>
              <?php if ($field['type'] == 'textarea') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="<?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <textarea name="<?php echo $field['name']; ?>" placeholder="<?php echo $field['title']; ?>"></textarea>
                </div>
              <?php } elseif ($field['type'] == 'radio') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="<?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <div class="field-heading"><?php echo $field['title']; ?></div>
                  <?php if ($field['view_fields']) { ?>
                    <?php foreach ($field['view_fields'] as $value) { ?>
                      <div class="field_radio">
                        <label>
                          <input name="<?php echo $field['name']; ?>" type="<?php echo $field['type']; ?>" value="<?php echo $value; ?>" /> <span style="display:inline-block;"><?php echo $value; ?></span>
                        </label>
                      </div>
                    <?php } ?>
                  <?php } ?>
                </div>
              <?php } elseif ($field['type'] == 'checkbox') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="<?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <div class="field-heading"><?php echo $field['title']; ?></div>
                  <?php if ($field['view_fields']) { ?>
                    <?php foreach ($field['view_fields'] as $value) { ?>
                      <div class="field_checkbox">
                        <label>
                          <input name="<?php echo $field['name']; ?>[]" type="<?php echo $field['type']; ?>" value="<?php echo $value; ?>" /> <span style="display:inline-block;"><?php echo $value; ?></span>
                        </label>
                      </div>
                    <?php } ?>
                  <?php } ?>
                </div>
              <?php } elseif ($field['type'] == 'select') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="<?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <div class="field-heading"><?php echo $field['title']; ?></div>
                  <select name="<?php echo $field['name']; ?>">
                    <option value=""><?php echo $text_make_a_choice; ?></option>
                    <?php if ($field['view_fields']) { ?>
                      <?php foreach ($field['view_fields'] as $value) { ?>
                        <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              <?php } elseif ($field['type'] == 'date') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="<?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <input type="text" name="<?php echo $field['name']; ?>" value="" class="<?php echo $_code; ?>-sidebar-date-field" placeholder="<?php echo $field['title']; ?>"/>
                </div>
              <?php } elseif ($field['type'] == 'time') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="<?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <input type="text" name="<?php echo $field['name']; ?>" value="" class="<?php echo $_code; ?>-sidebar-time-field" placeholder="<?php echo $field['title']; ?>"/>
                </div>
              <?php } elseif ($field['type'] == 'date_and_time') { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="<?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <input type="text" name="<?php echo $field['name']; ?>" value="" class="<?php echo $_code; ?>-sidebar-date-and-time-field" placeholder="<?php echo $field['title']; ?>"/>
                </div>
              <?php } else { ?>
                <div <?php echo ($field['css_id']) ? 'id="'.$field['css_id'].'"' : "" ; ?> data-error-name="<?php echo $field['name']; ?>" class="<?php echo $field['position'].' '; echo ($field['css_class']) ? $field['css_class'] : "" ; ?>">
                  <input name="<?php echo $field['name']; ?>" type="<?php echo $field['type']; ?>" placeholder="<?php echo $field['title']; ?>" />
                </div>
              <?php } ?>
              <?php if ($field['mask']) { ?>
                <script type="text/javascript">
                  $("#<?php echo $_code; ?>-sidebar-body [name='<?php echo $field['name']; ?>']").inputmask('<?php echo $field['mask']; ?>');
                </script>
              <?php } ?>
            <?php } ?>
            <?php if ($informations) { ?>
              <div id="sidebar-require-information" data-error-name="require_information"><?php echo $informations; ?> <input type="checkbox" name="require_information" value="<?php echo $require_information ? 1 : 0; ?>" /></div>
            <?php } ?>
          </div>
        <?php } ?>
      </form>
      <?php if (isset($text_info) && $hide_info_message == 2) { ?>
      <div class="info-text-block pos-2"><?php echo $text_info; ?></div>
      <?php } ?>
    </div>
  </div>
  <!-- BUTTONS -->
  <div class="sidebar-footer">
    <div>
      <input type="button" onclick="save_record('<?php echo $form_info['form_id'] ?>');" value="<?php echo $button_save; ?>" class="save-button-bottom" />
      <input type="button" onclick="<?php echo $_code; ?>_sidebar_close('<?php echo $form_info['form_id'] ?>', '<?php echo $form_info['sidebar_type'] ?>');" value="<?php echo $button_go_back; ?>" class="close-button-bottom" />
    </div>
  </div>
  <script type="text/javascript">
    flatpickr.localize(flatpickr.l10ns.<?php echo $_language_code; ?>);

    flatpickr('.<?php echo $_code; ?>-sidebar-date-field', {
      dateFormat: "Y-m-d",
      allowInput: true
    });
    
    flatpickr('.<?php echo $_code; ?>-sidebar-date-and-time-field', {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      time_24hr: true,
      allowInput: true
    });
    
    flatpickr('.<?php echo $_code; ?>-sidebar-time-field', {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true,
      allowInput: true
    });
    
    function maskElement(element, status) {
      if (status == true) {
        $('<div/>')
        .attr('class', '<?php echo $_code; ?>-sidebar-loadmask')
        .prependTo(element);
        $('<div class="<?php echo $_code; ?>-sidebar-loadmask-loading" />').insertAfter($('.<?php echo $_code; ?>-sidebar-loadmask'));
      } else {
        $('.<?php echo $_code; ?>-sidebar-loadmask').remove();
        $('.<?php echo $_code; ?>-sidebar-loadmask-loading').remove();
      }
    }

    $('body').click(function(e) {
      if (!$(e.target).closest('#<?php echo $_code; ?>-form-<?php echo $form_info['form_id'] ?>').length) {
        <?php echo $_code; ?>_sidebar_close('<?php echo $form_info['form_id'] ?>', '<?php echo $form_info['sidebar_type'] ?>');
      }
    });

    function save_record(form_id) {
      var $button_send = $('#<?php echo $_code; ?>-sidebar-body .save-button-bottom');
      $button_send.attr("disabled", true);
      maskElement('#smcup-sidebar-data', true);
      $.ajax({
        type: 'post',
        url: 'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/save_record',
        dataType: 'json',
        data: $('#<?php echo $_code; ?>-form-'+form_id).serialize(),
        success: function(json) {
          $('#<?php echo $_code; ?>-sidebar-data .alert-success, #<?php echo $_code; ?>-sidebar-data .sidebar-text-danger').remove();

          if (json['error']) {
            if (json['error']['field']) {
              maskElement('#smcup-sidebar-data', false);
              for (i in json['error']['field']) {
                var element = $('#<?php echo $_code; ?>-form-'+form_id+' [data-error-name='+i+']');
                element.append('<div class="sidebar-text-danger">'+json['error']['field'][i]+'</div>');
              }
            }
            $button_send.attr("disabled", false);
          } else {
            if (json['output']) {
              maskElement('#smcup-sidebar-data', false);
              $button_send.remove();
              $('#<?php echo $_code; ?>-sidebar-data').html('<div class="sidebar-success-message">'+json['output']+'</div>');
            }
          }
        }
      });
    }
  </script>
</div>