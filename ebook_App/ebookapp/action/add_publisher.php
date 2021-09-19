<?php

    include '../include/connection.php';

    $name = addslashes($_POST['name']);

    $query = "INSERT INTO tbl_publisher (name_publisher) VALUES ('$name')";

    if (isset($_POST['submit'])) {
    
        mysqli_query($conn, $query);
        ?>
        <script>
            window.location = '../publishers';
        </script>
        <?php
    }
?>