<?php include 'include/header.php';?>
<?php include 'apps/time.php';?>
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
						<div class="table-responsive">
							<table id="userList" class="table table-bordered table-hover table-striped">
								<thead class="thead-light">
								<tr>
									<th scope="col">#</th>
									<th scope="col">Name</th>
									<th scope="col">Comment</th>
									<th scope="col">Image</th>
									<th scope="col">Date</th>
									<th scope="col">Reply</th>
								</tr>
								</thead>
								<tbody>
									<?php
										$employee = ""
										$totalReply = mysqli_fetch_assoc($total);

										while($row = mysqli_fetch_array($employee))
										{ ?>
											<tr>
											<td><?php echo $row['id_comment'] ?></td>
											<td><?php echo $row['username'];?></td>
											<td><?php											
												$countText = strlen($row['comment']);
												if ($countText > 50) {
													echo substr($row['comment'], 0, 50).'...';
												}else{
													echo $row['comment'];
												}
												?>
											</td>
											<td><a>
												<img src="<?php echo $row['photo'];?>" height=70 width=100 id=myImg>
												</a>
											</td>								
											<td><?php echo getDateTimeDifferenceString($row['date_comment']);?></td>
											<td>
												<a href="comment-reply?reply=<?php echo $row['id_comment'];?>" class="btn btn-success"><i class="fa fa-comment"></i></a>
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