<?php
	session_start();

	// Mendapatkan id produk dari url
	$product_id = $_GET['id'];

	// Jika sudah ada produk tersebut di keranjang dan jumlahnya lebih dari 1, maka jumlahnya akan dikurangi 1
	if(isset($_SESSION['keranjang'][$product_id]) && $_SESSION['keranjang'][$product_id] > 1) {
		$_SESSION['keranjang'][$product_id] -= 1;
	}else{
		// Jika produk hanya ada satu, maka saat dikurangi produk akan dihapus dari keranjang
		unset($_SESSION['keranjang'][$product_id]);
	}

		// echo "<pre>";
		// print_r($_SESSION);
		// echo "</pre>";

	// Mengalihkan ke halaman keranjang
	echo '<script>alert("Produk telah dikurangi dari keranjang belanja.")</script>';
	echo '<script>window.location="keranjang.php"</script>';
?>