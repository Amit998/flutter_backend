<?php
   
    /*if(isset($_SERVER['HTTPS'] ) ) {  

		$file_path = 'https://'.$_SERVER['SERVER_NAME'] . '/';
		$image_path = 'https://'.$_SERVER['SERVER_NAME'] . '/';
		$image_user = 'https://'.$_SERVER['SERVER_NAME'] . '/image/user/';
        $pdf = 'https://'.$_SERVER['SERVER_NAME'] . '/ebook/';
	}
	else
	{
		$file_path = 'http://'.$_SERVER['SERVER_NAME'] . '/';
		$image_path = 'http://'.$_SERVER['SERVER_NAME'] . '/';
		$image_user = 'http://'.$_SERVER['SERVER_NAME'] . '/image/user/';
      	$pdf = 'http://'.$_SERVER['SERVER_NAME'] . '/ebook/';
	}*/

	//local
	if(isset($_SERVER['HTTPS'] ) ) {  

		$file_path = 'https://'.$_SERVER['SERVER_NAME'] . '/udemy/ebookapp/';
		$image_path = 'https://'.$_SERVER['SERVER_NAME'] . '/udemy/ebookapp/';
		$image_user = 'https://'.$_SERVER['SERVER_NAME'] . '/udemy/ebookapp/image/user/';
		$pdf = 'https://'.$_SERVER['SERVER_NAME'] . '/udemy/ebookapp/ebook/';
	}
	else
	{
		$file_path = 'http://'.$_SERVER['SERVER_NAME'] . '/udemy/ebookapp/';
		$image_path = 'http://'.$_SERVER['SERVER_NAME'] . '/udemy/ebookapp/';
		$image_user = 'http://'.$_SERVER['SERVER_NAME'] . '/udemy/ebookapp/image/user/';
		$pdf = 'http://'.$_SERVER['SERVER_NAME'] . '/udemy/ebookapp/ebook/';
	}

?>