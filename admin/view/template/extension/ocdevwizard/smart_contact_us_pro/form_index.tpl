<!--
##==================================================================##
## @author    : OCdevWizard                                         ##
## @contact   : ocdevwizard@gmail.com                               ##
## @support   : http://help.ocdevwizard.com                         ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf ##
## @copyright : (c) OCdevWizard. Smart Contact Us Pro, 2017         ##
##==================================================================##
-->
<div class="modal-content" id="modal-form-constructor-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>&times;</span></button>
    <h4 class="modal-title" id="myModalLabel"><?php echo $text_form; ?></h4>
  </div>
  <div class="modal-body">
    <div id="content" class="row" style="padding-bottom: 0;">
      <div class="panel-body" style="padding-top: 0;padding-bottom: 0;">
        <ul class="nav nav-tabs" id="modal-setting-tabs">
          <li class="active dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-cog"></i> <?php echo $tab_control_panel; ?> <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#modal-general-block" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general_setting; ?></a></li>
              <li><a href="#modal-fields-block" data-toggle="tab"><i class="fa fa-bars"></i> <?php echo $tab_fields_setting; ?></a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-language"></i> <?php echo $tab_language_setting; ?> <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#modal-language-block" data-toggle="tab"><i class="fa fa-flag-o"></i> <?php echo $tab_basic_language_setting; ?></a></li>
            </ul>
          </li>
        </ul>
        <form method="post" enctype="multipart/form-data" id="modal-form" class="form-horizontal">
          <input type="hidden" style="display:none;" name="form_id" value="<?php echo $form_id; ?>" />
          <div class="tab-content">
            <!-- TAB General block -->
            <div class="tab-pane fade active in" role="tabpanel" id="modal-general-block">
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-status"><?php echo $text_activate_module; ?></label>
                <div class="col-sm-9">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_new_saved_record_admin_alert; ?></label>
                <div class="col-sm-9">
                  <div class="btn-group btn-toggle" data-toggle="buttons">
                    <label class="btn <?php echo $new_saved_record_admin_alert == 1 ? 'active btn-success' : 'btn-default'; ?>">
                      <input type="radio"
                        name="new_saved_record_admin_alert"
                        value="1"
                        autocomplete="off"
                        <?php echo $new_saved_record_admin_alert == 1 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_yes; ?>
                    </label>
                    <label class="btn <?php echo $new_saved_record_admin_alert == 0 ? 'active btn-success' : 'btn-default'; ?>">
                      <input type="radio"
                        name="new_saved_record_admin_alert"
                        value="0"
                        autocomplete="off"
                        <?php echo $new_saved_record_admin_alert == 0 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_no; ?>
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label" for="input-email_for_notification"><?php echo $text_email_for_notification; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
                    <input value="<?php echo $email_for_notification; ?>" type="text" name="email_for_notification" class="form-control" id="input-email_for_notification" />
                  </div>
                  <div class="modal-error-block" id="modal-error-email-for-notification"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_email_for_notification_faq; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_email_template; ?></label>
                <div class="col-sm-9">
                  <div class="btn-group-vertical btn-toggle" data-toggle="buttons">
                    <label class="btn <?php echo $allow_email_template == 1 ? 'active btn-success' : 'btn-default'; ?><?php if (!$templates) { ?> disabled<?php } ?>">
                      <input type="radio"
                        name="allow_email_template"
                        value="1"
                        autocomplete="off"
                        <?php echo $allow_email_template == 1 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_custom_html_template; ?>
                    </label>
                    <label class="btn <?php echo $allow_email_template == 2 ? 'active btn-success' : 'btn-default'; ?>">
                      <input type="radio"
                        name="allow_email_template"
                        value="2"
                        autocomplete="off"
                        <?php echo $allow_email_template == 2 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_default_html_template; ?>
                    </label>
                  </div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_email_template_faq; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_email_template_by_default; ?></label>
                <div class="col-sm-9">
                  <?php if ($templates) { ?>
                  <?php $row_height = 55; $row = 0; foreach ($templates as $template) { ?>
                  <?php if ($row < 5) { $row_height = $row_height*1.26; } $row++; ?>
                  <?php } ?>
                  <div class="well well-sm" style="height: <?php echo $row_height; ?>px; overflow: auto;">
                    <?php foreach ($templates as $template) { ?>
                    <div class="radio">
                      <label>
                        <input type="radio" name="email_template_by_default" value="<?php echo $template['template_id']; ?>" <?php echo (isset($email_template_by_default) && $email_template_by_default == $template['template_id']) ? 'checked' : ''; ?> /> <?php echo $template['name']; ?> <b><a style="cursor:pointer;" onclick="open_email_template({id: '<?php echo $template['template_id']; ?>'});">[<?php echo $text_edit_template; ?>]</a></b>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':radio').attr('checked', false);"><?php echo $text_unselect_all; ?></button>
                  </div>
                  <?php } else { ?>
                    <div class="well well-sm" style="height: 69.3px; overflow: auto;">
                    <?php echo $text_no_templates; ?>
                    </div>
                  <?php } ?>
                  <div class="alert alert-info" role="alert"><?php echo $text_email_template_by_default_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_stores; ?></label>
                <div class="col-sm-9">
                  <?php $row_height = 55; $row = 0; foreach ($all_stores as $store) { ?>
                  <?php if ($row < 5) { $row_height = $row_height*1.26; } $row++; ?>
                  <?php } ?>
                  <div class="well well-sm" style="height: <?php echo $row_height; ?>px; overflow: auto;">
                    <?php foreach ($all_stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <input
                          type="checkbox"
                          name="stores[]"
                          value="<?php echo $store['store_id']; ?>" <?php echo (!empty($stores) && in_array($store['store_id'], $stores)) ? 'checked' : ''; ?>
                        /> <?php echo $store['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').trigger('click').attr('checked', true);"><?php echo $text_select_all; ?></button>
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></button>
                  </div>
                  <div class="modal-error-block" id="modal-error-stores"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_stores_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_customer_groups; ?></label>
                <div class="col-sm-9">
                  <?php $row_height = 55; $row = 0; foreach ($all_customer_groups as $customer_group) { ?>
                  <?php if ($row < 5) { $row_height = $row_height*1.26; } $row++; ?>
                  <?php } ?>
                  <div class="well well-sm" style="height: <?php echo $row_height; ?>px; overflow: auto;">
                    <?php foreach ($all_customer_groups as $customer_group) { ?>
                    <div class="checkbox">
                      <label>
                        <input
                          type="checkbox"
                          name="customer_groups[]"
                          value="<?php echo $customer_group['customer_group_id']; ?>" <?php echo (!empty($customer_groups) && in_array($customer_group['customer_group_id'], $customer_groups)) ? 'checked' : ''; ?>
                        /> <?php echo $customer_group['name']; ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').trigger('click').attr('checked', true);"><?php echo $text_select_all; ?></button>
                    <button type="button" class="btn btn-default btn-xs" onclick="$(this).parent().parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></button>
                  </div>
                  <div class="modal-error-block" id="modal-error-customer-groups"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_customer_groups_faq; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_select_terms; ?></label>
                <div class="col-sm-9">
                  <select name="require_information" class="form-control">
                    <option value=""><?php echo $text_no; ?></option>
                    <?php foreach ($all_informations as $information) { ?>
                      <option value="<?php echo $information['information_id']; ?>" <?php echo (!empty($require_information) && $require_information == $information['information_id']) ? 'selected' : ''; ?>><?php echo $information['title']; ?></option>
                    <?php } ?>
                  </select>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_select_terms_faq; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_hide_info_message; ?></label>
                <div class="col-sm-9">
                  <select name="hide_info_message" class="form-control">
                    <option value="0" <?php echo $hide_info_message == 0 ? 'selected="selected"' : ''; ?> ><?php echo $text_no; ?></option>
                    <option value="1" <?php echo $hide_info_message == 1 ? 'selected="selected"' : ''; ?> ><?php echo $text_before_products_list; ?></option>
                    <option value="2" <?php echo $hide_info_message == 2 ? 'selected="selected"' : ''; ?> ><?php echo $text_after_products_list; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label"><?php echo $text_display_type; ?></label>
                <div class="col-sm-9">
                  <select name="display_type" class="form-control">
                    <?php if ($display_type == 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_in_popup; ?></option>
                      <option value="2"><?php echo $text_in_static; ?></option>
                      <option value="3"><?php echo $text_in_sidebar; ?></option>
                    <?php } elseif ($display_type == 2) { ?>
                      <option value="1"><?php echo $text_in_popup; ?></option>
                      <option value="2" selected="selected"><?php echo $text_in_static; ?></option>
                      <option value="3"><?php echo $text_in_sidebar; ?></option>
                    <?php } else { ?>
                      <option value="1"><?php echo $text_in_popup; ?></option>
                      <option value="2"><?php echo $text_in_static; ?></option>
                      <option value="3" selected="selected"><?php echo $text_in_sidebar; ?></option>
                    <?php } ?>
                  </select>
                  <div class="alert alert-info display-type-1" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_in_popup_faq; ?></div>
                  <div class="alert alert-info display-type-2" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_in_static_faq; ?></div>
                  <div class="alert alert-info display-type-3" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_in_sidebar_faq; ?></div>
                </div>
              </div>
              <div class="form-group display-type-1">
                <label class="col-sm-3 control-label"><?php echo $text_popup_button_type; ?></label>
                <div class="col-sm-9">
                  <select name="popup_button_type" class="form-control">
                    <?php if ($popup_button_type == 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_static_button; ?></option>
                      <option value="2"><?php echo $text_float_button; ?></option>
                    <?php } else { ?>
                      <option value="1"><?php echo $text_static_button; ?></option>
                      <option value="2" selected="selected"><?php echo $text_float_button; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required display-type-1 popup-button-type-1">
                <label class="col-sm-3 control-label" for="input-add_id_selector"><?php echo $text_add_id_selector; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_css_id_indicator; ?></span>
                    <input value="<?php echo $add_id_selector; ?>" type="text" name="add_id_selector" class="form-control" placeholder="<?php echo $text_add_id_selector_ph; ?>"/>
                  </div>
                  <div class="modal-error-block" id="modal-error-add-id-selector"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_add_id_selector_faq; ?></div>
                </div>
              </div>
              <div class="form-group display-type-1 popup-button-type-1">
                <label class="col-sm-3 control-label" for="input-button_class"><?php echo $text_button_class; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_css_class_indicator; ?></span>
                    <input value="<?php echo $button_class; ?>" type="text" name="button_class" class="form-control" placeholder="<?php echo $text_button_class_ph; ?>"/>
                  </div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_button_class_faq; ?></div>
                </div>
              </div>
              <div class="form-group required display-type-1 popup-button-type-2">
                <label class="col-sm-3 control-label" for="input-float_button_id_selector"><?php echo $text_float_button_id_selector; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_css_id_indicator; ?></span>
                    <input value="<?php echo $float_button_id_selector; ?>" type="text" name="float_button_id_selector" class="form-control" readonly/>
                  </div>
                  <div class="modal-error-block" id="modal-error-float-button-id-selector"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_float_button_id_selector_faq; ?></div>
                </div>
              </div>
              <div class="form-group display-type-3">
                <label class="col-sm-3 control-label"><?php echo $text_sidebar_type; ?></label>
                <div class="col-sm-9">
                  <select name="sidebar_type" class="form-control">
                    <?php if ($sidebar_type == 1) { ?>
                      <option value="1" selected="selected"><?php echo $text_sidebar_left_side; ?></option>
                      <option value="2"><?php echo $text_sidebar_right_side; ?></option>
                    <?php } else { ?>
                      <option value="1"><?php echo $text_sidebar_left_side; ?></option>
                      <option value="2" selected="selected"><?php echo $text_sidebar_right_side; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required display-type-3">
                <label class="col-sm-3 control-label" for="input-sidebar_button_id_selector"><?php echo $text_sidebar_button_id_selector; ?></label>
                <div class="col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"><?php echo $text_css_id_indicator; ?></span>
                    <input value="<?php echo $sidebar_button_id_selector; ?>" type="text" name="sidebar_button_id_selector" class="form-control" readonly/>
                  </div>
                  <div class="modal-error-block" id="modal-error-sidebar-button-id-selector"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_sidebar_button_id_selector_faq; ?></div>
                </div>
              </div>
              <div class="form-group display-type-1 popup-button-type-1">
                <label class="col-sm-3 control-label"><?php echo $text_location; ?></label>
                <div class="col-sm-9">
                  <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-success <?php echo $location == 1 ? 'active' : ''; ?>">
                      <input type="radio" 
                        name="location" 
                        value="1" 
                        autocomplete="off" 
                        <?php echo $location == 1 ? 'checked="checked"' : ''; ?> 
                      /><?php echo $text_outside_before; ?>
                    </label>
                    <label class="btn btn-success <?php echo $location == 2 ? 'active' : ''; ?>">
                      <input type="radio" 
                        name="location" 
                        value="2" 
                        autocomplete="off" 
                        <?php echo $location == 2 ? 'checked="checked"' : ''; ?> 
                      /><?php echo $text_inside_left; ?>
                    </label>
                    <label class="btn btn-success <?php echo $location == 3 ? 'active' : ''; ?>">
                      <input type="radio" 
                        name="location" 
                        value="3" 
                        autocomplete="off" 
                        <?php echo $location == 3 ? 'checked="checked"' : ''; ?> 
                      /><?php echo $text_inside_right; ?>
                    </label>
                    <label class="btn btn-success <?php echo $location == 4 ? 'active' : ''; ?>">
                      <input type="radio" 
                        name="location" 
                        value="4" 
                        autocomplete="off" 
                        <?php echo $location == 4 ? 'checked="checked"' : ''; ?> 
                      /><?php echo $text_outside_after; ?>
                    </label>
                  </div>
                  <div class="modal-error-block" id="modal-error-location"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_location_faq; ?></div>
                </div>
              </div>
              <div class="form-group display-type-2">
                <label class="col-sm-3 control-label"><?php echo $text_static_position; ?></label>
                <div class="col-sm-9">
                  <select name="position" class="form-control">
                    <?php if ($position == 'column_left') { ?>
                      <option value="column_left" selected="selected"><?php echo $text_static_position_1; ?></option>
                      <option value="column_right"><?php echo $text_static_position_2; ?></option>
                      <option value="content_top"><?php echo $text_static_position_3; ?></option>
                      <option value="content_bottom"><?php echo $text_static_position_4; ?></option>
                    <?php } elseif ($position == 'column_right') { ?>
                      <option value="column_left"><?php echo $text_static_position_1; ?></option>
                      <option value="column_right" selected="selected"><?php echo $text_static_position_2; ?></option>
                      <option value="content_top"><?php echo $text_static_position_3; ?></option>
                      <option value="content_bottom"><?php echo $text_static_position_4; ?></option>
                    <?php } elseif ($position == 'content_top') { ?>
                      <option value="column_left"><?php echo $text_static_position_1; ?></option>
                      <option value="column_right"><?php echo $text_static_position_2; ?></option>
                      <option value="content_top" selected="selected"><?php echo $text_static_position_3; ?></option>
                      <option value="content_bottom"><?php echo $text_static_position_4; ?></option>
                    <?php } else { ?>
                      <option value="column_left"><?php echo $text_static_position_1; ?></option>
                      <option value="column_right"><?php echo $text_static_position_2; ?></option>
                      <option value="content_top"><?php echo $text_static_position_3; ?></option>
                      <option value="content_bottom" selected="selected"><?php echo $text_static_position_4; ?></option>
                    <?php } ?>
                  </select>
                  <div class="modal-error-block" id="modal-error-position"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_static_position_faq; ?></div>
                </div>
              </div>
              <div class="form-group display-type-2">
                <label class="col-sm-3 control-label" for="input-sort_order"><?php echo $text_static_sort_order; ?></label>
                <div class="col-sm-9">
                  <input value="<?php echo $sort_order; ?>" type="text" name="sort_order" class="form-control" />
                  <div class="modal-error-block" id="modal-error-sort-order"></div>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_static_sort_order_faq; ?></div>
                </div>
              </div>
            </div>
            <!-- TAB Fields block -->
            <div class="tab-pane fade" role="tabpanel" id="modal-fields-block">
              <div class="row">
                <div class="col-sm-3">
                  <ul class="nav nav-pills nav-stacked" id="fields-li">
                    <?php $field_row = 1; ?>
                    <?php foreach ($field_data as $field) { ?>
                    <li class="no_field_title">
                      <input type="hidden" style="display:none;" name="field_data[<?php echo $field_row; ?>][sort_order]" />
                      <input type="hidden" style="display:none;" name="field_data[<?php echo $field_row; ?>][name]" value="field_<?php echo $field_row; ?>" />
                      <a href="#tab-field<?php echo $field_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-field<?php echo $field_row; ?>\']').parent().remove(); $('#tab-field<?php echo $field_row; ?>').remove(); $('#fields-li a:first').tab('show');"></i> <?php echo $text_tab_field; ?> <?php echo '№'. $field_row; ?>
                      <span class="field_title">(<?php echo (isset($field['title'][$default_language_id])) ? $field['title'][$default_language_id] : ''; ?>)</span>
                      </a>
                    </li>
                    <?php $field_row++; ?>
                    <?php } ?>
                    <li id="field-add">
                      <button type="button" onclick="addField();" class="btn btn-success" style="width: 100%;"><i class="fa fa-plus-circle"></i> <?php echo $button_add_field; ?></button>
                    </li>
                  </ul>
                </div>
                <div class="col-sm-9">
                  <div class="tab-content">
                    <?php $field_row = 1; ?>
                    <?php foreach ($field_data as $field) { ?>
                      <div class="tab-pane" id="tab-field<?php echo $field_row; ?>">
                        <div class="form-group">
                          <label class="col-sm-3 control-label" for="input-activate<?php echo $field_row; ?>"><?php echo $text_activate_field; ?></label>
                          <div class="col-sm-9">
                            <select name="field_data[<?php echo $field_row; ?>][activate]" class="form-control" id="input-activate<?php echo $field_row; ?>">
                              <?php if ($field['activate'] == 1) { ?>
                                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                <option value="0"><?php echo $text_no; ?></option>
                              <?php } else { ?>
                                <option value="1"><?php echo $text_yes; ?></option>
                                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                              <?php } ?>
                            </select>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-3 control-label" for="input-title<?php echo $field_row; ?>"><?php echo $text_heading_field; ?></label>
                          <div class="col-sm-9">
                            <?php foreach ($languages as $language) { ?>
                            <div class="input-group" style="margin-bottom: 5px;">
                              <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                              <input type="text" name="field_data[<?php echo $field_row; ?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo (isset($field['title'][$language['language_id']])) ? $field['title'][$language['language_id']] : ''; ?>" class="form-control" id="input-title<?php echo $field_row; ?>" />
                            </div>
                            <div class="modal-error-block" id="modal-error-field-data-language-<?php echo $field_row; ?>-title-<?php echo $language['language_id']; ?>"></div>
                            <?php } ?>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-3 control-label" for="input-view<?php echo $field_row; ?>"><?php echo $text_assign_functionality; ?></label>
                          <div class="col-sm-9">
                            <select name="field_data[<?php echo $field_row; ?>][view]" class="form-control" id="input-view<?php echo $field_row; ?>">
                              <option value="0"><?php echo $text_make_a_choice; ?></option>
                              <?php foreach ($field_view_data as $key => $view) { ?>
                              <?php if ($key == 'file') { ?>
                              <option value="<?php echo $key; ?>" disabled="disabled"><?php echo $view; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $key; ?>" <?php echo ($field['view'] == $key) ? 'selected="selected"' : ''; ?>><?php echo $view; ?></option>
                              <?php } ?>
                              <?php } ?>
                            </select>
                            <div class="row" style="display:block;margin-top:15px">
                              <div class="col-sm-12">
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group" style="margin-bottom: 5px;">
                                  <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                  <input type="text" name="field_data[<?php echo $field_row; ?>][view_fields][<?php echo $language['language_id']; ?>]" value="<?php echo (isset($field['view_fields'][$language['language_id']])) ? $field['view_fields'][$language['language_id']] : ''; ?>" class="form-control" />
                                </div>
                                <?php } ?>
                                <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_assign_functionality_faq; ?></div>
                              </div>
                            </div>
                            <div class="modal-error-block" id="modal-error-field-data-<?php echo $field_row; ?>-view"></div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label" for="input-check<?php echo $field_row; ?>"><?php echo $text_check_type; ?></label>
                          <div class="col-sm-9">
                            <select name="field_data[<?php echo $field_row; ?>][check]" class="form-control" id="input-check<?php echo $field_row; ?>">
                              <option value="0" <?php echo $field['check'] == 0 ? 'selected="selected"' : ''; ?> ><?php echo $text_validation_type_1; ?></option>
                              <option value="1" <?php echo $field['check'] == 1 ? 'selected="selected"' : ''; ?> ><?php echo $text_validation_type_2; ?></option>
                              <option value="2" <?php echo $field['check'] == 2 ? 'selected="selected"' : ''; ?> ><?php echo $text_validation_type_3; ?></option>
                              <option value="3" <?php echo $field['check'] == 3 ? 'selected="selected"' : ''; ?> ><?php echo $text_validation_type_4; ?></option>
                            </select>
                            <div class="input-group" style="display:table;margin-top:15px;">
                              <span class="input-group-addon"><i class="fa fa-filter"></i></span>
                              <input type="text" placeholder="<?php echo $text_validation_type_3_ph; ?>" name="field_data[<?php echo $field_row; ?>][check_rule]" value="<?php echo $field['check_rule']; ?>" class="form-control" />
                            </div>
                            <div class="input-group" style="display:table;margin-top:15px;">
                              <span class="input-group-addon"><i class="fa fa-chevron-right"></i></span>
                              <input type="text" placeholder="<?php echo $text_validation_type_4_1_ph; ?>" name="field_data[<?php echo $field_row; ?>][check_min]" value="<?php echo $field['check_min']; ?>" class="form-control" />
                            </div>
                            <div class="input-group" style="display:table;margin-top:15px;">
                              <span class="input-group-addon"><i class="fa fa-chevron-left"></i></span>
                              <input type="text" placeholder="<?php echo $text_validation_type_4_2_ph; ?>" name="field_data[<?php echo $field_row; ?>][check_max]" value="<?php echo $field['check_max']; ?>" class="form-control" />
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label" for="input-mask<?php echo $field_row; ?>"><?php echo $text_mask; ?></label>
                          <div class="col-sm-9">
                            <div class="input-group">
                              <span class="input-group-addon"><i class="fa fa-pencil-square-o"></i></span>
                              <input value="<?php echo $field['mask']; ?>" type="text" name="field_data[<?php echo $field_row; ?>][mask]" class="form-control" placeholder="<?php echo $text_mask_ph; ?>" id="input-mask<?php echo $field_row; ?>" />
                            </div>
                            <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_mask_faq; ?></div>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-3 control-label" for="input-error_text<?php echo $field_row; ?>"><?php echo $text_error_text; ?></label>
                          <div class="col-sm-9">
                            <?php foreach ($languages as $language) { ?>
                            <div class="input-group" style="margin-bottom: 5px;">
                              <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                              <input type="text" name="field_data[<?php echo $field_row; ?>][error_text][<?php echo $language['language_id']; ?>]" value="<?php echo (isset($field['error_text'][$language['language_id']])) ? $field['error_text'][$language['language_id']] : ''; ?>" class="form-control" id="input-error_text<?php echo $field_row; ?>" />
                            </div>
                            <div class="modal-error-block" id="modal-error-field-data-language-<?php echo $field_row; ?>-error-text-<?php echo $language['language_id']; ?>"></div>
                            <?php } ?>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label" for="input-css_id<?php echo $field_row; ?>"><?php echo $text_css_id; ?></label>
                          <div class="col-sm-9">
                            <div class="input-group">
                              <span class="input-group-addon"><?php echo $text_css_id_indicator; ?></span>
                              <input value="<?php echo $field['css_id']; ?>" type="text" name="field_data[<?php echo $field_row; ?>][css_id]" class="form-control" placeholder="<?php echo $text_css_id_ph; ?>" id="input-css_id<?php echo $field_row; ?>" />
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-3 control-label" for="input-css_class<?php echo $field_row; ?>"><?php echo $text_css_class; ?></label>
                          <div class="col-sm-9">
                            <div class="input-group">
                              <span class="input-group-addon"><?php echo $text_css_class_indicator; ?></span>
                              <input value="<?php echo $field['css_class']; ?>" type="text" name="field_data[<?php echo $field_row; ?>][css_class]" class="form-control" placeholder="<?php echo $text_css_class_ph; ?>" id="input-css_class<?php echo $field_row; ?>" />
                            </div>
                          </div>
                        </div>
                        <div class="form-group position-field">
                          <label class="col-sm-3 control-label"><?php echo $text_position; ?></label>
                          <div class="col-sm-9">
                            <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-success <?php echo $field['position'] == 1 ? 'active' : ''; ?>">
                                <input type="radio" 
                                  name="field_data[<?php echo $field_row; ?>][position]" 
                                  value="1" 
                                  autocomplete="off" 
                                  <?php echo $field['position'] == 1 ? 'checked="checked"' : ''; ?> 
                                /><?php echo $text_left_side; ?>
                              </label>
                              <label class="btn btn-success <?php echo $field['position'] == 3 ? 'active' : ''; ?>">
                                <input type="radio" 
                                  name="field_data[<?php echo $field_row; ?>][position]" 
                                  value="3" 
                                  autocomplete="off" 
                                  <?php echo $field['position'] == 3 ? 'checked="checked"' : ''; ?> 
                                /><?php echo $text_center; ?>
                              </label>
                              <label class="btn btn-success <?php echo $field['position'] == 2 ? 'active' : ''; ?>">
                                <input type="radio" 
                                  name="field_data[<?php echo $field_row; ?>][position]" 
                                  value="2" 
                                  autocomplete="off" 
                                  <?php echo $field['position'] == 2 ? 'checked="checked"' : ''; ?> 
                                /><?php echo $text_right_side; ?>
                              </label>
                            </div>
                            <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_position_faq; ?></div>
                          </div>
                        </div>
                      </div>
                    <?php $field_row++; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <!-- TAB Language block -->
            <div class="tab-pane fade" role="tabpanel" id="modal-language-block">
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_module_heading; ?></label>
                <div class="col-sm-9">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group" style="margin-bottom: 5px;">
                    <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="form_description[<?php echo $language['language_id']; ?>][heading]" value="<?php echo isset($form_description[$language['language_id']]) ? $form_description[$language['language_id']]['heading'] : ''; ?>" class="form-control" />
                  </div>
                  <div class="modal-error-block" id="modal-error-form-description-language-heading-<?php echo $language['language_id']; ?>"></div>
                  <?php } ?>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_heading_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_module_call_button; ?></label>
                <div class="col-sm-9">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group" style="margin-bottom: 5px;">
                    <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="form_description[<?php echo $language['language_id']; ?>][call_button]" value="<?php echo isset($form_description[$language['language_id']]) ? $form_description[$language['language_id']]['call_button'] : ''; ?>" class="form-control" />
                  </div>
                  <div class="modal-error-block" id="modal-error-form-description-language-call-button-<?php echo $language['language_id']; ?>"></div>
                  <?php } ?>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_call_button_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_module_save_button; ?></label>
                <div class="col-sm-9">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group" style="margin-bottom: 5px;">
                    <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="form_description[<?php echo $language['language_id']; ?>][save_button]" value="<?php echo isset($form_description[$language['language_id']]) ? $form_description[$language['language_id']]['save_button'] : ''; ?>" class="form-control" />
                  </div>
                  <div class="modal-error-block" id="modal-error-form-description-language-save-button-<?php echo $language['language_id']; ?>"></div>
                  <?php } ?>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_save_button_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_module_close_button; ?></label>
                <div class="col-sm-9">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group" style="margin-bottom: 5px;">
                    <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <input type="text" name="form_description[<?php echo $language['language_id']; ?>][close_button]" value="<?php echo isset($form_description[$language['language_id']]) ? $form_description[$language['language_id']]['close_button'] : ''; ?>" class="form-control" />
                  </div>
                  <div class="modal-error-block" id="modal-error-form-description-language-close-button-<?php echo $language['language_id']; ?>"></div>
                  <?php } ?>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_module_close_button_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_success_message; ?></label>
                <div class="col-sm-9">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group" style="margin-bottom: 5px;">
                    <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="form_description[<?php echo $language['language_id']; ?>][success_message]" id="success_message<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($form_description[$language['language_id']]) ? $form_description[$language['language_id']]['success_message'] : ''; ?></textarea>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="texteditor_action({id: '#success_message<?php echo $language['language_id']; ?>'});"><?php echo $text_open_texteditor; ?></button>
                    <button type="button" class="btn btn-default btn-xs" onclick="texteditor_action({id: '#success_message<?php echo $language['language_id']; ?>', start: false, destroy: true});" style="display: none;"><?php echo $text_save_texteditor; ?></button>
                  </div>
                  <div class="modal-error-block" id="modal-error-form-description-language-success-message-<?php echo $language['language_id']; ?>"></div>
                  <?php } ?>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_success_message_faq; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-3 control-label"><?php echo $text_info_message; ?></label>
                <div class="col-sm-9">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group" style="margin-bottom: 5px;">
                    <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                    <textarea name="form_description[<?php echo $language['language_id']; ?>][info_message]" id="info_message<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($form_description[$language['language_id']]) ? $form_description[$language['language_id']]['info_message'] : ''; ?></textarea>
                  </div>
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-xs" onclick="texteditor_action({id: '#info_message<?php echo $language['language_id']; ?>'});"><?php echo $text_open_texteditor; ?></button>
                    <button type="button" class="btn btn-default btn-xs" onclick="texteditor_action({id: '#info_message<?php echo $language['language_id']; ?>', start: false, destroy: true});" style="display: none;"><?php echo $text_save_texteditor; ?></button>
                  </div>
                  <div class="modal-error-block" id="modal-error-form-description-language-info-message-<?php echo $language['language_id']; ?>"></div>
                  <?php } ?>
                  <div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <?php echo $text_info_message_faq; ?></div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-info" onclick="submit_form(this, <?php if ($form_id) { ?>'edit'<?php } else { ?>'add'<?php } ?>);"><?php echo $button_submit; ?></button>
    <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" <?php if (!$form_id) { ?>style="display: none;"<?php } ?>><?php echo $button_close; ?></button>
  </div>
</div>
<script type="text/javascript"><!--
var field_row = <?php echo $field_row; ?>;

function addField() {
  html  = '<div class="tab-pane" id="tab-field' + field_row + '">';
  html += '   <input type="hidden" style="display:none;" name="field_data[' + field_row + '][sort_order]" />';
  html += '   <input type="hidden" style="display:none;" name="field_data[' + field_row + '][name]" value="field_' + field_row + '" />';
  html += '   <div class="form-group">';
  html += '     <label class="col-sm-3 control-label" for="input-activate' + field_row + '"><?php echo $text_activate_field; ?></label>';
  html += '     <div class="col-sm-9">';
  html += '       <select name="field_data[' + field_row + '][activate]" class="form-control" id="input-activate' + field_row + '">';
  html += '         <option value="1"><?php echo $text_yes; ?></option><option value="0" selected="selected"><?php echo $text_no; ?></option>';
  html += '       </select>';
  html += '     </div>';
  html += '   </div>';
  html += '   <div class="form-group required">';
  html += '     <label class="col-sm-3 control-label" for="input-title' + field_row + '"><?php echo $text_heading_field; ?></label>';
  html += '     <div class="col-sm-9">';
                <?php foreach ($languages as $language) { ?>
  html += '       <div class="input-group" style="margin-bottom: 5px;">';
  html += '         <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
  html += '         <input type="text" name="field_data[' + field_row + '][title][<?php echo $language['language_id']; ?>]" value="" class="form-control" id="input-title' + field_row + '" />';
  html += '       </div>';
  html += '       <div class="modal-error-block" id="modal-error-field-data-language-' + field_row + '-title-<?php echo $language['language_id']; ?>"></div>';
                <?php } ?>
  html += '     </div>';
  html += '   </div>';
  html += '   <div class="form-group required">';
  html += '     <label class="col-sm-3 control-label" for="input-view' + field_row + '"><?php echo $text_assign_functionality; ?></label>';
  html += '     <div class="col-sm-9">';
  html += '       <select name="field_data[' + field_row + '][view]" class="form-control" id="input-view' + field_row + '">';
  html += '         <option value="0"><?php echo $text_make_a_choice; ?></option>';
                    <?php foreach ($field_view_data as $key => $view) { ?>
  html += '         <option value="<?php echo $key; ?>"><?php echo $view; ?></option>';
                    <?php } ?>
  html += '       </select>';
  html += '       <div class="row" style="display:none;margin-top:15px;">';
  html += '         <div class="col-sm-12">';
                      <?php foreach ($languages as $language) { ?>
  html += '             <div class="input-group" style="margin-bottom: 5px;">';
  html += '               <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
  html += '               <input type="text" name="field_data[' + field_row + '][view_fields][<?php echo $language['language_id']; ?>]" value="" class="form-control" />';
  html += '             </div>';
                      <?php } ?>
  html += '           <div class="alert alert-info" role="alert"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $text_assign_functionality_faq; ?></div>';
  html += '         </div>';
  html += '       </div>';
  html += '       <div class="modal-error-block" id="modal-error-field-data-' + field_row + '-view"></div>';
  html += '     </div>';
  html += '   </div>';
  html += '   <div class="form-group">';
  html += '     <label class="col-sm-3 control-label" for="input-check' + field_row + '"><?php echo $text_check_type; ?></label>';
  html += '     <div class="col-sm-9">';
  html += '       <select name="field_data[' + field_row + '][check]" class="form-control" id="input-check' + field_row + '">';
  html += '         <option value="0"><?php echo $text_validation_type_1; ?></option>';
  html += '         <option value="1"><?php echo $text_validation_type_2; ?></option>';
  html += '         <option value="2"><?php echo $text_validation_type_3; ?></option>';
  html += '         <option value="3"><?php echo $text_validation_type_4; ?></option>';
  html += '       </select>';
  html += '       <div class="input-group" style="display:none;margin-top:15px;">';
  html += '         <span class="input-group-addon"><i class="fa fa-filter"></i></span>';
  html += '         <input type="text" placeholder="" name="field_data[' + field_row + '][check_rule]" value="" class="form-control" />';
  html += '       </div>';
  html += '       <div class="input-group" style="display:none;margin-top:15px;">';
  html += '         <span class="input-group-addon"><i class="fa fa-chevron-right"></i></span>';
  html += '         <input type="text" placeholder="<?php echo $text_validation_type_4_1_ph; ?>" name="field_data[' + field_row + '][check_min]" value="" class="form-control" />';
  html += '       </div>';
  html += '       <div class="input-group" style="display:none;margin-top:15px;">';
  html += '         <span class="input-group-addon"><i class="fa fa-chevron-left"></i></span>';
  html += '         <input type="text" placeholder="<?php echo $text_validation_type_4_2_ph; ?>" name="field_data[' + field_row + '][check_max]" value="" class="form-control" />';
  html += '       </div>';
  html += '     </div>';
  html += '   </div>';
  html += '   <div class="form-group">';
  html += '     <label class="col-sm-3 control-label" for="input-mask' + field_row + '"><?php echo $text_mask; ?></label>';
  html += '     <div class="col-sm-9">';
  html += '       <div class="input-group">';
  html += '         <span class="input-group-addon"><i class="fa fa-pencil-square-o"></i></span>';
  html += '         <input value="" type="text" name="field_data[' + field_row + '][mask]" class="form-control" placeholder="<?php echo $text_mask_ph; ?>" id="input-mask' + field_row + '" />';
  html += '       </div>';
  html += '     </div>';
  html += '   </div>';
  html += '   <div class="form-group required">';
  html += '     <label class="col-sm-3 control-label" for="input-error_text' + field_row + '"><?php echo $text_error_text; ?></label>';
  html += '     <div class="col-sm-9">';
                <?php foreach ($languages as $language) { ?>
  html += '       <div class="input-group" style="margin-bottom: 5px;">';
  html += '         <span class="input-group-addon"><img src="<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
  html += '         <input type="text" name="field_data[' + field_row + '][error_text][<?php echo $language['language_id']; ?>]" value="<?php echo $error_for_all_field; ?>" class="form-control" id="input-error_text' + field_row + '" />';
  html += '       </div>';
  html += '       <div class="modal-error-block" id="modal-error-field-data-language-' + field_row + '-error-text-<?php echo $language['language_id']; ?>"></div>';
                <?php } ?>
  html += '     </div>';
  html += '   </div>';
  html += '   <div class="form-group">';
  html += '     <label class="col-sm-3 control-label" for="input-css_id' + field_row + '"><?php echo $text_css_id; ?></label>';
  html += '     <div class="col-sm-9">';
  html += '       <div class="input-group">';
  html += '         <span class="input-group-addon"><?php echo $text_css_id_indicator; ?></span>';
  html += '         <input value="" type="text" name="field_data[' + field_row + '][css_id]" class="form-control" placeholder="<?php echo $text_css_id_ph; ?>" id="input-css_id' + field_row + '" />';
  html += '       </div>';
  html += '     </div>';
  html += '   </div>';
  html += '   <div class="form-group">';
  html += '     <label class="col-sm-3 control-label" for="input-css_class' + field_row + '"><?php echo $text_css_class; ?></label>';
  html += '     <div class="col-sm-9">';
  html += '       <div class="input-group">';
  html += '         <span class="input-group-addon"><?php echo $text_css_class_indicator; ?></span>';
  html += '         <input value="" type="text" name="field_data[' + field_row + '][css_class]" class="form-control" placeholder="<?php echo $text_css_class_ph; ?>" id="input-css_class' + field_row + '" />';
  html += '       </div>';
  html += '     </div>';
  html += '   </div>';
  html += '   <div class="form-group position-field">';
  html += '     <label class="col-sm-3 control-label"><?php echo $text_position; ?></label>';
  html += '     <div class="col-sm-9">';
  html += '       <div class="btn-group" data-toggle="buttons">';
  html += '         <label class="btn btn-success">';
  html += '           <input type="radio" name="field_data[' + field_row + '][position]" value="1" autocomplete="off" /><?php echo $text_left_side; ?>';
  html += '         </label>';
  html += '         <label class="btn btn-success active">';
  html += '           <input type="radio" name="field_data[' + field_row + '][position]" value="3" autocomplete="off" checked="checked" /><?php echo $text_center; ?>';
  html += '         </label>';
  html += '         <label class="btn btn-success">';
  html += '           <input type="radio" name="field_data[' + field_row + '][position]" value="2" autocomplete="off" /><?php echo $text_right_side; ?>';
  html += '         </label>';
  html += '       </div>';
  html += '     </div>';
  html += '   </div>';

  $('#modal-fields-block .tab-content:first-child').append(html);

  $('#field-add').before('<li class="no_field_title"><a href="#tab-field' + field_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-field' + field_row + '\\\']\').parent().remove(); $(\'#tab-field' + field_row + '\').remove(); $(\'#fields-li a:first\').tab(\'show\');"></i> <?php echo $text_tab_field; ?> №' + field_row + '</a></li>');
  $('#fields-li a[href=\'#tab-field' + field_row + '\']').tab('show');

  $('select[name*=check]').change(function() {
    var val = $(this).val();
    if (val == 2) {
      $(this).next().show();
      $(this).next().next().hide();
      $(this).next().next().next().hide();
    } else if(val == 3) {
      $(this).next().hide();
      $(this).next().next().show();
      $(this).next().next().next().show();
    } else {
      $(this).next().hide();
      $(this).next().next().hide();
      $(this).next().next().next().hide();
    }
  });

  if ($('select[name=display_type]').val() != "1") {
    $('.position-field').hide();
  }

  $('select[name*=view]').change(function() {
    var val = $(this).val();

    if (val == "radio" || val == "checkbox" || val == "select") {
      $(this).next().show();
    } else {
      $(this).next().hide();
    }
  });

  field_row++;
}

$('select[name*=check]').change(function() {
  var val = $(this).val();

   if (val == 2) {
    $(this).next().show();
    $(this).next().next().hide();
    $(this).next().next().next().hide();
   } else if(val == 3) {
    $(this).next().hide();
    $(this).next().next().show();
    $(this).next().next().next().show();
   } else {
    $(this).next().hide();
    $(this).next().next().hide();
    $(this).next().next().next().hide();
   }
});

$('select[name*=view]').change(function() {
  var val = $(this).val();

  if (val == "radio" || val == "checkbox" || val == "select") {
    $(this).next().show();
  } else {
    $(this).next().hide();
  }
});

$('select[name*=check]').trigger('change');
$('select[name*=view]').trigger('change');


$('select[name=display_type]').change(function() {
  var val = $(this).val();

  if (val == 1) {
    $('.display-type-1').show();
    $('.display-type-2').hide();
    $('.display-type-3').hide();
    $('.position-field').show();
  } else if(val == 2) {
    $('.display-type-1').hide();
    $('.display-type-2').show();
    $('.display-type-3').hide();
    $('.position-field').hide();
  } else if(val == 3) {
    $('.display-type-1').hide();
    $('.display-type-2').hide();
    $('.display-type-3').show();
    $('.position-field').hide();
  }

  $('select[name=popup_button_type]').trigger('change');
});

$('select[name=popup_button_type]').change(function() {
  var val = $(this).val();
  var val_display_type = $('select[name=display_type]').val();

  if (val == 1 && val_display_type == 1) {
    $('.popup-button-type-1').show();
    $('.popup-button-type-2').hide();
  } else if(val == 2 && val_display_type == 1) {
    $('.popup-button-type-1').hide();
    $('.popup-button-type-2').show();
  }
});

$('#fields-li li:first-child a').tab('show');

$('#modal-fields-block .nav-pills').sortable({
  forcePlaceholderSize: true,
  items: '> li:not(#field-add)',
  cursor: "move",
  axis: "y",
  placeholder: 'tab-placeholder',
});

$('select[name=display_type]').trigger('change');
//--></script> 
<!-- start: code for module usability -->
<script type="text/javascript">
if ($('#modal-form-constructor-content .pro-block').length) {
  $('#modal-form-constructor-content .pro-block').each(function(index) {
    $(this).find('.control-label').append('<div class="clear"></div><div class="label label-info" style="text-transform: uppercase;"><?php echo $text_available_in_pro_version; ?></div>');
    $(this).find('input[type=\'radio\'], input[type=\'checkbox\'], select, button').attr('disabled', true);
    $(this).find('input[type=\'text\'], textarea').on('focus', function(){ alert('<?php echo $text_available_in_pro_version; ?>'); });
    $(this).find('label').addClass('disabled');
    $(this).addClass('pro-version-only');
  });
}
</script>
<!-- end: code for module usability -->
</div>
