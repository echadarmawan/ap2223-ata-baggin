<?php
	session_start();
	include 'db.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login Pelanggan | Baggin</title>
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
			<li><a href="daftar-pelanggan.php"><i class="fas fa-user-plus" style="padding-right: 5px;"></i>Signup</a></li>
		</ul>
		</div>
	</header>

	<!-- LOGIN PELANGGAN -->
	<div id="bg-login">
		<div class="box-login" style="width: 400px;">
			<h2>LOGIN</h2>
			<form action="" method="POST">
				<label for="email"><b>Email</b></label>
					<input type="email" name="email" placeholder="Masukkan Email" class="input-control">
				<label for="pass"><b>Password</b></label>
					<input type="password" name="pass" placeholder="Masukkan Password" class="input-control">
				<input type="submit" name="submit" value="LOGIN" class="btn">
				<label>
					<input type="checkbox" checked="checked" name="remember" style="margin-top: 10px;"> Remember me
				</label>
			</form>
			<div class="register-forget opacity">
				<a href="daftar-pelanggan.php" style="color: royalblue; text-decoration: underline; font-weight: bold;">Daftar</a>
				<a href="lupa-password.php" style="color: green; text-decoration: underline; font-weight: bold;">Lupa Password?</a>
			</div>
			<?php 
			// Jika button login di tekan
			if(isset($_POST['submit'])){
				// lakukan kueri untuk mengecek akun yang ditekan di tabel pelanggan di db
				$email = mysqli_real_escape_string($conn, $_POST['email']);
				$pass = mysqli_real_escape_string($conn, $_POST['pass']);

				$cek = mysqli_query($conn, "SELECT * FROM tb_customer WHERE customer_email = '".$email."' AND customer_pass = '".md5($pass)."'");

				// Menghitung akun yang terambil
				$akuncocok = mysqli_num_rows($cek);

				// Jika ada 1 akun yang cocok, maka akan diloginkan
				if($akuncocok == 1) {
					// Jika sukses login dan akan mendapatkan akun dalam bentuk array
					$akun = mysqli_fetch_assoc($cek);
					// Simpan di session pelanggan;
					$_SESSION['pelanggan'] = $akun;
					echo '<script>alert("Anda berhasil login!")</script>';
					echo '<script>window.location="keranjang.php"</script>';
				}else{
					echo '<script>alert("Email atau password Anda salah!")</script>';
				}
			}
		?>
		</div>
	</div>
</body>
	<!-- Fontawesome JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
</html>