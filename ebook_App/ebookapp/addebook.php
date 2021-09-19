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
						<h4>Add Ebook</h4>
					</div>
					<div class="card-body">
						<form class="form" role="form" method="post" action="action/add_ebook.php" enctype="multipart/form-data">
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Title Ebook</label>
								<div class="col-lg-9">
									<input class="form-control" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Category</label>
								<div class="col-lg-9">
									<?php
										include 'include/connection.php';
										$cat_que = "SELECT * FROM tbl_category";
										$cat_sel = mysqli_query($conn, $cat_que);
										$cat_sel_equals = mysqli_query($conn, $cat_que);
										$data_name = mysqli_fetch_assoc($cat_sel_equals);
									?>
									<select name="cat_news" class="form-control">
										<?php while ($data = mysqli_fetch_assoc($cat_sel)) {
											if ($data['cat_id'] == $data_name['cat_id']) {?>
												<option selected="<?php echo $data_name['cat_id'];?>" value="<?php echo $data['cat_id'];?>">
													<?php echo $data['name'];?>
												</option>
											<?php } else { ?>
												<option value="<?php echo $data['cat_id'];?>">
													<?php echo $data['name'];?>
												</option>
											}
										<?php }} ?>
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
								<label class="col-lg-3 col-form-label form-control-label">Author</label>
								<div class="col-lg-9">
									<?php
										include 'include/connection.php';
										$cat_que = "SELECT * FROM tbl_author";
										$cat_sel = mysqli_query($conn, $cat_que);
										$cat_sel_equals = mysqli_query($conn, $cat_que);
										$data_name = mysqli_fetch_assoc($cat_sel_equals);
									?>
									<select name="id_author" class="form-control">
										<?php while ($data = mysqli_fetch_assoc($cat_sel)) {
											if ($data['id_author'] == $data_name['id_author']) {?>
												<option selected="<?php echo $data_name['id_author'];?>" value="<?php echo $data['id_author'];?>">
													<?php echo $data['name_author'];?>
												</option>
											<?php } else { ?>
												<option value="<?php echo $data['id_author'];?>">
													<?php echo $data['name_author'];?>
												</option>
											}
										<?php }} ?>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Publisher</label>
								<div class="col-lg-9">
									<?php
										include 'include/connection.php';
										$cat_que = "SELECT * FROM tbl_publisher";
										$cat_sel = mysqli_query($conn, $cat_que);
										$cat_sel_equals = mysqli_query($conn, $cat_que);
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
										$cat_que = "SELECT * FROM tbl_language";
										$cat_sel = mysqli_query($conn, $cat_que);
										$cat_sel_equals = mysqli_query($conn, $cat_que);
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
									<input class="form-control" name="pages" type="number" required>
								</div>
							</div>
			            	<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Approved</label>
								<div class="col-lg-9">
									<div class="checkbox anim-checkbox">
										<input type="checkbox" id="ch3" name="status[]" value="1"/>
										<label for="ch3">Active</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Free Ebook</label>
								<div class="col-lg-9">
									<div class="checkbox anim-checkbox">
										<input type="checkbox" id="ch3" name="freebook[]" value="1"/>
										<label for="ch3">Yes, Free</label>
									</div>
								</div>
							</div>
			            	<div class="form-group row" id="news_video_display" style="display:none;">			  
		                    	<label class="col-lg-3 col-form-label form-control-label">Video Url(Youtube Only)</label>
			                    <div class="col-md-9">
			                      <input type="text" placeholder="ZVy6efR0PYU" name="news_url" id="news_url" value="" class="form-control">
			                    </div>
			            	</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">News Image</label>
								<div class="col-lg-9">
									<div class="fileupload fileupload-new" data-provides="fileupload">
										<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
											<img src="assets/img/demoUpload.jpg" alt=""/>
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
												<input type="file" name="photo" accept="image/*" required></span>
											<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row" id="news_article_display">
								<label class="col-lg-3 col-form-label form-control-label">Description</label>
								<div class="col-lg-9">
									<textarea name="description" id="description" class="form-control"></textarea>

                                    <script>CKEDITOR.replace( 'description' );</script>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-12 text-center">
									<input type="submit" <?php 
										if ($demoOrLive == "1") { ?>
											name="submit"
									<?php } else { ?>
											onclick="return confirm('Demo version not working.')"
									<?php } ?> 
									class="btn btn-primary" value="Save">
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