<?php
	session_start();
	include '../db.php';
	if($_SESSION['status_login'] != true){
		echo '<script>window.location="login.php"</script>';
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Data Pelanggan - Admin | Baggin</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<!-- Google Fonts CSS -->
	<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comic+Neue&display=swap"> -->
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
</head>
<body>
	<!-- header -->
	<header>
		<div class="container">
		<h1><a href="dashboard.php">Baggin</a></abbr></h1>
		<ul>
			<li><a href="dashboard.php">Dashboard</a></li>
			<li><a href="profil.php">Profil</a></li>
			<li><a href="data-kategori.php">Data Kategori</a></li>
			<li><a href="data-produk.php">Data Produk</a></li>
			<li class="dropdown"><a href="" class="dropbtn">Lainnya<i class="fas fa-caret-down" style="padding-left: 5px;"></i></a>
				<div class="dropdown-content">
				    <a href="data-pelanggan.php">Data Pelanggan</a>
				    <a href="data-pembelian.php">Data Pembelian</a>
				    <a href="laporan.php">Laporan</a>
			    </div>
			</li>
			<li><a href="logout.php">Keluar</a></li>
		</ul>
		</div>
	</header>

	<!-- SEARCH -->
	<div class="search">
		<div class="container">
			<form action="data-pelanggan.php" method="GET">
				<input type="text" name="search" placeholder="Cari Pelanggan">
				<input type="submit" name="cari" value="Cari Pelanggan">
			</form><br>
			<?php 
			if(isset($_GET['search'])){
				$search = $_GET['search'];
				echo "<b>Hasil pencarian : '".$search."' </b>";
			}
			?>
		</div>
	</div>

	<!-- content -->
	<div class="section">
		<div class="container">
			<h2>Data Pelanggan</h2>
			<div class="box">
				<table border="1" cellspacing="0" class="table">
					<thead>
						<tr>
							<th width="40px">No</th>
							<th>Nama Pelanggan</th>
							<th width="250px">Email</th>
							<th width="100px">Telepon</th>
							<th>Alamat</th>
							<th width="60px">Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php  
						// Melakukan pencarian berdasarkan nama pelanggan atau email pelanggan.
						if(isset($_GET['search'])) {
							$search = $_GET['search'];
							$pelanggan = mysqli_query($conn, "SELECT * FROM tb_customer WHERE customer_name LIKE '%".$search."%' OR customer_email LIKE '%".$search."%' ORDER BY customer_id DESC");
						}else{
							// Jika tidak melakukan pencarian. Jika tidak ingin fitur pencarian, hapus div.search dan pengkodisian di atas, pindahkan baris di bawah ke penginisiasian nomor. Sehingga setelah <?php, terdapat $no = 1 dan $pelanggan.
							$pelanggan = mysqli_query($conn, "SELECT * FROM tb_customer ORDER BY customer_id DESC");
						}
							$no = 1;
							if(mysqli_num_rows($pelanggan) > 0) {
							while($row = mysqli_fetch_array($pelanggan)){
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td><?php echo $row['customer_name'] ?></td>
							<td><?php echo $row['customer_email'] ?></td>
							<td><?php echo $row['customer_telp'] ?></td>
							<td><?php echo $row['customer_address'] ?></td>
							<td>
								<a href="proses-hapus.php?idc=<?php echo $row['customer_id'] ?>" onclick="return confirm('Yakin ingin menghapus?')" style="color: red; font-weight: bold;">Hapus</a>
							</td>
						</tr>
						<?php }}else{ ?>
							<tr>
								<td colspan="6">Tidak ada data</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
				<!-- Jika ingin membuat pagination -->
				<div class="center">
					<div class="pagination">
						<a href="#">&laquo;</a>
						<a href="#">&lt;</a>
						<a href="#" class="active">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">...</a>
						<a href="#">&gt;</a>
						<a href="#">&raquo;</a>
	  				</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<footer>
		<div class="container">
			<small>Copyright &copy; 2023 - Baggin.</small>
		</div>
	</footer>
</body>
</html>