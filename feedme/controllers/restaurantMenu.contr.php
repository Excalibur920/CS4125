<?php

class Menu extends database {
    function displayRestaurantName($restID) {
        $db = new database();
        $db->select("restaurants","restaurants.RName","restaurants.ID = " . $restID);
        $result = $db->sql;
        $row = array();
        $row = mysqli_fetch_assoc($result);
        echo $row['RName'];
    }

    function displayRestaurantAddress($restID) {
        $db = new database();
        $db->select("restaurants","restaurants.address_line_1, restaurants.address_line_2, restaurants.address_line_3, restaurants.zipcode","restaurants.ID = " . $restID);
        $result = $db->sql;
        $row = mysqli_fetch_assoc($result);
        echo $row['address_line_1'] . ", " . $row['address_line_2'] . ", " . $row['address_line_3'] . ", " . $row['zipcode'];
    }

    function displayMenu($menuID) {
        $db = new database();
        $db->select("menu_category", "menu_category.name, menu_category.ID", "menu_category.menu_id = " . $menuID );
            $result = $db->sql;
              while($row = mysqli_fetch_assoc($result)) {
                echo '<div><h2>'. $row['name'] .'</h2></div>';
                echo '<div class="grid-div">';

                $db->select("menu_line", "menu_line.foodName, menu_line.menu_id, menu_line.line_no, menu_line.price, menu_line.line_id", "menu_line.menu_id = " . $menuID . " AND menu_line.cat_id = " . $row['ID'] );
                $result2 = $db->sql;
                while($row2 = mysqli_fetch_assoc($result2)) {
                    echo '<div class="grid-cell">';
                    //echo '<div style="border:1px solid #333; background-color:#f1f1f1; border-radius:5px; padding:16px; height:350px;" align="center">';
                       // echo '<img src="images/'.$row2["picture"].'" class="img-responsive" /><br />';
                        echo '<h4 class="text-info">'.$row2["foodName"].'</h4>';
                        echo '<h4 class="text-danger">€ '.$row2["price"] .'</h4>';
                        echo '<input type="text" name="quantity" id="quantity'.$row2["line_id"].'" class="form-control" value="1" />';
                        echo '<input type="hidden" name="hidden_name" id="name'.$row2["line_id"].'" value="'.$row2["foodName"].'" />';
                        echo '<input type="hidden" name="hidden_price" id="price'.$row2["line_id"].'" value="'.$row2["price"].'" />';
                        echo '<input type="button" name="add_to_cart" id="'.$row2["line_id"].'" style="margin-top:5px;" class="btn btn-success form-control add_to_cart" value="Add to Cart" />';
                    //echo '</div>';
                echo '</div>';
                }
                echo '</div>';
              }
    }

    function getMenuID() {
        $db = new database();
        $db->select("restaurants", "restaurants.menu_id", "restaurants.ID = " . $_GET['ID']);
        $result = $db->sql;
        $row = mysqli_fetch_assoc($result);
        return $row['menu_id'];
    }

    function getRestaurantPic() {
        $db = new database();
        $db->select("restaurants", "restaurants.img_path", "restaurants.ID = " . $_GET['ID']);
        $result = $db->sql;
        $row = mysqli_fetch_assoc($result);
        echo $row['img_path'];
    }
}

?>