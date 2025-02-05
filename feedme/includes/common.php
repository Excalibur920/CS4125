<?php
session_start();	

$conn_host		= '#########';
$conn_user		= 'cs4125usr';
$conn_pass		= '#########';
$conn_database	= 'cs4125db';  

//$conn_host		= '##########';
//$conn_user		= 'ethan';
//$conn_pass		= '########';
//$conn_database	= 'cs4125db'; 


$link_db = mysqli_connect($conn_host,$conn_user,$conn_pass,$conn_database) or die('Unable to establish a DB connection');

?>