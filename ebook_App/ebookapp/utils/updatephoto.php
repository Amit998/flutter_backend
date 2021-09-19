<?php
	include '../include/connection.php';
	
	$data = file_get_contents('php://input');
	$dataDecode = json_decode($data, true);

	$photo = $_FILES['photo']['name'];
	$temp = $_FILES['photo']['tmp_name'];
	$iduser = $_POST['iduser'];

	$select = "SELECT * FROM tbl_user WHERE id_user = '".$iduser."'";
	$query = "UPDATE tbl_user SET photo_user = '".$photo."' WHERE id_user = '".$iduser."'";
	$check = mysqli_fetch_assoc(mysqli_query($conn, $select));

	if ($check['photo_user']!="") {
		mysqli_query($conn, $query);
		unlink('../image/user/'.$check['photo_user']);
		move_uploaded_file($temp, '../image/user/'.$photo);
	}else{
		mysqli_query($conn, $query);
		move_uploaded_file($temp, '../image/user/'.$photo);
	}
?>