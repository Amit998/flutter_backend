<?php

	include '../include/connection.php';
	
	$data = file_get_contents('php://input');
	$dataDecode = json_decode($data, true);

	$idUser = $dataDecode['id_user'];
	$idCourse = $dataDecode['id_course'];

	$query = "SELECT * FROM tbl_favorites WHERE id_fav_ebook = '".$idCourse."' AND id_fav_user = '".$idUser."'";
	
	$check = mysqli_fetch_assoc(mysqli_query($conn, $query));

	if ($check == 0) {
		echo "notfound";
	}else{
		echo "already";
	}
	mysqli_close($conn);
?>