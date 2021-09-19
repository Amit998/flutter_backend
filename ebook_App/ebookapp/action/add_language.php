<?php

    include '../include/connection.php';

    $name = addslashes($_POST['language']);

    $query = "INSERT INTO tbl_language (name_language) VALUES ('$name')";

    if (isset($_POST['submit'])) {
    
        mysqli_query($conn, $query);
        ?>
        <script>
            window.location = '../language';
        </script>
        <?php
    }
?>