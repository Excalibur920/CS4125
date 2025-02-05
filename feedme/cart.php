<?php
include "./includes/AllClasses.inc.php";
include "./controllers/cart.contr.php";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>DeliverEats | Food Delivery Service</title>
    <link rel="stylesheet" href="css/style.css" />
    <script src="js/jquery.min.js"></script>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
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
        <h1>Your Order:</h1>
        <span id="cart_details"></span>
		<form method= "POST" action= "delivery.php">
		<h2>Payment Options:</h1>
		<div>
        <input type="radio" id="cardradio" name="paymentoption" value="Card">
		<label for="cardradio">Card</label>

        <input type= "radio" id="cashradio" name="paymentoption" value="Cash">
		<label for="cashradio">Cash</label>

        <input type="radio" id="otherradio" name="paymentoption" value="Other">
		<label for="otherradio">Other</label>
</div>
<div>
	<button type="submit">Proceed</button>
    <a href="restaurantMenu.php" class="btn btn-default" id="cancel">Cancel</a>
</div>
</form>
    </div>

    <script>  
$(document).ready(function(){

	load_cart_data();

	function load_cart_data()
	{
		$.ajax({
			url:"fetch_cart.php",
			method:"POST",
			dataType:"json",
			success:function(data)
			{
				$('#cart_details').html(data.cart_details);
			}
		});
	}

	$(document).on('click', '.delete', function(){
		var line_id = $(this).attr("id");
		var action = 'remove';
		if(confirm("Are you sure you want to remove this product?"))
		{
			$.ajax({
				url:"action.php",
				method:"POST",
				data:{line_id:line_id, action:action},
				success:function()
				{
					load_cart_data();
					$('#cart-popover').popover('hide');
					alert("Item has been removed from Cart");
				}
			})
		}
		else
		{
			return false;
		}
	});

});

</script>