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

	$ambil = mysqli_query($conn, "SELECT * FROM tb_purchase WHERE purchase_id = '$id_pembelian' ");
	$detail = mysqli_fetch_assoc($ambil);

	// echo "<pre>";
	// print_r($detail);
	// print_r($_SESSION['pelanggan']);
	// echo "</pre>";

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
	// Proteksi tambahan. Misal pada riwayat belanja pelanggan no.X memiliki 2 transaksi yang masing-masing statusnya "Pending" dan "Sedang Diproses". Jika statusnya bukan "pending" maka akan diarahkan ke riwayat.php.
	if($detail['purchase_state'] !== 'Pending') {
		echo '<script>alert("Anda tidak berhak!")</script>';
		echo '<script>window.location="riwayat.php"</script>';
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
			<h1>Konfirmasi Pembayaran</h1>
			<div class="box" style="background-color: lightblue;">
				Total tagihan Anda: <strong>Rp<?php echo number_format($detail['purchase_total'])?></strong>
			</div>
			<div class="box">
				<p><b>Kirim bukti pembayaran Anda di sini:</b></p><br>
				<form action="" method="POST" enctype="multipart/form-data">
					<label for="nama">Nama Penyetor</label>
					<input type="text" name="nama" class="input-control" required>
					<label for="bank">Bank</label>
					<input type="text" name="bank" class="input-control" required>
					<label for="jumlah">Jumlah yang Dibayar</label>
					<input type="number" name="jumlah" class="input-control" min="1" required>
					<label for="foto">Foto Bukti</label>
					<p style="color: red; font-weight: bold;">Foto harus berformat JPEG atau JPG maksimal 2 MB. Penamaan file: Bukti Pembayaran A.N. [Nama Penyetor]. </p>
					<input type="file" name="foto" class="input-control" required>
					<input type="submit" name="kirim" value="Kirim" class="btn" style="color: white;">
				</form>
				<?php
				// Jika tombol kirim ditekan
				if(isset($_POST['kirim'])) {
					// menampung inputan dari form
					$nama		 = $_POST['nama'];
					$bank		 = $_POST['bank'];
					$jumlah		 = $_POST['jumlah'];
					$tanggal	 = date('Y-m-d');

					// Menampung data file yang diupload
					$namabukti = $_FILES['foto']['name'];
					$lokasibukti = $_FILES['foto']['tmp_name'];
					$type1 = explode('.', $namabukti);
					$type2 = $type1[1];

					$namabaru = date('YmdHis').'-'.$nama.'.'.$type2;

					// menampung data format file yang diizinkan
					$tipe_diizinkan = array('jpg','jpeg');

					// validasi format file
					if(!in_array($type2, $tipe_diizinkan)){
						// jika format file tidak ada di dalam tipe diizinkan
						echo '<script>alert("Format file tidak diizinkan")</script>';
					}else{
						// jika format file sesuai dengan yang ada di dalam array tipe dizinkan
						// proses upload file sekaligus insert ke database
						move_uploaded_file($lokasibukti, './bukti/'.$namabaru);
						$insert = mysqli_query($conn, "INSERT INTO tb_payment(purchase_id, payment_name, payment_bank, payment_amount, payment_date, payment_proof) VALUES (
									'".$id_pembelian."',
									'".$nama."',
									'".$bank."',
									'".$jumlah."',
									'".$tanggal."',
									'".$namabaru."'
						) ");
						if($insert){
							echo '<script>alert("Terima kasih telah mengirimkan bukti pembayaran.")</script>';
							echo '<script>window.location="riwayat.php"</script>';

							// Mengupdate status pembelian dari pending menjadi sudah kirim pembayaran
							$update = mysqli_query($conn, "UPDATE tb_purchase SET purchase_state = 'Sedang Diproses' WHERE purchase_id = '$id_pembelian' ");
						}else{
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