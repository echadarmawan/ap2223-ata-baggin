<?php
	session_start();
	include 'db.php';

	// Jika tidak ada session pelanggan / belum login, maka dialihkan ke login.php
	if(!isset($_SESSION['pelanggan'])) {
		echo '<script>alert("Anda harus login terlebih dahulu!")</script>';
		echo '<script>window.location="login-pelanggan.php"</script>';
	}
	// Mendapatkan id pelanggan
	$id_pelanggan = $_SESSION['pelanggan']['customer_id'];

	$pelanggan = mysqli_query($conn, "SELECT * FROM tb_customer WHERE customer_id = '$id_pelanggan' ");
	$detail = mysqli_fetch_assoc($pelanggan);
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Profil Pelanggan | Baggin</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<!-- Google Fonts CSS -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comic+Neue&display=swap">
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
</head>
<body>
	<!-- HEADER -->
	<header>
		<div class="container">
		<h1><a href="index.php"><img src="img/icon-logo.png" width="30px" align="center">Baggin</a></abbr></h1>
		<ul>
			<li><a href="produk.php">Products</a></li>
			<li><a href="about-contact.php">About & Contact</a></li>
			<li><a href="https://blognyaecha4.blogspot.com" target="_blank">Blog</a></li>
			<li><a href="keranjang.php"><i class="fas fa-shopping-cart"></i>Cart</a></li>
			<!-- Jika sudah login (terdapat session pelanggan -->
			<?php if(isset($_SESSION['pelanggan'])){ ?>
				<li class="dropdown"><a href="" class="dropbtn">Pelanggan<i class="fas fa-caret-down" style="padding-left: 5px;"></i></a>
					<div class="dropdown-content">
						<a href="profil-pelanggan.php"><i class="fas fa-user" style="padding-right: 10px;"></i>Profil</a>
						<a href="riwayat.php"><i class="fas fa-history" style="padding-right: 10px;"></i>Riwayat Belanja</a>
						<a href="logout-pelanggan.php"><i class="fas fa-sign-out-alt" style="padding-right: 10px;"></i>Logout</a>
					</div>
				</li>
			<!-- Selain itu (belum login) -->
			<?php }else{ ?>
				<li class="dropdown"><a href="" class="dropbtn">Pelanggan<i class="fas fa-caret-down" style="padding-left: 5px;"></i></a>
					<div class="dropdown-content">
						<a href="login-pelanggan.php"><i class="fas fa-sign-in-alt" style="padding-right: 10px;"></i>Login</a>
						<a href="daftar-pelanggan.php"><i class="fas fa-user-plus" style="padding-right: 10px;"></i>Signup</a>
					</div>
				</li>
			<?php } ?>
		</ul>
		</div>
	</header>

	<!-- PROFIL PELANGGAN -->
	<div class="section">
		<div class="container">
			<h1>Profil Pelanggan</h1>
			<div class="box">
				<h2>Selamat datang, <?php echo $detail['customer_name'] ?>!</h2>
				<!-- <pre style="background-color: whitesmoke;"><?php // echo print_r($detail)?></pre> -->
			</div>
			<div class="box">
				<form action="" method="POST">
					<label for="nama">Nama Lengkap</label>
					<input type="text" name="nama" placeholder="Nama Lengkap" class="input-control" value="<?php echo $detail['customer_name'] ?>" required>
					<label for="email">Email</label>
					<input type="email" name="email" placeholder="Email" class="input-control" value="<?php echo $detail['customer_email'] ?>" required>
					<label for="telp">Nomor Telepon</label>
					<input type="text" name="telp" placeholder="Nomor Telepon" class="input-control" value="<?php echo $detail['customer_telp'] ?>" required>
					<label for="alamat">Alamat Lengkap</label>
					<textarea class="input-control" name="alamat" placeholder="Alamat" required><?php echo $detail['customer_address'] ?></textarea><br>
					<input type="submit" name="submit" value="Ubah Profil" class="btn" style="color: white;">
				</form>
				<?php  
					if(isset($_POST['submit'])) {
						$nama 	= ucwords($_POST['nama']);
						$email 	= $_POST['email'];
						$telp 	= $_POST['telp'];
						$alamat = $_POST['alamat'];

						// Mengupdate data pada tabel pelanggan
						$update = mysqli_query($conn, "UPDATE tb_customer SET 
										customer_name = '".$nama."',
										customer_email = '".$email."',
										customer_telp = '".$telp."',
										customer_address = '".$alamat."' 
										WHERE customer_id = '".$id_pelanggan."' ");
						if($update) {
							echo '<script>alert("Ubah data berhasil")</script>';
							echo '<script>window.location="profil-pelanggan.php"</script>';
						}else{
							echo 'Gagal '.mysql_error($conn);
						}
					}
				?>
			</div>

			<h3>Ubah Password</h3>
			<div class="box">
				<form action="" method="POST">
					<input type="password" name="pass1" placeholder="Password Baru" class="input-control" required>
					<input type="password" name="pass2" placeholder="Konfirmasi Password Baru" class="input-control" required>
					<input type="submit" name="ubah_password" value="Ubah Password" class="btn">
				</form>
				<?php  
					if(isset($_POST['ubah_password'])) {
						$pass1 	= $_POST['pass1'];
						$pass2 = $_POST['pass2'];

						if($pass2 != $pass1) {
							echo '<script>alert("Konfirmasi password baru tidak sesuai")</script>';
						}else{
							$u_pass = mysqli_query($conn, "UPDATE tb_customer SET 
										customer_pass = '".md5($pass1)."' 
										WHERE customer_id = '".$id_pelanggan."' ");
							if($u_pass) {
								echo '<script>alert("Ubah data berhasil")</script>';
								echo '<script>window.location="profil-pelanggan.php"</script>';
							}else{
								echo 'Gagal '.mysql_error($conn);
							}
						}
					}
				?>
			</div>
		</div>
	</div>

	<!-- footer -->
	<footer>
		<div class="footer-content">
            <h3><img src="img/icon-logo.png" width="30px">Baggin</h3>
            <p>Sebuah toko online yang menjual berbagai macam tas untuk semua kalangan, baik untuk anak-anak maupun dewasa, pria maupun wanita, dengan harga terjangkau. Namun situs ini hanya berfungsi sebagai katalog. Jika ada yang berniat membeli atau tertarik dengan toko kami, pembeli dapat menghubungi nomor WhatsApp yang tercantum.</p>
            <ul class="socials">
                <li><a href="https://api.whatsapp.com/send?phone=6281213706799&text=Halo, saya tertarik dengan toko Anda. Bisakah kita membahasnya lebih jauh?" target="_blank"><i class="fab fa-whatsapp"></i></a></li>
                <li><a href="https://www.instagram.com/ansosbego_/" target="_blank"><i class="fab fa-instagram"></i></a></li>
                <li><a href="mailto:shivaaaulll@gmail.com?subject=Permintaan%20Berlangganan%20Toko%20Baggin&body=Halo%2C%20saya%20%5Bnama%5D%20dan%20tertarik%20dengan%20toko%20Anda.%20Bisakah%20kita%20membahasnya%20lebih%20jauh%3F" target="_blank"><i class="fas fa-envelope"></i></a></li>
                <li><a href="https://blognyaecha4.blogspot.com" target="_blank"><i class="fab fa-blogger"></i></a></li>
            </ul>
        </div>
        <div class="footer-bottom">
            <p>Copyright &copy; 2023 - Baggin.</p>
                    <div class="footer-menu">
                      <ul class="f-menu">
                        <li><a href="index.php">Home</a></li>
                        <li><a href="about-contact.php">About & Contact</a></li>
                        <li><a href="https://blognyaecha4.blogspot.com" target="_blank">Blog</a></li>
                      </ul>
                    </div>
        </div>
	</footer>
</body>
</html>