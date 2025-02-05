<!DOCTYPE html>

<html>
    <head>
    <link rel="stylesheet" type"text/css" href="css/style.css">
    </head>
<?php
include "./includes/AllClasses.inc.php";

include "./controllers/cust_dashboard.contr.php";
$db = new database();
$rest_obj = new Restaurant();

$_SESSION['user_id'] = 1;
$_SESSION['user_city'] = 'Limerick';
?>
 <body style="background-color: whitesmoke">
    <div class="header">
      <div class="navBar">
        <div class="logo">
          <li><a href="placeholder">DeliverEats</a></li>
        </div>
        <ul id="ul_navBar">
            <?php
            $rest_obj->displayNavbarMsg();
            ?>
            <li><a href="placeholder">Edit Profile</a></li>
          <li><a href="placeholder">Cart</a></li>
          <li><a href="placeholder">Login/Signup</a></li>
        </ul>
      </div>
    </div>
    <div class="menuBar">
          <ul id="ul_menuBar">
            <li><a href="placeholder">Burger</a></li>
            <li><a href="placeholder">Chinese</a></li>
            <li><a href="placeholder">Pizza</a></li>
            <li><a href="placeholder">Indian</a></li>
          </ul>
        </div>
<body style="background-color: whitesmoke">
    <div class="contentSection">
        <div class="grid-div">
            <?php	   
              $rest_obj->displayRestaurants();
            ?>
        </div>
    </div>
</body>

</html>