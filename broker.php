<?php
use phpCtrl\C_DataGrid;

$_GET['currentPage'] = 'broker';

require_once("phpGrid/conf.php");  
include_once('inc/head.php');    
include_once('inc/menu.php');

$filter = $_GET['listing_type_id'] ?? 1;
?>

<div class="btn-tabs">
	<a class="btn <?= $filter == 1 ? 'btn-primary' : '' ?>" href="?listing_type_id=1">For Sale</a> 
	<a class="btn <?= $filter == 2 ? 'btn-primary' : '' ?>" href="?listing_type_id=2">For Rent</a>
</div>

<?php
$dg = new C_DataGrid("SELECT concat(street1, ' ', street2, ', ', city, ', ', state, ' ', zip) as `address`, `main_photo_id`, 
	`id`, `agent_id`, `listing_status_id`, `date`, `listing_type_id`, `street1`, `street2`, `city`, `state`, `zip`, `country`, `latitude`, `longitude`, `asking_price`, `bedrooms`, `bath`, `area`, `lot`, `year`, `description`, `published`
	 FROM listing", "id", "listing");

$dg->set_query_filter(" listing_type_id = '". $filter ."'");

$dg->enable_autowidth(true); 

$dg->set_col_width('bedrooms', '50px');
$dg->set_col_width('bath', '50px');
$dg->set_col_width('area', '50px');
$dg->set_col_width('lot', '50px');
$dg->set_col_width('year', '50px');


$dg->set_col_hidden('id, latitude, longitude, street1, street2, city, state, zip, country, published');

$dg->set_col_readonly('address');

$dg->set_col_title('main_photo_id', 'Main Photo');
$dg->set_col_title('agent_id', 'Agent');
$dg->set_col_title('listing_type_id', 'Property Type');

$dg->set_col_property('main_photo_id', array('formatter'=>'###mainPhotoFormatter###'));
$dg->set_col_property('agent_id', array('formatter'=>'###agentLinkFormatter###')); // must have ###

$dg->set_col_currency('asking_price');

$dg->set_col_edittype('listing_type_id', 'select', 'select id, type from listing_type');
$dg->set_col_edittype('listing_status_id', 'select', 'select id, status from listing_status');
$dg->set_col_edittype('agent_id', 'select', "select id, concat(last_name, ', ', first_name) as name from account");
$dg->set_col_edittype('main_photo_id', 'select', "select id, url from image");

$dg->set_group_properties('listing_status_id');
$dg->set_group_summary('listing_status_id','sum');

$dg->enable_search(true);

$dg->enable_edit('FORM');

$dg -> display();
?>

<script type="text/javascript">
$(function() {
    var grid = jQuery("#listing");
    grid[0].toggleToolbar();
});
</script>

<?php
include_once('inc/footer.php');
?>