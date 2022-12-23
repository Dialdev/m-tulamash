<?php
##==================================================================##
## @author    : OCdevWizard                                         ##
## @contact   : ocdevwizard@gmail.com                               ##
## @support   : http://help.ocdevwizard.com                         ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf ##
## @copyright : (c) OCdevWizard. Smart Contact Us Pro, 2017         ##
##==================================================================##
class ModelExtensionOcdevwizardSmartContactUsPro extends Model {
  private $_name = 'smart_contact_us_pro';
  private $_code = 'smcup';
  private $_version = '1.0.1';
  
  public function addRecord($data = array()) {
    $this->db->query("
    INSERT INTO ".DB_PREFIX.$this->_code."_record
    SET
      form_id = '".(int)$data['form_id']."',
      ip = '".$this->db->escape($data['ip'])."',
      referer = '".$this->db->escape($data['referer'])."',
      user_agent = '".$this->db->escape($data['user_agent'])."',
      accept_language = '".$this->db->escape($data['accept_language'])."',
      user_language_id = '".(int)$data['user_language_id']."',
      field_data = '".$this->db->escape(serialize($data['field_data']))."',
      store_name = '".$this->db->escape($data['store_name'])."',
      store_url = '".$this->db->escape($data['store_url'])."',
      store_id = '".(int)$data['store_id']."',
      date_added = NOW()
    ");
    
    $record_id = $this->db->getLastId();
    
    $form_info = $this->getForm($data['form_id']);
    
    if ($form_info && $form_info['new_saved_record_admin_alert']) {
      $store_id = $this->config->get('config_store_id');
      $this->language->load('extension/ocdevwizard/'.$this->_name);
      
      $record_info = $this->getRecord($record_id);
      
      $html_data = array(
        'title'           => sprintf($this->language->get('text_email_title'), (string)$this->config->get('config_name'), $record_id),
        'store_name'      => (string)$this->config->get('config_name'),
        'logo'            => $store_id ? $this->config->get('config_url') : HTTP_SERVER.'image/'.$this->config->get('config_logo'),
        'store_url'       => $store_id ? $this->config->get('config_url') : HTTP_SERVER,
        'form_id'         => $record_info['form_id'],
        'ip'              => $record_info['ip'],
        'referer'         => $record_info['referer'],
        'user_agent'      => $record_info['user_agent'],
        'accept_language' => $record_info['accept_language'],
        'date_added'      => $record_info['date_added']
      );
      
      $html_data = array_merge($html_data, $this->language->load('extension/ocdevwizard/'.$this->_name));
      
      $html_data['fields'] = array();
      
      $fields = unserialize($record_info['field_data']);
      
      if ($fields) {
        foreach ($fields as $field) {
          $field_values = array();
          
          if (isset($field['value'])) {
            if (is_array($field['value'])) {
              $field_value_i = 0;
              foreach ($field['value'] as $field_value) {
                $field_values[] = (($field_value_i != 0) ? ', ' : '').$field_value;
                $field_value_i++;
              }
            } else {
              $field_values[] = $field['value'];
            }
          } else {
            $field_values[] = $this->language->get('error_download_file');
          }
          
          $html_data['fields'][] = array(
            'title'  => $field['title'],
            'values' => $field_values
          );
        }
      }
      
      if (version_compare(VERSION, '2.1.0.2.1', '<=')) {
        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/extension/ocdevwizard/'.$this->_name.'/mail_system.tpl')) {
          $html = $this->load->view($this->config->get('config_template').'/template/extension/ocdevwizard/'.$this->_name.'/mail_system.tpl', $html_data);
        } else {
          $html = $this->load->view('default/template/extension/ocdevwizard/'.$this->_name.'/mail_system.tpl', $html_data);
        }
      } else if (version_compare(VERSION, '3.0.0.0', '>=')) {
        $html = $this->load->view('extension/ocdevwizard/'.$this->_name.'/mail_system', $html_data);
      } else {
        $html = $this->load->view('extension/ocdevwizard/'.$this->_name.'/mail_system.tpl', $html_data);
      }
      
      // email notification
      if (version_compare(VERSION, '2.0.1.1', '<=')) {
        $mail = new Mail($this->config->get('config_mail'));
      } else if (version_compare(VERSION, '2.0.2.0', '>=') && version_compare(VERSION, '2.0.3.1', '<')) {
        $mail                = new Mail();
        $mail->protocol      = $this->config->get('config_mail_protocol');
        $mail->parameter     = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_host');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port     = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout  = $this->config->get('config_mail_smtp_timeout');
      } else {
        $mail                = new Mail();
        $mail->protocol      = $this->config->get('config_mail_protocol');
        $mail->parameter     = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port     = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout  = $this->config->get('config_mail_smtp_timeout');
      }
      
      $mail->setFrom($this->config->get('config_email'));
      $mail->setSender($this->config->get('config_name'));
      $mail->setSubject($html_data['title']);
      $mail->setHtml($html);
      $mail->setTo($form_info['email_for_notification']);
      $mail->send();
    }
    
    return $record_id;
  }
  
  public function getRecord($record_id) {
    return $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_record WHERE record_id = '".(int)$record_id."'")->row;
  }
  
  public function getForm($form_id) {
    $customer_group_id = $this->customer->isLogged() ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');
    
    return $this->db->query("
      SELECT
      DISTINCT *
      FROM ".DB_PREFIX.$this->_code."_form f
      LEFT JOIN ".DB_PREFIX.$this->_code."_form_description fd ON (f.form_id = fd.form_id)
      LEFT JOIN ".DB_PREFIX.$this->_code."_form_to_store f2s ON (f.form_id = f2s.form_id)
      LEFT JOIN ".DB_PREFIX.$this->_code."_form_to_customer_group f2c ON (f.form_id = f2c.form_id)
      WHERE
        f.form_id = '".(int)$form_id."'
        AND fd.language_id = '".(int)$this->config->get('config_language_id')."'
        AND f2s.store_id = '".(int)$this->config->get('config_store_id')."'
        AND f2c.customer_group_id = '".(int)$customer_group_id."'
        AND f.status = '1'
    ")->row;
  }
  
  public function getForms() {
    $customer_group_id = $this->customer->isLogged() ? (int)$this->customer->getGroupId() : (int)$this->config->get('config_customer_group_id');
    
    return $this->db->query("
    SELECT *
    FROM ".DB_PREFIX.$this->_code."_form f
    LEFT JOIN ".DB_PREFIX.$this->_code."_form_description fd ON (f.form_id = fd.form_id)
    LEFT JOIN ".DB_PREFIX.$this->_code."_form_to_store f2s ON (f.form_id = f2s.form_id)
    LEFT JOIN ".DB_PREFIX.$this->_code."_form_to_customer_group f2c ON (f.form_id = f2c.form_id)
    WHERE
      fd.language_id = '".(int)$this->config->get('config_language_id')."'
      AND f2s.store_id = '".(int)$this->config->get('config_store_id')."'
      AND f2c.customer_group_id = '".(int)$customer_group_id."'
      AND f.status = '1'
    ORDER BY LCASE(fd.heading) ASC
    ")->rows;
  }
  
  public function getLanguageByCode($code) {
    return $query = $this->db->query("SELECT language_id FROM ".DB_PREFIX."language WHERE code = '".(string)$code."'")->row['language_id'];
  }
  
  public function getStore($store_id) {
    return $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX."store WHERE store_id = '".(int)$store_id."'")->row;
  }
}