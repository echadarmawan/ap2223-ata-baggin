<?php 
	session_start();
	error_reporting(0);
	include 'db.php';

	$id_produk = $_GET['id'];

	// $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id = '".$_GET['id']."' ");
	$produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id = '$id_produk' ");
	$p = mysqli_fetch_object($produk);
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detail Produk | Baggin</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<!-- Google Fonts CSS -->
	<link href="https://fonts.googleapis.com/css2?family=Comic+Neue&display=swap" rel="stylesheet">
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
		</div>
	</header>

	<!-- SEARCH -->
	<div class="search">
		<div class="container">
			<form action="produk.php">
				<input type="text" name="search" placeholder="Cari Produk" value="<?php echo $_GET['search'] ?>">
				<input type="hidden" name="kat" value="<?php echo $_GET['kat'] ?>">
				<input type="submit" name="cari" value="Cari Produk">
			</form>
		</div>
	</div>

	<!-- PRODUCT DETAIL -->
	<div class="section">
		<div class="container">
			<h3>Detail Produk</h3>
			<div class="box">
				<div class="col-2">
					<img src="produk/<?php echo $p->product_image ?>" width="100%">
				</div>
				<div class="col-2">
					<h2><?php echo ucwords($p->product_name) ?></h2>
					<h3>Rp<?php echo number_format($p->product_price) ?></h3>
					<p>Deskripsi: <br>
						<?php echo $p->product_description ?>
					</p>
					<p>Jika berminat, klik beli atau bisa hubungi via:</p>
					<form action="" method="POST">
						<input type="number" min="1" max="10" class="form-control" name="jumlah" placeholder="pilih kuantitas" required>
						<input type="submit" name="beli" value="Beli" class="btn" style="width: 10%; color: white;">
						<a href="https://t.me/komputertips" target="_blank"><img src="img/telegram-icon.png" width="40px" align="right"></a>
						<a href="https://api.whatsapp.com/send?phone=6281213706799&text=Halo, saya tertarik dengan produk Anda, yaitu produk [sebutkan nama produk]." target="_blank"><img src="img/whatsapp-icon.png" width="40px" align="right"></a>
					</form>
					<!-- <a href="beli.php?id=<?php // echo $p->product_id ?>" class="btn" style="color: white;">Beli</a> -->
					<!-- <a href="https://api.whatsapp.com/send?phone=6281213706799&text=Halo, saya tertarik dengan produk Anda, yaitu produk [sebutkan nama produk]." target="_blank"><img src="img/whatsapp-icon.png" width="40px" align="center"></a>
					<a href="https://t.me/komputertips" target="_blank"><img src="img/telegram-icon.png" width="40px" align="center"></a> -->
					<?php
					// Jika tombol beli ditekan
					if(isset($_POST['beli'])) {
						//mendapatkan jumlah yang yang diinputkan
						$jumlah = $_POST['jumlah'];

						$_SESSION['keranjang'][$id_produk] = $jumlah;

						echo '<script>alert("Produk telah ditambahkan ke keranjang")</script>';
						echo '<script>window.location="keranjang.php"</script>';
					}
					?>
				</div>
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