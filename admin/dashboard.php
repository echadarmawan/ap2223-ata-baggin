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
	<title>Dashboard - Admin | Baggin</title>
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
	
	<!-- content -->
	<div class="section">
		<div class="container">
			<h3>Dashboard</h3>
			<div class="box">
				<h2>Selamat Datang <?php echo $_SESSION['admin_global']->admin_name ?> di Halaman Admin Toko Baggin.</h2>
				<br>
				<p><a href="tambah-admin.php" style="color: #A140E8; font-weight: bold;"><img src="../img/icon-add.png" width="30px" align="center">Tambah Admin</a></p>
				<table border="1" cellspacing="0" class="table">
					<thead>
						<tr>
							<th width="60px">No</th>
							<th>Nama Admin</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php  
							$no = 1;
							$admin = mysqli_query($conn, "SELECT * FROM tb_admin ORDER BY admin_id ASC");
							while($row = mysqli_fetch_array($admin)){
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td><?php echo $row['admin_name'] ?></td>
							<td align="center">
								<a href="proses-hapus.php?ida=<?php echo $row['admin_id'] ?>" onclick="return confirm('Yakin ingin menghapus?')" style="color: red; font-weight: bold;">Hapus</a>
							</td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
				<br>
				<h2><a href="../index.php" target="_blank">Go to <i class="fas fa-home"></i></a></h2>
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