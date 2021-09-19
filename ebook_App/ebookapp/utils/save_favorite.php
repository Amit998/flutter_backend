<?php

	include '../include/connection.php';
	
	$data = file_get_contents('php://input');
	$dataDecode = json_decode($data, true);

	$idCourse = $dataDecode['id_course'];
	$idUser = $dataDecode['id_user'];

	$query = "SELECT * FROM tbl_favorites WHERE id_fav_ebook = '".$idCourse."' AND id_fav_user = '".$idUser."'";
	$check = mysqli_fetch_assoc(mysqli_query($conn, $query));

	if ($check == 0) {
		mysqli_query($conn, "INSERT INTO tbl_favorites (id_fav_ebook, id_fav_user) VALUES ('".$idCourse."', '".$idUser."')");
		echo "success";
	}else{
		mysqli_query($conn, "DELETE FROM tbl_favorites WHERE id_fav_ebook = '".$idCourse."' AND id_fav_user = '".$idUser."'");
		echo "deleted";
	}
	mysqli_close($conn);
?>