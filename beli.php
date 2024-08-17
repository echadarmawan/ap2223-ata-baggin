<?php
	session_start();

	// Mendapatkan id produk dari url
	$product_id = $_GET['id'];

	// Jika sudah ada produk tsb di keranjang, maka jumlahnya akan bertambah
	if(isset($_SESSION['keranjang'][$product_id])) {
		$_SESSION['keranjang'][$product_id]+=1;
	}else{
		// Selain itu, maka akan ditambahkan ke keranjang (jumlah 1)
		$_SESSION['keranjang'][$product_id] = 1;
	}

		// echo "<pre>";
		// print_r($_SESSION);
		// echo "</pre>";

	// Mengalihkan ke halaman keranjang
	echo '<script>alert("Produk telah masuk ke keranjang belanja.")</script>';
	echo '<script>window.location="keranjang.php"</script>';
?>