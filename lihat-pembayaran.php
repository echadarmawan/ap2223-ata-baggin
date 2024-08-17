<?php
	session_start();
	include 'db.php';

	// Jika tidak ada session pelanggan / belum login, maka dialihkan ke login.php
	if(!isset($_SESSION['pelanggan'])) {
		echo '<script>alert("Anda harus login terlebih dahulu!")</script>';
		echo '<script>window.location="login-pelanggan.php"</script>';
	}

// Mendapatkan id_pembelian dari url
	$id_pembelian = $_GET['id'];

	$ambil = mysqli_query($conn, "SELECT * FROM tb_payment LEFT JOIN tb_purchase ON tb_payment.purchase_id=tb_purchase.purchase_id WHERE tb_purchase.purchase_id = '$id_pembelian' ");
	$detail = mysqli_fetch_assoc($ambil);

	// echo "<pre>";
	// print_r($detail);
	// print_r($_SESSION['pelanggan']);
	// echo "</pre>";

	// Misal pada riwayat belanja pelanggan no.X memiliki 2 transaksi yang masing-masing statusnya "Pending" dan "Sedang Diproses". Jika statusnya "pending" maka belum ada data pembayarannya alias kosong.
	if(empty($detail)) {
		echo '<script>alert("Belum ada data pembayaran.")</script>';
		echo '<script>window.location="riwayat.php"</script>';
	}

	// Mendapatkan id pelanggan yang beli
	$pelangganbeli = $detail['customer_id'];
	// Mendapatkan id pelanggan yang login
	$pelangganlogin = $_SESSION['pelanggan']['customer_id'];
	// Jika ada pelanggan yang berbuat "nakal" dengan mengintip pembayaran orang lain, maka akan diarahkan ke riwayat belanja pelanggan tersebut.
	if($pelangganbeli !== $pelangganlogin) {
		echo '<script>alert("Hayo kamu ngapain ngintip pembayaran orang lain?")</script>';
		echo '<script>window.location="riwayat.php"</script>';
		exit();
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pembayaran | Baggin</title>
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

	<!-- PEMBAYARAN -->
	<div class="section">
		<div class="container">
			<h1>Lihat Pembayaran</h1>
			<div class="col-2">
				<div class="box">
					<table class="horizontal">
						<tr>
							<th>Nama Penyetor</th>
							<td><?php echo $detail['payment_name']?></td>
						</tr>
						<tr>
							<th>Bank</th>
							<td><?php echo $detail['payment_bank'] ?></td>
						</tr>
						<tr>
							<th>Jumlah</th>
							<td>Rp<?php echo number_format($detail['payment_amount']) ?></td>
						</tr>
						<tr>
							<th>Tanggal</th>
							<td><?php echo $detail['payment_date'] ?></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-2">
				<div class="box">
					<p><b>Bukti Pembayaran:</b></p>
					<img src="./bukti/<?php echo $detail['payment_proof'] ?>" alt="" width="100%">
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