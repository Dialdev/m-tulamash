<?php
if($this->registry->has('theme_options') == false) { 
 header("location: themeinstall/index.php"); 
 exit; 
}
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config');
$page_direction = $theme_options->get( 'page_direction' );
?>
<?php $class = 3; $id = rand(0, 5000)*rand(0, 5000); $all = 4; $row = 4; ?>
