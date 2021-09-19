<?php

    include '../include/connection.php';

    $name = addslashes($_POST['name']);
    $photo_tmp = $_FILES['photo']['tmp_name'];
    $photo = $_FILES['photo']['name'];
    $strphoto = str_replace(" ", "", $photo);
    $strphoto_temp = str_replace(" ", "", $photo_tmp);
    $status = $_POST['status'];

    $md5photo = time()."_".$strphoto;

    if(!empty($status)){
        foreach($status as $valueStatus){
            //echo "value: " . $valueStatus;
        }
    }

    $query = "INSERT INTO tbl_category (name, photo_cat, status) VALUES ('$name', '$md5photo', '$valueStatus')";

    if (isset($_POST['submit'])) {
    
        move_uploaded_file($strphoto_temp, "../image/".$md5photo);
        mysqli_query($conn, $query);
        ?>
        <script>
            window.location = '../home#category';
        </script>
        <?php
    } else {
        ?>
        <script>
            window.location = '../home#category';
        </script>
        <?php
    }
?>