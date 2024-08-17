<?php
	session_start();
	include 'db.php';

	if(empty($_SESSION['keranjang']) OR !isset($_SESSION['keranjang'])) {
		echo '<script>alert("Keranjang kosong. Silakan berbelanja terlebih dahulu.")</script>';
		echo '<script>window.location="index.php"</script>';
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Keranjang Belanja | Baggin</title>
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

	<!-- KERANJANG -->
	<div class="section">
		<div class="container">
			<h1>Keranjang Belanja</h1>
			<div class="box">
				<table border="1" cellspacing="0" class="table" style="margin-bottom: 20px;">
					<thead>
						<tr>
							<th>No</th>
							<th width="500px">Nama Produk</th>
							<th>Harga</th>
							<th>Jumlah</th>
							<th>Subtotal</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 1 ?>
						<?php foreach ($_SESSION['keranjang'] as $product_id => $product_quantity) { ?>	
						<!-- Menampilkan produk yang sedang diperulangkan berdasarkan id produk -->
						<?php
							$ambil = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id='$product_id' ");
							$pecah = mysqli_fetch_assoc($ambil);
							$subharga = $pecah['product_price']*$product_quantity;
						?> 
							<tr>
								<td><?php echo $no ?></td>
								<td><a href="detail-produk.php?id=<?php echo $product_id ?>" style="cursor: pointer;"><?php echo ucwords($pecah['product_name']) ?></a></td>
								<td>Rp<?php echo number_format($pecah['product_price']) ?></td>
								<td><?php echo $product_quantity ?></td>
								<td>Rp<?php echo number_format($subharga)?></td>
								<td align="center">
									<button><a href="beli-kurang.php?id=<?php echo $product_id ?>"><i class="fas fa-minus fa-lg" style="font-size: 180%;"></i></button>
									<button><a href="beli.php?id=<?php echo $product_id ?>"><i class="fas fa-plus fa-lg" style="font-size: 180%;"></i></a></button>
									<a href="hapus-keranjang.php?id=<?php echo $product_id ?>" onclick="return confirm('Yakin ingin menghapus barang dari keranjang?')" class="btn-button" style="background-color: red;">Hapus</a>
								</td>
							</tr>
						<?php $no++ ?>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
		<div class="container">
			<a href="produk.php" class="btn" style="background-color: lightgray;">Lanjutkan Belanja</a>
			<a href="checkout.php" class="btn" style="color: white;">Checkout</a>
		</div>
	</div>

	<!-- Untuk melihat array produk yang dimasukkan ke keranjang -->
<!-- 	<div class="section">
		<div class="container">
			<div class="box">
				<pre>
					<?php // print_r($_SESSION['keranjang']); ?>
				</pre>
			</div>
		</div>
	</div> -->
	<!-- Nanti akan dihapus -->

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