<?php
	session_start();
	include '../db.php';
	if($_SESSION['status_login'] != true){
		echo '<script>window.location="login.php"</script>';
	}

	// Mendapatkan id_pembelian dari url
	$id_pembelian = $_GET['id'];
	// Mengambil data pembayaran berdasarkan id_
	$ambil = mysqli_query($conn, "SELECT * FROM tb_payment LEFT JOIN tb_purchase ON tb_payment.purchase_id=tb_purchase.purchase_id WHERE tb_payment.purchase_id = '$id_pembelian'");
	if(mysqli_num_rows($ambil) == 0){
		echo '<script>window.location="data-pembelian.php"</script>';
	}
	$detail = mysqli_fetch_assoc($ambil);
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detail Pembayaran | Admin | Baggin</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<!-- Google Fonts CSS -->
	<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Comic+Neue&display=swap"> -->
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
</head>
<body>
	<!-- header -->
	<header>
		<div class="container">
		<h1><a href="dashboard.php">Baggin</a></abbr></h1>
		<ul>
			<li><a href="dashboard.php">Dashboard</a></li>
			<li><a href="profil.php">Profil</a></li>
			<li><a href="data-kategori.php">Data Kategori</a></li>
			<li><a href="data-produk.php">Data Produk</a></li>
			<li class="dropdown"><a href="" class="dropbtn">Lainnya<i class="fas fa-caret-down" style="padding-left: 5px;"></i></a>
				<div class="dropdown-content">
				    <a href="data-pelanggan.php">Data Pelanggan</a>
				    <a href="data-pembelian.php">Data Pembelian</a>
				    <a href="laporan.php">Laporan</a>
			    </div>
			</li>
			<li><a href="logout.php">Keluar</a></li>
		</ul>
		</div>
	</header>

	<!-- content -->
	<div class="section">
		<div class="container">
			<h3>Detail Pembayaran</h3>
			<div class="box">
				<table class="horizontal">
					<tr>
						<th>Nama</th>
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
					<tr>
						<th>Bukti Pembayaran</th>
						<td><img src="../bukti/<?php echo $detail['payment_proof'] ?>" alt="" width="100%"></td>
					</tr>
				</table><br>
				<form action="" method="POST">
					<label>No. Resi Pengiriman</label>
					<!-- Harusnya ada kayak edit produk -->
					<input type="text" name="resi" class="input-control" value="<?php echo $detail['shipping_receipt'] ?>" required><br>
					<label>Status</label>
					<select class="input-control" name="status" required>
						<option value="Sedang Dikirim" <?php echo $detail['purchase_state'] == 'Sedang Dikirim'? 'selected':'' ?>>Sedang Dikirim</option>
						<option value="Telah Diterima" <?php echo $detail['purchase_state'] == 'Telah Diterima'? 'selected':'' ?>>Telah Diterima</option>
						<option value="Dibatalkan" <?php echo $detail['purchase_state'] == 'Dibatalkan'? 'selected':'' ?>>Dibatalkan</option>
					</select>
					<input type="submit" name="submit" value="Submit" class="btn" style="color: white;">
				</form><br>
				<?php
				if(isset($_POST['submit'])) {
					$resi = $_POST['resi'];
					$status = $_POST['status'];

					$update = mysqli_query($conn, "UPDATE tb_purchase SET 
						shipping_receipt = '".$resi."', 
						purchase_state = '".$status."' 
						WHERE purchase_id = '$id_pembelian' ");
					if($update) {
						echo '<script>alert("Update data pembelian berhasil!")</script>';
						echo '<script>window.location="data-pembelian.php"</script>';
					}else{
						echo 'Gagal '.mysql_error($conn);
					}
				}
				?>
				<pre style="background-color: #f8f8f8"><?php print_r($detail); ?></pre>
			</div>
		</div>
	</div>

	<!-- footer -->
	<footer>
		<div class="container">
			<small>Copyright &copy; 2023 - Baggin.</small>
		</div>
	</footer>
</body>
</html>