<?php
	include '../include/connection.php';

	$name = $_POST['name'];
	$email = $_POST['email'];
	$password = $_POST['password'];
	$photo = $_FILES['photo']['name'];
	$tmp = $_FILES['photo']['tmp_name'];

	$query = "SELECT * FROM tbl_user WHERE name_user = '$name' AND email_user = '$email'";
	$check = mysqli_fetch_array(mysqli_query($conn, $query));

	if (isset($check)) {
		$msg = 'Failed create an account';
		echo json_encode($msg);
	}else{
		mysqli_query($conn, "INSERT INTO tbl_user(name_user, email_user, photo_user, password) VALUES ('".$name."', '".$email."', '".$photo."', '".$password."')");
		move_uploaded_file($tmp, '../image/user/'.$photo);
		$msg = 'Successfully create an account';
		echo json_encode($msg);
	}
?>