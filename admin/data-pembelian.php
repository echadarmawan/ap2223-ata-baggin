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
	<title>Data Pembelian - Pembayaran | Admin | Baggin</title>
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

	<!-- SEARCH -->
	<div class="search">
		<div class="container">
			<form action="data-pembelian.php" method="GET">
				<input type="text" name="search" placeholder="Cari Pembelian">
				<input type="submit" name="cari" value="Cari Pembelian">
			</form><br>
			<?php 
			if(isset($_GET['search'])){
				$search = $_GET['search'];
				echo "<b>Hasil pencarian : '".$search."' </b>";
			}
			?>
		</div>
	</div>
	<!-- content -->
	<div class="section">
		<div class="container">
			<h2>Data Pembelian</h2>
			<div class="box">
				<table border="1" cellspacing="0" class="table">
					<thead>
						<tr>
							<th width="40px">No</th>
							<th>Nama Pelanggan</th>
							<th>Tanggal</th>
							<th>Status Pembelian</th>
							<th>Total</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php  
						// Melakukan pencarian berdasarkan nama pelanggan atau status pembelian.
						if(isset($_GET['search'])) {
							$search = $_GET['search'];
							$pembelian = mysqli_query($conn, "SELECT * FROM tb_purchase JOIN tb_customer ON tb_purchase.customer_id=tb_customer.customer_id WHERE customer_name LIKE '%".$search."%' OR purchase_state LIKE '%".$search."%' ");
						}else{
							// Jika tidak melakukan pencarian. Jika tidak ingin fitur pencarian, hapus div.search dan pengkodisian di atas, pindahkan baris di bawah ke penginisiasian nomor. Sehingga setelah <?php, terdapat $no = 1 dan $pembelian.
							$pembelian = mysqli_query($conn, "SELECT * FROM tb_purchase JOIN tb_customer ON tb_purchase.customer_id=tb_customer.customer_id");
						}
							$no = 1;
							if(mysqli_num_rows($pembelian) > 0) {
							while($row = mysqli_fetch_array($pembelian)){
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td><?php echo $row['customer_name'] ?></td>
							<td align="center"><?php echo $row['purchase_date'] ?></td>
							<td align="center"><?php echo $row['purchase_state'] ?></td>
							<td>Rp<?php echo number_format($row['purchase_total']) ?></td>
							<td>
								<a href="detail-pembelian.php?id=<?php echo $row['purchase_id'] ?>" class="btn-button" style="background-color: royalblue;">Detail</a>
								<?php if($row['purchase_state'] !== 'Pending'): ?>
									<a href="detail-pembayaran.php?id=<?php echo $row['purchase_id'] ?>" class="btn-button" style="background-color: green;">Pembayaran</a>
								<?php endif ?>
							</td>
						</tr>
						<?php }}else{ ?>
							<tr>
								<td colspan="5" align="center">Tidak ada data</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
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