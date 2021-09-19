<?php include 'include/connection.php';?>
<?php include 'sessions.php';?>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
	<title>Bebe News</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
	<script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
	<link href="assets/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/styles.css"/>
	<script type="text/javascript">
	    $(document).ready(function() {
	        //Asegurate que el id que le diste a la tabla sea igual al texto despues del simbolo #
	        $('#userList').DataTable();
	    } );
	</script>
	<script type="text/javascript">
	    $(document).ready(function() {
	        //Asegurate que el id que le diste a la tabla sea igual al texto despues del simbolo #
	        $('#userList1').DataTable();
	    } );
	</script>
	<script src="assets/ckeditor/ckeditor.js"></script>
	<script>
		$(document).ready(() => {
		let url = location.href.replace(/\/$/, "");
	
		if (location.hash) {
			const hash = url.split("#");
			$('#myTab a[href="#'+hash[1]+'"]').tab("show");
			url = location.href.replace(/\/#/, "#");
			history.replaceState(null, null, url);
			setTimeout(() => {
			$(window).scrollTop(0);
			}, 400);
		} 

		//$('a[data-toggle="tab"]').on("click", function() { this is conflict with jquery, because have type "click"
		//$('a[data-toggle="tab"]').click(function() { this is not conflict because "click" globar function

		$('a[data-toggle="tab"]').click(function() {
			let newUrl;
			const hash = $(this).attr("href");
			if(hash == "#home") {
			newUrl = url.split("#")[0];
			} else {
			newUrl = url.split("#")[0] + hash;
			}
			newUrl += "/";
			history.replaceState(null, null, newUrl);
		});
		});
	</script>
</head>