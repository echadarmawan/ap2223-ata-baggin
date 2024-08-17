<?php
	session_start();
	include 'db.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Daftar Pelanggan | Baggin</title>
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
			<li><a href="login-pelanggan.php"><i class="fas fa-sign-in-alt" style="padding-right: 5px;"></i>Login</a></li>
		</ul>
		</div>
	</header>

	<!-- DAFTAR PELANGGAN -->
	<div class="section">
		<div class="container" method="POST">
			<h1>Daftar Pelanggan</h1>
			<div class="box">
				Lorem ipsum dolor sit amet consectetur adipisicing, elit. Explicabo ipsum alias dolor doloremque quis! Explicabo porro autem sunt, laborum nostrum doloribus quibusdam sapiente aperiam, distinctio architecto est optio repellendus magnam.
			</div>
			<div class="box">
				<form action="" method="POST">
					<input type="text" name="nama" placeholder="Nama Lengkap" class="input-control" value="" required>
					<input type="email" name="email" placeholder="Email" class="input-control" value="" required>
					<input type="text" name="telp" placeholder="Nomor Telepon" class="input-control" value="" required>
					<textarea class="input-control" name="alamat" placeholder="Alamat" required></textarea><br>
					<input type="text" name="pass1" placeholder="Password" class="input-control" value="" required>
					<input type="password" name="pass2" placeholder="Konfirmasi Password" class="input-control" value="" required>
					<input type="submit" name="submit" value="DAFTAR SEKARANG" class="btn" style="color: white;">
				</form>
				<!-- Jika tombol submit ditekan -->
				<?php 
				if(isset($_POST['submit'])) {
					$nama		 = $_POST['nama'];
					$email		 = $_POST['email'];
					$telp		 = $_POST['telp'];
					$alamat		 = $_POST['alamat'];
					$pass1		 = $_POST['pass1'];
					$pass2		 = $_POST['pass2'];

					// mengecek apakah email sudah digunakan
					$cek = mysqli_query($conn, "SELECT * FROM tb_customer WHERE customer_email = '".$email."' ");
					if(mysqli_num_rows($cek) == 1){
						echo '<script>alert("Pendaftaran gagal. Email sudah dgunakan. Mohon gunakan email lain.")</script>';
					}else{
						// mengecek apakah konfirmasi password sesuai dan jika sesuai maka data akan dimasukkan ke dalam database
						if($pass2 != $pass1) {
							echo '<script>alert("Konfirmasi password tidak sesuai")</script>';
						}else{
							// Memasukkan data ke dalam ke dalam database tb_customer
							$insert = mysqli_query($conn, "INSERT INTO tb_customer VALUES (
									null,
									'".$email."',
									'".md5($pass1)."',
									'".$nama."',
									'".$telp."',
									'".$alamat."'
							) ");
							echo '<script>alert("Pendaftaran berhasil. Silakan login!")</script>';
							echo '<script>window.location="login-pelanggan.php"</script>';
						}
					}
				}
				?>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
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
<!-- Fontawesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
</html>