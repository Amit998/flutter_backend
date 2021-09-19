<?php

	include '../include/connection.php';
	include '../image/baseurl.php';
	
	$data = file_get_contents('php://input');
	$dataDecode = json_decode($data, true);

	$idu = $dataDecode['id'];

	$query = "SELECT * FROM tbl_user WHERE id_user = '".$idu."'";
	$getData = mysqli_fetch_assoc(mysqli_query($conn, $query));

	if($getData['photo_user']!=""){
		echo $image_user.$getData['photo_user'];
	}else{
		echo "no_img";
	}

	mysqli_close($conn);
?>