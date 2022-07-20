<?php
use phpCtrl\C_DataGrid;
use phpCtrl\C_DataBase;

$_GET['currentPage'] = 'home';

require_once("phpGrid/conf.php");  
include_once('inc/head.php');    
include_once('inc/menu.php');


$db = new C_DataBase(PHPGRID_DB_HOSTNAME, PHPGRID_DB_USERNAME, PHPGRID_DB_PASSWORD, PHPGRID_DB_NAME);
$result = $db->db_query("select l.*, l.id as listing_id, l.description as listing_description, img.*, lt.type as list_type, pt.type as prop_type from listing l 
                            inner join image img ON img.id = l.main_photo_id
                            inner join listing_type lt ON lt.id = l.listing_type_id 
                            inner join property_type pt ON pt.id = l.property_type_id 
                            inner join listing_status ls ON ls.id =  l.listing_status_id
                            WHERE ls.status = 'Active' ");
?>

<div class="row">
<?php while($row = $db->fetch_array_assoc($result)): ?>

    <div class="column">
        <div class="card">
            <a href="property.php?id=<?= $row['listing_id']; ?>">
                <img src="<?= $row['url'] ?>" width="80%" class="main-photo">
            </a>
            <h2><?= $row['list_type'] ?> $<?= $row['asking_price'] ?></h2>
            <p><?= $row['prop_type'] ?></p>
            <p><?= $row['bedrooms'] ?> bd / <?= $row['bath'] ?> ba / <?= $row['area'] ?> sqt / <?= $row['lot'] ?> lot</p>
            <p>Year built: <?= $row['year'] ?></p>
            <p><?= $row['street1'] ?>, <?= $row['city'] ?>, <?= $row['state'] ?> <?= $row['zip'] ?></p>
            <p><a href="property.php?id=<?= $row['listing_id']; ?>">Details >></a></p>
        </div>
    </div>

<?php  endwhile; ?>
</div>



<?php
include_once('inc/footer.php');
?>