<html>
<head>
	<title>Quit</title>
</head>
<body>
	<h3> Data Aktivitas Keluar dari Aplikasi </h3>
	<br/>
	<table border="1">
		<tr>
			<th>NO</th>
			<th>Kelas</th>
			<th>Nama</th>
			<th>Waktu</th>
		</tr>
		<?php 
		$koneksi = mysqli_connect("localhost","root","","zyacbt_all");
		$no = 1;
		$data = mysqli_query($koneksi,"select * from tes");
		while($d = mysqli_fetch_array($data)){
			?>
			<tr>
				<td><?php echo $no++; ?></td>
				<td><?php echo $d['kelas']; ?></td>
				<td><?php echo $d['nama']; ?></td>
				<td><?php echo $d['waktu']; ?></td>
			</tr>
			<?php 
		}
		?>
	</table>
</body>
</html>