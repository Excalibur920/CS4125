<?php

/* LOCAL Connect */
/*
$conn_host		= '#########';
$conn_user		= 'ethan';
$conn_pass		= '#######';
$conn_database	= '#########'; 
*/

/* Remote Connect */
$conn_host		= '#########';
$conn_user		= 'cs4125usr';
$conn_pass		= '########';
$conn_database	= 'cs4125db'; 


$link_db = mysqli_connect($conn_host,$conn_user,$conn_pass,$conn_database) or die('Unable to establish a DB connection');

/* PDO Connection Details */
$dsn = "mysql:host=$conn_host;dbname=$conn_database;charset=utf8mb4";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];	


?>
