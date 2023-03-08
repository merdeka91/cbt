<?php
	//$koneksi = mysqli_connect("localhost","root","","zyacbt");
	$koneksi = mysqli_connect("localhost","root","","zyacbt_all");
	if (mysqli_connect_errno()){
		echo "Koneksi database gagal : " . mysqli_connect_error();
	}
	$data = mysqli_query($koneksi,"select * from cbt_tes");
	while($d = mysqli_fetch_array($data)){
		$arr = explode(" ", $d['tes_begin_time']);;
		
		if($arr[1] == "07:00:00"){
			$id = $d['tes_id'];
			$jb = $arr[0]." 11:00:00";
			mysqli_query($koneksi,"update cbt_tes set tes_begin_time='$jb' where tes_id='$id'");
		}
		else if($arr[1] == "08:10:00"){
			$id = $d['tes_id'];
			$jb = $arr[0]." 12:40:00";
			mysqli_query($koneksi,"update cbt_tes set tes_begin_time='$jb' where tes_id='$id'");
		}
		else if($arr[1] == "09:20:00"){
			$id = $d['tes_id'];
			$jb = $arr[0]." 13:50:00";
			mysqli_query($koneksi,"update cbt_tes set tes_begin_time='$jb' where tes_id='$id'");
		}		
	}
	echo "Sukses";
?>