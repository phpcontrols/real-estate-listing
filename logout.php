<?php
if(session_id()) session_destroy();

header("location: index.php");

die;