<?php
	session_start();
	include '../db.php';
	if($_SESSION['status_login'] != true){
		echo '<script>window.location="login.php"</script>';
	}

	$admin = mysqli_query($conn, "SELECT * FROM tb_admin");
	// Membatasi jumlah admin
	if(mysqli_num_rows($admin) >= 3) {
		echo '<script>alert("Anda tidak bisa menambah admin. Jumlah admin sudah penuh.")</script>';
		echo '<script>window.location="dashboard.php"</script>';
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Tambah Admin - Admin | Baggin</title>
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
			<h3>Tambah Admin</h3>
			<div class="box">
				<form action="" method="POST">
					<input type="text" name="nama" placeholder="Nama Admin" class="input-control" required>
					<input type="text" name="user" placeholder="Username" class="input-control" required>
					<input type="text" name="hp" placeholder="Nomor Telepon" class="input-control" required>
					<input type="email" name="email" placeholder="Email" class="input-control" required>
					<input type="text" name="alamat" placeholder="Alamat" class="input-control" required>
					<input type="text" name="pass1" placeholder="Password" class="input-control" required>
					<input type="password" name="pass2" placeholder="Konfirmasi Password" class="input-control" required>
					<input type="submit" name="submit" value="Tambah Admin" class="btn">
				</form>
				<?php  
					if(isset($_POST['submit'])) {
						$nama 	= ucwords($_POST['nama']);
						$user 	= $_POST['user'];
						$hp 	= $_POST['hp'];
						$email 	= $_POST['email'];
						$alamat = $_POST['alamat'];
						$pass1 	= $_POST['pass1'];
						$pass2 = $_POST['pass2'];

						// mengecek apakah email sudah digunakan
						$cek = mysqli_query($conn, "SELECT * FROM tb_admin WHERE username = '".$user."' ");
						if(mysqli_num_rows($cek) == 1){
							echo '<script>alert("Pendaftaran gagal. Username sudah dgunakan. Mohon gunakan username lain.")</script>';
						}else{
							// mengecek apakah konfirmasi password sesuai dan jika sesuai maka data akan dimasukkan ke dalam database
							if($pass2 != $pass1) {
								echo '<script>alert("Konfirmasi password tidak sesuai")</script>';
							}else{
								// Memasukkan data ke dalam ke dalam database tb_customer
								$insert = mysqli_query($conn, "INSERT INTO tb_admin VALUES ( 
									null,
									'".$nama."',
									'".$user."',
									'".md5($pass1)."',
									'".$hp."',
									'".$email."',
									'".$alamat."'
								) ");
								if($insert) {
									echo '<script>alert("Tambah admin berhasil")</script>';
									echo '<script>window.location="dashboard.php"</script>';
								}else{
									echo 'Gagal '.mysql_error($conn);
								}
							}
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