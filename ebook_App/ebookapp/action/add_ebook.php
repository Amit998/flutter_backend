<?php

    include '../include/connection.php';

    $name = addslashes($_POST['name']);
    $category = $_POST['cat_news'];
    $photo_tmp = $_FILES['photo']['tmp_name'];
    $photo = $_FILES['photo']['name'];
    $description = $_POST['description'];
    $status = $_POST['status'];
    $freebook = $_POST['freebook'];
    $pages = $_POST['pages'];
    $id_language = $_POST['id_language'];

    $pdfSample = $_FILES['sample']['name'];
    $pdfSampleType = $_FILES['sample']['type'];

    $id_author = $_POST['id_author'];
    $id_publisher = $_POST['id_publisher'];

    $strphoto = str_replace(" ", "", $photo);
    $strphoto_temp = str_replace(" ", "", $photo_tmp);

    $pdf_replace = str_replace(" ", "", $pdf);
    $sample_replace = "sample".'_'.str_replace(" ", "", $pdfSample);

    $md5photo = time()."_".$strphoto;

    if(!empty($status)){
        foreach($status as $valueStatus){
            //echo "value: " . $valueStatus;
        }
    }

    if (!empty($freebook)) {
        foreach ($freebook as $valueFree) {
            # code...
        }
    }

    $query = "INSERT INTO tbl_ebook (title, photo, description, samplebook, cat_id, status_ebook, date, id_author, id_publisher, pages, id_language, freebook) VALUES ('$name', '$md5photo', '$description', '$sample_replace', '$category', '$valueStatus', now(), '$id_author', '$id_publisher', '$pages', '$id_language', '$valueFree')";

    if (isset($_POST['submit'])) {

        move_uploaded_file($_FILES['sample']['tmp_name'], "../ebook/".$sample_replace);
        move_uploaded_file($strphoto_temp, "../image/".$md5photo);
        mysqli_query($conn, $query);

        ?>
            <script>
                window.location = '../home#view';
            </script>
        <?php      

    } else {
        ?>
            <script>
                window.location = '../home#view';
            </script>
        <?php
    }
?>