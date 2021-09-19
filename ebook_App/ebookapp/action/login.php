<?php 

	include("../include/connection.php");
	$email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_STRING);
	$password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);
	if($email=="")
	{
		 $_SESSION['msg']="1"; 
		 header( "Location:../index.php");
		 exit;
	}
	else if($password=="")
	{
		$_SESSION['msg']="2"; 
		header( "Location:../index.php");
		exit;		 
	}	 
	else
	{
		$qry="select * from tbl_admin where email='".$email."' and password='".$password."'";
		$result=mysqli_query($conn,$qry);		
		if(mysqli_num_rows($result) > 0)
		{ 
			$row=mysqli_fetch_assoc($result);
			$_SESSION['id']=$row['id'];
		    $_SESSION['admin_name']=$row['email'];
			header( "Location:../home");
			exit;
		}
		else
		{
			$_SESSION['msg']="4"; 
			header( "Location:../index.php");
			exit;		 
		}
	}
?> 