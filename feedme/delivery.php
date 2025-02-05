<?php
include "./includes/AllClasses.inc.php";
$total = 0.00;
for ($j = 0; $j < sizeof($_SESSION["shopping_cart"]); $j++) {
    $total = $total + (number_format($_SESSION["shopping_cart"][$j]["price"],2) * number_format($_SESSION["shopping_cart"][$j]["quantity"],2));

}

$order = array("r_id"=>$_SESSION["rest_id"],"c_id"=>$_SESSION["user_id"],"ord_stat"=>"Pending","total"=>$total);
$db = new database();

$db->insert("ordert",$order);
$db->select("ordert","ordert.ID", "ordert.r_id=" . $_SESSION["rest_id"] . " AND ordert.c_id= " . $_SESSION["user_id"] . " ORDER BY ordert.ID DESC LIMIT 1");
$result = $db->sql;

$row = mysqli_fetch_assoc($result);
          	    	            			            


for ($i = 0; $i < sizeof($_SESSION["shopping_cart"]); $i++) {
    $line = array("order_id"=>$row['ID'],"line_no"=>$i+1,"line_id"=>$_SESSION["shopping_cart"][$i]["line_id"] ,"price"=>$_SESSION["shopping_cart"][$i]["price"],"quantity"=>$_SESSION["shopping_cart"][$i]["quantity"]);
    // $db = new database();
    $db->insert("order_line", $line);
}

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>DeliverEats | Food Delivery Service</title>
    <link rel="stylesheet" href="style.css" />
    <script src="js/jquery.min.js"></script>
		<link rel="stylesheet" href="bootstrap.min.css" />
		<script src="js/bootstrap.min.js"></script>
  </head>
  <body style="background-color: whitesmoke">
    <div class="header">
      <div class="navBar">
        <div class="logo">
          <li><a href="placeholder">DeliverEats</a></li>
        </div>
        <ul id="ul_navBar">
            <li><a href="placeholder">Edit Profile</a></li>
          <li><a href="cart.php">Cart</a></li>
          <li><a href="placeholder">Login/Signup</a></li>
        </ul>
      </div>
    </div>
    <div class="contentSection">
        <h2>
    <?php echo "Your Order's Payment Method: " . $_POST['paymentoption']; ?>
</h2>
</div>
</body>