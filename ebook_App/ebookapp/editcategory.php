<?php include 'include/header.php';?>
<body>
	<div class="container">
	<div class="mx-auto col-sm-12 main-section" id="myTab" role="tablist">
		<?php include 'include/child-tab.php';?>
		<div class="tab-content" id="myTabContent">	
			<div role="tabpanel">
				<div class="card">
					<div class="card-header">
						<h4>All Category</h4>
					</div>
					<div class="card-body">
						<?php
							$id = $_GET['cat_id'];
							$query = "SELECT * FROM tbl_category WHERE cat_id = '".$id."'";

							$ms = mysqli_query($conn, $query);
							$result = mysqli_fetch_assoc($ms);

							if (isset($_POST['submit'])) {
							
								$name = $_POST['name'];    
								$status = $_POST['status'];

								if(!empty($status)){
									foreach($status as $valueStatus){
										echo "value: " . $valueStatus;
									}
								}                                 

								if($_FILES['photo']['name']!=""){
									
									$name = $_POST['name'];
									$photo_tmp = $_FILES['photo']['tmp_name'];
									$photo = $_FILES['photo']['name'];

									$strphoto = str_replace(" ", "", $photo);
									$strphoto_temp = str_replace(" ", "", $photo_tmp);
									$status = $_POST['status'];
	
									$md5photo = time()."_".$strphoto;

									if(!empty($status)){
										foreach($status as $valueStatus){
											//echo "value: " . $valueStatus;
										}
									}

									$query = "UPDATE tbl_category SET name = '".$name."', photo_cat = '".$md5photo."', status = '".$valueStatus."' WHERE cat_id = '".$id."'";

									if ($result['photo_cat']!="") {
										unlink('image/'.$result['photo_cat']);
									}

									move_uploaded_file($strphoto_temp, "image/".$md5photo);
									mysqli_query($conn, $query);
									?>
									<script>
										window.location = 'category.php';
									</script>
									<?php

								}

								$query = "UPDATE tbl_category SET name = '".$name."', status = '".$valueStatus."' WHERE cat_id = '".$id."'";
								mysqli_query($conn, $query);

								?>
									<script>
										window.location = 'category.php';
									</script>
								<?php
								
							}
						?>
						<form class="form" role="form" method="post" enctype="multipart/form-data" autocomplete="off">
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Title Category</label>
								<div class="col-lg-9">
									<input class="form-control" name="name" value="<?php echo $result['name']; ?>">
								</div>
							</div>												
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">News Image</label>
								<div class="col-lg-9">
									<div class="fileupload fileupload-new" data-provides="fileupload">
										<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
											<img src="<?php include 'image/baseurl.php'; echo $image_path.'image/'.$result['photo_cat'];?>" alt=""/>
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
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Status</label>
								<div class="col-lg-9">
									<div class="checkbox anim-checkbox">
										<input type="checkbox" id="ch3" name="status[]" value="1" <?php if($result['status']=="1"){ ?>checked<?php }?>/>
										<label for="ch3">Published</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-12 text-center">
									<input type="submit" name="submit" class="btn btn-primary" value="Save">
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