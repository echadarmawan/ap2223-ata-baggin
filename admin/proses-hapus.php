<?php 
	
	include '../db.php';
	
	// PROSES MENGHAPUS KATEGORI
	if(isset($_GET['idk'])){
		$delete = mysqli_query($conn, "DELETE FROM tb_category WHERE category_id = '".$_GET['idk']."' ");
		echo '<script>window.location="data-kategori.php"</script>';
	}

	// PROSES MENGHAPUS PRODUK
	if(isset($_GET['idp'])){
		$produk = mysqli_query($conn, "SELECT product_image FROM tb_product WHERE product_id = '".$_GET['idp']."' ");
		$p = mysqli_fetch_object($produk);
		unlink('./produk/'.$p->product_image);
		$delete = mysqli_query($conn, "DELETE FROM tb_product WHERE product_id = '".$_GET['idp']."' ");
		echo '<script>window.location="data-produk.php"</script>';
	}

	// PROSES MENGHAPUS CUSTOMER
	if(isset($_GET['idc'])){
		$delete = mysqli_query($conn, "DELETE FROM tb_customer WHERE customer_id = '".$_GET['idc']."' ");
		echo '<script>window.location="data-pelanggan.php"</script>';
	}

	// PROSES MENGHAPUS ADMIN
	if(isset($_GET['ida'])){
		$delete = mysqli_query($conn, "DELETE FROM tb_admin WHERE admin_id = '".$_GET['ida']."' ");
		echo '<script>window.location="dashboard.php"</script>';
	}
?>