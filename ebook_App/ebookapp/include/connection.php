<?php
    error_reporting(0);
    session_start();
    
    $host = "localhost";
    $user = "root";
    $pass = "";
    $db = "udemy_ebook";

    $conn = mysqli_connect($host, $user, $pass, $db);
    
    //get data setting
    $query="SELECT * FROM tbl_setting where id='1'";
    $mysqli_query=mysqli_query($conn, $query);
    $mysqli_fetch_assoc=mysqli_fetch_assoc($mysqli_query);

    define("SLIDER", $mysqli_fetch_assoc['slider']);
    define("SUGGEST1", $mysqli_fetch_assoc['field_keyword1']);
    define("SUGGEST2", $mysqli_fetch_assoc['field_keyword2']);

?>