<?php
  include "./includes/AllClasses.inc.php";
  include "./controllers/cust_dashboard.contr.php";
  include "./controllers/restaurantMenu.contr.php";

  $menu = new Menu();
  $db = new database();
  
  $_SESSION['user_id'] = 1;
  $_SESSION['user_city'] = 'Limerick';
  $_SESSION['rest_id'] = $_GET['ID'];
  //echo "Debug " .print_r( $_GET, true);
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
        <?php
        $msg = new Restaurant();
            $msg->displayNavbarMsg();
            ?>
            <li><a href="placeholder">Edit Profile</a></li>
          <li><a href="cart.php">Cart</a></li>
          <li><a href="placeholder">Login/Signup</a></li>
        </ul>
      </div>
    </div>
    <div class="contentSection">
      <div class="restaurantBackground" style='background-image: url("<?php $menu->getRestaurantPic() ?>")'>
        <div class="restaurantName">
          <h2>
            <?php
              $menu->displayRestaurantName($_GET['ID']);
            ?>
          </h2>
          
          
        </div>
        <div class="restuarantAddress">
          <p>
          <?php
              $menu->displayRestaurantAddress($_GET['ID']);
            ?>
          </p>
        </div>
      </div>
	  <style>
		.popover
		{
		    width: 100%;
		    max-width: 800px;
		}
		</style>
      <div class="restaurantDetails">
        <div class="menuBar">
          <ul id="ul_menuBar">
          <li>
								<a id="cart-popover" class="btn" data-placement="bottom" title="Shopping Cart">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									<span class="badge"></span>
									<span class="total_price">$ 0.00</span>
								</a>
							</li>
            <!---<li><a href="placeholder">Starters</a></li>--->
            <?php
              //$db->select("menu_category", "menu_category.name", "menu_category.menu_id = " . $rest_row['menu_id'] );
              //$result = $db->sql;
              //while($row = mysqli_fetch_assoc($result)) {
              //  echo '<li><a href="placeholder">' . $row['name'] . '</a></li>';
              //}
            ?>
          </ul>
        </div>
          <?php
            $menu->displayMenu($menu->getMenuID());
          ?> 
          <div id="popover_content_wrapper" style="display: none">
				<span id="cart_details"></span>
				<div align="right">
					<a href="cart.php" class="btn btn-primary" id="check_out_cart">
					<span class="glyphicon glyphicon-shopping-cart"></span> Check out
					</a>
					<a href="#" class="btn btn-default" id="clear_cart">
					<span class="glyphicon glyphicon-trash"></span> Clear
					</a>
				</div>
			</div>
</html>

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
				$('.total_price').text(data.total_price);
				$('.badge').text(data.total_item);
			}
		});
	}

	$('#cart-popover').popover({
		html : true,
        container: 'body',
        content:function(){
        	return $('#popover_content_wrapper').html();
        }
	});

	$(document).on('click', '.add_to_cart', function(){
		var line_id = $(this).attr("id");  // set in fetch_item.php output
		var foodName = $('#name'+line_id).val();
		var price = $('#price'+line_id).val();
		var quantity = $('#quantity'+line_id).val();
		var action = "add";
		if(quantity > 0)
		{
			$.ajax({
				url:"action.php",
				method:"POST",
				data:{line_id:line_id, foodName:foodName, price:price, quantity:quantity, action:action},
				success:function(data)
				{
					load_cart_data();
					alert("Item has been Added into Cart");
				}
			});
		}
		else
		{
			alert("lease Enter Number of Quantity");
		}
	});

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

	$(document).on('click', '#clear_cart', function(){
		var action = 'empty';
		$.ajax({
			url:"action.php",
			method:"POST",
			data:{action:action},
			success:function()
			{
				load_cart_data();
				$('#cart-popover').popover('hide');
				alert("Your Cart has been clear");
			}
		});
	});
    
});

</script>