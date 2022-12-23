<?php

$extension_name = "Import / Export XLS Products Tool ";

// Heading
$_['heading_title']    = $extension_name.' (V.5.6.3.0) [<a href="http://feofan.net" target="_blank">feofan.net</a>]';

// Text
$_['text_buttom']      = 'Import / Export XLS Tool';
$_['text_success']      = 'The import was successful!';
$_['error_permission']      = 'Not permission to import.';
$_['error_file_not_found']  = 'Not upload XLS file.';

//ERRORS
	$_['error_column_name'] 			= '<b>Error columns:</b> incorrect column name "%s". Check tab rules.';
	$_['error_data_empty_name']			= '<b>Error data:</b> empty name in row %s.';	
	$_['error_data_empty_model']		= '<b>Error data:</b> empty model in row %s.';	
	$_['error_data_repeat_category']	= '<b>Error data:</b> category "<b>%s</b>" repeated in row %s.';
	$_['error_data_empty_option']		= '<b>Error data:</b> option empty in row %s.';
	$_['error_data_empty_option_value']	= '<b>Error data:</b> option value empty in row %s.';
	$_['error_data_empty_option_type']	= '<b>Error data:</b> option type empty in row %s.';	
	$_['error_data_wrong_options_type']		= '<b>Error data:</b> option type incorrect in row %s.';
	$_['error_data_wrong_options_prefix']		= '<b>Error data:</b> option prefix incorrect in row %s.';
	$_['error_data_model_repeat'] = '<b>Error data:</b> model repeat in row %s.';
	$_['error_repeat_category']	= '<b>Error:</b> found %s categories "<b>%s</b>" repeated in row %s.';

	$_['error_column_name_required']	= '<b>Error:</b> not found column required "*Name"';	
	$_['error_column_model_required']	= '<b>Error:</b> not found column required "*Model"';

	$_['error_inno_db']	= 'Error while formatting to InnoDB motor';
	$_['success_inno_db']	= 'Success, your columns have now InnoDB motor!';

	$_['error_upload_file']	= '<b>Error:</b> Please upload a xls file.';

	$_['error_downloading_image_main'] = 'The import was aborted, some errors downloading images:';
	$_['error_downloading_image'] = 'Can\'t get image from url <b>%s</b> for product with model <b>%s</b>.';

//IMPORTING
	$_['import_success']	= 'The import was successful!';

	$_['image_upload_description']      = 'Upload images<br><span class="help">Can be a ZIP file.</span>';


//EXTENSION
	//TAB IMPORT
		$_['tab_import'] = 'Import';
		$_['step_recommended'] = '<b>Recommended </b> change your tables to InnoDB motor if hasn\'t.';
		$_['step_recommended_explain'] = 'If your database tables haven\'t InnoDB motor if while importing appear some unexpected error the previous datas that was inserted won\'t be deleted, however if you convert your tables to InnoDB motor the Rollback query will be compatible and if appear some unexpected error your datas inserted while import process will be deleted.<br><br><b>
 His shop won\'t be affected by this change motor</b>';
 		$_['convert_to_innodb'] = 'Convert to InnoDB';
		
		$_['step_0'] = '<b>1.-</b> Configure import.';
		$_['categories_last_tree'] = 'Last category assign';
		$_['categories_last_tree_help'] = 'If market the product only will be asigned to last child in categories tree.';
		$_['save_configuration'] = 'Save configuration';
		$_['save_configuration_success'] = 'Configuration saved successfully!';

		$_['step_1'] = '<b>2.-</b> Download empty XLS file and fill it.';
		$_['step_1_button_download'] = 'Download xls file';

		$_['step_2'] = '<b>3.-</b> Modify your XLS file. (Optional)';
		$_['step_2_explain'] = 'You can delete unnecessary columns or change his order. <b>Never change column name or create new column</b> the system will detect this and give you error.<br>Visit <a href="javascript:{}" onclick="$(\'a.tab_rules\').trigger(\'click\');">Rules tab</a> to know default values to deleted or empty columns.';
		
		$_['step_3'] = '<b>4.-</b> Upload your filled XLS file.';
		$_['upload_file'] = 'Upload xls file';
		$_['upload_file_help'] = 'Remember visit Rules tab.';
		

		$_['step_4'] = '<b>5.-</b> Upload your images. (Optional)';
		$_['upload_images'] = 'Upload images';
		$_['upload_images_help'] = 'You can be upload all files once in <b>.zip</b> file.';

		$_['step_5'] = '<b>6.-</b> All ready? <b>Go to import!</b>';
		$_['import'] = 'Press button to start to import';
		$_['import_start'] = '<b>START IMPORT</b>';		
		$_['import_help'] = '<b>IMPORTANT</b>: For your safety, make a backup before import.';

		$_['images_not_found']      = 'Images not found: <span style="color:#ff0000;">%s</span> of <b>%s</b>';
		$_['thead_number'] = 'Number';
		$_['thead_id'] = 'Id';
		$_['thead_model'] = 'Model';
		$_['thead_name'] = 'Name';
		$_['thead_image'] = 'Image';
	//END TAB IMPORT

	//TAB EXPORT
		$_['tab_export'] = 'Export';
		$_['export_legend'] = '<b>Export your shop!</b> Use this excel to modify your products in new import or to Opencart migration';
		$_['export_range_to_help'] = 'Export products by ranges, you can put from <b>1</b> to <b>%s</b>.';
		$_['export_range_from_help'] = 'Export products by ranges, you can put from <b>1</b> to <b>%s</b>.';
		$_['export_range_from'] = 'Range from';
		$_['export_range_to'] = 'Range to';
		$_['export_price_between_from'] = 'Price between >';
		$_['export_price_between_from_help'] = 'Put the lowest price.';
		$_['export_price_between_to'] = 'Price between <';
		$_['export_price_between_to_help'] = 'Price the highest price.';
		$_['export_categories'] = 'Categories';
		$_['export_manufacturers'] = 'Manufacturers';
		$_['export_button'] = 'Export xls file';
		$_['export_range_error_number'] = 'Ranges have to be numbers';
		$_['export_range_error_more'] = '"From" is more than "To"';
		$_['export_models'] = 'Models';
		$_['export_models_help'] = 'Write model split by \'|\' example: 123|244|464';
	//END TAB EXPORT

	//TAB RULES
		$_['tab_rules'] = 'Import rules';

		$_['default_values_legend'] = 'Importing new products - Default values (if column is deleted or cell is empty)';
		$_['default_values_see_hide'] = 'Show/hide default values';

			$_['thead_dv_number'] = '*';
			$_['thead_dv_name'] = 'Name';
			$_['thead_dv_default_value'] = 'Default value';
			$_['thead_dv_explain'] = 'Explain';
			$_['dv_required'] = '<b>Required</b>';
			$_['dv_autogenerate'] = '<b>Auto generated</b>';
			$_['dv_autocalculated'] = '<b>Auto calculated</b>';		
			$_['dv_empty'] = 'Empty';
			$_['dv_will_default_store'] = 'Your default store';
			$_['dv_yes'] = 'Yes';
			$_['dv_will_be_yes'] = '%s will be "Yes"';
			$_['dv_enabled'] = 'Enabled';
			$_['dv_will_be_enabled'] = '%s will be "Enabled"';
			$_['dv_will_be_autogenerate_image'] = '%s will be auto generated basing in product model. Example: MOD1234.jpg';
			$_['dv_will_be_autocalculate_option_prefix'] = '%s will be auto calculated basing in product first product data with same name.';
			$_['dv_wont_have'] = 'The product won\'t have %s.';
			$_['dv_will_be_empty'] = '%s will be empty.';
			$_['dv_will_be'] = '%s will be %s.';
			$_['dv_is_required'] = '%s is required.';
			$_['dv_will_be_autogenerate'] = '%s will be auto generated basing in product name.';
			$_['dv_will_be_autogenerate_available'] = '%s will be auto generated with current date.';
			$_['dv_will_be_autogenerate_meta_title'] = '%s will be auto generated with product name.';			
		
		$_['updating_products_legend'] = 'Updating existing products';
		$_['updating_products_see_hide'] = 'Show/hide updating existing products';

			$_['up_rule_1'] = 'Remember that columns "<b>Model</b>" and "<b>Name</b>" are required, you can\'t remove this columns and leave in blank.';
			$_['up_rule_2'] = 'If import system detects a product in your shop with <b>same model</b> this will be edited.';
			$_['up_rule_3'] = 'The export system exports all datas of your products. If you want change only price you have to modify only column price, leaving another columns intact.';
			$_['up_rule_4'] = 'Remember that if you delete columns or leave in blank in a existing product this attributes delete, for example, if you have in your shop one product with 5 categories and you deleted or leave in blank categories columns in import file this categories will be unlink for this product.';

		$_['creating_options_legend'] = 'Product with options';
		$_['creating_options_see_hide'] = 'Show/hide Product with options';
			$_['creating_options_explain'] = '
				In this example will import a product called "<b>Pro</b>".<br><br>
				<b>The first row find contain the main product datas</b> then:<br>
				<ul>
					<li>Product price will be 12.</li>
					<li>Reward points will be 10.</li>
					<li>Weight will be 0.9.</li>
					<li>Quantity will be the sum all options: 55</li>
				</ul>
				The product will have 4 options:
				<ul>
					<li><b>1º option</b>; Quantity: 5 || Price: +0 || Points: +0 || Weight: +0</li>
					<li><b>2º option</b>; Quantity: 10 || Price: +0.5 || Points: +1 || Weight: +0.1</li>
					<li><b>3º option</b>; Quantity: 25 || Price: +1 || Points: +2 || Weight: +0.3</li>
					<li><b>4º option</b>; Quantity: 15 || Price: +1.5 || Points: +3 || Weight: +0.4</li>
				</ul>
			';

		$_['possible_values_legend'] = 'Possible values (based in your store)';
		$_['possible_values_see_hide'] = 'Show/hide possible values';
			$_['possible_values_out_stock'] = 'Out stock status';
			$_['possible_values_option_types'] = 'Option type';
			$_['possible_values_option_prefixes'] = 'Option price prefix<br>Option points prefix<br>Option weight prefix';
			$_['possible_values_tax_class'] = 'Tax Class';
			$_['possible_values_store'] = 'Store';
			$_['possible_values_class_weight'] = 'Class weight';
			$_['possible_values_class_length'] = 'Class length';
			$_['possible_values_layouts'] = 'Layout';
			$_['possible_values_customer_groups'] = 'Customer groups';

		$_['general_rules_legend'] = '<b>GENERAL RULES - IMPORTANT</b>';
		$_['general_rules_see_hide'] = 'Show/hide general rules';
			$_['general_rules_model_name'] = 'Model and name are required, you can\'t remove this columns and leave in blank.';
			$_['general_rules_product_edit'] = 'If import system detects a product in your shop with <b>same model</b> this will be edited.';
			$_['general_rules_categories'] = '<b>Categories:</b> If a category doesn\'t exist the system will create it in appropriate level. <b>Case sensitive</b>.';
			$_['general_rules_date'] = '<b>Dates:</b> If you put a date (for example to special date start) is possible that excel auto put date format in this cell, change date format to text format before import.';
			$_['general_rules_manufactures'] = '<b>Manufacturer:</b> To related a product with a manufacturer the manufacturer name in xls file has to have the exactly same name that in your shop.';
			$_['general_rules_options'] = '<b>Option:</b> If import system detects exactly same name in some cell "*Name" will be considered by option of this product.';
			$_['general_rules_options_stock'] = '<b>Option and stock:</b> If a product has options his stock will the sum of "Quantity" cell to all his options values.';
			$_['general_rules_images'] = '<b>Auto assign image:</b> If you didn\'t or deleted column "Main image" the system auto assign a image called "model_product.jpg" example MOD1234.jpg .';
			$_['general_rules_stores'] = '<b>Stores:</b> If a product has more than 1 store assigns you can slipt by symbol "|", for example: "0|1|2"';

		$_['downlod_demo_pack'] = 'Download demo pack';
			$_['downlod_demo_pack_text'] = '<a href="view/template/tool/import_xls_files/%s.zip">Download demo pack</a>, in this pack you can find an example filled xls file with options, categories, filter etc. Also images pack.<br><br>You can get the import result in this <a target="_new" href="http://opencartqualityextensions.com/opencart_demos/opencart_import_tool/">online demo shop</a>.';
	//END TAB RULES

//END EXTENSION

//Tab information
	$_['tab_help']		= 'Help';
	$_['tab_changelog']     = 'Changelog';
?>