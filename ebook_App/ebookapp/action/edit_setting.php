<?php

	include '../include/connection.php';

	if (isset($_POST['submit'])) {
		$slider = $_POST['slider'];
		$ads = $_POST['ads'];
		$startappaccountid = $_POST['startappaccountid'];
		$androidappid = $_POST['androidappid'];
		$iosappid = $_POST['iosappid'];
		$admobaccount = $_POST['admobreward'];
		$banner = $_POST['banner'];
		$interstisial = $_POST['interstisial'];
		$unitygameid = $_POST['unitygameid'];
		$unitybanner = $_POST['unitybanner'];
		$unityinterstisial = $_POST['unityinterstisial'];
		$unityreward = $_POST['unityreward'];
		$startapplivemode = $_POST['startapplivemode'];
		if(!empty($startapplivemode)){
			foreach($startapplivemode as $valueStartapplivemode){
				
			}
		}
		$unitylivemode = $_POST['unitylivemode'];
		if(!empty($unitylivemode)){
			foreach($unitylivemode as $valueUnityLiveMode){
				
			}
		}

		$query = "UPDATE tbl_setting SET slider = '".$slider."', ads = '".$ads."', startapplivemode = '".$valueStartapplivemode."', startappaccountid = '".$startappaccountid."', androidappid = '".$androidappid."', iosappid = '".$iosappid."', admobreward = '".$admobaccount."', banner = '".$banner."', interstisial = '".$interstisial."', unitylivemode = '".$valueUnityLiveMode."', unitygameid = '".$unitygameid."', unitybanner = '".$unitybanner."', unityinterstisial = '".$unityinterstisial."', unityreward = '".$unityreward."' WHERE id = 1";

		mysqli_query($conn, $query);

		?>
			<script>
				window.location = '../home#setting';
			</script>
		<?php
	}

?>