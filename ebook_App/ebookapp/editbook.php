<?php include 'include/header.php';?>
<?php include 'include/demo.php';?>
<body>
	<div class="container">
	<div class="mx-auto col-sm-12 main-section" id="myTab" role="tablist">
		<?php include 'include/child-tab.php';?>
		<div class="tab-content" id="myTabContent">	
			<div role="tabpanel">
				<div class="card">
					<div class="card-header">
						<h4>All News</h4>
					</div>
					<div class="card-body">
						<?php
							$id = $_GET['news_id'];
							$query = "SELECT * FROM tbl_ebook WHERE id_ebook = '".$id."'";

							$ms = mysqli_query($conn, $query);
							$result = mysqli_fetch_assoc($ms);

							if (isset($_POST['submit'])) {
							
								$name = addslashes($_POST['name']);
								$category = $_POST['cat_news'];
								$description = $_POST['description'];
								$status = $_POST['status'];
								$freebook = $_POST['freebook'];
								$pages = $_POST['pages'];
								$id_language = $_POST['id_language'];

    							$pdfSample = $_FILES['sample']['name'];
    							$pdfSampleType = $_FILES['sample']['type'];
    							$sample_replace = "sample".'_'.str_replace(" ", "", $pdfSample);

								$id_author = $_POST['id_author'];
								$id_publisher = $_POST['id_publisher'];
				

								if ($pdfSampleType=="application/pdf") {

									if(!empty($status)){
							        foreach($status as $valueStatus){
							            //echo "value: " . $valueStatus;
							        	}
							    	}

							    	if (!empty($freebook)) {
								        foreach ($freebook as $valueFree) {
								            # code...
								        }
								    }

									if($_FILES['photo']['name']!=""){

										$name = addslashes($_POST['name']);
										$category = $_POST['cat_news'];
										$photo_tmp = $_FILES['photo']['tmp_name'];
										$photo = $_FILES['photo']['name'];
										$description = $_POST['description'];
										$status = $_POST['status'];
										$freebook = $_POST['freebook'];
										$pages = $_POST['pages'];
										$id_language = $_POST['id_language'];
										
		    							$pdfSample = $_FILES['sample']['name'];
		    							$pdfSampleType = $_FILES['sample']['type'];
		    							$sample_replace = "sample".'_'.str_replace(" ", "", $pdfSample);

										$id_author = $_POST['id_author'];
										$id_publisher = $_POST['id_publisher'];
					

										if(!empty($status)){
									        foreach($status as $valueStatus){
									            //echo "value: " . $valueStatus;
									        }
									    }

									    if (!empty($freebook)) {
									        foreach ($freebook as $valueFree) {
									            # code...
									        }
									    }

										$strphoto = str_replace(" ", "", $photo);
										$strphoto_temp = str_replace(" ", "", $photo_tmp);

										$md5photo = time()."_".$strphoto;

										$query = "UPDATE tbl_ebook SET title = '".$name."', photo = '".$md5photo."', description = '".$description."', samplebook = '".$sample_replace."', cat_id = '".$category."', status_ebook = '".$valueStatus."', id_author = '".$id_author."', id_publisher = '".$id_publisher."', pages = '".$pages."', id_language = '".$id_language."', freebook = '".$valueFree."' WHERE id_ebook = '".$id."'";

										if ($result['photo']!="") {
											unlink('image/'.$result['photo']);
										}

										if ($result['samplebook']!="") {
											unlink('ebook/'.$result['samplebook']);
										}

										move_uploaded_file($_FILES['sample']['tmp_name'], "ebook/".$sample_replace);
										move_uploaded_file($strphoto_temp, "image/".$md5photo);
										mysqli_query($conn, $query);

										?>
										<script>
											window.location = 'home#view';
										</script>
										<?php
									}

									if($pdfSample!=""){

										$name = addslashes($_POST['name']);
										$category = $_POST['cat_news'];
										$photo_tmp = $_FILES['photo']['tmp_name'];
										$photo = $_FILES['photo']['name'];
										$description = $_POST['description'];
										$status = $_POST['status'];
										$freebook = $_POST['freebook'];
										$pages = $_POST['pages'];
										$id_language = $_POST['id_language'];
										
		    							$pdfSample = $_FILES['sample']['name'];
		    							$pdfSampleType = $_FILES['sample']['type'];
		    							$sample_replace = "sample".'_'.str_replace(" ", "", $pdfSample);

										$id_author = $_POST['id_author'];
										$id_publisher = $_POST['id_publisher'];
					

										if(!empty($status)){
									        foreach($status as $valueStatus){
									            //echo "value: " . $valueStatus;
									        }
									    }

									    if (!empty($freebook)) {
									        foreach ($freebook as $valueFree) {
									            # code...
									        }
									    }

										$strphoto = str_replace(" ", "", $photo);
										$strphoto_temp = str_replace(" ", "", $photo_tmp);

										$md5photo = time()."_".$strphoto;

										$query = "UPDATE tbl_ebook SET title = '".$name."', description = '".$description."', samplebook = '".$sample_replace."', cat_id = '".$category."', status_ebook = '".$valueStatus."', id_author = '".$id_author."', id_publisher = '".$id_publisher."', pages = '".$pages."', id_language = '".$id_language."', freebook = '".$valueFree."' WHERE id_ebook = '".$id."'";

									
										if ($result['samplebook']!="") {
											unlink('ebook/'.$result['samplebook']);
										}

										move_uploaded_file($_FILES['sample']['tmp_name'], "ebook/".$sample_replace);
										mysqli_query($conn, $query);

										?>
										<script>
											window.location = 'home#view';
										</script>
										<?php
									}

									$query = "UPDATE tbl_ebook SET title = '".$name."', description = '".$description."', samplebook = '".$sample_replace."', cat_id = '".$category."', status_ebook = '".$valueStatus."', id_author = '".$id_author."', id_publisher = '".$id_publisher."', pages = '".$pages."', id_language = '".$id_language."', freebook = '".$valueFree."' WHERE id_ebook = '".$id."'";

									if ($result['samplebook']!="") {
										unlink('ebook/'.$result['samplebook']);
									}

									move_uploaded_file($_FILES['sample']['tmp_name'], "ebook/".$sample_replace);
									mysqli_query($conn, $query);

									?>
										<script>
											window.location = 'home#view';
										</script>
									<?php
									
								}else{

									if(!empty($status)){
							        foreach($status as $valueStatus){
							            //echo "value: " . $valueStatus;
							        	}
							    	}

							    	if(!empty($freebook)){
							        foreach($freebook as $valueFree){
							            //echo "value: " . $valueStatus;
							        	}
							    	}

									if($_FILES['photo']['name']!=""){

										$name = addslashes($_POST['name']);
										$category = $_POST['cat_news'];
										$photo_tmp = $_FILES['photo']['tmp_name'];
										$photo = $_FILES['photo']['name'];
										$description = $_POST['description'];
										$status = $_POST['status'];
										$freebook = $_POST['freebook'];
										$pages = $_POST['pages'];
										$id_language = $_POST['id_language'];
		
		    							$pdfSample = $_FILES['sample']['name'];
		    							$pdfSampleType = $_FILES['sample']['type'];
		    							$sample_replace = "sample".'_'.str_replace(" ", "", $pdfSample);

										$id_author = $_POST['id_author'];
										$id_publisher = $_POST['id_publisher'];
					

										if(!empty($status)){
									        foreach($status as $valueStatus){
									            //echo "value: " . $valueStatus;
									        }
									    }

									    if (!empty($freebook)) {
									        foreach ($freebook as $valueFree) {
									            # code...
									        }
									    }

										$strphoto = str_replace(" ", "", $photo);
										$strphoto_temp = str_replace(" ", "", $photo_tmp);

										$md5photo = time()."_".$strphoto;

										$query = "UPDATE tbl_ebook SET title = '".$name."', photo = '".$md5photo."', description = '".$description."', cat_id = '".$category."', status_ebook = '".$valueStatus."', id_author = '".$id_author."', id_publisher = '".$id_publisher."', pages = '".$pages."', id_language = '".$id_language."', freebook = '".$valueFree."' WHERE id_ebook = '".$id."'";

										if ($result['photo']!="") {
											unlink('image/'.$result['photo']);
										}

										move_uploaded_file($strphoto_temp, "image/".$md5photo);
										mysqli_query($conn, $query);

										?>
										<script>
											window.location = 'home#view';
										</script>
										<?php
									}

									$query = "UPDATE tbl_ebook SET title = '".$name."', description = '".$description."', cat_id = '".$category."', status_ebook = '".$valueStatus."', id_author = '".$id_author."', id_publisher = '".$id_publisher."', pages = '".$pages."', id_language = '".$id_language."', freebook = '".$valueFree."' WHERE id_ebook = '".$id."'";

									mysqli_query($conn, $query);

									?>
										<script>
											window.location = 'home#view';
										</script>
									<?php

								}

							}
						?>
						<form class="form" role="form" method="post" action="" enctype="multipart/form-data">
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Title News</label>
								<div class="col-lg-9">
									<input class="form-control" name="name" value="<?php echo htmlentities($result['title']);?>">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Category</label>
								<div class="col-lg-9">
									<?php

										$id = $_GET['news_id'];
										$cat_que = "SELECT * FROM tbl_category";
										$cat_news = "SELECT * FROM tbl_ebook WHERE id_ebook = '".$id."'";
										$cat_sel = mysqli_query($conn, $cat_que);
										$cat_news = mysqli_query($conn, $cat_news);
										$data_news = mysqli_fetch_assoc($cat_news);
					
									?>
									<select name="cat_news" class="form-control" class="select2">
										<?php while($data = mysqli_fetch_assoc($cat_sel)){?>
											<?php echo $data['cat_id'];
													echo $data_news['cat_id'];?>
											<option value="<?php echo $data['cat_id'];?>" <?php if($data['cat_id']==$data_news['cat_id']){ ?>selected<?php }?>> <?php echo $data['name']?></option>
										<?php
										}
										?>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Ebook</label>
								<div class="col-lg-9">
									<input class="form-control" name="sample" type="file" accept="application/pdf">
								</div>
							</div> 
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Current Ebook</label>
								<div class="col-lg-9">
									<p><?php include 'image/baseurl.php';
									 echo $pdf.htmlentities($result['samplebook']);?></p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Author</label>
								<div class="col-lg-9">
									<?php

										$id = $_GET['news_id'];
										$cat_que = "SELECT * FROM tbl_author";
										$cat_news = "SELECT * FROM tbl_ebook WHERE id_ebook = '".$id."'";
										$cat_sel = mysqli_query($conn, $cat_que);
										$cat_news = mysqli_query($conn, $cat_news);
										$data_news = mysqli_fetch_assoc($cat_news);
					
									?>
									<select name="id_author" class="form-control" class="select2">
										<?php while($data = mysqli_fetch_assoc($cat_sel)){?>
											<?php echo $data['id_author'];
													echo $data_news['id_author'];?>
											<option value="<?php echo $data['id_author'];?>" <?php if($data['id_author']==$data_news['id_author']){ ?>selected<?php }?>> <?php echo $data['name_author']?></option>
										<?php
										}
										?>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Publisher</label>
								<div class="col-lg-9">
									<?php
										include 'include/connection.php';
										$id = $_GET['news_id'];
										$cat_que = "SELECT * FROM tbl_publisher";
										$cat_news = "SELECT * FROM tbl_ebook WHERE id_ebook = '".$id."'";
										$cat_sel = mysqli_query($conn, $cat_que);
										$cat_sel_equals = mysqli_query($conn, $cat_news);
										$data_name = mysqli_fetch_assoc($cat_sel_equals);
									?>
									<select name="id_publisher" class="form-control">
										<?php while ($data = mysqli_fetch_assoc($cat_sel)) {
											if ($data['id_publisher'] == $data_name['id_publisher']) {?>
												<option selected="<?php echo $data_name['id_publisher'];?>" value="<?php echo $data['id_publisher'];?>">
													<?php echo $data['name_publisher'];?>
												</option>
											<?php } else { ?>
												<option value="<?php echo $data['id_publisher'];?>">
													<?php echo $data['name_publisher'];?>
												</option>
											}
										<?php }} ?>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Language</label>
								<div class="col-lg-9">
									<?php
										include 'include/connection.php';
										$id = $_GET['news_id'];
										$cat_que = "SELECT * FROM tbl_language";
										$cat_news = "SELECT * FROM tbl_ebook WHERE id_ebook = '".$id."'";
										$cat_sel = mysqli_query($conn, $cat_que);
										$cat_sel_equals = mysqli_query($conn, $cat_news);
										$data_name = mysqli_fetch_assoc($cat_sel_equals);
									?>
									<select name="id_language" class="form-control">
										<?php while ($data = mysqli_fetch_assoc($cat_sel)) {
											if ($data['id_language'] == $data_name['id_language']) {?>
												<option selected="<?php echo $data_name['id_language'];?>" value="<?php echo $data['id_language'];?>">
													<?php echo $data['name_language'];?>
												</option>
											<?php } else { ?>
												<option value="<?php echo $data['id_language'];?>">
													<?php echo $data['name_language'];?>
												</option>
											}
										<?php }} ?>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Pages</label>
								<div class="col-lg-9">
									<input class="form-control" name="pages" type="number" value="<?php echo $result['pages'];?>" required>
								</div>
							</div>
			            	<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Approved</label>
								<div class="col-lg-9">
									<div class="checkbox anim-checkbox">
										<input type="checkbox" id="ch3" name="status[]" value="1" <?php if($result['status_ebook']=="1"){ ?>checked<?php }?>/>
										<label for="ch3">Active</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Free Ebook</label>
								<div class="col-lg-9">
									<div class="checkbox anim-checkbox">
										<input type="checkbox" id="ch3" name="freebook[]" value="1" <?php if($result['freebook']=="1"){ ?>checked<?php }?>/>
										<label for="ch3">Yes, Free</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Ebook Image</label>
								<div class="col-lg-9">
									<div class="fileupload fileupload-new" data-provides="fileupload">
										<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
											<img src="<?php include 'image/baseurl.php'; echo $image_path.'image/'.$result['photo'];?>" alt=""/>
										</div>
										<div class="fileupload-preview fileupload-exists thumbnail"
											style="
											max-width: 200px;
											max-height: 150px;
											line-height: 20px;">
										</div>
										<div>
											<span class="btn btn-file btn-primary">
												<span class="fileupload-new">Select image</span>
												<span class="fileupload-exists">Change</span>
												<input type="file" name="photo" accept="image/*"></span>
											<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row" id="news_article_display">
								<label class="col-lg-3 col-form-label form-control-label">Description</label>
								<div class="col-lg-9">
									<textarea name="description" id="description" class="form-control"><?php echo $result['description']?></textarea>
                                    <script>CKEDITOR.replace( 'description' );</script>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-12 text-center">
									<input type="submit" <?php 

										if ($demoOrLive == "1") {
											?>name="submit"<?php
										}else{
											?>name="demo"<?php
										}
									 ?> class="btn btn-primary" value="Save">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include 'include/footer.php';?>
</body>
</html>