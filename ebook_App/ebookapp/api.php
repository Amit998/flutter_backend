<?php

	include 'include/connection.php';
	include 'image/baseurl.php';
	include 'action/time.php';

	if (isset($_GET['slider'])) {
		
		$newsJson2 = array();

		$limit = SLIDER;

		$query2 = "SELECT t.id_ebook, t.title, t.photo, t.description, t.samplebook, t.cat_id, t.status_ebook, t.date, t.id_author, t.id_publisher, t.pages, t.id_language, ta.id_author, ta.name_author, tp.id_publisher, tp.name_publisher, tl.id_language, t.freebook, tl.name_language, AVG(rating) as rating FROM tbl_ebook t LEFT OUTER JOIN tbl_comment c ON t.id_ebook = c.id_ebook JOIN tbl_author ta ON t.id_author = ta.id_author JOIN tbl_publisher tp ON t.id_publisher = tp.id_publisher JOIN tbl_language tl ON t.id_language = tl.id_language WHERE t.status_ebook = '1' GROUP BY t.id_ebook, c.id_ebook ORDER BY t.id_ebook DESC LIMIT $limit";
		$sql2 = mysqli_query($conn, $query2);

		while ($data2 = mysqli_fetch_assoc($sql2)) {
			
			$row2['id'] = $data2['id_ebook'];
			$row2['title'] = $data2['title'];
			$row2['photo'] = $image_path.'image/'.$data2['photo'];
			$row2['description'] = $data2['description'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['status_news'] = $data2['status_ebook'];
			$row2['pdf'] = $pdf.$data2['samplebook'];	
			$row2['date'] = $data2['date'];
			$row2['author_name'] = $data2['name_author'];
			$row2['publisher_name'] = $data2['name_publisher'];
			$row2['pages'] = $data2['pages'];
			$row2['language'] = $data2['name_language'];
			$row2['rating'] = (string)round($data2['rating'], 1);
			$row2['free'] = $data2['freebook'];

			array_push($newsJson2, $row2);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson2,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

	} else if (isset($_GET['pdf_by_id'])) {
		
		$newsJson2 = array();

		$limit = SLIDER;
		$idEbook = $_GET['pdf_by_id'];

		$query2 = "SELECT t.id_ebook, t.title, t.photo, t.description, t.samplebook, t.cat_id, t.status_ebook, t.date, t.id_author, t.id_publisher, t.pages, t.id_language, ta.id_author, ta.name_author, tp.id_publisher, tp.name_publisher, tl.id_language, t.freebook, tl.name_language, AVG(rating) as rating FROM tbl_ebook t LEFT OUTER JOIN tbl_comment c ON t.id_ebook = c.id_ebook JOIN tbl_author ta ON t.id_author = ta.id_author JOIN tbl_publisher tp ON t.id_publisher = tp.id_publisher JOIN tbl_language tl ON t.id_language = tl.id_language WHERE t.id_ebook = '".$idEbook."'  GROUP BY t.id_ebook, c.id_ebook ORDER BY t.id_ebook DESC LIMIT $limit";
		$sql2 = mysqli_query($conn, $query2);

		while ($data2 = mysqli_fetch_assoc($sql2)) {
			
			$row2['id'] = $data2['id_ebook'];
			$row2['title'] = $data2['title'];
			$row2['photo'] = $image_path.'image/'.$data2['photo'];
			$row2['description'] = $data2['description'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['status_news'] = $data2['status_ebook'];
			$row2['pdf'] = $pdf.$data2['samplebook'];	
			$row2['date'] = $data2['date'];
			$row2['author_name'] = $data2['name_author'];
			$row2['publisher_name'] = $data2['name_publisher'];
			$row2['pages'] = $data2['pages'];
			$row2['language'] = $data2['name_language'];
			$row2['rating'] = (string)round($data2['rating'], 1);
			$row2['free'] = $data2['freebook'];

			array_push($newsJson2, $row2);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson2,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

	} else if(isset($_GET['search'])){

		$newsJson2 = array();

		$search = $_GET['search'];

		$query2 = "SELECT t.id_ebook, t.title, t.photo, t.description, t.samplebook, t.cat_id, t.status_ebook, t.date, t.id_author, t.id_publisher, t.pages, t.id_language, ta.id_author, ta.name_author, tp.id_publisher, tp.name_publisher, tl.id_language, t.freebook, tl.name_language, AVG(rating) as rating FROM tbl_ebook t LEFT OUTER JOIN tbl_comment c ON t.id_ebook = c.id_ebook JOIN tbl_author ta ON t.id_author = ta.id_author JOIN tbl_publisher tp ON t.id_publisher = tp.id_publisher JOIN tbl_language tl ON t.id_language = tl.id_language WHERE t.status_ebook = '1' AND t.title LIKE '%".$search."%' GROUP BY t.id_ebook, c.id_ebook ORDER BY t.id_ebook DESC";
		$sql2 = mysqli_query($conn, $query2);

		while ($data2 = mysqli_fetch_assoc($sql2)) {
			
			$row2['id'] = $data2['id_ebook'];
			$row2['title'] = $data2['title'];
			$row2['photo'] = $image_path.'image/'.$data2['photo'];
			$row2['description'] = $data2['description'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['status_news'] = $data2['status_ebook'];
			$row2['pdf'] = $pdf.$data2['samplebook'];	
			$row2['date'] = $data2['date'];
			$row2['author_name'] = $data2['name_author'];
			$row2['publisher_name'] = $data2['name_publisher'];
			$row2['pages'] = $data2['pages'];
			$row2['language'] = $data2['name_language'];
			$row2['rating'] = (string)round($data2['rating'], 1);
			$row2['free'] = $data2['freebook'];

			array_push($newsJson2, $row2);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson2,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

	} else if (isset($_GET['category'])){
      
      $newsJson3 = array();

		$query3 = "SELECT * FROM tbl_category WHERE status = '1' ORDER BY cat_id DESC";
		$sql3 = mysqli_query($conn, $query3);

		while ($data3 = mysqli_fetch_assoc($sql3)) {
			
			$row3['cat_id'] = $data3['cat_id'];
			$row3['photo_cat'] = $image_path.'image/'.$data3['photo_cat'];
			$row3['name'] = $data3['name'];
			$row3['status'] = $data3['status'];

			array_push($newsJson3, $row3);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson3,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

    } else if(isset($_GET['pdf_by_cat'])){

      	$bycat = $_GET['pdf_by_cat'];

		$newsJson2 = array();

		$query2 ="SELECT t.id_ebook, t.title, t.photo, t.description, t.samplebook, t.cat_id, t.status_ebook, t.date, t.id_author, t.id_publisher, t.pages, t.id_language, ta.id_author, ta.name_author, tp.id_publisher, tp.name_publisher, tl.id_language, t.freebook, tl.name_language, AVG(rating) as rating FROM tbl_ebook t LEFT OUTER JOIN tbl_comment c ON 			t.id_ebook = c.id_ebook JOIN tbl_author ta ON t.id_author = ta.id_author JOIN tbl_publisher tp ON t.id_publisher = tp.id_publisher JOIN tbl_language tl ON t.id_language = 				tl.id_language WHERE t.status_ebook = '1' AND t.cat_id = '$bycat' GROUP BY t.id_ebook, c.id_ebook ORDER BY t.id_ebook DESC";
		$sql2 = mysqli_query($conn, $query2);


		while ($data2 = mysqli_fetch_assoc($sql2)) {
			
			$row2['id'] = $data2['id_ebook'];
			$row2['title'] = $data2['title'];
			$row2['photo'] = $image_path.'image/'.$data2['photo'];
			$row2['description'] = $data2['description'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['status_news'] = $data2['status_ebook'];
			$row2['pdf'] = $pdf.$data2['samplebook'];
			$row2['date'] = $data2['date'];
			$row2['author_name'] = $data2['name_author'];
			$row2['publisher_name'] = $data2['name_publisher'];
			$row2['pages'] = $data2['pages'];
			$row2['language'] = $data2['name_language'];
			$row2['rating'] = (string)round($data2['rating'], 1);
			$row2['free'] = $data2['freebook'];

			array_push($newsJson2, $row2);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
		echo $val= str_replace('\\/', '/', json_encode($newsJson2,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();
     
	} else if (isset($_GET['random'])){
	    
	    $newsJson2 = array();

	    $limit=SLIDER;

		$query2 = "SELECT t.id_ebook, t.title, t.photo, t.description, t.samplebook, t.cat_id, t.status_ebook, t.date, t.id_author, t.id_publisher, t.pages, t.id_language, ta.id_author, ta.name_author, tp.id_publisher, tp.name_publisher, tl.id_language, t.freebook, tl.name_language, AVG(rating) as rating FROM tbl_ebook t LEFT OUTER JOIN tbl_comment c ON t.id_ebook = c.id_ebook JOIN tbl_author ta ON t.id_author = ta.id_author JOIN tbl_publisher tp ON t.id_publisher = tp.id_publisher JOIN tbl_language tl ON t.id_language = tl.id_language WHERE t.status_ebook = '1' GROUP BY t.id_ebook, c.id_ebook ORDER BY RAND() DESC LIMIT $limit";
		$sql2 = mysqli_query($conn, $query2);

		while ($data2 = mysqli_fetch_assoc($sql2)) {
			
			$row2['id'] = $data2['id_ebook'];
			$row2['title'] = $data2['title'];
			$row2['photo'] = $image_path.'image/'.$data2['photo'];
			$row2['description'] = $data2['description'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['status_news'] = $data2['status_ebook'];
			$row2['pdf'] = $pdf.$data2['samplebook'];
			$row2['date'] = $data2['date'];
			$row2['author_name'] = $data2['name_author'];
			$row2['publisher_name'] = $data2['name_publisher'];
			$row2['pages'] = $data2['pages'];
			$row2['language'] = $data2['name_language'];
			$row2['rating'] = (string)round($data2['rating'], 1);
			$row2['free'] = $data2['freebook'];

			array_push($newsJson2, $row2);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson2,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

	} else if(isset($_GET['coming'])){
	    
	    $newsJson2 = array();

		$query2 = "SELECT t.id_ebook, t.title, t.photo, t.description, t.samplebook, t.cat_id, t.status_ebook, t.date, t.id_author, t.id_publisher, t.pages, t.id_language, ta.id_author, ta.name_author, tp.id_publisher, tp.name_publisher, tl.id_language, t.freebook, tl.name_language, AVG(rating) as rating FROM tbl_ebook t LEFT OUTER JOIN tbl_comment c ON t.id_ebook = c.id_ebook JOIN tbl_author ta ON t.id_author = ta.id_author JOIN tbl_publisher tp ON t.id_publisher = tp.id_publisher JOIN tbl_language tl ON t.id_language = tl.id_language WHERE t.status_ebook = '0' GROUP BY t.id_ebook, c.id_ebook ORDER BY t.id_ebook DESC";
		$sql2 = mysqli_query($conn, $query2);

		while ($data2 = mysqli_fetch_assoc($sql2)) {
			
			$row2['id'] = $data2['id_ebook'];
			$row2['title'] = $data2['title'];
			$row2['photo'] = $image_path.'image/'.$data2['photo'];
			$row2['description'] = $data2['description'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['status_news'] = $data2['status_ebook'];
			$row2['pdf'] = $pdf.$data2['samplebook'];
			$row2['date'] = $data2['date'];
			$row2['author_name'] = $data2['name_author'];
			$row2['publisher_name'] = $data2['name_publisher'];
			$row2['pages'] = $data2['pages'];
			$row2['language'] = $data2['name_language'];
			$row2['rating'] = (string)round($data2['rating'], 1);
			$row2['free'] = $data2['freebook'];

			array_push($newsJson2, $row2);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson2,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

	} else if (isset($_GET['latest'])) {
		
		$newsJson2 = array();

		$query2 ="SELECT t.id_ebook, t.title, t.photo, t.description, t.samplebook, t.cat_id, t.status_ebook, t.date, t.id_author, t.id_publisher, t.pages, t.id_language, ta.id_author, ta.name_author, tp.id_publisher, tp.name_publisher, tl.id_language, t.freebook, tl.name_language, AVG(rating) as rating FROM tbl_ebook t LEFT OUTER JOIN tbl_comment c ON t.id_ebook = c.id_ebook JOIN tbl_author ta ON t.id_author = ta.id_author JOIN tbl_publisher tp ON t.id_publisher = tp.id_publisher JOIN tbl_language tl ON t.id_language = tl.id_language WHERE t.status_ebook = '1' GROUP BY t.id_ebook, c.id_ebook ORDER BY t.id_ebook DESC";
		$sql2 = mysqli_query($conn, $query2);


		while ($data2 = mysqli_fetch_assoc($sql2)) {
			
			$row2['id'] = $data2['id_ebook'];
			$row2['title'] = $data2['title'];
			$row2['photo'] = $image_path.'image/'.$data2['photo'];
			$row2['description'] = $data2['description'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['status_news'] = $data2['status_ebook'];
			$row2['pdf'] = $pdf.$data2['samplebook'];
			$row2['date'] = $data2['date'];
			$row2['author_name'] = $data2['name_author'];
			$row2['publisher_name'] = $data2['name_publisher'];
			$row2['pages'] = $data2['pages'];
			$row2['language'] = $data2['name_language'];
			$row2['rating'] = (string)round($data2['rating'], 1);
			$row2['free'] = $data2['freebook'];

			array_push($newsJson2, $row2);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson2,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

	} else if (isset($_GET['ads'])) {
		
		$newsJson = array();
	
		$query = "SELECT * FROM tbl_setting";
		$sql = mysqli_query($conn, $query);

		while ($data = mysqli_fetch_assoc($sql)) {
			
			$row['ads'] = $data['ads'];
			$row['startapplivemode'] = $data['startapplivemode'];
			$row['startappaccountid'] = $data['startappaccountid'];
			$row['androidappid'] = $data['androidappid'];
			$row['iosappid'] = $data['iosappid'];
			$row['admobreward'] = $data['admobreward'];
			$row['banner'] = $data['banner'];
			$row['interstitial'] = $data['interstisial'];
			$row['unitylivemode'] = $data['unitylivemode'];
			$row['unitygameid'] = $data['unitygameid'];
			$row['unitybanner'] = $data['unitybanner'];
			$row['unityinterstitial'] = $data['unityinterstisial'];
			$row['unityreward'] = $data['unityreward'];
			array_push($newsJson, $row);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	} else if (isset($_GET['global_ratings'])) {
		
		$id_ebook = $_GET['global_ratings'];
		$newsJson = array();
	
		$query = "SELECT * FROM tbl_comment JOIN tbl_user ON tbl_comment.id_user = tbl_user.tokens WHERE id_ebook = '$id_ebook' 
		ORDER BY id_comment DESC";
		$sql = mysqli_query($conn, $query);

		while ($data = mysqli_fetch_assoc($sql)) {
			
			$row['name'] = $data['name_user'];
			$row['photo'] = $data['photo_user'];
			$row['dates'] = getDateTimeDifferenceString($data['date_comment']);
			$row['comment'] = $data['comment'];
			$row['rating'] = (string)$data['rating'];
			$row['id_user'] = $data['tokens'];

			array_push($newsJson, $row);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));
		die();

	} else if (isset($_GET['already_ratings'])) {
		
		$id_ebook = $_GET['already_ratings'];
		$newsJson = array();
	
		$query = "SELECT * FROM tbl_comment JOIN tbl_user ON tbl_comment.id_user = tbl_user.tokens WHERE tbl_comment.id_user = '$id_ebook' 
		ORDER BY id_comment DESC";
		$sql = mysqli_query($conn, $query);

		while ($data = mysqli_fetch_assoc($sql)) {
			
			$row['name'] = $data['name_user'];
			$row['photo'] = $data['photo_user'];
			$row['dates'] = getDateTimeDifferenceString($data['date_comment']);
			$row['comment'] = $data['comment'];
			$row['rating'] = (string)$data['rating'];
			$row['id_user'] = $data['tokens'];

			array_push($newsJson, $row);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

	} else if (isset($_GET['favorite'])) {

		$idUser = $_GET['favorite'];
		
		$newsJson2 = array();

		$query1 = "SELECT * FROM tbl_ebook JOIN tbl_author ON tbl_ebook.id_author = tbl_author.id_author JOIN tbl_category ON tbl_ebook.cat_id = tbl_category.cat_id JOIN tbl_favorites ON tbl_ebook.id_ebook = tbl_favorites.id_fav_ebook JOIN tbl_user ON tbl_favorites.id_fav_user = tbl_user.id_user WHERE tbl_favorites.id_fav_user = '".$idUser."' ORDER BY tbl_favorites.id_favorites DESC";

		$sql2 = mysqli_query($conn, $query1);

		while ($data2 = mysqli_fetch_assoc($sql2)) {
			
			$row2['id'] = $data2['id_ebook'];
			$row2['title'] = $data2['title'];
			$row2['photo'] = $image_path.'image/'.$data2['photo'];
			$row2['description'] = $data2['description'];
			$row2['cat_id'] = $data2['cat_id'];
			$row2['status_news'] = $data2['status_ebook'];
			$row2['pdf'] = $pdf.$data2['samplebook'];	
			$row2['date'] = $data2['date'];
			$row2['author_name'] = $data2['name_author'];
			$row2['publisher_name'] = $data2['name_publisher'];
			$row2['pages'] = $data2['pages'];
			$row2['language'] = $data2['name_language'];
			$row2['rating'] = (string)round($data2['rating'], 1);
			$row2['free'] = $data2['freebook'];

			array_push($newsJson2, $row2);
		}

		header( 'Content-Type: application/json; charset=utf-8' );
	    echo $val= str_replace('\\/', '/', json_encode($newsJson2,JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK));
		die();

	}
?>