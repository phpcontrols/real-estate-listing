<?php
use phpCtrl\C_DataGrid;

$filter = $_GET['inquiry_status_id'] ?? 1;

$_GET['currentPage'] = 'inquiries';

require_once("phpGrid/conf.php");  
include_once('inc/head.php');    
include_once('inc/menu.php');
?>

<div class="btn-tabs">
	<a class="btn <?= $filter == 1 ? 'btn-primary' : '' ?>" href="?inquiry_status_id=1">Processed</a> 
	<a class="btn <?= $filter == 2 ? 'btn-primary' : '' ?>" href="?inquiry_status_id=2">New</a>
	<a class="btn <?= $filter == 3 ? 'btn-primary' : '' ?>" href="?inquiry_status_id=3">Closed</a>
</div>

<?php
$dg = new C_DataGrid("SELECT * FROM inquiry", "id", "inquiry");

$dg->set_query_filter(" inquiry_status_id = '". $filter ."'");

$dg->set_col_hidden('id');

$dg->enable_autowidth(true);

$dg->set_col_width('listing_id', '300px');
$dg->set_col_width('inquiry_status_id', '100px');

$dg->set_col_title('listing_id', 'Listing');
$dg->set_col_title('inquiry_status_id', 'Status');
$dg->set_col_title('agent_id', 'Agent');

$dg->set_col_edittype('listing_id', 'select', "select id, concat(street1, ', ', city, ', ', state, ' ', zip) from listing");
$dg->set_col_edittype('inquiry_status_id', 'select', "select id, status from inquiry_status");
$dg->set_col_edittype('agent_id', 'select', "select id, concat(last_name, ', ', first_name) from account");

$dg->set_col_format('email', 'email');

$dg->enable_search(true);

$dg->enable_edit('FORM');

$dg->set_col_property('listing_id', array('formatter'=>'###listingLinkFormatter###')); // must have ###
$dg->set_col_property('agent_id', array('formatter'=>'###agentLinkFormatter###')); // must have ###


$dg -> display();
?>

<script type="text/javascript">
$(function() {
    var grid = jQuery("#inquiry");
    grid[0].toggleToolbar();

    var listing = $('#inquiry').jqGrid('getCol', 'listing_id');
    //console.log(listing);
});
</script>

<?php
include_once('inc/footer.php');
?>