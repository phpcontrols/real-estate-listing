<?php
use phpCtrl\C_DataGrid;

$_GET['currentPage'] = 'agents';

require_once("phpGrid/conf.php");  
include_once('inc/head.php');    
include_once('inc/menu.php');


$dg = new C_DataGrid("SELECT first_name, last_name, id, active, email, phone, role_id, photo FROM account", "id", "account");

$dg->set_col_title('active', 'Status');

$dg->set_caption('Agents');

$dg->set_col_width('active', '50px');

$dg->enable_autowidth(true);

$dg->set_col_hidden('id, role_id');

$dg->set_col_edittype('active', 'select', '1:Active;0:Inactive');

$dg->set_col_format('email', 'email');

$dg->set_col_img('photo', 'assets/agent_photos/');

// form hyperlink from another cell
$dg->set_col_format("last_name", "showlink", array("baseLinkUrl"=>"javascript:", 
                                                    "target"=>"_self",
                                                    "showAction"=>"gotoUrl(jQuery('#account'),'",
                                                    "addParam"=>"');"));

$dg->enable_edit('FORM');
$dg->set_col_fileupload('photo');

$dg -> display();
?>

<style>
#account td img {
    width: 80px;
}
</style>

<script>
function gotoUrl(grid, param) {
    var ar = param.split('=');
    if (grid.length > 0 && ar.length === 2 && ar[0] === '?id') {
        var rowid = ar[1];
        var url = grid.getCell(rowid, 'id');
        window.location.href = 'agent_details.php?id=' + url;
    }
};
</script>

<?php
include_once('inc/footer.php');
?>