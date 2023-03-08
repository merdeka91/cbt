<?php
	//$koneksi = mysqli_connect("localhost","root","","zyacbt");
	$koneksi = mysqli_connect("localhost","root","","zyacbt_all");
	if (mysqli_connect_errno()){
		echo "Koneksi database gagal : " . mysqli_connect_error();
	}
	$data = mysqli_query($koneksi,"select * from cbt_user");
	while($d = mysqli_fetch_array($data)){
		if($d['user_detail'] == 0){
			$id = $d['user_id'];
			mysqli_query($koneksi,"update cbt_user set user_detail='1' where user_id='$id'");
		}
		else if($d['user_detail'] == 1){
			$id = $d['user_id'];
			mysqli_query($koneksi,"update cbt_user set user_detail='0' where user_id='$id'");
		}

	}
	echo "Sukses";
?>