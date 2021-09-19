<?php

    include '../include/connection.php';

    $name = addslashes($_POST['name']);

    $query = "INSERT INTO tbl_author (name_author) VALUES ('$name')";

    if (isset($_POST['submit'])) {
    
        mysqli_query($conn, $query);
        ?>
        <script>
            window.location = '../authors';
        </script>
        <?php
    }
?>