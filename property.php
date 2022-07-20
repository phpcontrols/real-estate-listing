<?php
use phpCtrl\C_DataBase;

$prop_id = $_GET['id'] ?? 0;

$_GET['currentPage'] = 'home';

require_once("phpGrid/conf.php");  
include_once('inc/head.php');
include_once('inc/menu.php');


$db = new C_DataBase(PHPGRID_DB_HOSTNAME, PHPGRID_DB_USERNAME, PHPGRID_DB_PASSWORD, PHPGRID_DB_NAME);
$result = $db->db_query("select l.*, l.description as listing_description, 
                            img.*, 
                            lt.type as list_type, 
                            pt.type as prop_type, 
                            a.*, a.first_name as agent_fn, a.last_name as agent_ln, a.email as agent_email, a.phone as agent_phone 
                            from listing l 
                            inner join image img ON img.id = l.main_photo_id
                            inner join listing_type lt ON lt.id = l.listing_type_id 
                            inner join property_type pt ON pt.id = property_type_id 
                            inner join account a ON a.id = l.agent_id
                            WHERE l.id = ? ", [$prop_id]);

$row = $db->fetch_array_assoc($result);
?>

<div class="row">
    <div class="column half">
        <div class="card">
            <img src="<?= $row['url'] ?>" width="70%" />
            <div>
                <p>Additional photos</p>
                <?php
                $result = $db->db_query('select * from listing l inner join image img ON img.listing_id = l.id WHERE l.id = ?', [$prop_id]);

                while($imgs = $db->fetch_array_assoc($result)) {
                    echo " <img src='". $imgs['url'] ."' width='100' height='75'> ";
                }
                ?>

            </div>
        </div>
    </div>

    <div class="column half">
        <div class="card left">
            <h1> <?= $row['list_type'] ?> $<?= $row['asking_price'] ?></h1>
            <br />
            <p><h3>Property Type</h3><?= $row['prop_type'] ?></p>
            <p><?= $row['bedrooms'] ?> bd / <?= $row['bath'] ?> ba / <?= $row['area'] ?> sqt / <?= $row['lot'] ?> lot</p>
            <p><h3>Year built:</h3> <?= $row['year'] ?></p>
            <p><h3>Address:</h3> <?= $row['street1'] ?>, <?= $row['city'] ?>, <?= $row['state'] ?> <?= $row['zip'] ?></p>
            <p><h3>Description:</h3><?= $row['listing_description']; ?></p>
        </div>
    </div>

    <div class="column half">
        <div class="card">
            <h2>Listing Agent</h2>
            <img src="assets/agent_photos/<?= $row['photo'] ?>" width="100" />
            <p><?= $row['agent_fn'] ?> <?= $row['agent_ln'] ?></p>
            <p><a href="mailto:<?= $row['agent_email'] ?>"><?= $row['agent_email'] ?></a></p>
            <p><?= $row['agent_phone'] ?></p>
        </div>
    </div>

    <div class="column half">
        <div class="card left">
        <iframe width="600" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=<?= urlencode($row['street1'] ." ". $row['city'] ." ". $row['state'] ." ". $row['zip']) ?>&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
        </div>
    </div>
</div>


<?php
include_once('inc/footer.php');
?>