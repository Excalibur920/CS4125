<?php

class Restaurant extends database{

	function displayRestaurants(){
      $db = new database();
	    $db->select("restaurants","restaurants.RName, restaurants.ID, restaurants.img_path","restaurants.city = '" . $_SESSION['user_city'] . "'");                            
	    $result = $db->sql;

	    while($row = mysqli_fetch_assoc($result)) {
	        echo '<a class="rest-cell" href="restaurantMenu.php?ID=' . $row['ID'] . '" style="background-image: url(\'./' . $row['img_path'] . '\')" name="rest' . $row['ID'] . '">' . $row['RName'] . "</a>";	            	            	    	            			            
	    }

	}

	function displayNavbarMsg() {
		$db = new database();
		$db->select("customers","customers.FName, customers.LName","customers.ID = '" . $_SESSION['user_id'] . "'");
            $result = $db->sql;
            $row = mysqli_fetch_assoc($result);
            echo '<strong>Hungry, ' . $row['FName'] . ' ' . $row['LName'] . '?</strong>';
	}
}
?>
