<?php
	session_start();
	include 'db.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Lupa Password | Baggin</title>
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
			<li class="dropdown"><a href="" class="dropbtn">Pelanggan<i class="fas fa-caret-down" style="padding-left: 5px;"></i></a>
				<div class="dropdown-content">
					<a href="login-pelanggan.php"><i class="fas fa-sign-in-alt" style="padding-right: 10px;"></i>Login</a>
					<a href="daftar-pelanggan.php"><i class="fas fa-user-plus" style="padding-right: 10px;"></i>Signup</a>
				</div>
			</li>
		</ul>
		</div>
	</header>

	<!-- LUPA PASSWORD -->
	<div id="bg-login">
		<div class="box-login" style="width: 400px;">
			<h2>Lupa Password</h2>
			<form action="" method="POST">
				<label for="email"><b>Email</b></label>
					<input type="email" name="email" placeholder="Masukkan Username" class="input-control" required>
				<label for="pass1"><b>Password</b></label>
					<input type="text" name="pass1" placeholder="Masukkan Password" class="input-control" required>
				<label for="pass2"><b>Konfirmasi Password</b></label>
					<input type="password" name="pass2" placeholder="Konfirmasi Password" class="input-control" required>
				<input type="submit" name="submit" value="SUBMIT" class="btn">
			</form>
			<?php 
				if(isset($_POST['submit'])) {
					// lakukan kueri untuk mengecek akun yang ditekan di tabel pelanggan di db
					$email		 = $_POST['email'];
					$pass1		 = $_POST['pass1'];
					$pass2		 = $_POST['pass2'];

					// mengecek apakah email sudah digunakan
					$cek = mysqli_query($conn, "SELECT * FROM tb_customer WHERE customer_email = '".$email."' ");
					if(mysqli_num_rows($cek) == 1){
						if($pass2 != $pass1) {
							echo '<script>alert("Konfirmasi password tidak sesuai")</script>';
						}else{
							// Mengupdate data ke dalam ke dalam database tb_customer
							$update = mysqli_query($conn, "UPDATE tb_customer SET customer_pass = '".md5($pass1)."' WHERE customer_email = '".$email."' ");
							echo '<script>alert("Update password berhasil. Silakan login!")</script>';
							echo '<script>window.location="login-pelanggan.php"</script>';
						}
					}else{
						echo '<script>alert("Email yang Anda masukkan tidak terdaftar!")</script>';
					}
				}
			?>
		</div>
	</div>
</body>
	<!-- Fontawesome JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
</html>