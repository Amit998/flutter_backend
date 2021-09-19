<?php
	include '../include/connection.php';

	$comment = $_GET['comment'];
	$id_ebook = $_GET['id_ebook'];
	$id_user = $_GET['id_user'];
	$rating = $_GET['rating'];

	$regis = "INSERT INTO tbl_comment(comment, date_comment, id_ebook, id_user, rating) 
	VALUES ('$comment', now(), '$id_ebook', '$id_user', '$rating')";
	mysqli_query($conn, $regis);
?>