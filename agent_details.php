<?php
use phpCtrl\C_DataGrid;
use phpCtrl\C_DataBase;

$agent_id = $_GET['id'] ?? false;

$_GET['currentPage'] = 'agents';

require_once("phpGrid/conf.php");  
include_once('inc/head.php');
include_once('inc/menu.php');


$db = new C_DataBase(PHPGRID_DB_HOSTNAME, PHPGRID_DB_USERNAME, PHPGRID_DB_PASSWORD, PHPGRID_DB_NAME);
$result = $db->db_query("select * FROM account WHERE id = ? ", [$agent_id]);

$row = $db->fetch_array_assoc($result);
?>

<div class="container-fluid">
    <div class="row">

        <div class="col-md-2">
            <h2>Agent Details</h2>
            <img src="assets/agent_photos/<?= $row['photo'] ?>" width="150" />
            <p><?= $row['first_name'] ?> <?= $row['last_name'] ?></p>
            <p><a href="mailto:<?= $row['email'] ?>"><?= $row['email'] ?></a></p>
            <p><?= $row['phone'] ?></p>
        </div>

        <div class="col-md-10">  

            <div class="row">
                <?php
                $dg = new C_DataGrid("SELECT * FROM listing", "id", "listing");

                $dg->set_query_filter(" agent_id = '". $agent_id ."'");

                $dg->set_col_hidden('id, agent_id, latitude, longitude');

                $dg->set_col_currency('asking_price');

                $dg->enable_autowidth(true);

                $dg -> display();
                ?>
            </div>
            <div class="row">
                <?php
                $dg = new C_DataGrid("SELECT * FROM inquiry", "id", "inquiry");

                $dg->set_query_filter(" agent_id = '". $agent_id ."'");

                $dg->set_col_hidden('id, agent_id');

                $dg->set_col_format('email', 'email');

                $dg->enable_autowidth(true);

                $dg -> display();
                ?>
            </div>

        </div>

    </div>
</div>

  

<?php
include_once('inc/footer.php');
?>