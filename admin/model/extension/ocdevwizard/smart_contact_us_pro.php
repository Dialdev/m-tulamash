<?php
##==================================================================##
## @author    : OCdevWizard                                         ##
## @contact   : ocdevwizard@gmail.com                               ##
## @support   : http://help.ocdevwizard.com                         ##
## @license   : http://license.ocdevwizard.com/Licensing_Policy.pdf ##
## @copyright : (с) OCdevWizard. Smart Contact Us Pro, 2017    ##
##==================================================================##
libxml_use_internal_errors(true);

class ModelExtensionOcdevwizardSmartContactUsPro extends Model {
  private $_name = 'smart_contact_us_pro';
  private $_code = 'smcup';
  private $_version = '1.0.1';
  
  public function createDBTables() {
    $sql1 = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX.$this->_code."_record` (";
    $sql1 .= "`record_id` int(11) NOT NULL AUTO_INCREMENT, ";
    $sql1 .= "`form_id` int(11) NOT NULL, ";
    $sql1 .= "`ip` varchar(40) COLLATE utf8_general_ci NOT NULL, ";
    $sql1 .= "`referer` text NOT NULL, ";
    $sql1 .= "`user_agent` varchar(255) COLLATE utf8_general_ci NOT NULL, ";
    $sql1 .= "`accept_language` varchar(255) COLLATE utf8_general_ci NOT NULL, ";
    $sql1 .= "`user_language_id` int(11) NOT NULL,";
    $sql1 .= "`field_data` text COLLATE utf8_general_ci NOT NULL, ";
    $sql1 .= "`viewed` int(1) COLLATE utf8_general_ci NOT NULL DEFAULT '0', ";
    $sql1 .= "`date_added` datetime NOT NULL, ";
    $sql1 .= "`date_viewed` datetime NOT NULL, ";
    $sql1 .= "`store_name` text COLLATE utf8_general_ci NOT NULL, ";
    $sql1 .= "`store_url` text COLLATE utf8_general_ci NOT NULL, ";
    $sql1 .= "`store_id` int(11) NOT NULL DEFAULT '0', ";
    $sql1 .= "PRIMARY KEY (`record_id`) ";
    $sql1 .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci AUTO_INCREMENT=1 ; ";
    
    $this->db->query($sql1);
    
    $sql2 = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."ocdevwizard_setting` ( ";
    $sql2 .= "`setting_id` int(11) NOT NULL AUTO_INCREMENT,";
    $sql2 .= "`store_id` int(11) NOT NULL DEFAULT '0',";
    $sql2 .= "`code` varchar(32) NOT NULL,";
    $sql2 .= "`key` varchar(64) NOT NULL,";
    $sql2 .= "`value` text NOT NULL,";
    $sql2 .= "`serialized` tinyint(1) NOT NULL,";
    $sql2 .= "PRIMARY KEY (`setting_id`)";
    $sql2 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";
    
    $this->db->query($sql2);
    
    $sql3 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX.$this->_code."_email_template ( ";
    $sql3 .= "`template_id` int(11) NOT NULL AUTO_INCREMENT,";
    $sql3 .= "`name` varchar(255) NOT NULL,";
    $sql3 .= "`status` tinyint(1) NOT NULL DEFAULT '0', ";
    $sql3 .= "`date_added` datetime NOT NULL, ";
    $sql3 .= "`date_modified` datetime NOT NULL, ";
    $sql3 .= "PRIMARY KEY (`template_id`)";
    $sql3 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";
    
    $this->db->query($sql3);
    
    $sql4 = "CREATE TABLE IF NOT EXISTS ".DB_PREFIX.$this->_code."_email_template_description ( ";
    $sql4 .= "`template_id` int(11) NOT NULL AUTO_INCREMENT,";
    $sql4 .= "`language_id` int(11) NOT NULL,";
    $sql4 .= "`subject` varchar(255) NOT NULL,";
    $sql4 .= "`template` text NOT NULL, ";
    $sql4 .= "PRIMARY KEY (`template_id`,`language_id`), ";
    $sql4 .= "KEY `subject` (`subject`)";
    $sql4 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";
    
    $this->db->query($sql4);
    
    $sql5 = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX.$this->_code."_form` (";
    $sql5 .= "`form_id` int(11) NOT NULL AUTO_INCREMENT, ";
    $sql5 .= "`status` tinyint(1) NOT NULL DEFAULT '1', ";
    $sql5 .= "`new_saved_record_admin_alert` tinyint(1) NOT NULL DEFAULT '1', ";
    $sql5 .= "`email_for_notification` text COLLATE utf8_general_ci NOT NULL, ";
    $sql5 .= "`allow_email_template` tinyint(1) NOT NULL DEFAULT '2', ";
    $sql5 .= "`email_template_by_default` int(11) NOT NULL, ";
    $sql5 .= "`require_information` int(11) NOT NULL, ";
    $sql5 .= "`hide_info_message` tinyint(1) NOT NULL DEFAULT '0', ";
    $sql5 .= "`display_type` tinyint(1) NOT NULL DEFAULT '1', ";
    $sql5 .= "`add_id_selector` varchar(128) COLLATE utf8_general_ci NOT NULL, ";
    $sql5 .= "`button_class` varchar(128) COLLATE utf8_general_ci NOT NULL, ";
    $sql5 .= "`float_button_id_selector` varchar(128) COLLATE utf8_general_ci NOT NULL, ";
    $sql5 .= "`sidebar_button_id_selector` varchar(128) COLLATE utf8_general_ci NOT NULL, ";
    $sql5 .= "`location` int(1) NOT NULL DEFAULT '1', ";
    $sql5 .= "`sidebar_type` tinyint(1) NOT NULL DEFAULT '1', ";
    $sql5 .= "`popup_button_type` tinyint(1) NOT NULL DEFAULT '1', ";
    $sql5 .= "`position` varchar(14) COLLATE utf8_general_ci NOT NULL, ";
    $sql5 .= "`sort_order` int(3) NOT NULL, ";
    $sql5 .= "`date_added` datetime NOT NULL, ";
    $sql5 .= "`date_modified` datetime NOT NULL, ";
    $sql5 .= "PRIMARY KEY (`form_id`) ";
    $sql5 .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci AUTO_INCREMENT=1 ;";
    
    $this->db->query($sql5);
    
    $sql6 = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX.$this->_code."_form_description` (";
    $sql6 .= "`form_id` int(11) NOT NULL, ";
    $sql6 .= "`field_data` text COLLATE utf8_general_ci NOT NULL, ";
    $sql6 .= "`language_id` int(11) NOT NULL, ";
    $sql6 .= "`heading` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql6 .= "`call_button` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql6 .= "`save_button` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql6 .= "`close_button` varchar(64) COLLATE utf8_general_ci NOT NULL, ";
    $sql6 .= "`success_message` text COLLATE utf8_general_ci NOT NULL, ";
    $sql6 .= "`info_message` text COLLATE utf8_general_ci NOT NULL ";
    $sql6 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; ";
    
    $this->db->query($sql6);
    
    $sql7 = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX.$this->_code."_form_to_customer_group` (";
    $sql7 .= "`form_id` int(11) NOT NULL, ";
    $sql7 .= "`customer_group_id` int(11) NOT NULL ";
    $sql7 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; ";
    
    $this->db->query($sql7);
    
    $sql8 = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX.$this->_code."_form_to_store` (";
    $sql8 .= "`form_id` int(11) NOT NULL, ";
    $sql8 .= "`store_id` int(11) NOT NULL ";
    $sql8 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci; ";
    
    $this->db->query($sql8);
  }
  
  public function deleteDBTables() {
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_record;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form_description;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form_to_customer_group;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_form_to_store;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_email_template;");
    $this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX.$this->_code."_email_template_description;");
  }
  
  public function getOCdevCatalog() {
    $catalog = array();
    
    $curl = curl_init();
    
    curl_setopt($curl, CURLOPT_URL, 'http://ocdevwizard.com/products/share/share.xml');
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    
    $response_data = curl_exec($curl);
    $httpcode_data = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    
    curl_close($curl);
    
    $results = simplexml_load_string($response_data);
    
    if ($httpcode_data == 200 && !empty($response_data) && $results !== false) {
      foreach ($results->product as $product) {
        $language = substr($this->request->server['HTTP_ACCEPT_LANGUAGE'], 0, 2);
        
        $catalog[] = array(
          'extension_id'     => (int)$product->extension_id,
          'title'            => (string)$product->title,
          'img'              => (string)$product->img,
          'price'            => (string)$product->price,
          'url'              => (string)str_replace("&amp;", "&", $product->url),
          'date_added'       => (string)$product->date_added,
          'opencart_version' => (string)$product->opencart_version,
          'latest_version'   => (string)$product->latest_version,
          'version_compare'  => version_compare($this->_version, (string)$product->latest_version),
          'features'         => (in_array($language, array(
              'ru',
              'uk'
            )) && $product->{'features_'.$language}) ? (string)$product->{'features_'.$language} : (string)$product->features
        );
      }
      
      $sort_order = array();
      
      foreach ($catalog as $key => $value) {
        $sort_order[$key] = strtotime($value['date_added']);
      }
      
      array_multisort($sort_order, SORT_DESC, $catalog);
    }
    
    return $catalog;
  }
  
  public function getOCdevSupportInfo() {
    $catalog = array();
    
    $curl = curl_init();
    
    curl_setopt($curl, CURLOPT_URL, 'http://ocdevwizard.com/support/support.xml');
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    
    $response_data = curl_exec($curl);
    $httpcode_data = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    
    curl_close($curl);
    
    $results = simplexml_load_string($response_data);
    
    if ($httpcode_data == 200 && !empty($response_data) && $results !== false) {
      $language = substr($this->request->server['HTTP_ACCEPT_LANGUAGE'], 0, 2);
      
      $catalog = array(
        'general'       => (in_array($language, array(
            'ru',
            'uk'
          )) && $results->{'general_'.$language}) ? (string)$results->{'general_'.$language} : (string)$results->general,
        'terms'         => (in_array($language, array(
            'ru',
            'uk'
          )) && $results->{'terms_'.$language}) ? (string)$results->{'terms_'.$language} : (string)$results->terms,
        'faq'           => (in_array($language, array(
            'ru',
            'uk'
          )) && $results->{'faq_'.$language}) ? (string)$results->{'faq_'.$language} : (string)$results->faq,
        'license'       => (string)$results->license,
        'license_error' => (string)$results->license_error
      );
    }
    
    return $catalog;
  }
  
  public function updateViewed($record_id) {
    $this->db->query("UPDATE ".DB_PREFIX.$this->_code."_record SET viewed = '1', date_viewed = NOW() WHERE record_id = '".(int)$record_id."'");
  }
  
  public function addForm($data) {
    $this->db->query("
      INSERT INTO ".DB_PREFIX.$this->_code."_form
      SET
        status = '".(int)$data['status']."',
        new_saved_record_admin_alert = '".(int)$data['new_saved_record_admin_alert']."',
        email_for_notification = '".$this->db->escape($data['email_for_notification'])."',
        allow_email_template = '".(int)$data['allow_email_template']."',
        email_template_by_default = '".(int)((isset($data['email_template_by_default'])) ? $data['email_template_by_default'] : '')."',
        require_information = '".(int)$data['require_information']."',
        hide_info_message = '".(int)$data['hide_info_message']."',
        display_type = '".(int)$data['display_type']."',
        add_id_selector = '".$this->db->escape($data['add_id_selector'])."',
        button_class = '".$this->db->escape($data['button_class'])."',
        location = '".(int)$data['location']."',
        sidebar_type = '".(int)$data['sidebar_type']."',
        popup_button_type = '".(int)$data['popup_button_type']."',
        `position` = '".$this->db->escape($data['position'])."',
        sort_order = '".(int)$data['sort_order']."',
        date_added = NOW()
    ");
    
    $form_id = $this->db->getLastId();
    
    foreach ($data['form_description'] as $language_id => $value) {
      $this->db->query("
        INSERT INTO ".DB_PREFIX.$this->_code."_form_description
        SET
          form_id = '".(int)$form_id."',
          language_id = '".(int)$language_id."',
          heading = '".$this->db->escape($value['heading'])."',
          call_button = '".$this->db->escape($value['call_button'])."',
          save_button = '".$this->db->escape($value['save_button'])."',
          close_button = '".$this->db->escape($value['close_button'])."',
          success_message = '".$this->db->escape($value['success_message'])."',
          info_message = '".$this->db->escape($value['info_message'])."',
          field_data = '".$this->db->escape(serialize($data['field_data']))."'
      ");
    }
    
    if (isset($data['stores'])) {
      foreach ($data['stores'] as $store_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_store SET form_id = '".(int)$form_id."', store_id = '".(int)$store_id."'");
      }
    }
    
    if (isset($data['customer_groups'])) {
      foreach ($data['customer_groups'] as $customer_group_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_customer_group SET form_id = '".(int)$form_id."', customer_group_id = '".(int)$customer_group_id."'");
      }
    }
    
    $this->db->query("
      UPDATE ".DB_PREFIX.$this->_code."_form
      SET
        float_button_id_selector = '".$this->db->escape($this->_code.'-float-button-'.$form_id)."',
        sidebar_button_id_selector = '".$this->db->escape($this->_code.'-sidebar-button-'.$form_id)."'
      WHERE
        form_id = '".(int)$form_id."'
    ");
    
    return $form_id;
  }
  
  public function editForm($form_id, $data) {
    $this->db->query("
      UPDATE ".DB_PREFIX.$this->_code."_form
      SET
        status = '".(int)$data['status']."',
        new_saved_record_admin_alert = '".(int)$data['new_saved_record_admin_alert']."',
        email_for_notification = '".$this->db->escape($data['email_for_notification'])."',
        allow_email_template = '".(int)$data['allow_email_template']."',
        email_template_by_default = '".(int)((isset($data['email_template_by_default'])) ? $data['email_template_by_default'] : '')."',
        require_information = '".(int)$data['require_information']."',
        hide_info_message = '".(int)$data['hide_info_message']."',
        display_type = '".(int)$data['display_type']."',
        add_id_selector = '".$this->db->escape($data['add_id_selector'])."',
        button_class = '".$this->db->escape($data['button_class'])."',
        float_button_id_selector = '".$this->db->escape($data['float_button_id_selector'])."',
        sidebar_button_id_selector = '".$this->db->escape($data['sidebar_button_id_selector'])."',
        location = '".(int)$data['location']."',
        sidebar_type = '".(int)$data['sidebar_type']."',
        popup_button_type = '".(int)$data['popup_button_type']."',
        position = '".$this->db->escape($data['position'])."',
        sort_order = '".(int)$data['sort_order']."',
        date_modified = NOW() WHERE form_id = '".(int)$form_id."'
    ");
    
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form_id."'");
    
    foreach ($data['form_description'] as $language_id => $value) {
      $this->db->query("
        INSERT INTO ".DB_PREFIX.$this->_code."_form_description
        SET
          form_id = '".(int)$form_id."',
          language_id = '".(int)$language_id."',
          heading = '".$this->db->escape($value['heading'])."',
          call_button = '".$this->db->escape($value['call_button'])."',
          save_button = '".$this->db->escape($value['save_button'])."',
          close_button = '".$this->db->escape($value['close_button'])."',
          success_message = '".$this->db->escape($value['success_message'])."',
          info_message = '".$this->db->escape($value['info_message'])."',
          field_data = '".$this->db->escape(serialize($data['field_data']))."'
      ");
    }
    
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_store WHERE form_id = '".(int)$form_id."'");
    
    if (isset($data['stores'])) {
      foreach ($data['stores'] as $store_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_store SET form_id = '".(int)$form_id."', store_id = '".(int)$store_id."'");
      }
    }
    
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_customer_group WHERE form_id = '".(int)$form_id."'");
    
    if (isset($data['customer_groups'])) {
      foreach ($data['customer_groups'] as $customer_group_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_customer_group SET form_id = '".(int)$form_id."', customer_group_id = '".(int)$customer_group_id."'");
      }
    }
  }
  
  public function getForm($form_id) {
    return $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form WHERE form_id = '".(int)$form_id."'")->row;
  }
  
  public function getForms($data = array()) {
    $sql = "SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_form f LEFT JOIN ".DB_PREFIX.$this->_code."_form_description fd ON (f.form_id = fd.form_id) WHERE fd.language_id = '".(int)$this->config->get('config_language_id')."'";
    
    if (isset($data['filter_form']) && !empty($data['filter_form'])) {
      $sql .= " AND fd.heading LIKE '".$this->db->escape($data['filter_form'])."%'";
    }
    
    if (isset($data['filter_display_type']) && !empty($data['filter_display_type'])) {
      $sql .= " AND f.display_type = '".(int)$data['filter_display_type']."'";
    }
    
    if (isset($data['filter_group_form']) && !empty($data['filter_group_form'])) {
      $sql .= " GROUP BY fd.heading";
    }
    
    $sort_data = array(
      'fd.heading',
      'f.date_added',
      'f.date_modified'
    );
    
    if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
      $sql .= " ORDER BY ".$data['sort'];
    } else {
      $sql .= " ORDER BY f.date_added";
    }
    
    if (isset($data['order']) && ($data['order'] == 'DESC')) {
      $sql .= " DESC";
    } else {
      $sql .= " ASC";
    }
    
    if (isset($data['start']) || isset($data['limit'])) {
      if ($data['start'] < 0) {
        $data['start'] = 0;
      }
      
      if ($data['limit'] < 1) {
        $data['limit'] = 20;
      }
      
      $sql .= " LIMIT ".(int)$data['start'].",".(int)$data['limit'];
    }
    
    return $this->db->query($sql)->rows;
  }
  
  public function getExportForms() {
    $query = $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_form")->rows;
    
    $form_data = array();
    
    if ($query) {
      foreach ($query as $form) {
        $data = array();
        
        $data = $form;
        
        $data = array_merge($data, array('stores' => $this->getFormStores($form['form_id'])));
        $data = array_merge($data, array('customer_groups' => $this->getFormCustomerGroups($form['form_id'])));
        $data = array_merge($data, array('field_data' => $this->getFields($form['form_id'])));
        $data = array_merge($data, array('form_description' => $this->getFormDescription($form['form_id'])));
        
        $form_data[] = $data;
      }
    }
    
    return $form_data;
  }
  
  public function prepareFormForImport() {
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form_description");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form_to_store");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_form_to_customer_group");
  }
  
  public function importForm($data) {
    $this->db->query("
      INSERT INTO ".DB_PREFIX.$this->_code."_form
      SET
        form_id = '".(int)$data['form_id']."',
        status = '".(int)$data['status']."',
        new_saved_record_admin_alert = '".(int)$data['new_saved_record_admin_alert']."',
        email_for_notification = '".$this->db->escape($data['email_for_notification'])."',
        allow_email_template = '".(int)$data['allow_email_template']."',
        email_template_by_default = '".(int)$data['email_template_by_default']."',
        require_information = '".(int)$data['require_information']."',
        hide_info_message = '".(int)$data['hide_info_message']."',
        display_type = '".(int)$data['display_type']."',
        add_id_selector = '".$this->db->escape($data['add_id_selector'])."',
        button_class = '".$this->db->escape($data['button_class'])."',
        float_button_id_selector = '".$this->db->escape($data['float_button_id_selector'])."',
        sidebar_button_id_selector = '".$this->db->escape($data['sidebar_button_id_selector'])."',
        location = '".(int)$data['location']."',
        sidebar_type = '".(int)$data['sidebar_type']."',
        popup_button_type = '".(int)$data['popup_button_type']."',
        `position` = '".$this->db->escape($data['position'])."',
        sort_order = '".(int)$data['sort_order']."',
        date_added = '".$this->db->escape($data['date_added'])."',
        date_modified = '".$this->db->escape($data['date_modified'])."'
    ");
    
    foreach ($data['form_description'] as $language_id => $value) {
      $this->db->query("
        INSERT INTO ".DB_PREFIX.$this->_code."_form_description
        SET
          form_id = '".(int)$data['form_id']."',
          language_id = '".(int)$language_id."',
          heading = '".$this->db->escape($value['heading'])."',
          call_button = '".$this->db->escape($value['call_button'])."',
          save_button = '".$this->db->escape($value['save_button'])."',
          close_button = '".$this->db->escape($value['close_button'])."',
          success_message = '".$this->db->escape($value['success_message'])."',
          info_message = '".$this->db->escape($value['info_message'])."',
          field_data = '".$this->db->escape(serialize($data['field_data']))."'
      ");
    }
    
    if (isset($data['stores'])) {
      foreach ($data['stores'] as $store_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_store SET form_id = '".(int)$data['form_id']."', store_id = '".(int)$store_id."'");
      }
    }
    
    if (isset($data['customer_groups'])) {
      foreach ($data['customer_groups'] as $customer_group_id) {
        $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_form_to_customer_group SET form_id = '".(int)$data['form_id']."', customer_group_id = '".(int)$customer_group_id."'");
      }
    }
  }
  
  public function getTotalForms($data = array()) {
    $sql = "SELECT COUNT(*) AS total FROM ".DB_PREFIX.$this->_code."_form f LEFT JOIN ".DB_PREFIX.$this->_code."_form_description fd ON (f.form_id = fd.form_id) WHERE fd.language_id = '".(int)$this->config->get('config_language_id')."'";
    
    if (isset($data['filter_form']) && !empty($data['filter_form'])) {
      $sql .= " AND fd.heading LIKE '".$this->db->escape($data['filter_form'])."%'";
    }
    
    return $this->db->query($sql)->row['total'];
  }
  
  public function deleteForm($form_id) {
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form WHERE form_id = '".(int)$form_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_store WHERE form_id = '".(int)$form_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_customer_group WHERE form_id = '".(int)$form_id."'");
    
    return true;
  }
  
  public function deleteForms() {
    $query = $this->db->query("SELECT form_id FROM ".DB_PREFIX.$this->_code."_form")->rows;
    
    if ($query) {
      foreach ($query as $form) {
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form WHERE form_id = '".(int)$form['form_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form['form_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_store WHERE form_id = '".(int)$form['form_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_form_to_customer_group WHERE form_id = '".(int)$form['form_id']."'");
      }
      
      return true;
    } else {
      return false;
    }
  }
  
  public function copyForm($form_id) {
    $query = $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_form f LEFT JOIN ".DB_PREFIX.$this->_code."_form_description fd ON (f.form_id = fd.form_id) WHERE f.form_id = '".(int)$form_id."' AND fd.language_id = '".(int)$this->config->get('config_language_id')."'");
    
    if ($query->num_rows) {
      $data = array();
      
      $data = $query->row;
      
      $data['status'] = '0';
      
      $data['field_data'] = $this->getFields($form_id);
      
      $data = array_merge($data, array('stores' => $this->getFormStores($form_id)));
      $data = array_merge($data, array('customer_groups' => $this->getFormCustomerGroups($form_id)));
      $data = array_merge($data, array('form_description' => $this->getFormDescription($form_id)));
      
      $this->addForm($data);
      
      return true;
    } else {
      return false;
    }
  }
  
  public function getRecord($record_id) {
    return $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_record WHERE record_id = '".(int)$record_id."'")->row;
  }
  
  public function getRecords($data = array()) {
    $sql = "SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_record WHERE viewed = '".(int)$data['filter_status']."' AND store_id = '".(int)$data['filter_store_id']."'";
    
    $sort_data = array(
      'date_added',
      'viewed'
    );
    
    if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
      $sql .= " ORDER BY ".$data['sort'];
    } else {
      $sql .= " ORDER BY date_added";
    }
    
    if (isset($data['order']) && ($data['order'] == 'DESC')) {
      $sql .= " DESC";
    } else {
      $sql .= " ASC";
    }
    
    if (isset($data['start']) || isset($data['limit'])) {
      if ($data['start'] < 0) {
        $data['start'] = 0;
      }
      
      if ($data['limit'] < 1) {
        $data['limit'] = 20;
      }
      
      $sql .= " LIMIT ".(int)$data['start'].",".(int)$data['limit'];
    }
    
    return $this->db->query($sql)->rows;
  }
  
  public function getTotalRecords($data = array()) {
    $sql = "SELECT COUNT(*) AS total FROM ".DB_PREFIX.$this->_code."_record WHERE viewed = '".(int)$data['filter_status']."' AND store_id = '".(int)$data['filter_store_id']."'";
    
    if (!empty($data['filter_date_added'])) {
      $sql .= " AND DATE(date_added) = DATE('".$this->db->escape($data['filter_date_added'])."')";
    }
    
    return $this->db->query($sql)->row['total'];
  }
  
  public function getTotalRecordsForWidget($data = array()) {
    $sql = "SELECT COUNT(*) AS total FROM ".DB_PREFIX.$this->_code."_record";
    
    if (isset($data['filter_viewed'])) {
      $sql .= " WHERE viewed = '".$this->db->escape($data['filter_viewed'])."'";
    }
    
    return $this->db->query($sql)->row['total'];
  }
  
  public function deleteRecord($record_id, $filter_status) {
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_record WHERE record_id = '".(int)$record_id."' AND viewed = '".(int)$filter_status."'");
    
    return true;
  }
  
  public function deleteRecords($filter_status, $store_id = 0) {
    $query = $this->db->query("SELECT record_id FROM ".DB_PREFIX.$this->_code."_record WHERE viewed = '".(int)$filter_status."' AND store_id = '".(int)$store_id."'")->rows;
    
    if ($query) {
      foreach ($query as $record) {
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_record WHERE record_id = '".(int)$record['record_id']."'");
      }
      
      return true;
    } else {
      return false;
    }
  }
  
  public function getExportRecords() {
    $query = $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_record")->rows;
    
    $record_data = array();
    
    if ($query) {
      foreach ($query as $record) {
        $data = array();
        
        $data               = $record;
        $data['field_data'] = unserialize($record['field_data']);
        
        $record_data[] = $data;
      }
    }
    
    return $record_data;
  }
  
  public function prepareRecordForImport() {
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_record");
  }
  
  public function importRecord($data) {
    $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_record SET record_id = '".(int)$data['record_id']."', form_id = '".(int)$data['form_id']."', ip = '".$this->db->escape($data['ip'])."', referer = '".$this->db->escape($data['referer'])."', user_agent = '".$this->db->escape($data['user_agent'])."', accept_language = '".$this->db->escape($data['accept_language'])."', field_data = '".$this->db->escape(serialize($data['field_data']))."', viewed = '".(int)$data['viewed']."', date_added = '".$this->db->escape($data['date_added'])."', date_viewed = '".$this->db->escape($data['date_viewed'])."', store_name = '".$this->db->escape($data['store_name'])."', store_url = '".$this->db->escape($data['store_url'])."', store_id = '".(int)$data['store_id']."'");
  }
  
  public function getFormDescription($form_id) {
    $description_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form_id."'")->rows;
    
    if ($query) {
      foreach ($query as $result) {
        $description_data[$result['language_id']] = array(
          'heading'         => $result['heading'],
          'call_button'     => $result['call_button'],
          'save_button'     => $result['save_button'],
          'close_button'    => $result['close_button'],
          'success_message' => $result['success_message'],
          'info_message'    => $result['info_message']
        );
      }
    }
    
    return $description_data;
  }
  
  public function getFields($form_id) {
    $query = $this->db->query("SELECT field_data FROM ".DB_PREFIX.$this->_code."_form_description WHERE form_id = '".(int)$form_id."'")->row['field_data'];
    
    return unserialize($query);
  }
  
  public function getFormStores($form_id) {
    $form_store_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form_to_store WHERE form_id = '".(int)$form_id."'")->rows;
    
    if ($query) {
      foreach ($query as $result) {
        $form_store_data[] = $result['store_id'];
      }
    }
    
    return $form_store_data;
  }
  
  public function getFormCustomerGroups($form_id) {
    $form_customer_group_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_form_to_customer_group WHERE form_id = '".(int)$form_id."'")->rows;
    
    if ($query) {
      foreach ($query as $result) {
        $form_customer_group_data[] = $result['customer_group_id'];
      }
    }
    
    return $form_customer_group_data;
  }
  
  public function addEmailTemplate($data) {
    $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_email_template SET `name` = '".$this->db->escape($data['name'])."', status = '".(int)$data['status']."', date_added = NOW()");
    
    $template_id = $this->db->getLastId();
    
    foreach ($data['template_description'] as $language_id => $value) {
      $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_email_template_description SET template_id = '".(int)$template_id."', language_id = '".(int)$language_id."', subject = '".$this->db->escape($value['subject'])."', template = '".$this->db->escape($value['template'])."'");
    }
    
    return $template_id;
  }
  
  public function editEmailTemplate($template_id, $data) {
    $this->db->query("UPDATE ".DB_PREFIX.$this->_code."_email_template SET `name` = '".$this->db->escape($data['name'])."', status = '".(int)$data['status']."', date_modified = NOW() WHERE template_id = '".(int)$template_id."'");
    
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_email_template_description WHERE template_id = '".(int)$template_id."'");
    
    foreach ($data['template_description'] as $language_id => $value) {
      $this->db->query("INSERT INTO ".DB_PREFIX.$this->_code."_email_template_description SET template_id = '".(int)$template_id."', language_id = '".(int)$language_id."', subject = '".$this->db->escape($value['subject'])."', template = '".$this->db->escape($value['template'])."'");
    }
  }
  
  public function copyEmailTemplate($template_id) {
    $query = $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_email_template et LEFT JOIN ".DB_PREFIX.$this->_code."_email_template_description etd ON (et.template_id = etd.template_id) WHERE et.template_id = '".(int)$template_id."' AND etd.language_id = '".(int)$this->config->get('config_language_id')."'");
    
    if ($query->num_rows) {
      $data = $query->row;
      
      $data['status'] = '0';
      
      $data['template_description'] = $this->getEmailTemplateDescription($template_id);
      
      $this->addEmailTemplate($data);
      
      return true;
    } else {
      return false;
    }
  }
  
  public function deleteEmailTemplate($template_id) {
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_email_template WHERE template_id = '".(int)$template_id."'");
    $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_email_template_description WHERE template_id = '".(int)$template_id."'");
    
    return true;
  }
  
  public function deleteEmailTemplates() {
    $query = $this->db->query("SELECT template_id FROM ".DB_PREFIX.$this->_code."_email_template")->rows;
    
    if ($query) {
      foreach ($query as $email_template) {
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_email_template WHERE template_id = '".(int)$email_template['template_id']."'");
        $this->db->query("DELETE FROM ".DB_PREFIX.$this->_code."_email_template_description WHERE template_id = '".(int)$email_template['template_id']."'");
      }
      
      return true;
    } else {
      return false;
    }
  }
  
  public function getEmailTemplate($template_id, $language_id = 0) {
    return $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_email_template et LEFT JOIN ".DB_PREFIX.$this->_code."_email_template_description etd ON (et.template_id = etd.template_id) WHERE et.template_id = '".(int)$template_id."' AND etd.language_id = '".(($language_id) ? $language_id : $this->config->get('config_language_id'))."'")->row;
  }
  
  public function getEmailTemplates($data = array()) {
    $sql = "SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_email_template et LEFT JOIN ".DB_PREFIX.$this->_code."_email_template_description etd ON (et.template_id = etd.template_id) WHERE etd.language_id = '".(int)$this->config->get('config_language_id')."'";
    
    if (!empty($data['filter_name'])) {
      $sql .= " AND et.name LIKE '".$this->db->escape($data['filter_name'])."%'";
    }
    
    if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
      $sql .= " AND et.status = '".(int)$data['filter_status']."'";
    }
    
    if (isset($data['filter_group_email_template']) && !empty($data['filter_group_email_template'])) {
      $sql .= " GROUP BY et.name";
    }
    
    $sort_data = array(
      'et.name',
      'et.status'
    );
    
    if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
      $sql .= " ORDER BY ".$data['sort'];
    } else {
      $sql .= " ORDER BY etd.subject";
    }
    
    if (isset($data['order']) && ($data['order'] == 'DESC')) {
      $sql .= " DESC";
    } else {
      $sql .= " ASC";
    }
    
    if (isset($data['start']) || isset($data['limit'])) {
      if ($data['start'] < 0) {
        $data['start'] = 0;
      }
      
      if ($data['limit'] < 1) {
        $data['limit'] = 20;
      }
      
      $sql .= " LIMIT ".(int)$data['start'].",".(int)$data['limit'];
    }
    
    return $this->db->query($sql)->rows;
  }
  
  public function getEmailTemplateDescription($template_id) {
    $template_description_data = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_email_template_description WHERE template_id = '".(int)$template_id."'")->rows;
    
    foreach ($query as $result) {
      $template_description_data[$result['language_id']] = array(
        'subject'  => $result['subject'],
        'template' => $result['template']
      );
    }
    
    return $template_description_data;
  }
  
  public function getExportEmailTemplates() {
    $query = $this->db->query("SELECT DISTINCT * FROM ".DB_PREFIX.$this->_code."_email_template")->rows;
    
    $email_template_data = array();
    
    if ($query) {
      foreach ($query as $email_template) {
        $data = array();
        
        $data = $email_template;
        
        $data = array_merge($data, array('template_description' => $this->getEmailTemplateDescription($email_template['template_id'])));
        
        $email_template_data[] = $data;
      }
    }
    
    return $email_template_data;
  }
  
  public function prepareEmailTemplateForImport() {
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_email_template");
    $this->db->query("TRUNCATE ".DB_PREFIX.$this->_code."_email_template_description");
  }
  
  public function importEmailTemplate($data) {
    $this->db->query("
      INSERT INTO ".DB_PREFIX.$this->_code."_email_template
      SET
        template_id = '".(int)$data['template_id']."',
        `name` = '".$this->db->escape($data['name'])."',
        status = '".(int)$data['status']."',
        date_added = '".$this->db->escape($data['date_added'])."',
        date_modified = '".$this->db->escape($data['date_modified'])."'
    ");
    
    $template_id = $this->db->getLastId();
    
    foreach ($data['template_description'] as $language_id => $value) {
      $this->db->query("
        INSERT INTO ".DB_PREFIX.$this->_code."_email_template_description
        SET
          template_id = '".(int)$template_id."',
          language_id = '".(int)$language_id."',
          subject = '".$this->db->escape($value['subject'])."',
          template = '".$this->db->escape($value['template'])."'
      ");
    }
  }
  
  public function getTotalEmailTemplates($data = array()) {
    $sql = "SELECT COUNT(DISTINCT et.template_id) AS total FROM ".DB_PREFIX.$this->_code."_email_template et LEFT JOIN ".DB_PREFIX.$this->_code."_email_template_description etd ON (et.template_id = etd.template_id)";
    
    $sql .= " WHERE etd.language_id = '".(int)$this->config->get('config_language_id')."'";
    
    if (!empty($data['filter_name'])) {
      $sql .= " AND et.name LIKE '".$this->db->escape($data['filter_name'])."%'";
    }
    
    if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
      $sql .= " AND et.status = '".(int)$data['filter_status']."'";
    }
    
    if (isset($data['filter_group_email_template']) && !empty($data['filter_group_email_template'])) {
      $sql .= " GROUP BY et.name";
    }
    
    return $this->db->query($sql)->row['total'];
  }
  
  public function sendAnswer($data = array()) {
    $records = array();
    
    $query = $this->db->query("SELECT * FROM ".DB_PREFIX.$this->_code."_record WHERE record_id = '".(int)$data['record_id']."'")->row;
    
    if ($query) {
      $records[] = $query;
    }
    
    if ($records) {
      foreach ($records as $record) {
        $form_data = $this->getForm($record['form_id']);
        
        if ($form_data && $form_data['allow_email_template']) {
          // custom html template
          if ($form_data['allow_email_template'] == 1) {
            if (isset($form_data['email_template_by_default']) && $form_data['email_template_by_default']) {
              $tag_codes = array(
                '{email}',
                '{store_name}',
                '{store_address}',
                '{store_email}',
                '{store_telephone}',
                '{store_fax}',
                '{message}'
              );
              
              $tag_codes_replace = array(
                $data['email'],
                $record['store_name'],
                $this->config->get('config_address'),
                $this->config->get('config_email'),
                $this->config->get('config_telephone'),
                ($this->config->get('config_fax') != '') ? $this->config->get('config_fax') : '',
                $data['message']
              );
              
              $html_data = array();
              $html_data = array_merge($html_data, $this->language->load('extension/ocdevwizard/'.$this->_name));
              
              $template_description = $this->getEmailTemplateDescription($form_data['email_template_by_default']);
              
              if ($template_description) {
                $html_data['html_template'] = html_entity_decode(str_replace($tag_codes, $tag_codes_replace, $template_description[$record['user_language_id']]['template']), ENT_QUOTES, 'UTF-8');
                $subject                    = html_entity_decode(str_replace($tag_codes, $tag_codes_replace, $template_description[$record['user_language_id']]['subject']), ENT_QUOTES, 'UTF-8');
                
                $html_data['title'] = $subject;
                
                if (version_compare(VERSION, '3.0.0.0', '>=')) {
                  $html = $this->load->view('extension/ocdevwizard/'.$this->_name.'/mail_custom', $html_data);
                } else {
                  $html = $this->load->view('extension/ocdevwizard/'.$this->_name.'/mail_custom.tpl', $html_data);
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
                
                $mail->setTo($data['email']);
                $mail->setFrom($this->config->get('config_email'));
                $mail->setSender($record['store_name']);
                $mail->setSubject($subject);
                $mail->setHtml($html);
                $mail->send();
              }
            }
          }
          
          // default html template
          if ($form_data['allow_email_template'] == 2) {
            $subject = sprintf($this->language->get('text_email_subject'), $record['store_name']);
            
            $html_data = array(
              'title'           => $subject,
              'logo'            => $record['store_url'].'image/'.$this->config->get('config_logo'),
              'store_name'      => $record['store_name'],
              'store_url'       => $record['store_url'],
              'store_address'   => (string)$this->config->get('config_address'),
              'store_email'     => (string)$this->config->get('config_email'),
              'store_telephone' => (string)$this->config->get('config_telephone'),
              'store_fax'       => (string)$this->config->get('config_fax') != '' ? $this->config->get('config_fax') : '',
              'message'         => html_entity_decode($data['message'], ENT_QUOTES, 'UTF-8')
            );
            
            $html_data = array_merge($html_data, $this->language->load('ocdevwizard/'.$this->_name));
            
            if (version_compare(VERSION, '3.0.0.0', '>=')) {
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
            
            $mail->setTo($data['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($record['store_name']);
            $mail->setSubject($subject);
            $mail->setHtml($html);
            $mail->send();
          }
        }
      }
      return true;
    } else {
      return false;
    }
  }
}