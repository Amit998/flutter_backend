<?php
	include '../include/connection.php';

	$name = $_GET['name_user'];
	$email = $_GET['email_user'];
	$photo = $_GET['photo_user'];
	$token = $_GET['tokens'];

	$queryRegister = "SELECT * FROM tbl_user WHERE email_user = '$email'";

	$msql = mysqli_query($conn, $queryRegister);

	$ss = mysqli_num_rows($msql);

	if ($ss == 0) {

		$regis = "INSERT INTO tbl_user(name_user, email_user, photo_user, tokens) VALUES ('$name', '$email', '$photo', '$token')";
		$msqlRegis = mysqli_query($conn, $regis);

	}else{

		echo "You have logged";
	}
?>