<?php include 'include/header.php';?>
<body>
	<div class="container">
	<div class="mx-auto col-sm-12 main-section" id="myTab" role="tablist">
		<?php include 'include/child-tab.php';?>
		<div class="tab-content" id="myTabContent">	
			<div role="tabpanel">
				<div class="card">
					<div class="card-header">
						<h4>Add Author</h4>
					</div>
					<div class="card-body">
						<form class="form" role="form" method="post" action="action/add_author.php" enctype="multipart/form-data" autocomplete="off">
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Name</label>
								<div class="col-lg-9">
									<input class="form-control" name="name">
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