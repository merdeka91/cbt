<?php
	//$koneksi = mysqli_connect("localhost","root","","zyacbt");
	$koneksi = mysqli_connect("localhost","sman1garut","dbpass1Garut","zyacbt");
	if (mysqli_connect_errno()){
		echo "Koneksi database gagal : " . mysqli_connect_error();
	}
	mysqli_query($koneksi,"UPDATE `cbt_user` SET `user_detail`='0' WHERE (`user_grup_id`>'300')");
	echo "Sukses";
?>