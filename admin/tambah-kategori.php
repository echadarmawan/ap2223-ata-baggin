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
	<title>Tambah Kategori - Admin | Baggin</title>
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
			<h3>Tambah Data Kategori</h3>
			<div class="box">
				<form action="" method="POST">
					<input type="text" name="nama" placeholder="Nama Kategori" class="input-control" required>
					<input type="submit" name="submit" value="Submit" class="btn">
				</form>
				<?php 
					if(isset($_POST['submit'])) {
						$nama = ucwords($_POST['nama']);

						$insert = mysqli_query($conn, "INSERT INTO tb_category VALUES (
											null,
											'".$nama."') ");
						if($insert) {
							echo '<script>alert("Tambah data berhasil")</script>';
							echo '<script>window.location="data-kategori.php"</script>';
						}else{
							echo 'Gagal'.mysqli_error($conn);
						}
					}
				?>
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