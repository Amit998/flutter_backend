<?php
	include '../include/connection.php';

	$id_ebook = $_GET['id_ebook'];

	$newsJson = array();

	$query = mysqli_query($conn,"SELECT count(rating) as Total from tbl_comment where id_ebook='$id_ebook'");
	$tot = mysqli_fetch_array($query);

	$query = mysqli_query($conn,"SELECT AVG(rating) as Avg from tbl_comment where id_ebook='$id_ebook'");
	$avg = mysqli_fetch_array($query);

	$row['total'] = $tot['Total'];
	$row['average'] = round($avg['Avg'],1);

	array_push($newsJson, $row);

	$final['pdf'] = $newsJson;

	header( 'Content-Type: application/json; charset=utf-8' );
    echo $val= str_replace('\\/', '/', json_encode($final,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
	die();
?>