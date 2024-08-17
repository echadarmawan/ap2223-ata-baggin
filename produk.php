<?php 
	session_start();
	error_reporting(0);
	include 'db.php';
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Produk | Baggin</title>
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

	<!-- PRODUCTS -->
	<div class="section">
		<div class="container">
			<h1>Produk</h1>
			<div class="box">
				<?php
					$where = ""; // Menginisialisasi variabel $where
					if ($_GET['search'] != '' || $_GET['kat'] != '') {
    					$where = "WHERE product_status = 1"; // Menambahkan kondisi awal

    					if ($_GET['search'] != '') {
        					$where .= " AND product_name LIKE '%" . $_GET['search'] . "%'"; // Menambahkan kondisi pencarian berdasarkan nama produk
    					}

    					if ($_GET['kat'] != '') {
        					$where .= " AND category_id = '" . $_GET['kat'] . "'"; // Menambahkan kondisi pencarian berdasarkan id kategori
    					}
					}

    				$produk = mysqli_query($conn, "SELECT * FROM tb_product $where ORDER BY product_id DESC");
					if(mysqli_num_rows($produk) > 0) {
						while($p = mysqli_fetch_array($produk)){
				?>
					<a href="detail-produk.php?id=<?php echo $p['product_id'] ?>">
						<div class="col-4">
							<img src="produk/<?php echo $p['product_image'] ?>">
							<p class="nama"><?php echo ucwords(substr($p['product_name'], 0, 50)) ?></p>
							<p class="harga">Rp<?php echo number_format($p['product_price']) ?></p>
						</div>
					</a>
				<?php }}else{ ?>
					<p>Produk tidak ada</p>
				<?php } ?>
			</div>
		</div>

		<!-- SOON TO BE PAGINATION -->
		<div class="center">
			<div class="pagination">
				<a href="#">&laquo;</a>
				<a href="#">1</a>
				<a href="#" class="active">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">6</a>
				<a href="#">&raquo;</a>
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