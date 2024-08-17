<?php 
	session_start();
	include 'db.php';
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>About - Contact | Baggin</title>
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

	<!-- ABOUT -->
	<div class="section">
		<div class="container">
			<div class="box">
				<div class="col-2">
					<img src="img/about-bg.jpg" width="100%">
				</div>
				<div class="col-2">
					<h2>Tentang Kami</h2>
					<p>Selamat datang di Baggin, destinasi terbaik untuk mendapatkan tas berkualitas dengan gaya dan desain terkini. Kami adalah toko online yang berkomitmen untuk menyediakan koleksi tas yang memenuhi kebutuhan dan gaya hidup Anda.</p>
					<p>Didirikan pada tahun 2023 sebagai tugas mata kuliah Algoritma dan Pemrograman 2B, Baggin ingin berdedikasi untuk memberikan pengalaman belanja yang luar biasa kepada pelanggan kami. Dengan visi untuk menjadi toko online terpercaya dalam industri tas, kami terus berinovasi dan berusaha memberikan produk dan layanan terbaik kepada pelanggan kami.</p>
					<p>Kami memiliki tim yang terdiri dari tiga mahasiswi kelas 1KA34 Universitas Gunadarma Kampus K dan setiap dari kami memiliki tugas yang berbeda dalam mengembangkan situs ini. Setiap tas yang kami tawarkan dipilih dengan teliti, dengan menggunakan bahan-bahan berkualitas tinggi dan teknik pembuatan yang canggih. Kami berkomitmen untuk menyediakan produk yang tahan lama dan fungsional, tanpa mengorbankan gaya dan keindahan desain.</p>
					<p>Kami percaya bahwa setiap individu memiliki gaya dan preferensi yang unik. Oleh karena itu, kami menyediakan beragam koleksi tas untuk memenuhi berbagai kebutuhan dan selera. Apakah Anda mencari tas untuk kegiatan sehari-hari, bepergian, atau acara khusus, kami memiliki pilihan yang tepat untuk Anda. Koleksi kami mencakup tas selempang, tas ransel, tas wanita, tas pria, dan masih banyak lagi, yang semuanya dipilih dengan cermat untuk memenuhi standar kualitas tertinggi.</p>
					<p>Kami mengutamakan kepuasan pelanggan sebagai prioritas utama kami. Kami berkomitmen untuk memberikan layanan pelanggan yang ramah dan responsif, serta pengiriman yang cepat dan aman. Tim kami siap membantu Anda dengan pertanyaan, saran, atau masukan apa pun yang Anda butuhkan. Kami berharap dapat membangun hubungan jangka panjang dengan pelanggan kami, dan memberikan pengalaman belanja yang tak terlupakan.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- CONTACT -->
	<div class="section">
		<div class="container">
			<h2>Kontak Kami</h2>
			<div class="box">
				<div class="col-3">
					<a href="https://www.freepik.com/author/syarifahbrit" target="_blank"><img src="img/person-1.jpg"></a>
					<h3>Keshia Davina P. D.</h3>
					<p>IG: -</p>
					<p>WA: -</p>
				</div>
				<div class="col-3">
					<a href="https://www.freepik.com/author/syarifahbrit" target="_blank"><img src="img/person-2.jpg"></a>
					<h3>Shiva Aulia</h3>
					<p>IG: -</p>
					<p>WA: -</p>
				</div>
				<div class="col-3">
					<a href="http://www.freepik.com" target="_blank"><img src="img/person-3.jpg"></a>
					<h3>Tirsa Nesawasana</h3>
					<p>IG: -</p>
					<p>WA: -</p>
				</div>
				<div id="map">
            		<!-- How to change your own map point
                           1. Go to Google Maps
                           2. Click on your location point
                           3. Click "Share" and choose "Embed map" tab
                           4. Copy only URL and paste it within the src="" field below
                    -->
	              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.2407265861248!2d106.61333437423326!3d-6.2319636610282885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69fc1acf84837d%3A0x6642a0008730b471!2sUniversitas%20Gunadarma%20Kampus%20K!5e0!3m2!1sid!2sid!4v1682433116999!5m2!1sid!2sid" width="100%" height="500px" frameborder="0" style="border:0" allowfullscreen></iframe>
	            </div>
			</div>
		</div>
	</div>

	<!-- THANKS -->
	<div class="section">
		<div class="container">
			<h2>Halaman Terima Kasih</h2>
			<div class="box">
				<h3>Terima kasih yang sebesar-besarnya kepada para penyelamat yang telah membantu kami dalam pembuatan web ini:</h3><br>
				<ul style="padding-left: 10px;">
					<li>PHPmu: <a href="https://phpmu.com/cara-reset-nilai-auto-increment-mysql/" target="_blank">https://phpmu.com/cara-reset-nilai-auto-increment-mysql/</a></li>
					<li>Jagowebdev: <a href="https://jagowebdev.com/membuat-mengedit-menghapus-foreign-key-dengan-phpmyadmin/" target="_blank">https://jagowebdev.com/membuat-mengedit-menghapus-foreign-key-dengan-phpmyadmin/</a></li>
					<li>WebHozz Blog: <a href="https://www.webhozz.com/blog/membuat-foreign-key-pada-tabel-mysql/" target="_blank">https://www.webhozz.com/blog/membuat-foreign-key-pada-tabel-mysql/</a></li>
					<li>Raynaldo Sutisna in dev.to: <a href="https://dev.to/raaynaldo/speed-up-code-your-html-using-emmet-in-vscode-nesting-operators-201o" target="_blank">https://dev.to/raaynaldo/speed-up-code-your-html-using-emmet-in-vscode-nesting-operators-201o</a></li>
					<li>W3Schools: <a href="https://www.w3schools.com" target="_blank">https://www.w3schools.com</a></li>
					<li>Fun Techsy: <a href="https://www.funtechsy.com/2020/07/perbedaan-fetch-array-assoc-dan-row.html" target="_blank">https://www.funtechsy.com/2020/07/perbedaan-fetch-array-assoc-dan-row.html</a></li>
				</ul>
				<div class="col-3" style="border: none;">
					<h3><a href="https://chat.openai.com" target="_blank">Aa ChatGPT <3</a></h3>
					<iframe
					src="https://www.youtube.com/embed/XruEVMtQHmE" allowfullscreen>
				</iframe>
				</div>
				<div class="col-3" style="border: none;">
					<h3>Team TRAINIT</h3>
					<iframe
					src="https://www.youtube.com/embed/uJ0jOO9rSI8" allowfullscreen>
					</iframe>
				</div>
				<div class="col-3" style="border: none;">
					<h3>Dzulfikar Nurfikri</h3>
					<iframe
					src="https://www.youtube.com/embed/WDPMGTPIW5g" allowfullscreen>
					</iframe>
				</div>
				<div class="col-3" style="border: none;">
					<h3>Cara Fajar</h3>
					<iframe
					src="https://www.youtube.com/embed/dYK9seXoXXY" allowfullscreen>
					</iframe>
				</div>
				<div class="col-3" style="border: none;">
					<h3>Erik Se19</h3>
					<iframe
					src="https://www.youtube.com/embed/K7gyclhWo1Y" allowfullscreen>
					</iframe>
				</div>
				<div class="col-3" style="border: none;">
					<h1>Dan lainnya yang tidak sempat kami sebutkan.</h1>
					<h1>^ v ^</h1>
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