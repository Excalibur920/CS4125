<?php
class Restaurant extends database {

  // $db = new database();
	function displayRestaurants() {
	    $db->select("restaurants","restaurants.RName, restaurants.ID, restaurants.img_path","restaurants.city = '" . $_SESSION['user_city'] . "'");                            
	    $result = $db->sql;
	    while($row = mysqli_fetch_assoc($result)) {
	        echo '<a class="rest-cell" href="restaurantMenu.php?ID=' . $row['ID'] . '" style="background-image: url(\'./' . $row['img_path'] . '\')" name="rest' . $row['ID'] . '">' . $row['RName'] . "</a>";	            	            	    	            			            
	    }
	}
}
?>
