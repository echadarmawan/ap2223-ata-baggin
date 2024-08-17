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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Checkout | Baggin</title>
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
							<th width="600px">Nama Produk</th>
							<th>Harga</th>
							<th>Jumlah</th>
							<th>Subtotal</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 1 ?>
						<?php $total = 0 ?>
						<?php foreach ($_SESSION['keranjang'] as $product_id => $product_quantity) { ?>	
						<!-- Menampilkan produk yang sedang diperulangkan berdasarkan id produk -->
						<?php
							$ambil = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id='$product_id' ");
							$pecah = mysqli_fetch_assoc($ambil);
							$subharga = $pecah['product_price']*$product_quantity;
						?> 
							<tr>
								<td><?php echo $no ?></td>
								<td><a href="detail-produk.php?id=<?php echo $product_id ?>"><?php echo ucwords($pecah['product_name']) ?></a></td>
								<td>Rp<?php echo number_format($pecah['product_price']) ?></td>
								<td><?php echo $product_quantity ?></td>
								<td>Rp<?php echo number_format($subharga)?></td>
							</tr>
						<?php $no++ ?>
						<?php $total+=$subharga ?>
						<?php } ?>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="4">Total Belanja</th>
							<th>Rp<?php echo number_format($total)?></th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<h1>Informasi Pelanggan</h1>
			<div class="box">
				<form action="" method="POST" enctype="multipart/form-data">
					<label for="nama"><b>Nama</b></label>
					<input type="text" name="nama" class="input-control" readonly value="<?php echo $_SESSION['pelanggan']['customer_name'] ?>">
					<label for="telp"><b>Nomor Telepon</b></label>
					<input type="text" name="telp" class="input-control" readonly value="<?php echo $_SESSION['pelanggan']['customer_telp'] ?>">
					<label for="alamat-pengiriman"><b>Alamat</b></label>
					<textarea class="input-control" name="alamat-pengiriman" title="Tuliskan alamat lengkap dengan template sebagai berikut: Nama Jalan, Nomor Rumah, RT, RW, Kelurahan, Kecamatan, Kota/Kabupaten, Provinsi, Kode Pos" required><?php echo $_SESSION['pelanggan']['customer_address'] ?></textarea><br>
					<select class="input-control" name="id-pengiriman" required>
						<option value="">--Pilih Jasa Pengiriman--</option>
						<?php  
							$pengiriman = mysqli_query($conn, "SELECT * FROM tb_shipping");
							while($kirim = mysqli_fetch_assoc($pengiriman)) {
						?>
						<option value="<?php echo $kirim['shipping_id'] ?>">
							<?php echo $kirim['shipping_service'] ?> -
							Rp<?php echo number_format($kirim['shipping_rates']) ?>
						</option>
						<?php } ?>
					</select>
					<input type="submit" name="checkout" value="Checkout" class="btn" style="color: white;">
					<!-- TEST (Nanti akan dihapus) -->
					<!-- <pre><?php // print_r($_SESSION['pelanggan']) ?></pre>
					<pre><?php // print_r($_SESSION['keranjang']) ?></pre> -->
				</form>
				<?php 
					if(isset($_POST['checkout'])) {
						$customer_id = $_SESSION['pelanggan']['customer_id'];
						$shipping_id = $_POST['id-pengiriman'];
						$purchase_date = date('y-m-d');
						$alamat = $_POST['alamat-pengiriman'];

						$ambil = mysqli_query($conn, "SELECT * FROM tb_shipping WHERE shipping_id = '$shipping_id' ");
						if (mysqli_num_rows($ambil) > 0) {
    						// ada baris data yang cocok
							$arraypengiriman = mysqli_fetch_assoc($ambil);
							$ekspedisi = $arraypengiriman['shipping_service'];
							$tarif = $arraypengiriman['shipping_rates'];
							$purchase_total = $total + $tarif;

							// TEST (Nanti akan dihapus)
							echo "<pre>";
							print_r($purchase_total);
							echo "</pre>";

							// 1. Menyimpan data pada tabel pembelian
							$insert = mysqli_query($conn, "INSERT INTO tb_purchase(customer_id, shipping_id, purchase_date, purchase_total, shipping_service, shipping_rates, shipping_address) VALUES (
								'".$customer_id."',
								'".$shipping_id."',
								'".$purchase_date."',
								'".$purchase_total."',
								'".$ekspedisi."',
								'".$tarif."',
								'".$alamat."'
							) ");

							// 2. Mendapatkan id pembelian yang barusan terjadi
							$id_pembelian_baru = mysqli_insert_id($conn);
							foreach ($_SESSION['keranjang'] as $product_id => $product_quantity) {
								
								// Mendapatkan data produk berdasarkan product_id
								$prod = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id = '$product_id' ");
								if(mysqli_num_rows($prod) > 0) {
									$perproduk = mysqli_fetch_assoc($prod);
									$nama = $perproduk['product_name'];
									$harga = $perproduk['product_price'];
									$subharga = $perproduk['product_price']*$product_quantity;

									mysqli_query($conn, "INSERT INTO tb_product_purchase(purchase_id, product_id, product_quantity, product_name, product_price, sub_price) VALUES (
									'".$id_pembelian_baru."',
									'".$product_id."',
									'".$product_quantity."',
									'".$nama."',
									'".$harga."',
									'".$subharga."'
									)");
								}
							}

							// Pengkondisian yang jika berhasil, tampilan akan dialihkan ke halaman nota dari id_pembelian_baru
							if($insert){
								echo '<script>alert("Pembelian Sukses!")</script>';
								echo '<script>window.location="nota.php?id='.$id_pembelian_baru.'"</script>';
							} else {
	    						// tidak ada baris data yang cocok
	    						// lakukan tindakan penanganan yang sesuai
								echo 'Gagal'.mysqli_error($conn);
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