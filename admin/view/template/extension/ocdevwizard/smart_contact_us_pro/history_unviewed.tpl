<!--
##==================================================================##
## @author    : OCdevWizard                                         ##
## @contact   : ocdevwizard@gmail.com                               ##
## @support   : http://help.ocdevwizard.com                         ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf ##
## @copyright : (c) OCdevWizard. Smart Contact Us Pro, 2017         ##
##==================================================================##
-->

<?php if ($histories) { ?>
  <div class="btn-group">
    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
      <i class="fa fa-trash-o"></i> <?php echo $button_delete_menu; ?> <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
      <li><a onclick="delete_all(0,'record');"><?php echo $button_delete_all; ?></a></li>
      <li><a onclick="delete_all_selected(0,'record');"><?php echo $button_delete_selected; ?></a></li>
    </ul>
  </div>
<?php } ?>
<button type="button" onclick="$('a[href=#unviewed-saved-record-block]').click();" class="btn btn-primary"><i class="fa fa-refresh"></i> <?php echo $button_update; ?></button>
<div class="special-margin"></div>
<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('#unviewed-saved-record-block input[name*=\'selected\']').attr('checked', this.checked);" /></td>
        <td class="text-left" width="15%"><?php echo $column_record_details; ?></td>
        <td class="text-left"><?php echo $column_record_visitor_data; ?></td>
        <td class="text-left"><?php echo $column_extra_user_info; ?></td>
        <td class="text-left"><?php echo $column_record_date; ?></td>
        <td class="text-left"><?php echo $column_record_status; ?></td>
        <td class="text-center" width="10%"><?php echo $column_record_action; ?></td>
      </tr>
    </thead>
    <tbody>
    <?php if ($histories) { ?>
      <?php foreach ($histories as $history) { ?>
      <tr>
        <td style="text-align: center;"><input type="checkbox" name="selected[]" value="<?php echo $history['record_id']; ?>" /></td>
        <td class="text-left">
          <?php if ($history['form_check']) { ?>
          <p><strong><?php echo $text_form_name; ?></strong> <a href="javascript:void(0)" onclick="open_form({id: '<?php echo $history['form_id']; ?>'});"><?php echo $history['heading']; ?></a></p>
          <?php } else { ?>
          <p><strong><?php echo $text_form_name; ?></strong> <?php echo $history['heading']; ?></p>
          <?php } ?>
          <?php if ($history['store_name'] && $history['store_url']) { ?>
          <p><strong><?php echo $text_store; ?></strong> <a href="<?php echo $history['store_url']; ?>" target="_blank"><?php echo $history['store_name']; ?></a></p>
          <?php } ?>
        </td>
        <td>
          <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-visitor-data-<?php echo $history['record_id']; ?>" autocomplete="off"><?php echo $button_view_visitor_data; ?></button>
          <!-- Modal -->
          <div class="modal fade" id="modal-visitor-data-<?php echo $history['record_id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel"><?php echo $text_modal_visitor_data; ?></h4>
                </div>
                <div class="modal-body">
                  <?php if ($history['field_data']) { ?>
                  <div class="table-responsive">
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <td class="col-sm-2"><?php echo $column_record_modal_record_id; ?></td>
                          <td class="col-sm-10"><?php echo $column_record_modal_referer; ?></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><?php echo $history['record_id']; ?></td>
                          <td><?php echo $history['referer']; ?></td>
                        </tr>
                      </tbody>
                    </table>
                    <table class="table table-bordered" style="margin-bottom: 0;">
                      <thead>
                        <tr>
                          <td class="col-sm-6"><?php echo $column_record_modal_heading; ?></td>
                          <td class="col-sm-6"><?php echo $column_record_modal_value; ?></td>
                        </tr>
                      </thead>
                      <tbody>
                      <?php foreach ($history['field_data'] as $record) { ?>
                        <tr>
                          <td><?php echo $record['title']; ?></td>
                          <td><?php foreach ($record['values'] as $value) { ?><?php echo $value; ?><?php } ?></td>
                        </tr>
                      <?php } ?>
                      </tbody>
                    </table>
                  </div>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
          <script type="text/javascript">
            $('#modal-visitor-data-<?php echo $history['record_id']; ?>').on('hidden.bs.modal', function () {
              $.ajax({
                type: 'get',
                url:  'index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history_update_viewed&<?php echo $token; ?>&record_id=<?php echo $history['record_id']; ?>',
                dataType: 'json',
                success: function(json) {
                  $('#history0').load('index.php?route=extension/ocdevwizard/<?php echo $_name; ?>/history&<?php echo $token; ?>&filter_store_id=<?php echo $store_id; ?>&filter_status=0');
                }
              });
            });
          </script>
        </td>
        <td class="text-left">
          <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-extra-user-info-<?php echo $history['record_id']; ?>" autocomplete="off"><?php echo $button_view_extra_info; ?></button>
          <!-- Modal -->
          <div class="modal fade" id="modal-extra-user-info-<?php echo $history['record_id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="myModalLabel"><?php echo $text_modal_extra_info_heading; ?></h4>
                </div>
                <div class="modal-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" style="margin-bottom:0">
                      <thead>
                        <tr>
                          <td class="text-left"><?php echo $column_ip; ?></td>
                          <td class="text-left"><?php echo $column_record_user_agent; ?></td>
                          <td class="text-left"><?php echo $column_record_acept_language; ?></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="text-left">
                            <?php echo $history['ip']; ?> <button type="button" onclick="window.open('http://www.checkip.com/ip/<?php echo $history['ip']; ?>','_blank');return false;" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $button_check_ip; ?>" data-placement="right"><i class="fa fa-info-circle"></i> <?php echo $text_check; ?></button>
                          </td>
                          <td class="text-left"><?php echo $history['user_agent']; ?></td>
                          <td class="text-left"><?php echo $history['accept_language']; ?></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </td>
        <td class="text-left">
          <p><strong><?php echo $text_date_added; ?></strong> <?php echo $history['date_added']; ?></p>
        </td>
        <td class="text-left"><?php echo $history['status']; ?></td>
        <td class="text-center">
          <a onclick="confirm('<?php echo $text_are_you_sure; ?>') ? delete_selected(0,'record',<?php echo $history['record_id']; ?>) : false;" data-toggle="tooltip" title="" class="btn btn-warning" data-original-title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a>
        </td>
      </tr>
      <?php } ?>
      <?php } else { ?>
        <tr>
          <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
        </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<?php if ($histories) { ?>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<?php } ?>