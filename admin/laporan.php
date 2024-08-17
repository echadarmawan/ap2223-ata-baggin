<?php
	session_start();
	include '../db.php';
	if($_SESSION['status_login'] != true){
		echo '<script>window.location="login.php"</script>';
	}

	$semuadata = array();
	$mulai = '-';
	$selesai = '-';
	$status = '';

	if(isset($_POST['lihat'])) {

		$mulai = $_POST['tglm'];
		$selesai = $_POST['tgls'];
		$status = $_POST['status'];

		if($status != '') {
			$ambil = mysqli_query($conn, "SELECT * FROM tb_purchase tbp LEFT JOIN tb_customer tbc ON tbp.customer_id=tbc.customer_id WHERE purchase_state = '$status' AND purchase_date BETWEEN '$mulai' AND '$selesai'");
		}else{
			$ambil = mysqli_query($conn, "SELECT * FROM tb_purchase tbp LEFT JOIN tb_customer tbc ON tbp.customer_id=tbc.customer_id WHERE purchase_date BETWEEN '$mulai' AND '$selesai'");
		}
		
		while($pecah = mysqli_fetch_assoc($ambil)) {
			$semuadata[] = $pecah;

			// echo "<pre>";
			// echo print_r($semuadata);
			// echo "</pre>";
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Laporan Penjualan - Admin | Baggin</title>
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
			<h2>Laporan Pembelian dari <?php echo $mulai ?> hingga <?php echo $selesai ?></h2>
			<div class="box">
				<form method="POST">
					<div class="col-3" style="min-height: 100px; border: none; text-align: left;">
						<label for="tglm">Tanggal Mulai</label>
						<input type="date" class="input-control" name="tglm" value="<?php echo $mulai ?>">
					</div>
					<div class="col-3" style="min-height: 100px; border: none; text-align: left;">
						<label for="tgls">Tanggal Selesai</label>
						<input type="date" class="input-control" name="tgls" value="<?php echo $selesai ?>">
					</div>
					<div class="col-3" style="min-height: 100px; border: none; text-align: left;">
						<label for="status">Status</label>
						<select class="input-control" name="status">
							<option value="">--Pilih Status Pembelian--</option>
							<option value="Pending" <?php echo $status == 'Pending'? 'selected':'' ?>>Pending</option>
							<option value="Sedang Diproses" <?php echo $status == 'Sedang Diproses'? 'selected':'' ?>>Sedang Diproses</option>
							<option value="Sedang Dikirim" <?php echo $status == 'Sedang Dikirim'? 'selected':'' ?>>Sedang Dikirim</option>
							<option value="Telah Diterima" <?php echo $status == 'Telah Diterima'? 'selected':'' ?>>Telah Diterima</option>
							<option value="Dibatalkan" <?php echo $status == 'Dibatalkan'? 'selected':'' ?>>Dibatalkan</option>
						</select>
					</div>
					<input type="submit" name="lihat" value="Lihat" class="btn" style="color: white;">
				</form>
			</div>
			<div class="box">
				<table border="1" cellspacing="0" class="table">
					<thead>
						<tr>
							<th width="60px">No</th>
							<th>Pelanggan</th>
							<th>Tanggal</th>
							<th>Status</th>
							<th>Jumlah</th>
						</tr>
					</thead>
					<tbody>
						<?php $total = 0 ?>
						<?php foreach ($semuadata as $key => $value) { ?>
							<?php $total+=$value['purchase_total'] ?>
						<tr>
							<td><?php echo $key+1 ?></td>
							<td><?php echo $value['customer_name'] ?></td>
							<td><?php echo $value['purchase_date'] ?></td>
							<td><?php echo $value['purchase_state'] ?></td>
							<td>Rp<?php echo number_format($value['purchase_total']) ?></td>
						</tr>
						<?php } ?>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="4">Total Penjualan</th>
							<th>Rp<?php echo number_format($total)?></th>
						</tr>
					</tfoot>
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