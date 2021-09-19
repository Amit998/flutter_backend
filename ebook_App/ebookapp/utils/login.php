<?php

	include '../include/connection.php';
	
	$data = file_get_contents('php://input');
	$dataDecode = json_decode($data, true);

	$name = $dataDecode['email'];
	$password = $dataDecode['password'];

	$query = "SELECT * FROM tbl_user WHERE email_user = '$name' AND password = '$password'";
	$check = mysqli_fetch_array(mysqli_query($conn, $query));
	$getData = mysqli_fetch_assoc(mysqli_query($conn, $query));

	if (isset($check)) {

		$scs = 'Successfully login';
		$array = [$getData['id_user'], 
				$getData['name_user'], 
				$getData['email_user'], 
				$getData['photo_user'],
				$scs];
		echo json_encode($array);
	}else{
		$invalidSuccess = 'Name or password incorrect or Account not exist';
		$failedMsg = json_encode($invalidSuccess);
		echo $failedMsg;
	}
	mysqli_close($conn);
?>