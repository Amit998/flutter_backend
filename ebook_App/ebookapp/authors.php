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
						<h4>All Authors</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<?php
								if (isset($_GET['id_author'])) { 
									$deleteNews = $_GET['id_author'];
									$news_del = "DELETE FROM tbl_author WHERE id_author = '".$deleteNews."'";
									$news_del_path = "SELECT * FROM tbl_author WHERE id_author = '".$deleteNews."'";
									$que_del_path = mysqli_query($conn, $news_del_path);

									$que_del = mysqli_query($conn, $news_del);
									$que_del = mysqli_query($conn, $news_del);
								}
							?>
							<table id="userList" class="table table-bordered table-hover table-striped">
								<thead class="thead-light">
								<tr>
									<th scope="col" style="width: 10%;">#</th>
									<th scope="col" style="width: 70%;">Name</th>
									<th scope="col" style="width: 20%;">Action</th>
								</tr>
								</thead>
								<tbody>
								<?php
									$cat = mysqli_query($conn, "SELECT * from tbl_author");
									$cat_id = mysqli_query($conn, "SELECT * from tbl_author");
									while($row = mysqli_fetch_array($cat))
									{ ?>
										<tr>
										<td><?php echo $row['id_author'] ?></td>
										<td><?php echo $row['name_author'] ?></td>
										<td>
											<?php 
												if ($demoOrLive == "1") { ?>
													<a href="editauthor?id_author=<?php echo $row['id_author'];?>" class="btn btn-success"><i class="fa fa-edit"></i></a>
											<?php } else {?>
													<a href="" class="btn btn-success"><i class="fa fa-edit"></i></a>
											<?php } ?>
											&ensp;&ensp;
											<?php 
												if ($demoOrLive == "1") { ?>
													<a href="?id_author=<?php echo $row['id_author'];?>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this Authors?')"><i class="fa fa-user-times"></i></a>
											<?php } else {?>
													<a href="" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this Authors?')"><i class="fa fa-user-times"></i></a>
											<?php } ?>
										</td>
										</tr>
									<?php }
								?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include 'include/footer.php';?>
</body>
</html>