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
	<title>Data Produk - Admin | Baggin</title>
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
			<form action="data-produk.php" method="GET">
				<input type="text" name="search" placeholder="Cari Produk">
				<input type="submit" name="cari" value="Cari Produk">
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
			<h2>Data Produk</h2>
			<div class="box">
				<p><a href="tambah-produk.php" style="color: #A140E8; font-weight: bold;"><img src="../img/icon-add.png" width="30px" align="center">Tambah Produk</a></p>
				<table border="1" cellspacing="0" class="table">
					<thead>
						<tr>
							<th width="60px">No</th>
							<th>Kategori</th>
							<th>Nama Produk</th>
							<th>Harga</th>
							<th>Gambar</th>
							<th>Status</th>
							<th width="120px">Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php  
						// Melakukan pencarian berdasarkan nama produk, nama kategori, dan deskripsi produk.
						if(isset($_GET['search'])) {
							$search = $_GET['search'];
							$produk = mysqli_query($conn, "SELECT * FROM tb_product LEFT JOIN tb_category USING (category_id) WHERE product_name LIKE '%".$search."%' OR category_name LIKE '%".$search."%' OR product_description LIKE '%".$search."%' ORDER BY product_id DESC");
						}else{
							// Jika tidak melakukan pencarian. Jika tidak ingin fitur pencarian, hapus div.search dan pengkodisian di atas, pindahkan baris di bawah ke penginisiasian nomor. Sehingga setelah <?php, terdapat $no = 1 dan $produk.
							$produk = mysqli_query($conn, "SELECT * FROM tb_product LEFT JOIN tb_category USING (category_id) ORDER BY product_id DESC");
						}
							$no = 1;
							if(mysqli_num_rows($produk) > 0) {
							while($row = mysqli_fetch_array($produk)){
						?>
						<tr>
							<td><?php echo $no++ ?></td>
							<td><?php echo $row['category_name'] ?></td>
							<td><?php echo ucwords($row['product_name']) ?></td>
							<td>Rp<?php echo number_format($row['product_price']) ?></td>
							<td><a href="../produk/<?php echo $row['product_image'] ?>" target="blank"><img src="../produk/<?php echo $row['product_image'] ?>" width="80px"></a></td>
							<td><?php echo ($row['product_status'] == 0)? 'Tidak Aktif':'Aktif'; ?></td>
							<td align="center">
								<a href="edit-produk.php?id=<?php echo $row['product_id'] ?>" style="color: green; font-weight: bold;">Edit</a> || <a href="proses-hapus.php?idp=<?php echo $row['product_id'] ?>" onclick="return confirm('Yakin ingin menghapus?')" style="color: red; font-weight: bold;">Hapus</a>
							</td>
						</tr>
						<?php }}else{ ?>
							<tr>
								<td colspan="7">Tidak ada data</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
				<!-- Jika ingin membuat pagination -->
				<div class="center">
					<div class="pagination">
						<a href="#">&laquo;</a>
						<a href="#">&lt;</a>
						<a href="#" class="active">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">...</a>
						<a href="#">&gt;</a>
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