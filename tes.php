<?php
	header("Refresh:2; url=index.php/welcome/logout");
	$koneksi = mysqli_connect("localhost","root","","zyacbt_all");
	$kelas = $_GET['a'];
	$nama = $_GET['b'];
	date_default_timezone_set('Asia/Jakarta');
	$time = date('d-m-Y  h:i:s');
	mysqli_query($koneksi,"INSERT INTO `tes` (`kelas`, `nama`, `waktu`) VALUES ('$kelas', '$nama', '$time')");
	
	$datakelas = array("X IPA 1", "X IPA 2", "X IPA 3", "X IPA 4","X IPA 5", "X IPA 6", "X IPA 7", "X IPA 8","X IPA 9", "X IPS 2", "X IPS 3", "X IPS 1");

	if (in_array($kelas, $datakelas)){
		mysqli_query($koneksi,"update cbt_user set user_detail='7' where user_id='$nipd'");
	}
	
	
	//echo "<center><h3> Jangan Curang! </h3>";
	echo "<center><h3> Anda terdeteksi keluar dari aplikasi CBT </h3>";
	echo "<h2> Aktivitas anda tercatat di server! </h2><br/>";
	echo "<a href='index.php/welcome/logout'> Klik untuk kembali </a></center";
?>
