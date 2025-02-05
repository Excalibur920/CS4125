<?php

//action.php

session_start();

if(isset($_POST["action"]))
{
	if($_POST["action"] == "add")
	{
		if(isset($_SESSION["shopping_cart"]))
		{
			$is_available = 0;
			foreach($_SESSION["shopping_cart"] as $keys => $values)
			{
				if($_SESSION["shopping_cart"][$keys]['line_id'] == $_POST["line_id"])
				{
					$is_available++;
					$_SESSION["shopping_cart"][$keys]['quantity'] = $_SESSION["shopping_cart"][$keys]['quantity'] + $_POST["quantity"];
				}
			}
			if($is_available == 0)
			{
				$item_array = array(
					'line_id'          =>     $_POST["line_id"],  
					'foodName'         =>     $_POST["foodName"],  
					'price'            =>     $_POST["price"],  
					'quantity'         =>     $_POST["quantity"]
				);
				$_SESSION["shopping_cart"][] = $item_array;
			}
		}
		else
		{
			$item_array = array(
				'line_id'            =>     $_POST["line_id"],  
				'foodName'           =>     $_POST["foodName"],  
				'price'              =>     $_POST["price"],  
				'quantity'           =>     $_POST["quantity"]
			);
			$_SESSION["shopping_cart"][] = $item_array;
		}
	}

	if($_POST["action"] == 'remove')
	{
		foreach($_SESSION["shopping_cart"] as $keys => $values)
		{
			if($values["line_id"] == $_POST["line_id"])
			{
				unset($_SESSION["shopping_cart"][$keys]);
			}
		}
	}
	if($_POST["action"] == 'empty')
	{
		unset($_SESSION["shopping_cart"]);
	}
}

?>