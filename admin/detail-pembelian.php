<?php
	session_start();
	include '../db.php';
	if($_SESSION['status_login'] != true){
		echo '<script>window.location="login.php"</script>';
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detail Pembelian | Admin | Baggin</title>
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
			<h3>Detail Pembelian</h3>
			<div class="box">
				<?php
					$ambil = mysqli_query($conn, "SELECT * FROM tb_purchase JOIN tb_customer ON tb_purchase.customer_id = tb_customer.customer_id WHERE tb_purchase.purchase_id = '".$_GET['id']."' ");
					$detail = mysqli_fetch_assoc($ambil);
				?>
				<pre style="background-color: #f8f8f8"><?php print_r($detail); ?></pre>
				<strong><?php echo $detail['customer_name']; ?></strong> <br>
				<p>
					<?php echo $detail['customer_telp']; ?> <br>
					<?php echo $detail['customer_email']; ?>
				</p>
				<p>
					Tanggal: <?php echo $detail['purchase_date']; ?> <br>
					Total: <?php echo $detail['purchase_total']; ?>
				</p>

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
							$ambil = mysqli_query($conn, "SELECT * FROM tb_product_purchase JOIN tb_product ON tb_product_purchase.product_id=tb_product.product_id WHERE tb_product_purchase.purchase_id = '".$_GET['id']."' ");
							if(mysqli_num_rows($ambil) > 0) {
							while($pecah = mysqli_fetch_assoc($ambil)){
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td><?php echo $pecah['product_name'] ?></td>
							<td>Rp<?php echo number_format($pecah['product_price']) ?></td>
							<td><?php echo $pecah['product_quantity'] ?></td>
							<td>Rp<?php echo number_format($pecah['product_price']*$pecah['product_quantity']) ?></td>
						</tr>
						<?php }}else{ ?>
							<tr>
								<td colspan="5" align="center">Tidak ada data</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
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