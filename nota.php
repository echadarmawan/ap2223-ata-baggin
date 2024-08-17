<?php
	session_start();
	include 'db.php';

	// Jika tidak ada session pelanggan / belum login, maka dialihkan ke login.php
	if(!isset($_SESSION['pelanggan'])) {
		echo '<script>alert("Anda harus login terlebih dahulu!")</script>';
		echo '<script>window.location="login-pelanggan.php"</script>';
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Nota Pembelian | Baggin</title>
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

	<!-- DETAIL PEMBELIAN -->
	<div class="section">
		<div class="container">
			<h1>Detail Pembelian</h1>
			<div class="box">
				<?php
					$ambil = mysqli_query($conn, "SELECT * FROM tb_purchase JOIN tb_customer ON tb_purchase.customer_id = tb_customer.customer_id WHERE tb_purchase.purchase_id = '".$_GET['id']."' ");
					$detail = mysqli_fetch_assoc($ambil);
				?>

				<!-- <h3>Data orang yang beli di $detail</h3>
					<pre style="background-color: #f8f8f8"><?php // print_r($detail); ?></pre> -->

				<!-- <h3>Data orang yang login di $_SESSION</h3>
					<pre style="background-color: #f8f8f8"><?php // print_r($_SESSION); ?></pre> -->

				<!-- Jika pelanggan yang beli tidak sama dengan pelanggan yang login, maka akan dilarikan ke riwayat.php karena dia tidak berhak melihat nota orang lain. -->
				<!-- Pelanggan yang beli harus pelanggan yang login. -->
				<?php 
					// Mendapatkan id pelanggan yang beli
					$pelangganbeli = $detail['customer_id'];
					// Mendapatkan id pelanggan yang login
					$pelangganlogin = $_SESSION['pelanggan']['customer_id'];

					if($pelangganbeli !== $pelangganlogin) {
						echo '<script>alert("Hayo kamu ngapain ngintip nota orang lain?")</script>';
						echo '<script>window.location="riwayat.php"</script>';
						exit();
					}
				?>

				<div class="col-3" style="min-height: 150px; text-align: left; border-block: unset;">
					<h3>Pembelian</h3>
					<strong>No. Pembelian: <?php echo $detail['purchase_id']; ?></strong> <br>
					<p>
						Tanggal: <?php echo date("d F Y", strtotime($detail['purchase_date'])); ?> <br>
						Total: Rp<?php echo number_format($detail['purchase_total']); ?>
					</p>
				</div>
				<div class="col-3" style="min-height: 150px; text-align: left; border-block: unset;">
					<h3>Pelanggan</h3>
					<strong><?php echo $detail['customer_name']; ?></strong> <br>
					<p>
						<?php echo $detail['customer_telp']; ?> <br>
						<?php echo $detail['customer_email']; ?>
					</p>
				</div>
				<div class="col-3" style="min-height: 150px; text-align: left; border-block: unset;">
					<h3>Jasa Pengiriman</h3>
					<strong><?php echo $detail['shipping_service']; ?></strong> <br>
					<p>Ongkos Kirim: Rp<?php echo number_format($detail['shipping_rates']) ?></p>
					<p>Alamat: <?php echo $detail['shipping_address']; ?></p>
				</div>

				<table border="1" cellspacing="0" class="table">
					<thead>
						<tr>
							<th>No</th>
							<th>Nama Produk</th>
							<th>Harga</th>
							<th>Jumlah</th>
							<th>Subtotal</th>
						</tr>
					</thead>
					<tbody>
						<?php  
							$no = 1;
							$ambil = mysqli_query($conn, "SELECT * FROM tb_product_purchase WHERE purchase_id = '".$_GET['id']."' ");
							if(mysqli_num_rows($ambil) > 0) {
							while($pecah = mysqli_fetch_assoc($ambil)){
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td><?php echo $pecah['product_name'] ?></td>
							<td>Rp<?php echo number_format($pecah['product_price']) ?></td>
							<td><?php echo $pecah['product_quantity'] ?></td>
							<td>Rp<?php echo number_format($pecah['sub_price']) ?></td>
						</tr>
						<?php }}else{ ?>
							<tr>
								<td colspan="5" align="center">Tidak ada data</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>

			<div class="box">
				<div class="col-2" style="min-height: 100px; background-color: lightblue;">
					<p>Silahkan melakukan pembayaran sebesar Rp<?php echo number_format($detail['purchase_total']); ?> ke <br>
						<strong> BANK ABC XXXX-XXXX-XXXX a.n. Keshia DPD</strong></p>
				</div>
				<div class="col-2" style="min-height: 100px;">
					<table class="horizontal">
						<tr>
							<th>Total</th>
							<td>Rp<?php echo number_format($detail['purchase_total'])?></td>
						</tr>
						<tr>
							<th>Status</th>
							<td><?php echo $detail['purchase_state'] ?></td>
						</tr>
					</table>
				</div>
			</div>

		</div>
	</div>
	<!-- AKHIR DETAIL PEMBELIAN -->

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