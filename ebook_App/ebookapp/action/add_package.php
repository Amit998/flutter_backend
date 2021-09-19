<?php

    include '../include/connection.php';

    $name = addslashes($_POST['name']);
    $id_product = addslashes($_POST['product']);
    $status = $_POST['status'];

    if(!empty($status)){
        foreach($status as $valueStatus){
            //echo "value: " . $valueStatus;
        }
    }

    $query = "INSERT INTO tbl_package(id_product, title, status) VALUES ('$id_product', '$name', '$valueStatus')";

    if (isset($_POST['submit'])) {

         mysqli_query($conn, $query);
        ?>
            <script>
                window.location = '../package';
            </script>
        <?php     
    } else {
        ?>
            <script>
                window.location = '../package';
            </script>
        <?php 
    }
?>