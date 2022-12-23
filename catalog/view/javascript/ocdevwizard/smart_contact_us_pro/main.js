$(function() {
  $.ajax({
    type: 'post',
    url: 'index.php?route=extension/ocdevwizard/smart_contact_us_pro/getForms',
    dataType: 'json',
    success: function(json) {
      $.each(json['forms'], function(i,value) {
        if (value['display_type'] == 1) {
          $.each(value['add_id_selector'], function(i,i_selector) {
            if (value['popup_button_type'] == 1) {
              if (value['location'] == 1) {
                $('#'+i_selector).before("<button class='"+value['button_class']+" smcup-call-static-button' onclick='getOCwizardModal_smcup("+value['form_id']+", 1)'>"+value['call_button']+"</button>");
              } else if (value['location'] == 2) {
                $('#'+i_selector).prepend("<button class='"+value['button_class']+" smcup-call-static-button' onclick='getOCwizardModal_smcup("+value['form_id']+", 1)'>"+value['call_button']+"</button>");
              } else if (value['location'] == 3) {
                $('#'+i_selector).append("<button class='"+value['button_class']+" smcup-call-static-button' onclick='getOCwizardModal_smcup("+value['form_id']+", 1)'>"+value['call_button']+"</button>");
              } else {
                $('#'+i_selector).after("<button class='"+value['button_class']+" smcup-call-static-button' onclick='getOCwizardModal_smcup("+value['form_id']+", 1)'>"+value['call_button']+"</button>");
              }
            } else {
               $('body').append("<button id='"+value['float_button_id_selector']+"' class='smcup-call-float-button' onclick='getOCwizardModal_smcup("+value['form_id']+", 1)'>"+value['call_button']+"</button>");
            }
          });
        } else if(value['display_type'] == 3) {
          if (value['sidebar_type'] == 1) {
            $('body').before("<div id='smcup-sidebar-"+value['form_id']+"' class='smcup-sidebar smcup-sidebar-left'></div><button class='smcup-call-sidebar-button' id='"+value['sidebar_button_id_selector']+"' onclick='getOCwizardModal_smcup("+value['form_id']+", 2, "+value['sidebar_type']+")'>"+value['call_button']+"</button>");
          } else {
            $('body').before("<div id='smcup-sidebar-"+value['form_id']+"' class='smcup-sidebar smcup-sidebar-right'></div><button class='smcup-call-sidebar-button' id='"+value['sidebar_button_id_selector']+"' onclick='getOCwizardModal_smcup("+value['form_id']+", 2, "+value['sidebar_type']+")'>"+value['call_button']+"</button>");
          }
        }
      });
    }
  });
});
function getOCwizardModal_smcup(form_id, popup_button_type, sidebar_type = 0) {
  if (popup_button_type == 1) {
    $.magnificPopup.open({
      tLoading: '<img src="catalog/view/theme/default/stylesheet/ocdevwizard/smart_contact_us_pro/loading.svg" alt="" />',
      items: {
        src: 'index.php?route=extension/ocdevwizard/smart_contact_us_pro&form_id='+form_id+'&popup_button_type='+popup_button_type,
        type: 'ajax'
      },
      showCloseBtn: false,
      callbacks: {
        open: function() {
          $('.mfp-content').addClass('mfp-with-anim');
        },
      }
    });
    $('.mfp-bg').css({
      'background': 'url(image/catalog/ocdevwizard/smart_contact_us_pro/background/bg_10.png)',
      'opacity': '0.4'
    });
  } else {
    $('#smcup-sidebar-'+form_id).load('index.php?route=extension/ocdevwizard/smart_contact_us_pro&form_id='+form_id+'&popup_button_type='+popup_button_type);
    $('#smcup-sidebar-'+form_id).css('width', '250px');
  }
}
function smcup_sidebar_close(form_id, sidebar_type) {
  $('#smcup-sidebar-'+form_id).css('width', '0');
}
function smcup_static_save_record(form_id) {
  $.ajax({
    type: 'post',
    url: 'index.php?route=extension/ocdevwizard/smart_contact_us_pro_static/save_record',
    dataType: 'json',
    data: $('#smcup-form-'+form_id).serialize(),
    beforeSend: function() {
      $('#smcup-static-data-'+form_id+' button').button('loading');
    },
    complete: function() {
      $('#smcup-static-data-'+form_id+' button').button('reset');
    },
    success: function(json) {
      $('#smcup-static-data-'+form_id+' .alert-success').remove();
      $('#smcup-static-data-'+form_id+' .static-text-danger').remove();
      if (json['error']) {
        if (json['error']['field']) {
          for (i in json['error']['field']) {
            var element = $('#smcup-static-data-'+form_id+' [data-error-name='+i+']');
            element.append('<div class="static-text-danger">'+json['error']['field'][i]+'</div>');
          }
        }
      } else {
        if (json['output']) {
          $('#smcup-static-data-'+form_id+' button').removeAttr('onclick');
          $('#smcup-static-data-'+form_id+' .list-group').prepend('<div class="list-group-item"><div class="alert alert-success smcup-fix-alert"><i class="fa fa-check-circle"></i> '+json['output']+'</div></div>');
        }
      }
    }
  });
}
