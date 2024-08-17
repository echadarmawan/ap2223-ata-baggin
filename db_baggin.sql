-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Bulan Juni 2023 pada 16.00
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_baggin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `admin_telp` varchar(100) NOT NULL,
  `admin_email` text NOT NULL,
  `admin_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`) VALUES
(1, 'Keshia Davina Putri Darmawan', 'admin', '21232f297a57a5a743894a0e4a801fc3', '085692568942', 'keshiadavinapd@gmail.com', 'Jl. Kelapa Dua Raya No.93, Klp. Dua, Kec. Klp. Dua, Kabupaten Tangerang, Banten 15810.'),
(2, 'Tirsa Nesawasana', 'tirsa', 'bb9f55dbfdcc3b31bf51dd81ac5ac722', '081213706799', 'tirsanesawasana@student.gunadarma.ac.id', 'Jl. Kelapa Dua Raya No.93, Klp. Dua, Kec. Klp. Dua, Kabupaten Tangerang, Banten 15810'),
(3, 'Shiva Aulia Setiawan', 'shiva', '69f404925df883e0e5579d65b7768e7c', '081385169654', 'shivaaulll@gmail.com', 'Jl. Kelapa Dua Raya No.93, Klp. Dua, Kec. Klp. Dua, Kabupaten Tangerang, Banten 15810');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(1, 'Tas Ransel'),
(2, 'Tote Bag'),
(3, 'Dompet'),
(4, 'Tas Sekolah'),
(5, 'Tas Laptop'),
(6, 'Koper'),
(7, 'Tas Selempang'),
(8, 'Clutch'),
(9, 'Tas Kerja'),
(10, 'Waist Bag'),
(11, 'Aksesoris Tas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE `tb_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_pass` varchar(100) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_telp` varchar(20) NOT NULL,
  `customer_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_customer`
--

INSERT INTO `tb_customer` (`customer_id`, `customer_email`, `customer_pass`, `customer_name`, `customer_telp`, `customer_address`) VALUES
(1, 'customer@gmail.com', '91ec1f9324753048c0096d036a694f86', 'customer', '012345678910', 'Jl. Customer'),
(2, 'pelanggan@gmail.com', '7f78f06d2d1262a0a222ca9834b15d9d', 'pelanggan', '088888888888', 'Jl. Pelanggan'),
(3, 'halo@gmail.com', '57f842286171094855e51fc3a541c1e2', 'Ismail Marzuki', '532721056717', 'Jl. Halo-Halo Bandung'),
(4, 'udin@gmail.com', '6bec9c852847242e384a4d5ac0962ba0', 'udin', '088808880888', 'Jl. Udin'),
(5, 'pembeli@gmail.com', 'a9f8bbb8cb84375f241ce3b9da6219a1', 'pembeli', '099909990999', 'Jl. Pembeli'),
(6, 'buyer@gmail.com', '794aad24cbd58461011ed9094b7fa212', 'buyer', '044404440444', 'Jl. Buyer No.420 Rt6 Rw9'),
(7, 'sanfisudiaamrul@dummy.com', '1238a41e3e35fa8f7cb637937bb5fb48', 'Sanfi Sudiarjo Amrullah', '085692568942', 'Jl. Lele No.420 Rt.06 Rw.09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_payment`
--

CREATE TABLE `tb_payment` (
  `payment_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `payment_name` varchar(100) NOT NULL,
  `payment_bank` varchar(100) NOT NULL,
  `payment_amount` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_proof` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_payment`
--

INSERT INTO `tb_payment` (`payment_id`, `purchase_id`, `payment_name`, `payment_bank`, `payment_amount`, `payment_date`, `payment_proof`) VALUES
(1, 27, 'Buyer Buying', 'ABC', 6743283, '2023-06-20', '20230620155100-Buyer Buying.jpg'),
(2, 25, 'Saki Yoshida', 'Bank Shindol', 1140000, '2023-06-21', '20230621121501-Saki Yoshida.jpeg'),
(3, 30, 'Sanfi Sudiarjo Amrullah', 'Bank ABC', 575000, '2023-07-22', '20230722115228-Sanfi Sudiarjo Amrullah.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_product`
--

CREATE TABLE `tb_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_product`
--

INSERT INTO `tb_product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_description`, `product_image`, `product_status`, `date_created`) VALUES
(1, 3, '#C001 Dompet Lucu Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor in', 20000, '<p>Dompet murah meriah MANTAP</p>\r\n', '3-C001.jpg', 1, '2023-05-07 09:45:26'),
(2, 1, '#A001 Ransel Backpack', 235000, '<p>Kondisi: Baru Berat Satuan: 700 g Semua gambar di kami adalah dummy picture 100%. Barang yang ada di foto adalah barang yang dijual.</p>\r\n', '1-A001.jpg', 1, '2023-05-07 10:11:34'),
(3, 6, '#SPECIAL Samsonite Red BTS BUTTER X SR Spinner Koper Hardcase Medium 24inch', 5690000, '<p>Kondisi: Baru</p>\r\n\r\n<p>Berat Satuan: 17 kg</p>\r\n\r\n<p>Warna: Kuning, Hitam</p>\r\n\r\n<p>Semua gambar di kami adalah dummy picture 100%. Barang yang ada di foto adalah barang yang dijual.</p>\r\n', '6-SPEC.jpg', 0, '2023-05-07 10:35:55'),
(4, 11, '#K001 Boneka Prajurit Squid Game', 36000, '<p>Boneka Squid Game bahan flanel empuk</p>\r\n', '11-K001.jpg', 1, '2023-05-07 11:17:50'),
(5, 9, '#I001 Tas Kerja Pria', 334000, '<p>Warna: Hitam</p>\r\n\r\n<p>Tas kerja formal. Cocok untuk dipakai kerja.</p>\r\n', '9-I001.jpg', 1, '2023-05-07 11:20:23'),
(6, 10, '#J001 Tas Selempang Waist Bag Pria Unisex', 119000, '<p>tas selempang tas dada waist bag murah meriah</p>\r\n', '10-J001.jpg', 1, '2023-05-07 13:16:24'),
(7, 11, '#K002 Keychain Hello Kitty', 25900, '<p>Gantungan kunci bertema Hello Kitty dengan desain kupu-kupu, bintang dan daun. Memiliki 3 warna yang berbeda. High Quality serta tidak mudah berkarat.</p>\r\n', '11-K002.jpg', 1, '2023-05-19 18:29:02'),
(8, 11, '#K003 Keychain Hello Kitty', 35000, '<p>Gantungan Kunci Toy Story &amp; Monster University</p>\r\n\r\n<p>[!!] Hiasan gantungan buzz sesuai foto per varian (yang ada bintangnya).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>➤ Detail:</p>\r\n\r\n<p>&bull; Real picture and ready stock yaa</p>\r\n\r\n<p>&bull; Besar: +/- 5 cm tegantung karakter (Rex lebih besar +/- 7 cm)</p>\r\n\r\n<p>&bull; Bahan: bervarasi tergantung karakter (sesuai dengan foto dan varian)</p>\r\n', '11-K003.jpg', 1, '2023-05-20 01:17:01'),
(9, 11, '#K004 Stroberi List Silver Alphabet Keychain A-Z', 8000, '<p>STROBERI LIST SILVER ALPHABET KEYCHAIN A-M</p>\r\n\r\n<p>&bull; GANTUNGAN &ndash; yang bisa dipasangkan di kunci dan tas;</p>\r\n\r\n<p>&bull; BERBAHAN AKLIRIK &ndash; yang aman dan bagus;</p>\r\n\r\n<p>&bull; BERWARNA PUTIH TRANSPARANT &ndash; yang sesuai untuk digunakan dengan warna apa saja;</p>\r\n\r\n<p>&bull; UKURAN* &ndash; &plusmn; 2.5 cm x 2.7 cm; dan</p>\r\n\r\n<p>&bull; VARIASI &ndash; Huruf A-M</p>\r\n', '11-K004.jpg', 1, '2023-05-20 01:21:27'),
(10, 11, '#K005 Bag charm / Carabiner Bag Charm', 18000, '<p>BAG CHARM / CARABINER KEYCHAIN by POMPOENY❤️</p>\r\n\r\n<p>~100% Handmade with 💓💓💓</p>\r\n\r\n<p>~100% REAL PICT✨</p>\r\n\r\n<p>~ Visual Bag Charm menambah value Tas kalian jadi semakin Chic &amp; Aesthetic ✨</p>\r\n\r\n<p>~ Warna di foto &amp; aslinya bisa sedikit berbeda krn perbedaan lighting✨</p>\r\n\r\n<p>~ Tersedia berbagai model, motif tali &amp; warna (bisa dicek dipilihan check out!✨)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Spesifikasi:</p>\r\n\r\n<p>~ Panjang Bag Charm (Pengait sampai ujung tali): 18-26cm (Tergantung model varian)</p>\r\n\r\n<p>~ Tebal Diameter Tali Prusik/Paracord: 2mm - 3mm</p>\r\n\r\n<p>~ Material Beads Accesories: Akrilik, mote, stopper, parel rantai plastik</p>\r\n\r\n<p>~ Pengait/ Cantelan CARABINER:&nbsp; Bahan Stainless / warna metalic doff</p>\r\n\r\n<p>*JIKA TALI YG SESUAI DGN GAMBAR HABIS, MAKA AKAN DIGANTI SESUAI PERSEDIAAN TALI YG ADA TANPA PEMBERITAHUAN SEBELUMNYA, yg pasti tetep kece warna mix n match talinya dgn pengait okay!🥰*</p>\r\n', '11-K005.jpg', 1, '2023-05-20 01:30:44'),
(11, 11, '#K006 halo patch - cute pin astronaut brooch pin bros acrylic akrilic korean style cute import / pin', 3595, '<p>HALO PATCH - CUTE PIN ASTRONAUT BROOCH PIN BROS ACRYLIC AKRILIC KOREAN STYLE CUTE IMPORT / PIN TAS LUCU</p>\r\n', '11-K006.jpg', 1, '2023-05-20 01:32:54'),
(12, 11, '#K007 Gantungan kunci Dinosaurus', 5888, '<p>Applicable occasions: Graduation season, parties, birthdays, festival,etc.&nbsp;</p>\r\n\r\n<p>Color: As the picture shows&nbsp;</p>\r\n\r\n<p>100% Brand New and High Quality&nbsp;</p>\r\n\r\n<p>Size: As the picture shows&nbsp;</p>\r\n\r\n<p>Type: Cartoon Animal Keychain&nbsp;</p>\r\n\r\n<p>Package include:&nbsp;&nbsp;</p>\r\n\r\n<p>1 x Cartoon Animal Keychain</p>\r\n\r\n<p>Note:&nbsp;&nbsp;</p>\r\n\r\n<p>1. Due to the light and monitors effect, colors may have lightly difference.&nbsp;</p>\r\n\r\n<p>2. Please allow slightly size errors due to manual measurement. Thank you for your understand!</p>\r\n', '11-K007.jpg', 1, '2023-05-20 01:35:35'),
(13, 11, '#K008 Gantungan kunci Super Mario Bros Luigi', 7888, '<p>Applicable occasions: Graduation season, parties, birthdays, festival,etc.&nbsp;</p>\r\n\r\n<p>Color: As the picture shows&nbsp;</p>\r\n\r\n<p>100% Brand New and High Quality&nbsp;</p>\r\n\r\n<p>Size: As the picture shows&nbsp;</p>\r\n\r\n<p>Type: Cartoon Animal Keychain&nbsp;</p>\r\n\r\n<p>Package include:&nbsp;&nbsp;</p>\r\n\r\n<p>1 x Cartoon Animal Keychain&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Note:&nbsp;&nbsp;</p>\r\n\r\n<p>1. Due to the light and monitors effect, colors may have lightly difference.&nbsp;</p>\r\n\r\n<p>2. Please allow slightly size errors due to manual measurement. Thank you for your understand!</p>\r\n', '11-K008.jpg', 1, '2023-05-20 01:55:28'),
(14, 11, '#K009 Gantungan Kunci/ Keychain/ Bagcharm', 9999, '<p>🌼READY STOCK🌼</p>\r\n\r\n<p>📎 100% Handmade By Diary</p>\r\n\r\n<p>📎 Size -+ 12cm - 25cm (bisa jadi ada perbedaan karena handmade)</p>\r\n\r\n<p>📎 Packing rapi dan aman</p>\r\n\r\n<p>📎 Bisa request warna (chat sesuai ketersediaan stock tali)</p>\r\n\r\n<p>📎 Harga tertera adalah harga satuan /pcs</p>\r\n\r\n<p>📎 Cocok untuk gantungan tas / kunci / souvenir</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>📌 Tersedia harga grosir/disc untuk pembelian minimal 10pcs</p>\r\n\r\n<p>📌 Souvenir bisa konsultasi harga dan model via chat.</p>\r\n\r\n<p>🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-Terimakasih-</p>\r\n', '11-K009.jpg', 1, '2023-05-20 01:57:03'),
(15, 11, '#K010 Acrylic Pin | Pin akrilik by yeele', 6500, '<p>Pin akrilik aksesoris tas/topi,dll.(✿◠‿◠)</p>\r\n\r\n<p>&bull; Size &plusmn; 3-4 cm</p>\r\n\r\n<p>&bull; Material akrilik 3mm printed, bukan sticker</p>\r\n\r\n<p>&bull; Peniti dibagian belakang pin</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>⚠️ PERHATIAN ⚠️</p>\r\n\r\n<p>* Claim Return diboleh kan hanya dengan alasan cacat produk.</p>\r\n\r\n<p>* Komplain tidak akan ditanggapi jika berkaitan dengan kualitas, ada harga ada kualitas.</p>\r\n\r\n<p>* TIDAK MENERIMA KOMPLAIN KERUSAKAN BARANG TANPA VIDEO UNBOXING</p>\r\n\r\n<p>*&nbsp; Klaim kerusakan barang hanya di terima 2 kali 24 jam setelah barang sampai ke tujuan</p>\r\n\r\n<p>* Warna tidak 100% sama karna perbedaan saat di foto dengan kamera</p>\r\n', '11-K010.jpg', 1, '2023-05-20 02:00:25'),
(16, 11, '#K011 Gantungan Kunci/ Keychain/ Macrame Rainbow', 19499, '<p>🌼READY STOCK🌼</p>\r\n\r\n<p>📎 100% Handmade By Diary</p>\r\n\r\n<p>📎 Size -+ 13cm x 13cm (bisa jadi ada perbedaan karena handmade)</p>\r\n\r\n<p>📎 Packing rapi dan aman</p>\r\n\r\n<p>📎 Bisa request warna (chat sesuai ketersediaan stock tali)</p>\r\n\r\n<p>📎 Harga tertera adalah harga satuan /pcs</p>\r\n\r\n<p>📎 Cocok untuk gantungan tas / kunci / souvenir</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>📌 Tersedia harga grosir/disc untuk pembelian minimal 10pcs</p>\r\n\r\n<p>📌 Souvenir bisa konsultasi harga dan model via chat</p>\r\n\r\n<p>📌 Cek etalase untuk warna dan model lainnya.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼🌼</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-Terimakasih-</p>\r\n', '11-K011.jpg', 1, '2023-05-20 02:01:55'),
(17, 10, '#J002 Tas wanita/ Waist bag Wanita', 105900, '<p>Warna: hitam, oranye, putih, hijau</p>\r\n\r\n<p>Bahan: Nylon</p>\r\n\r\n<p>NOTE：Pilihan dengan &quot;Leather&quot; berarti bahannya terbuat dari kulit, jadi perhatikanlah！！！</p>\r\n\r\n<p>Penggunaan: satu bahu / rentang diagonal</p>\r\n\r\n<p>Ukuran: 27*10*17 CM&nbsp; panjang tali: ~116cm</p>\r\n', '10-J002.jpg', 1, '2023-05-20 02:05:09'),
(18, 10, '#J003 Mickout Waist Bag “Chasp” Black', 85000, '<p>&nbsp;&quot;Chasp&quot; Mickout&#39;s Waist Bag.</p>\r\n\r\n<p>Product Summary :</p>\r\n\r\n<p>&bull; Outer Material Cordura Bimo.</p>\r\n\r\n<p>&bull; Inner Material Torin Urex.</p>\r\n\r\n<p>&bull; Adjustable Strap.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Dimensions :</p>\r\n\r\n<p>&bull; (P) Length : 24 cm.</p>\r\n\r\n<p>&bull; (T) Height : 11 cm.</p>\r\n\r\n<p>&bull; (L) Width : 11 cm.</p>\r\n\r\n<p>Mickout. Dare to be different</p>\r\n', '10-J003.jpg', 1, '2023-05-20 02:10:19'),
(19, 10, '#J004 Waistbag Keren Water Resistant', 250750, '<p>FITUR</p>\r\n\r\n<p>📎 1 saku utama belakang</p>\r\n\r\n<p>📎 1 saku utama</p>\r\n\r\n<p>📎 3 saku multifungsi</p>\r\n\r\n<p>📎 slot kamera spliter</p>\r\n\r\n<p>📎 earphone holder</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>KEUNGGULAN</p>\r\n\r\n<p>📎 tali webbing fixlon</p>\r\n\r\n<p>📎 bagian luar 2 bahan</p>\r\n\r\n<p>📎 tahan air</p>\r\n\r\n<p>📎 kompartment luas</p>\r\n\r\n<p>📎 unisex</p>\r\n\r\n<p>📎 x-buckle 2.0 magnet</p>\r\n', '10-J004.jpg', 1, '2023-05-20 03:40:52'),
(20, 10, '#J005 Bostanten Tas Pinggang/ WaistBag Wanita', 79000, '<p>Bahan: Nilon</p>\r\n\r\n<p>Warna: Off-putih，Kelabu cahaya，merah muda，hitam，oranye，hitam-1，Off-putih-1，coklat-1，claret-1，Hijau militer-1，Kelabu cahaya-1，Pink-1，biru-1</p>\r\n\r\n<p>Dimensi: 21cm (Lebar) * 13cm (Tinggi) * 3cm (Kedalaman)</p>\r\n\r\n<p>Berat: 0.17kg</p>\r\n\r\n<p>Deskripsi internal：Tas penyimpanan besar * 1 tas masukkan * 3 tas zipper belakang * 1, tinggi tengah tali bahu sekitar 26-51cm (dapat disesuaikan dan tidak dapat dibuang)</p>\r\n', '10-J005.jpg', 1, '2023-05-20 03:47:45'),
(21, 10, '#J006 korean canvas sling bag bucket/ waist bag', 88000, '<p>SIZE 32 X 21CM</p>\r\n\r\n<p>BAHAN CANVAS TEBAL</p>\r\n\r\n<p>TALI SLING BISA DI ATUR PANJANG PENDEK</p>\r\n\r\n<p>PENUTUP BUKA TAS MENGGUNAKAN TALI SERUT</p>\r\n', '10-J006.jpg', 1, '2023-05-20 03:52:18'),
(22, 10, '#J007 selempang pria wanita hocodo', 38000, '<p>UKURAN 32X12X45</p>\r\n\r\n<p>PAKAI RESLETING</p>\r\n\r\n<p>PAKAI PURING LAPISAN DALAM</p>\r\n\r\n<p>REALPICT</p>\r\n\r\n<p>BERAT 150 GRAM</p>\r\n\r\n<p>READY STOK</p>\r\n\r\n<p>Bonus Totebag selama persediaan masih ada.</p>\r\n', '10-J007.jpg', 1, '2023-05-20 03:54:48'),
(23, 10, '#J008 Tas dada Pria Selempang Transparant PVC', 29950, '<p>Spesifikasi:</p>\r\n\r\n<p>- Bahan: PVC</p>\r\n\r\n<p>- Warna: bening</p>\r\n\r\n<p>- Ukuran: aplikasi. 26x17x6.5cm / 13.77x6.69 x 2.55in</p>\r\n\r\n<p>- Jumlah: 1 buah</p>\r\n\r\n<p>Catatan:</p>\r\n\r\n<p>- Transisi: 1cm = 10mm = 0.39 inci</p>\r\n\r\n<p>- Tidak ada paket eceran.</p>\r\n\r\n<p>- Toleransi kesalahan 1-2cm karena pengukuran manual. Harap pastikan Anda tidak keberatan sebelum menawar.</p>\r\n\r\n<p>- Karena perbedaan antara monitor yang berbeda, gambar mungkin tidak mencerminkan warna sebenarnya dari barang. Terima kasih!</p>\r\n', '10-J008.jpg', 1, '2023-05-20 04:04:19'),
(24, 10, '#J009 Tas wanita / Tas selempang / waist bag', 34999, '<p>&nbsp;&bull; Material : Kulit Sintetis</p>\r\n\r\n<p>&bull; Detail : 1 kompartemen utama</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 Kantung kecil dibagian dalam tas</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tali Strap Panjang dan bisa diatur</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bisa dipakai anak dan dewasa mulai dari usia 6 tahun</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bisa untuk dijadikan tas pinggang</p>\r\n\r\n<p>Perawatan</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; - Cuci dengan sikat basah dan sabun lembut</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; - Keringkan dengan cara diangin-anginkan</p>\r\n\r\n<p>Ukuran : 18cm (panjang) x 5cm (tinggi) x 4cm (lebar)</p>\r\n', '10-J009.jpg', 1, '2023-05-20 04:15:41'),
(25, 10, '#J010 Tas Etnik / Tas bahu wanita', 46000, '<p>Selamat datang di fashion_space1 =======</p>\r\n\r\n<p>+100% gambarnya sama dengan aslinya</p>\r\n\r\n<p>+100% produk impor</p>\r\n\r\n<p>+ Tidak perlu bertanya ke toko, cukup klik variasinya, pesanan berhasil dilakukan, dan pengiriman dapat dilakukan.</p>\r\n\r\n<p>+ Pengiriman dari Tangerang</p>\r\n\r\n<p>=Nama Tas: Messenger Bag/Tas Bahu</p>\r\n\r\n<p>=Bahan: bahan khusus</p>\r\n\r\n<p>=4 warna: biru/khaki/kuning</p>\r\n\r\n<p>=Ukuran: lebar atas: 21.5CM, tinggi bawah; 16CM, tinggi: 15CM, tebal: 1CM, tali bahu: 120CM</p>\r\n\r\n<p>= Berat: 0,15kg</p>\r\n', '10-J010.jpg', 1, '2023-05-20 04:18:11'),
(26, 10, '#J011 Evho – Arc Waistbag | Tas Pinggang', 181800, '<p>Bahan Sysntetic leather premium Waterproof</p>\r\n\r\n<p>Sletting waterproof</p>\r\n\r\n<p>buckle amco part</p>\r\n\r\n<p>bahan dalam wp torin urex</p>\r\n\r\n<p>Tali 3D premium design</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>panjang 30 cm</p>\r\n\r\n<p>lebar 7 cm</p>\r\n\r\n<p>tinggi 14 cm</p>\r\n\r\n<p>panjang tali 130 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>fungsi</strong></p>\r\n\r\n<p>3 sletting utama</p>\r\n\r\n<p>1 sletting dalem</p>\r\n\r\n<p>4 saku multifungsi</p>\r\n', '10-J011.jpg', 1, '2023-05-20 04:20:10'),
(27, 9, '#I002 CEKA Totebag Mini Wanita Resleting Wanita Tas Kerja Tas Kantor', 128900, '<p>Detail :</p>\r\n\r\n<p>L : Muat laptop 13-14 inch bezel tipis</p>\r\n\r\n<p>S : Muat untuk&nbsp; ipad / tab</p>\r\n\r\n<p>Ukuran</p>\r\n\r\n<p>L&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 46x17,5x28cm</p>\r\n\r\n<p>S&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 34x9x25cm</p>\r\n\r\n<p>Material : Kulit Sintetis Premium (Tekstur Kulit Croco Premium)</p>\r\n\r\n<p>Included : Dust Bag, Brand Tag, Care Label, Full Emboss</p>\r\n\r\n<p>Kompartemen : 1 Ruang Penyimpanan Besar</p>\r\n\r\n<p>Style : Shoulder &amp; Handle</p>\r\n', '9-I002.jpg', 1, '2023-05-20 04:24:27'),
(28, 9, '#I003 Tas Kantor Kerja Pria Selempang Jinjing bisa expanding - Briefcase Original Import Polo Hummer', 272000, '<p>&nbsp;Tas Laptop Polo Hummer</p>\r\n\r\n<p>- Warna: Hitam</p>\r\n\r\n<p>- Material cordura, splashproof</p>\r\n\r\n<p>- 1 Kompartemen utama dengan resleting (saku pengaman laptop di dalam)</p>\r\n\r\n<p>- 1 Kompartemen sekunder sengan resleting</p>\r\n\r\n<p>- 1 Resleting untuk EXPANDING</p>\r\n\r\n<p>- 1 Selipan kantong di bagian belakang dengan resleting</p>\r\n\r\n<p>- 2 Kantong di bagian depan dengan resleting</p>\r\n\r\n<p>- Dimensi: 40x15x30</p>\r\n\r\n<p>*****&nbsp; Note: SEMUA MODEL MEMILIKI JUMLAH KANTONG SAMA&nbsp; *****</p>\r\n', '9-I003.jpg', 1, '2023-05-20 06:56:05'),
(29, 9, '#I004 Luminox Tas Kantor / Tas Pria / Tas Laptop', 239000, '<p>●Ukuran Produk (PxLxT) 40x8x30 cm</p>\r\n\r\n<p>●Tas Kantor multifungsi (Tas Jinjing dan Selempang)</p>\r\n\r\n<p>●Terbuat dari bahan polyester 500 denier weave dan water repellent</p>\r\n\r\n<p>●1 Kolom utama dilengkapi dengan sekat laptop max. 14 inch</p>\r\n\r\n<p>●1 kolom utama lainnya dengan sekat organizer untuk berbagai barang esensial dan kaitan untuk gantungan kunci</p>\r\n\r\n<p>●1 kolom tambahan dibagian depan tas</p>\r\n\r\n<p>●Double kepala resleting untuk memudahkan dalam membuka dan menutup tas</p>\r\n\r\n<p>●Sekat penyangga ke trolley koper</p>\r\n\r\n<p>●Tali selempang yang dapat dilepas pasang sesuai dengan kebutuhan Anda</p>\r\n\r\n<p>●Terdapat saku dibagian belakang tas dengan resleting untuk menyimpan barang berharga (safety pocket)&quot;</p>\r\n', '9-I004.jpg', 1, '2023-05-20 06:59:03'),
(30, 9, '#I005 Backpack Pria Waterproof Tas Ransel Laptop Original - Genus Pro2 Mokamula', 292500, '<p>SPESIFIKASI BACKPACK PRIA GENUS PRO2 :</p>\r\n\r\n<p>- Bahan Utaman : Cordura Bimo</p>\r\n\r\n<p>- Bahan Dalam : D300</p>\r\n\r\n<p>- Accessories : Iron Castings ATG Finishing</p>\r\n\r\n<p>- Ring/Accessories :&nbsp; Buckle Acetal</p>\r\n\r\n<p>- Dimensi Tas - P33 x L15 x T43 Cm</p>\r\n\r\n<p>- Berat Produk - 800 gram (17 Lliter)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>FITUR BACKPACK PRIA GENUS PRO2 :</p>\r\n\r\n<p>- USB Port ( termasuk kabel USB dalam paket penjualan )</p>\r\n\r\n<p>- Headset Hole</p>\r\n\r\n<p>- Bonus Raincover</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>KOMPARTEMEN BACKPACK PRIA GENUS PRO2 :</p>\r\n\r\n<p>- 1 Ruang Utama</p>\r\n\r\n<p>- 1 Saku Resleting Depan (Bag Luar)</p>\r\n\r\n<p>- 1 Saku Resleting Belakang (Bag Luar)</p>\r\n\r\n<p>- 2 Saku Kanan Kiri (Bag Luar)</p>\r\n\r\n<p>- 1 Slot Laptop 15,6 Inch (Bag Dalam)</p>\r\n\r\n<p>- 1 Saku Resleting (Bag Dalam)</p>\r\n\r\n<p>- 2 Saku HP (Bag Dalam)</p>\r\n', '9-I005.jpg', 1, '2023-05-20 07:01:58'),
(31, 9, '#I006 Tas Ransel Distro Laptop Pria Wanita Backpack', 289000, '<p>- Design Stylish Elegant</p>\r\n\r\n<p>- Large Capacity</p>\r\n\r\n<p>- Bahan Tebal Premium</p>\r\n\r\n<p>- Terdapat Bantalan Busa di Tali dan Bagian Belakang Tas</p>\r\n\r\n<p>- Bahan Waterproof</p>\r\n\r\n<p>- Terdapat Slot Laptop</p>\r\n\r\n<p>- Bagian Space Utama Model Serut</p>\r\n\r\n<p>- Terdapat 2 Resleting ( 1 Depan + 1 Bagian Dalam)&nbsp;&nbsp;</p>\r\n\r\n<p>- Terdapat 2 Sisi Kantong</p>\r\n\r\n<p>- Bisa Slot Ke Gagang Handle Koper</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Materials : Polyster PVC&nbsp;</p>\r\n\r\n<p>Kapasitas : 20L</p>\r\n\r\n<p>Size : 33 x 14 x 43 Cm</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ready :</p>\r\n\r\n<p>- BLACK</p>\r\n\r\n<p>- GREY</p>\r\n', '9-I006.jpg', 1, '2023-05-20 07:06:17'),
(32, 9, '#I007 Tas Tote Bag Wanita kanvas untuk laptop', 99900, '<p>- Material Kanvas Premium</p>\r\n\r\n<p>- Kompartement utama luas</p>\r\n\r\n<p>- Penutup menggunakan resleting</p>\r\n\r\n<p>- Muat hingga laptop 14 inch</p>\r\n\r\n<p>- Interior gadget sleave , pocket with zipper</p>\r\n\r\n<p>- Kompartement Luas Muat Banyak Muat Laptop Design Stylish</p>\r\n\r\n<p>- Terdapat 2 slot di bagian depaN</p>\r\n\r\n<p>- Dimensi : P X L X T : 34,5 X 10 X 31</p>\r\n', '9-I007.jpg', 1, '2023-05-20 07:12:18'),
(33, 9, '#I008 Puan Bag – Fit LAPTOP 16 inch', 159000, '<p>-Premium Faux Leather (tebal dan lentur)</p>\r\n\r\n<p>-Water resistant (tidak tembus jika terkena air)</p>\r\n\r\n<p>-Full Zipper (resleting anti macet)</p>\r\n\r\n<p>-Compartment available (ada tempat penyimpanan untuk barang penting)</p>\r\n\r\n<p>-Satin interior (sehingga bagian dalam tas tidak gampang kotor dan mudah dibersihkan)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>*Free STRAP PANJANG (bisa jadi tas selempang)</p>\r\n\r\n<p>*Free DUSTBAG (supaya tas tidak berdebu)</p>\r\n\r\n<p>*Muat LAPTOP up to 16 inch</p>\r\n', '9-I008.jpg', 1, '2023-05-20 07:14:30'),
(34, 9, '#I009 Tote bag ransel Backpack urban factor - Firm | Tas laptop Pria Kasual', 204000, '<p>Deskripsi:</p>\r\n\r\n<p>* Tas 16L, Tempat Laptop fit to 15 inch*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>* Setiap pembelian Tas ransel urban factor series Firm Berhak mendapatkan Gratis Bonus Khusus</p>\r\n\r\n<p>* Garansi 3 bulan untuk setiap pembelian Tas ransel, (wajib sertakan foto atau video saat review) sebagai syarat klaim garansi (syarat dan ketentuan berlaku)&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>* Claim free ongkos kirim dan voucher lainnya di setiap pembelian lewat progam-program</p>\r\n\r\n<p>* Pastikan Chat ke admin terlebih dahulu untuk cek stock sebelum melakukan pembelian&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>* Setiap Pembelian Tas ransel / Tas laptop / Backpack Top Roll akan mendapatkan :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Kartu Keaslian Tas Ransel / Tas Laptop Urban Factor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Sticker Urban Factor&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Greating Card&nbsp;</p>\r\n\r\n<p>* Semua Backpack Urban Factor merupakan Produk dengan Kualitas Terbaik yang di buat di pabrik sendiri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>* Pengiriman cepat untuk seluruh wilayah Indonesia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>* Pengiriman Setiap hari max Jam 17:00,&nbsp; Minggu Libur pengiriman (closed)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>* Setiap Backpack / Tas laptop / Tas Ransel Urban factor melalui proses QC ketat untuk mendapatkan product terbaik bagi Konsumen</p>\r\n', '9-I009.jpg', 1, '2023-05-20 07:33:23'),
(35, 9, '#I010 DEADLY Tote bag Hitam Tas Selempang', 94000, '<p>Panduan Ukuran</p>\r\n\r\n<p>Panjang x Tinggi x Lebar: 39 x 37 x 7 cm</p>\r\n\r\n<p>Bahan: Premium Balloon Nylon</p>\r\n\r\n<p>1 kompartemen utama &ndash; fit laptop 12 inch</p>\r\n\r\n<p>2 kompartemen tambahan</p>\r\n\r\n<p>Bisa jadi Totebag dan Slingbag</p>\r\n', '9-I010.jpg', 1, '2023-05-20 07:34:53'),
(36, 9, '#I011 HUTCH Tote Bag \"RYKER\" Black', 137000, '<p>selamat datang di HUTCH OFFICIAL STORE, Produk kami adalah solusi untuk kamu yang pengen tampil modis dengan budget minimalis namun tetap dengan kualitas yang KEREN ABISSS !</p>\r\n\r\n<p>Inovasi terbaru dari HUTCH.ID yang menggabungkan fungsi Backpack dan Totebag dalam satu produk yang sama.</p>\r\n\r\n<p>Fitur backpack strap pada bagian belakang Totte Bag di design khusus sehingga tidak mengganggu kenyamanan kalian saat menggunakan Tas ini sebagai Totte Bag ataupun Tas Jinjing. Totebag Lyon mampu memenuhi kebutuhan mobile kalian, baik saat bergaya santai, casual, ataupun professional. Cocok digunakan untuk aktivitas kuliah maupun aktivitas outdoor lainnya.</p>\r\n', '9-I011.jpg', 1, '2023-05-20 07:36:24'),
(37, 8, '#H001 HONYAN Clutch Pria Import Waterproof Tas Tangan Anti Air Hand Bag - Easton', 189000, '<p>Bahan: Kulit PU Premium</p>\r\n\r\n<p>Ukuran : 27.5x6.5x20</p>\r\n\r\n<p>Warna:&nbsp; Black,Brown</p>\r\n\r\n<p>Bag Mouth: 1 Zipper</p>\r\n\r\n<p>Berat: 400 gram</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Included:</p>\r\n\r\n<p>Box Hon&amp;Yan</p>\r\n\r\n<p>Full Emboss Hon&amp;Yan</p>\r\n\r\n<p>Dust Bag Hon&amp;Yan</p>\r\n\r\n<p>Brand Tag Hon&amp;Yan</p>\r\n\r\n<p>Care Label Hon&amp;Yan</p>\r\n', '8-H001.jpg', 1, '2023-05-20 07:39:05'),
(38, 8, '#H002 Evernext- Clutch Bag ipad Tablet Waterproof', 99000, '<p>Deskripsi: CLUTCH WEASLEY di design dengan simple dan minimalis, Clutch Weasley ini dapat menunjang kebutuhan mobile kalian secara maksimal, baik bergaya santai, casual, ataupun professional. Terdapat banyak saku yang bisa digunakan.</p>\r\n', '8-H002.jpg', 1, '2023-05-20 07:40:28'),
(39, 8, '#H003 Tas clucth wanita terkinian cantik', 85500, '<p>Bahan&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pu leather sintesis</p>\r\n\r\n<p>Ukuran&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22 * 5,5 * 11.5 Cm</p>\r\n\r\n<p>Berat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 600 Gram</p>\r\n', '8-H003.jpg', 1, '2023-05-20 07:41:52'),
(40, 8, '#H004 Zorra – Sofia Clutch Wanita Pesta', 69900, '<p>SOFIA Clutch Mewah</p>\r\n\r\n<p>Clutch Wanita Serbaguna, cocok dipakai sebagai clutch pesta, atau dibawa ke kantor .</p>\r\n\r\n<p>Clutch Pesta ini tidak terlalu besar, namun cukup untuk menyimpan berbagai keperluan, seperti dompet, HP, dan peralatan make up. Model nya simple, dengan bahan yang premium menambah kesan mewah clutch pesta SOFIA dari ZORRA.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Terdapat handle yang bisa dilepas pasang menyesuaikan penampilan.</p>\r\n', '8-H004.jpg', 1, '2023-05-20 07:43:25'),
(41, 8, '#H005 Zorra - Osaka Clutch Pesta Wanita Premium Quality  Tas Tangan Wanita Terbaru', 89900, '<p>Fashion Clutch dengan bahan PU Leather dikombinasikan dengan aksen tekstile dan motif batik yang menarik.&nbsp;</p>\r\n\r\n<p>Kualitas PREMIUM, dengan harga yang sangat terjangkau.</p>\r\n\r\n<p>ukuran 27.5 x 20 cm.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Clutch simple, namun bisa menyimpan untuk menyimpan berbagai keperluan, seperti dompet, make up kit, dan HP.</p>\r\n', '8-H005.jpg', 1, '2023-05-20 07:44:43'),
(42, 8, '#H006 Tas Dompet Clutch Bag', 55000, '<p>READY WARNA HITAM DAN COKLAT</p>\r\n\r\n<p>Tas Dompet Bag Clutch 1001</p>\r\n\r\n<p>Ukuran : 25.5 x 17 x 3.5 cm</p>\r\n\r\n<p>Bahan : Kulit Imitasi / PU</p>\r\n', '8-H006.jpg', 1, '2023-05-20 07:47:20'),
(43, 8, '#H007 Kee Clutch Tas Tangan Pria OX BLACK', 149000, '<p>SPECIFICATION:</p>\r\n\r\n<p>- Dimension: 25 x 20 x 3 cm</p>\r\n\r\n<p>- Thickness: 2mm</p>\r\n\r\n<p>MATERIAL:</p>\r\n\r\n<p>- Murano Faux Leather</p>\r\n\r\n<p>- Satin Lining Fabric</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>FEATURE:</p>\r\n\r\n<p>- 1 Compartment Utama</p>\r\n\r\n<p>- 1 Compartment di bagian dalam tas</p>\r\n\r\n<p>- Card Organizer</p>\r\n\r\n<p>BONUS :</p>\r\n\r\n<p>- Sticker KEE INDONESIA</p>\r\n', '8-H007.jpg', 1, '2023-05-20 07:49:08'),
(44, 8, '#H008 SLIGHT Clutch Tas Pesta Reveka Gold Hitam Light Silver Dark Silver dan Pink Rosegold', 142500, '<p>&bull; Ready Gold , Hitam , Light Silver , Dark Silver dan Pink Rosegold</p>\r\n\r\n<p>&bull; Elegant &amp; Artistic</p>\r\n\r\n<p>&bull; Exclusive</p>\r\n\r\n<p>&bull; High Quality</p>\r\n\r\n<p>&bull; Detail size ukuran tas panjang 24 cm, lebar 5 cm dan tinggi 13 cm.</p>\r\n\r\n<p>&bull; Terbuat dari bahan kombinasi kulit sintetis glitter dan aksesoris metal .</p>\r\n\r\n<p>&bull; Bonus : Long slingbag chain (tali rantai panjang)</p>\r\n\r\n<p>&bull; Limitid Edition</p>\r\n', '8-H008.jpg', 1, '2023-05-20 07:51:13'),
(45, 8, '#H009 SLIGHT Clutch Tas Pesta Esme', 159250, '<p>NEW COLLECTION ❤&nbsp;</p>\r\n\r\n<p>&bull; Ready warna Hitam, Silver dan Beige Cream untuk produk Clutch Tas Pesta Esme.</p>\r\n\r\n<p>&bull; Elegant &amp; Artistic</p>\r\n\r\n<p>&bull; Exclusive</p>\r\n\r\n<p>&bull; High Quality</p>\r\n\r\n<p>&bull; Detail size ukuran . dengan ukuran panjang 22 cm, lebar 5 cm, dan tinggi 13,8 cm</p>\r\n\r\n<p>&bull; Terbuat dari bahan kombinasi kulit sintetis.</p>\r\n\r\n<p>&bull; Limited Edition</p>\r\n', '8-H009.jpg', 1, '2023-05-20 07:53:09'),
(46, 8, '#H010 SLIGHT Clutch Marble Light Gold', 220500, '<p>Clutch Tas Pesta Marble&nbsp; Motifnya terinspirasi dari motif marble atau kristal yang sedang hits saat ini. Motif yang penuh dengan kesan elegan . Ada kesan mewah namun tetap terlihat simple di balik desain marmer ini. Desainnya sengaja dibuat artistik dan elegan untuk mendukung keanggunan dirimu.</p>\r\n\r\n<p>&bull; Elegant &amp; Artistic</p>\r\n\r\n<p>&bull; Exclusive</p>\r\n\r\n<p>&bull; High Quality</p>\r\n\r\n<p>&bull; Bonus: Long Slingbag Chain</p>\r\n\r\n<p>&bull; Berukuran Diameter 17,5 cm (muat hp besar maksimal 6,5 inch ) Tebal 4.5 cm</p>\r\n\r\n<p>&nbsp;&bull; Clutch ini juga dilengkapi dengan hiasan tassel yang tidak kalah elegan.</p>\r\n', '8-H010.jpg', 1, '2023-05-20 07:55:05'),
(47, 7, '#G001 Tas selempang bening transparan PVC kasual tas Messenger bahu olahraga pria', 35000, '<p>Bagus untuk acara olahraga, konser, festival, sekolah dan kantor,</p>\r\n\r\n<p>Terbuat dari PVC jernih tahan lama, tahan air, dan dingin, nilon lembut, dan ritsleting kokoh,</p>\r\n\r\n<p>Tali bahu disesuaikan,</p>\r\n\r\n<p>Cocok untuk segala usia, pria dan wanita,</p>\r\n\r\n<p>Mudah dibersihkan</p>\r\n\r\n<p>Mudah untuk dibawa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Spesifikasi:</p>\r\n\r\n<p>Ukuran: 24*21*10cm/9.4*8.3*3, 9in</p>\r\n\r\n<p>Berat: 300g</p>\r\n\r\n<p>Bahan: PVC</p>\r\n\r\n<p>Elemen populer: transparan</p>\r\n\r\n<p>Gaya: kesederhanaan perkotaan</p>\r\n', '7-G001.jpg', 1, '2023-05-20 07:56:36'),
(48, 7, '#G002 Tas Selempang LESTIE 100% Canvas Premium Tebal Tas Kanvas', 37500, '<p>- GARANSI 12 BULAN</p>\r\n\r\n<p>- FOTO ASLI by SATU ALAT ( COPYRIGHT )</p>\r\n\r\n<p>- 99% SEPERTI DI FOTO</p>\r\n\r\n<p>- GENDER : WANITA</p>\r\n\r\n<p>- TALI : PANJANG SEKALI SEBAGAI VARIASI up to 150cm</p>\r\n\r\n<p>- BAHAN&nbsp; : 100% CANVAS PREMIUM TEBAL</p>\r\n\r\n<p>- INSIDE / DALAM&nbsp; : LAPIS PURING TEBAL ADA 2 KANTONG</p>\r\n\r\n<p>- SIZE&nbsp; : P x L x T ( 22CM X 6CM X 19CM )</p>\r\n\r\n<p>- CLOSURE TYPE : RESLETING</p>\r\n\r\n<p>- USAGE : TOTEBAG, HANDBAG, SLING BAG</p>\r\n', '7-G002.jpg', 1, '2023-05-20 07:58:04'),
(49, 7, '#G003 ALEXA BAG By selusa', 60900, '<p>A Local Sweetbag</p>\r\n\r\n<p>-----</p>\r\n\r\n<p>Hallo girls, welcome to Selusa. Desain tas yang sangat unik dan berbeda membuat hari-harimu&nbsp; bersemangat dan juga membuat penampilanmu on-point !</p>\r\n\r\n<p>SPESIFIKASI</p>\r\n\r\n<p>MATERIALS : Kanvas Premium</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The package u get ?</p>\r\n\r\n<p>- Soft box coklat (hanya untuk produk yang bahannya kokoh saja ya bestie)</p>\r\n\r\n<p>Berikut produk selusa yang menggunakan soft box :</p>\r\n\r\n<p>Joanna bag, Naima bag, Bijou bag, Tamara binder, Ara medium, Livy bag, Aily bag, Baylen bag.</p>\r\n', '7-G003.jpg', 1, '2023-05-20 08:05:17'),
(50, 7, '#G004 CRSL Omo Slingbag | Choose Characters | Tas Selempang', 159000, '<p>Go steal this bag before run out of stock!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>◾️Colors : Each Characters 1 color.</p>\r\n\r\n<p>◾️Size : 29 x 17 x 10 cm (PxLxT)</p>\r\n\r\n<p>◾️Materials : Baby Corduroy</p>\r\n\r\n<p>◾️Bordir Characters</p>\r\n\r\n<p>◾️Resleting YKK</p>\r\n', '7-G004.jpg', 1, '2023-05-20 08:06:58'),
(51, 7, '#G005 MINI BUMPY BAG', 149999, '<p>MINI BUMPY BAG! Made from crinkle material, that lightweight and easy for your daily wear. This slingbag features an adjustable body strap and a hand grip to be used as a handbag. Comes in 6 colors (army, black, brown, navy, sky blue, and yellow) this bag surely will be your new companion throughout the year!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Go adopt yours NOW!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>◾️Colors : Black, Sky Blue, Navy, Army, Yellow</p>\r\n\r\n<p>◾️Size :</p>\r\n\r\n<p>◾️Materials : Crinkel</p>\r\n\r\n<p>◾️Bordir Characters</p>\r\n\r\n<p>◾️Resleting YKK</p>\r\n', '7-G005.jpg', 1, '2023-05-20 08:09:15'),
(52, 7, '#G006 ROBIC SLINGBAG', 159999, '<p>☀️ ROBIC SLINGBAG ☀️</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Looking for a bag that&rsquo;s simple yet spacious?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We have something for you! CRSL &ldquo;Robic&rdquo; Bag. Made from kanvas twill material. Comes in two colours, black and broken white. Spacious compartment that fits a 10&rdquo; inch iPad and adjustable strap. You can detach the padded strap and wear it as a shoulder bag.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Adopt this one bag for so many features!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>◾️Colors : Black, White</p>\r\n\r\n<p>◾️Size :</p>\r\n\r\n<p>◾️Materials : Canvas PE (water repellant aman gerimis)</p>\r\n\r\n<p>◾️Resleting YKK</p>\r\n', '7-G006.jpg', 1, '2023-05-20 08:12:32'),
(53, 7, '#G007 STAR MESSSENGER BAG | Fairycore bag', 175000, '<p>Material: Canvas Water Resistant</p>\r\n\r\n<p>Color: Khaki combine with Army (the Star)</p>\r\n\r\n<p>(warna asli mungkin terlihat beda di foto karena efek cahaya)</p>\r\n\r\n<p>Size:</p>\r\n\r\n<p>&nbsp;- Length: 35 cm</p>\r\n\r\n<p>&nbsp;- Height: 28 cm</p>\r\n\r\n<p>&nbsp;- Width: 10 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>NOTES:</p>\r\n\r\n<p>pre-order 3-7 days because we made by order-!</p>\r\n', '7-G007.jpg', 1, '2023-05-20 08:14:16'),
(54, 7, '#G008 Vidoj – Slingbag/ Tas selempang wanita- Jill Black', 175000, '<p>Jill slingbag in black</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>premium taslan material</p>\r\n\r\n<p>sizechart di slide ke 4</p>\r\n\r\n<p>tali adjustable dan bisa dilepas pasang</p>\r\n\r\n<p>menggunakan kancing (tidak menggunakan resleting</p>\r\n\r\n<p>tali serut sebagai pengaman tambahan</p>\r\n', '7-G008.jpg', 1, '2023-05-20 08:15:28'),
(55, 7, '#G009 Bostanten Tas Wanita Tas selempang', 179000, '<p>Bahan: kulit PU</p>\r\n\r\n<p>Warna: Cokelat</p>\r\n\r\n<p>Dimensi: 20cm (Lebar) * 16.5cm (Tinggi) * 6.5cm (Kedalaman)</p>\r\n\r\n<p>Berat: 0.48kg</p>\r\n\r\n<p>Deskripsi internal：Saku penyimpanan besar*1 Saku sisipan*3, tinggi tengah tali bahu sekitar 44-53cm (dapat disesuaikan dan tidak dapat dilepas)</p>\r\n', '7-G009.jpg', 1, '2023-05-20 08:17:19'),
(56, 7, '#G010 Tas Selempang Kulit Wanita Tas Cewek Rantai Bahu Slingbag Pearl Bag GM 8968', 97000, '<p>Warna: Creamy White</p>\r\n\r\n<p>Bahan: PU leather</p>\r\n\r\n<p>Ukuran: 21x6x14 cm ( PxLxT )</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>~dapat 2 tali</p>\r\n\r\n<p>~produk import</p>\r\n', '7-G010.jpg', 1, '2023-05-20 08:18:42'),
(57, 6, '#F001 Roaming Koper ABS Kabin & Bagasi L018', 550000, '<p>High Quality</p>\r\n\r\n<p>Import 100%</p>\r\n\r\n<p>Bahan ABS</p>\r\n\r\n<p>Anti Gores</p>\r\n\r\n<p>Roda 4 berputar 360</p>\r\n\r\n<p>Aluminium Stainless Trolly</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Koper tersebut merupakan koper upgradean dari model koper lama kami</p>\r\n\r\n<p>Kelebihannya :</p>\r\n\r\n<p>Warna roda, kunci, handle semuanya sudah ikut warna tubuh koper jadi lebih cakep karena warnanya senada</p>\r\n', '6-F001.jpg', 1, '2023-05-20 08:21:09'),
(58, 6, '#F002 Tas Koper Polo City Hardcase Size 24 Inch', 259000, '<p>Polo City siap menemani perjalananan Anda dengan menghadirkan Polo City Koper 4roda putar 360derajat. koper ini siap menampung segala keperluan pribadi Anda, mulai dari baju, peralatan mandi, hingga dokumen penting. Dilengkapi dengan kunci kombinasi, barang-barang Anda lebih terjaga keamanannya selama bepergian. Koper berdesain kompak ini memiliki 4buah roda putaryang memudahkan Anda untuk menariknya, sehingga beban terasa lebih ringan dan bergerak pun lebih leluasa.</p>\r\n', '6-F002.jpg', 1, '2023-05-20 08:22:57'),
(59, 6, '#F003 YOKO Koper Kabin Bagasi 20 22 24 Inch Warna Pastel Roda Silent', 369000, '<p>✨ 【Fitur】</p>\r\n\r\n<p>Koper ini sangat cocok untuk bepergian. Ke mana pun Anda pergi ke rencana perjalanan, kapal, kereta api, dll. Koper membuat hidup menjadi mudah dan menyenangkan.</p>\r\n\r\n<p>✅ 【Eksterior】</p>\r\n\r\n<p>Berbagai warna, penampilan fashion, penampilan trendi untuk Anda pilih.</p>\r\n\r\n<p>✅ 【Bahan PC Jerman】</p>\r\n\r\n<p>Tas troli perjalanan ini terbuat dari cangkang keras bahan PC Jerman yang ringan dan tahan lama; tahan gores, tahan tekanan dan tahan air. Interior yang sepenuhnya berjajar dan organizer serbaguna memudahkan Anda mengemas pakaian.</p>\r\n\r\n<p>✅ 【Putaran 360&deg;】</p>\r\n\r\n<p>Roda putar multi-arah yang senyap bergerak ke segala arah dan mudah untuk bermanuver, roda ini telah diuji secara ekstensif dalam kondisi jalan yang berbeda, menekankan daya tahan dan ketahanan terhadap kerusakan. Jadikan globetrotting Anda lebih mudah.</p>\r\n', '6-F003.jpg', 1, '2023-05-20 08:24:57'),
(60, 6, '#F004 YOKO Koper Germany Covestro PC Material Import Koper 24 Inch jumbo 20 / 22 inch Kabin', 391000, '<p>✨ 【Fitur】</p>\r\n\r\n<p>Koper ini sangat cocok untuk bepergian. Ke mana pun Anda pergi ke rencana perjalanan, kapal, kereta api, dll. Koper membuat hidup menjadi mudah dan menyenangkan.</p>\r\n\r\n<p>✅ 【Eksterior】</p>\r\n\r\n<p>Berbagai warna, penampilan fashion, penampilan trendi untuk Anda pilih.</p>\r\n\r\n<p>✅ 【Bahan PC Jerman】</p>\r\n\r\n<p>Tas troli perjalanan ini terbuat dari cangkang keras bahan PC Jerman yang ringan dan tahan lama; tahan gores, tahan tekanan dan tahan air. Interior yang sepenuhnya berjajar dan organizer serbaguna memudahkan Anda mengemas pakaian.</p>\r\n\r\n<p>✅ 【Putaran 360&deg;】</p>\r\n\r\n<p>Roda putar multi-arah yang senyap bergerak ke segala arah dan mudah untuk bermanuver, roda ini telah diuji secara ekstensif dalam kondisi jalan yang berbeda, menekankan daya tahan dan ketahanan terhadap kerusakan. Jadikan globetrotting Anda lebih mudah.</p>\r\n', '6-F004.jpg', 1, '2023-05-20 08:26:37'),
(61, 6, '#F005 Koper Cabin Pilot T089 18 Inch', 955000, '<p>Bahan Body 100% Polycarbonate</p>\r\n\r\n<p>✨️Resleting Pada Bagian Dalam Jauh Lebih Kuat</p>\r\n\r\n<p>✨️ Sistem Kunci TSA LOCK Yang Dapat Memberikan Keamanan Dalam Mengunci Koper Dengan 3 Kombinasi Angka</p>\r\n\r\n<p>✨️Putaran Roda 360&deg; Dan Dilengkapi Dengan Lapisan Karet Sehingga Roda Menjadi Tidak Berisik</p>\r\n\r\n<p>✨️100% Produk Import Yang Full Perakitan Dari Pabrik, Jadi Sangat Meminimalisir Cacat Karena Proses Perakitan Yang Belum Memenuhi Standart</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>SIZE KOPER:</p>\r\n\r\n<p>P=36cm</p>\r\n\r\n<p>L=24cm</p>\r\n\r\n<p>T=40cm</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>SIZE BEAUTYCASE:</p>\r\n\r\n<p>P=31cm</p>\r\n\r\n<p>L=8cm</p>\r\n\r\n<p>T=23cm</p>\r\n', '6-F005.jpg', 1, '2023-05-20 08:31:09'),
(62, 6, '#F006 Tas Koper Anak Troli Roda 4 Ukuran 18 Inch', 155000, '<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ukuran 18 Inch</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bahan Koper : Fiber ABS</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Material Trolly/ Tangkai Koper : Alumunium Hitam anti karat</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lapisan Dalam Koper : Satin berbebahan halus dan tebal</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Roda Koper : 4 roda yang dapat berputar 360 derajat</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kunci Pengaman : Kode kunci dengan 3 nomor yang kode dasarnya 000 dan bisa disetting sendiri</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Panjang Koper : 34 cm</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lebar Koper : 21 cm</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tinggi Koper : 36 cm</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kapasitas Isi Koper : 7 - 10 kg</p>\r\n', '6-F006.jpg', 1, '2023-05-20 08:32:34'),
(63, 6, '#F007 Koper Kabin Polo Milano 18 Inch', 425000, '<p>SPECIFICATION :</p>\r\n\r\n<p>Brand :&nbsp; Polo Milano&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>Material :&nbsp; ABS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>Ukuran :&nbsp; 18&nbsp; Inch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>Dimensi :&nbsp; 48x21x41&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>Berat Fisik :&nbsp; 1 kg&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>FEATURE :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>- Detail Logo</p>\r\n\r\n<p>- Adjustable Trolley</p>\r\n\r\n<p>- 3 Digit Combination Lock</p>\r\n\r\n<p>- 360 Rotate Wheel</p>\r\n\r\n<p>- Top &amp; Side Handle</p>\r\n', '6-F007.jpg', 1, '2023-05-20 08:34:00'),
(64, 6, '#F008 Koper Cantik List Gold Kabin & Bagasi', 688000, '<p>High Quality</p>\r\n\r\n<p>Import 100%</p>\r\n\r\n<p>Bahan Polycarbonite Anti Pecah</p>\r\n\r\n<p>Aluminium Frame</p>\r\n\r\n<p>TSA Lock</p>\r\n\r\n<p>4 Roda berputar 360</p>\r\n\r\n<p>Aluminium Stainless Trolly</p>\r\n', '6-F008.jpg', 1, '2023-05-20 08:36:03'),
(65, 6, '#F009 Koper Anak Roda 4 Tas Troli Unisex LK003', 134000, '<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ukuran 18 Inch</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bahan Koper : Fiber ABS</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Material Trolly/ Tangkai Koper : Alumunium Hitam anti karat</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lapisan Dalam Koper : Satin berbebahan halus dan tebal</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Roda Koper : 4 roda yang dapat berputar 360 derajat</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Panjang Koper : 30 cm</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lebar Koper : 20 cm</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tinggi Koper : 45 cm</p>\r\n\r\n<p>&bull;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kapasitas Isi Koper : 7 - 10 kg</p>\r\n', '6-F009.jpg', 1, '2023-05-20 08:37:26'),
(66, 6, '#F010 Tas Koper Kabin Polo City Hardcase Fiber Size 18 inch - 074', 209000, '<p>Koper Hardcase ABS+PVC Coated</p>\r\n\r\n<p>- Kunci Kombinasi</p>\r\n\r\n<p>- Iron Trolley</p>\r\n\r\n<p>- Padded Handle</p>\r\n\r\n<p>- 4 Roda Putar 360 derajat</p>\r\n\r\n<p>- Dimensi 18 inch: 34x20x50&nbsp;cm</p>\r\n\r\n<p>- Sudah termasuk packaging dus + bubble wrap</p>\r\n', '6-F010.jpg', 1, '2023-05-20 08:39:11'),
(67, 5, '#E001 Eiger Shelby 2.0 Laptop Backpack', 489000, '<p>- Menggunakan material polyester yang bagus dan tebal</p>\r\n\r\n<p>- Dilengkapi dengan strap pengaman</p>\r\n\r\n<p>- Memiliki kompartemen yang banyak</p>\r\n\r\n<p>Editor&#39;s Choice: &quot;Buat kamu yang memiliki aktivitas padat dengan mobilitas tinggi, membawa laptop berpergian tentu menjadi sesuatu yang agak merepotkan. Agar memudahkan kegiatan kamu, backpack Shelby 2.0 dari Eiger bisa menjadi tas laptop terbaik yang dimiliki. Tas laptop Eiger ini dibuat dari material yang bagus dan berkualitas, karena menggunakan polyester yang tebal dan tidak mudah merembes saat hujan.&quot;</p>\r\n\r\n<p>Selain itu, kompartemen utamanya juga terbilang luas dan bisa menampung laptop 14 inci dan barang lainnya yang dibutuhkan untuk menunjang kegiatanmu, seperti buku dan alat tulis. Tak ketinggalan pula saku-saku kecil, yang bisa kamu manfaatkan untuk menyimpan aksesoris ataupun barang-barang kecil lainnya.</p>\r\n\r\n<p>Tali punggungnya juga dibuat tebal dengan busa, sehingga terasa lebih nyaman. Tas laptop Eiger ini juga dlengkapi dengan strap pengaman, jadi membawa tas pun bisa lebih aman.</p>\r\n', '5-E001.jpg', 1, '2023-05-20 09:13:03'),
(68, 5, '#E002 Catenzo MB', 169000, '<p>- Laptop slot dilengkapi bantalan busa dan velcro</p>\r\n\r\n<p>- Memilki dua jenis tali</p>\r\n\r\n<p>- Muatan yang luas</p>\r\n\r\n<p>- Hanya tersedia satu warna</p>\r\n\r\n<p>Untuk para wanita yang ingin tampil trendi dengan tas laptop bagus yang kekinian, Catenzo dengan tipe MB 006 bisa menjadi produk ideal untuk kamu. Tas yang dirancang dengan kombinasi warna biru dan putih ini memiliki desain yang feminim dengan bentuk yang tak biasa. Bahan yang digunakan pun terbuat dari kanvas, sehingga membuat tas jadi lebih tebal dan kokoh.</p>\r\n\r\n<p>Tidak hanya itu, tas ransel laptop wanita yang satu ini menyadiakan dua jenis tali, yakni tali punggung dan tali yang berupa handle. Sehingga kamu bisa menggunakannya sebagai tas jinjing ataupun backpack, sesuai kebutuhan.</p>\r\n\r\n<p>Selain unggul dengan tampilan yang cantik, tas ini memiliki muatan utaman yang luas dan mampu membawa laptop ukuran 14 inci. Penyekat laptopnya pun dilengkapi dengan bantalan busa dan perekat velcro, membuat laptop yang dibawa jadi tetap aman dari guncangan.</p>\r\n', '5-E002.jpg', 1, '2023-05-20 09:15:00'),
(69, 5, '#E003 DTBG Ransel Laptop Premium', 399000, '<p>- Memiliki USB charging port</p>\r\n\r\n<p>- Memiliki 4 bar yang bisa menyala</p>\r\n\r\n<p>- Harga cukup terjangkau</p>\r\n\r\n<p>- Desain yang kurang compact</p>\r\n\r\n<p>Buat kamu yang sangat aware dengan keamanan, DTBG Ransel Laptop Premium adalah produk yang tepat untuk kamu. Dengan desain anti maling yang lebih bulky dari tas laptop kebanyakan, produk ini sudah dilengkapi dengan dengan USB charging port yang bisa disambungkan dengan power bank. Jadi, kamu tak perlu membuka-tutup tas terlalu sering ketika sedang mengisi daya handphone.</p>\r\n\r\n<p>Untuk bagian dalamnya tentu tak perlu diragukan lagi. Sebab, tas ransel laptop ini memiliki space khusus penyimpanan laptop untuk ukuran 15 inci yang dilengkapi dengan bantalan busa empuk, agar laptop lebih aman dan tahan guncangan. Lapisan luarnya pun dibuat dengan material tahan air, jadi kamu tak perlu khawatir saat musim hujan.</p>\r\n\r\n<p>Bukan hanya itu saja, tas ransel laptop ini juga memiliki 4 buah bar pada bagian depan tas, yang mana bar tersebut bisa menyala dan dapat memberikanmu sedikit penerangan ditempat yang gelap. Dengan dimensi 46 x 30 x 19 cm, produk ransel yang komplet ini ditawarkan dengan harga yang terjangkau.</p>\r\n', '5-E003.jpg', 1, '2023-05-20 09:19:22'),
(70, 5, '#E004 Kalibre Verquinox 28L', 499000, '<p>- Bahan nylon yang kuat</p>\r\n\r\n<p>- 3 kompartemen ruang</p>\r\n\r\n<p>- Lengkap dengan rain cover</p>\r\n\r\n<p>Buat kamu yang sering membawa gadget di dalam tas seperti, laptop, kamera untuk kerja atau kuliah, dan sedang mencari tas laptop anti air untuk melindungi barang keperluanmu? Rekomendasi tas yang satu ini bisa menjadi pilihan yang tepat buat kamu.&nbsp;<br />\r\n&nbsp;<br />\r\nKalibre Verquinox 28L merupakan salah satu tas laptop ransel anti air terbaik yang terbuat dari bahan nylon Japan. Dilengkapi dengan 3 kompartemen ruang dengan Zipper dan 1 kompartemen ruang utama menggunakan Zipper Lock.<br />\r\n&nbsp;<br />\r\nMeski dibanderol dengan harga yang cukup mahal, tetapi kualitas tas ini sangat baik untuk melindungi barang keperluanmu dari air. Sehingga, produk lokal ini juga sangat cocok untuk kamu yang suka membawa laptop karena sudah dilengkapi dengan kalibre rain cover.</p>\r\n', '5-E004.jpg', 1, '2023-05-20 09:22:11'),
(71, 5, '#E005 Navy Club EIBB Backpack', 174000, '<p>- Desain yang sederhana<br />\r\n- Terdapat bantalan pada bagian belakang tas<br />\r\n- Dilengkapi resleting yang bisa digembok</p>\r\n\r\n<p>Ingin tetap tampil kasual saat beraktivitas? Navy Club EIBB Backpack adalah tas laptop yang bagus untuk kamu. Produk yang satu ini memiliki desain yang sederhana dengan warna netral, sehingga cocok untuk digunakan sehari-hari baik bagi pria ataupun wanita.</p>\r\n\r\n<p>Selain itu, kompartemen utamanya terbilang luas, karena memiliki ruang khusus yang disediakan untuk laptop 14 inci dan peralatan lainnya, seperti buku maupun alat tulis. Pada bagian belakang tas dilengkapi juga dengan busa sebagai bantalan, agar laptop lebih aman sekaligus membuat punggung kamu tidak sakit akibat bersentuhan dengan body laptop.</p>\r\n\r\n<p>Tak ketinggalan pula, bagian samping tas laptop ransel ini memiliki slot khusus untuk botol minum yang terbuat dari material elastis, sehingga botol tidak mudah jatuh. Bagian resletingnya pun dibuat memiliki lubang, agar kamu bisa menggemboknya jika kamu memiliki gembok tas. Jadi, barang yang kamu bawa pun bisa tetap aman.</p>\r\n', '5-E005.jpg', 1, '2023-05-20 09:29:53');
INSERT INTO `tb_product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_description`, `product_image`, `product_status`, `date_created`) VALUES
(72, 5, '#E006 Hamlin Quenty Notebook Case', 800000, '<p>- Menggunakan kombinasi bahan yang berkualitas</p>\r\n\r\n<p>- Tahan terhadap air dan guncangan</p>\r\n\r\n<p>- Bahan yang breathable</p>\r\n\r\n<p>- Warna cerah yang mudah kotor</p>\r\n\r\n<p>Khawatir laptop jadi basah saat musim hujan? Hamlin Quenty Notebook Case bisa menjadi produk yang cocok untuk kamu. Terbuat dari kombinasi bahan kanvas dan polyester, membuat tas ini tidak hanya memiliki durabilitas yang bagus dan kuat, tetapi juga tahan air, debu, dan tahan guncangan. Jadi, kamu tak perlu khawatir lagi jika laptop basah di musim hujan.</p>\r\n\r\n<p>Bahan dari tas ini juga diklaim breathable, sehingga membuat bagian dalam tas tidak lembab dan tidak mudah bau. Selain itu, handle-nya pun nyaman, karena dibuat dari bahan yang sama dengan material utama atas, sehingga tidak sakit ditangan saat kamu menjinjing tas.</p>\r\n\r\n<p>Tas ransel 14 inch ini dirancang dengan warna gray yang netral dan desain yang slim, membuat tampilan tas laptop ini jadi lebih estetik dan tidak terlalu besar. Untuk sebuah tas laptop yang memiliki desain menarik, harga yang ditawarkan pun cukup kompetitif dan tidak mahal.</p>\r\n', '5-E006.jpg', 1, '2023-05-20 09:32:56'),
(73, 5, '#E007 HEYLOOK Savana Tote Bag', 97000, '<p>- Memiliki dual fungsi</p>\r\n\r\n<p>- Material yang tebal dan tidak mudah sobek</p>\r\n\r\n<p>- Jahitan yang kuat dan rapi</p>\r\n\r\n<p>- Bagian dalam dilengkapi furing satin yang lembut</p>\r\n\r\n<p>- Tidak memiliki lapisan busa untuk keamanan laptop</p>\r\n\r\n<p>Memiliki desain tote bag yang beda dari lainnya, Heylook Savana bisa menjadi pilihan tepat untuk kamu yang menginginkan tas multifungsi. Karena, produk yang satu ini memiliki dua tali tas yang berbeda, sehingga kamu bisa menggunakannya sebagai tote bag ataupun backpack sesuai kebutuhan.</p>\r\n\r\n<p>Bukan hanya desainnya yang keren, tas laptop aesthetic ini juga menggunakan material cordura yang tebal, kuat, dan anti air, sehingga dapat melindungi tas kamu di musim hujan agar tidak basah. Bagian dalamnya pun sudah dilengkapi dengan furing satin yang lembut.</p>\r\n\r\n<p>Pada slot penyimpanan laptop, dilengkapi pula dengan perekat velcro dan sekat busa yang empuk, dan mampu menyimpan laptop berukuran 14 inci. Jahitannya pun kuat dan terlihat rapi, sehingga membuat tampilannya lebih bagus dan tidak berantakan akibat benang jahitan.</p>\r\n', '5-E007.jpg', 1, '2023-05-20 09:35:48'),
(74, 5, '#E008 Bruno Cavalli 14037 Expandable Bag', 275000, '<p>- Dibekali busa khusus yang tahan panas</p>\r\n\r\n<p>- Memiliki USB port dan headset extention</p>\r\n\r\n<p>- Bagian handle dirancang kuat dan nyaman</p>\r\n\r\n<p>Tas ransel laptop dari Bruno Cavalli ini juga bisa kamu jadikan alternatif pilihan. Sesuai dengan Namanya, tas laptop ini bersifat expandable atau dapat diperbesar. Sehingga tas ini memiliki ruang yang luas di kompartemen utamanya. Dengan begitu, tas ini dapat menampung banyak barang dan laptop berukuran 17 inci.</p>\r\n\r\n<p>Memiliki space yang cukup luas, tas ini dapat menyimpan barang-barang lainnya selain laptop, seperti pakaian, bukk, dokumen, dan lainnya. Sementara, pada bagian kompartemen laptop, tas laptop backpack ini dibekali busa khusus untuk alas laptop sebagai pelindungnya.</p>\r\n\r\n<p>Selain itu, untuk kamu yang punya banyak gadget juga jangan khawatir, karena tas ini dilengkapi sekat gadget, sehingga bisa menyimpan gadget kamu denga naman. Tas ini memiliki kapasitas 31-32 liter dengan menggunakan material kanvas yang water resistant. Menariknya lagi, tas laptop ini dibekali port USB dan headset extention.</p>\r\n\r\n<p>Tak hanya itu saja, tas laptop dari Bruno Cavalli ini juga memiliki tali pengait koper di bagian punggung tas dan tali pengait di kedua tali ransel. Untuk bagian punggung dan tali pada tas ini dibuat lapisan busa yang tebal dan bahan yang tidak panas.</p>\r\n', '5-E008.jpg', 1, '2023-05-20 09:38:01'),
(75, 5, '#E009 Navy Club Briefcase HCH', 258900, '<p>- Tas kantor multifungsi, bisa jinjing &amp; selempang</p>\r\n\r\n<p>- Water Repellent</p>\r\n\r\n<p>- Sekat penyangga ke trolley koper</p>\r\n\r\n<p>- Tali selempang yang dapat dilepas pasang</p>\r\n\r\n<p>Navy Club bukanlah brand baru untuk produsen tas dan koper. Merk tersebut dikenal menyediakan produk berkualitas dengan harga yang terjangkau. Jika kamu sedang mencari tas laptop multifungsi, bisa jinjing atau selempang, maka Navy Club Briefcase HCH bisa kamu pilih.</p>\r\n\r\n<p>Tas ini dibuat dari paduan bahan polyester 500 denier dengan synthetic leather dengan desain elegan, cocok untuk kamu gunakan ke kantor. Untuk bagian dalam, tersedia sekat laptop dengan ukuran maksimal 14 Inch. Kemudian, ada pula sekat yang kedua dilengkapi internal saku organizer. Kamu bisa menggunakan untuk menaruh barang-barang, seperti pulpen, ponsel ataupun dompet. Ada pula, kantong di bagian depan yang bisa kamu gunakan untuk menaruh barang-barang yang bisa kamu segera ambil saat dibutuhkan.</p>\r\n\r\n<p>Bahan tas ini water repellent, sehingga dapat tahan dari cipratan air atau hujan ringan. Untuk kamu yang sering bepergian dengan koper troli, tas ini dilengkapi tali selempang yang dapat dilepas pasang dan strap untuk penyangga ke koper.</p>\r\n', '5-E009.jpg', 1, '2023-05-20 09:40:24'),
(76, 5, '#E010 Torch Jinju Mini Tote Bag', 167860, '<p>- Desain minimalis yang keren<br />\r\n- Dapat dijadikan backpack dan tote bag<br />\r\n- Waterproof<br />\r\nTorch Jinju Mini Tote Bag merupakan tas laptop yang ideal buat kamu yang suka tampil minimalis. Tas ini memiliki desain yang modern, bisa digunakan sebagai tas ransel ataupun tote yang praktis.<br />\r\nDengan dimensi yang cukup luas 30 x 22 x 8 cm dengan kapasitas 7 liter, tas ini bisa kamu gunakan untuk ke kantor, kampus ataupun hangout atau beraktivitas saat akhir pekan. Bahan yang digunakan adalah poly elable yang membuat tas ini waterproof dari percikan air atau hujan ringan.<br />\r\nTerdapat kompartemen utama dan sub kompartemen yang muat untuk tablet atau laptop hingga ukuran 10-11 inch. Selain itu ada pula saku bagian depan untuk quick access benda-benda yang perlu kamu raih dengan cepat. productnation</p>\r\n', '5-E010.jpg', 1, '2023-05-20 09:43:24'),
(77, 4, '#D001 Exsport', 399000, '<p>Merek tas Exsport merupakan buatan negeri yang memiliki kualitas ekspor. Merek tas ini cukup terkenal se-antero Indonesia karena desainnya yang simpel dengan kompartemen utama yang luas. Exsport masih mempertahankan desain klasiknya, namun hadir dengan sentuhan modern.</p>\r\n\r\n<p>Tas Exsport klasik memiliki satu kompartemen utama dan kantong depan, dua-duanya dilengkapi dengan zip. Terdapat juga dua kantong kecil di dalam dan satu untuk menyimpan dokumen. Bahan tas ini dibuat dari nylon berkualitas tinggi dan resleting YKK.</p>\r\n', '4-D001.jpg', 1, '2023-05-20 09:46:48'),
(78, 4, '#D002 Converse', 799000, '<p>Selain mengeluarkan sepatu sneakers, Converse juga turut meluncurkan tas yang bisa digunakan untuk semua jenis kelamin dan umur. Serupa dengan produk sepatunya, varian tas merk Converse yang beragam, modis, dan kokoh. Hal ini dapat dilihat dari pemilihan warna yang cenderung netral pada produk tas sehingga dapat melengkapi gaya pelajar saat pergi ke sekolah.</p>\r\n', '4-D002.jpg', 1, '2023-05-20 09:53:34'),
(79, 4, '#D003 Jansport', 359950, '<p>Tas JanSport merupakan merek tas sekolah yang cukup terkenal di seluruh dunia. Merek asal Amerika Serikat ini memiliki desain minimalis dengan bobot ringan ketika dipakai. Bahan yang digunakan tas ini diketahui berasal dari material daur ulang, tapi memiliki kualitas tinggi. Toppers tidak akan merasa pegal-pegal di pundak atau punggung ketika membawa berbagai keperluan sekolah dengan tas JanSport. Dari segi desain tas ini dengan bermacam motif menarik dan simpel juga akan membuat kamu lebih stylish.</p>\r\n', '4-D003.jpg', 1, '2023-05-20 09:55:43'),
(80, 4, '#D004 Eiger', 349000, '<p>Merk tas anak sekolah yang bagus dan awet selanjutnya adalah Eiger. Selain terkenal dengan produk untuk mendaki dan rekreasi alam, merk Eiger juga merilis tas sekolah yang bisa digunakan oleh pelajar. Menjadi salah satu merk lokal Indonesia, kualitas Eiger juga tidak kalah bagus dengan kualitas tas dari luar negeri. Meskipun tas Eiger banyak yang difungsikan untuk pendakian, Toppers juga bisa memakai tas Eiger untuk sekolah dengan banyaknya slot untuk memuat buku dan peralatan sekolah lainnya. Model yang kokoh juga membuatnya dapat digunakan dalam jangka panjang.</p>\r\n', '4-D004.jpg', 1, '2023-05-20 09:57:26'),
(81, 4, '#D005 Jeune Premier', 1016000, '<p>Jika kamu mencari kualitas premium dengan motif yang sangat beragam, kamu bisa mampir ke laman Jeune Premier. Brand ini menawarkan tas sekolah dalam bentuk ransel yang berdiri ataupun melebar. Jeune Premier memiliki khas desain yang menggambarkan keceriaan anak-anak namun tetap terkesan elegan. Tas dari Jeune Premier memiliki lapisan dalam yang mudah dibersihkan serta lapisan yang anti air dan noda.</p>\r\n', '4-D005.jpg', 1, '2023-05-20 09:59:13'),
(82, 4, '#D006 Catenzo', 139000, '<p>Catenzo bisa dibilang surganya anak-anak penggemar superhero! Ya, tokoh-tokoh pahlawan kartun adalah salah satu desain andalan dan khas dari Catenzo. Meskipun demikian, banyak juga pilihan desain lain yang tidak kalah menarik. Catenzo menghadirkan pilihan untuk anak perempuan dan laki-laki mulai dari usia TK hingga SD. Motif yang ditawarkan pun beragam dan bisa disesuaikan dengan usia. Ada banyak motif karakter dengan warna yang cukup mencolok, ada juga tas-tas dengan warna yang lebih terkesan netral.</p>\r\n', '4-D006.jpg', 1, '2023-05-20 10:05:17'),
(83, 4, '#D007 Garsel', 250000, '<p>Merk tas lokal mulai banyak bermunculan dengan kualitas yang tidak kalah bagus dengan merk tas luar negeri. Kali ini, Garsel yang diproduksi di Bandung turut menawarkan berbagai jenis pakaian dan sepatu yang ditujukan untuk semua umur dan jenis kelamin. Tas sekolah yang diluncurkan Garsel juga tidak kalah bagus dan awet. Dengan harga yang terjangkau, Garsel menawarkan model tas yang beragam dan unik untuk melengkapi penampilan pelajar masa kini.</p>\r\n', '4-D007.jpg', 1, '2023-05-20 10:06:58'),
(84, 4, '#D008 Palazzo', 299000, '<p>Untuk Toppers yang sering membawa buku atau peralatan yang berat ke sekolah, merk tas Palazzo dapat menjadi pilihan tas untuk dibawa. Palazzo menawarkan berbagai tas ransel dengan warna monokrom yang kalem dan maskulin, cocok untuk anak laki-laki yang tidak ingin banyak motif mencolok pada tas sekolahnya. Model tas Palazzo juga didesain agar pelajar yang memakainya tidak mengalami sakit di pundak karena muatan yang berat.</p>\r\n', '4-D008.jpg', 1, '2023-05-20 10:09:12'),
(85, 4, '#D009 Infikids', 145000, '<p>Produk lokal asal Cibaduyut ini memiliki pilihan tas dengan berbagai bentuk dan desain. Salah satu ciri khasnya adalah desain 3 dimensi yang mengikuti wujud karakter yang digambarkan tas tersebut. Jadi, jangan kaget kalau tas yang bergambar badak memiliki cula pendek di depannya!</p>\r\n\r\n<p>Selain itu, Infikids juga menawarkan tas-tas dengan desain yang sederhana dengan perpaduan warna yang berkelas. Hadir dalam bentuk koper dan ransel, Infikids memiliki sangat banyak pilihan untuk kamu yang suka menimbang-nimbang sebelum membeli sesuatu.</p>\r\n', '4-D009.jpg', 1, '2023-05-20 10:12:44'),
(86, 4, '#D010 Tas Sekolah Harvest', 170000, '<p>Harvest menjual berbagai pilihan tas sekolah dengan berbagai desain dan motif yang simpel dan keren. Merek ini menggunakan nylon premium untuk produk tas mereka. Secara keseluruhan tas merek ini sangat cocok untuk berbagai kebutuhan, sekolah ataupun jalan-jalan.</p>\r\n', '4-D010.jpg', 1, '2023-05-20 10:15:22'),
(87, 3, '#C002 Fossil', 750000, '<p>Merk jam tangan, tas dan dompet ini memang sudah terkenal dengan bahan kulitnya yang berkualitas. Tak heran ketika rentang harganya pun juga lumayan tinggi Desain dompetnya juga simple dan elegan.</p>\r\n', '3-C002.jpg', 1, '2023-05-20 10:18:34'),
(88, 3, '#C003 Coach', 1490000, '<p>Termasuk luxury brand, produk Coach bisa jadi pilihanmu yang memang menyukai barang mewah bermerk. Termasuk dompet pria, tampilannya lumayan beragam. Mulai dari yang cenderung polos, hingga motif khas Coach yang mencolok.</p>\r\n', '3-C003.jpg', 1, '2023-05-20 10:20:13'),
(89, 3, '#C004 Braun Buffel', 2371008, '<p>Merk ini menawarkan dompet dengan bentuk yang beragam, mulai dari regular hingga fold long wallet dengan resleting. Selain itu, warnanya juga sangat bagus. Dari yang netral hingga warna mencolok, contohnya seperti warna kuning. Motifnya juga tidak biasa, bisa jadi pilihan untukmu yang bosan dengan model dompet pria yang itu-itu saja.</p>\r\n', '3-C004.jpg', 1, '2023-05-20 10:22:04'),
(90, 3, '#C005 Leatherology', 447663, '<p>Leatherology banyak menghadirkan jenis dompet. Di antaranya adalah Bifold, Trifold, Card Holders, Money Clips hingga Checkbook Covers. Maka dari itu, bentuk dan desainnya juga bermacam-macam. Menariknya, terhadap Magnetic Money Clips yang berguna untuk menjepit uang agar terorganisir.</p>\r\n', '3-C005.jpg', 1, '2023-05-20 10:24:03'),
(91, 3, '#C006 Brodo', 120000, '<p>Brodo merupakan brand fashion pria yang berasal dari Indonesia. Produk yang mereka juga bermacam-macam, salah satunya adalah dompet pria. Desainnya sangat bagus dengan warna-warna netral kesukaan para pria. Harganya juga sangat terjangkau untuk brand lokal.</p>\r\n', '3-C006.jpg', 1, '2023-05-20 10:26:06'),
(92, 3, '#C007 Wallts', 179900, '<p>Wallts adalah brand fashion asal Bandung yang berdiri pada tahun 2015. Terlihat dari namanya, dompet asalah spesialisasi produk yang mereka tawarkan. Dari segi kualitas juga juga sangat bagus. Terlebih desainnya sangat trendy dan tidak membosankan. Untuk hitungan brand lokal, harganya tergolong &lsquo;low-high.&rsquo; Namun hal tersebut sepertinya tidak perlu dipermasalahkan, karena produknya sangat bagus jika ditinjau dari segala aspek.</p>\r\n', '3-C007.jpg', 1, '2023-05-20 10:28:02'),
(93, 3, '#C008 Fullhardy', 845000, '<p>Merk ini terkenal dengan kulitas kulitnya. Walaupun berbahan dasar kulit yang seharusnya memiliki harga tinggi, produk Fullhardy tergolong cenderung mudah dijangkau bentuk dan jenisnya juga beragam, mulai dari semi card holder hingga ada yang menggunakan tali dilengkapi dengan magnet untuk mengunci.</p>\r\n', '3-C008.jpg', 1, '2023-05-20 10:29:42'),
(94, 3, '#C009 Voyej', 99999, '<p>Merk ini memang spesialis dompet kulit. Maka dari itu, kualitasnya tidak diragukan lagi. Desainnya juga sangat elegan dengan warna-warna yang cerah hingga netral. Tak hanya dompet, mereka juga menyediakan ID Card Holder yang bisa kamu jadikan alternatif sebagai mini wallet Voyej ini juga merupakan brand local.</p>\r\n', '3-C009.jpg', 1, '2023-05-20 10:31:02'),
(95, 3, '#C010 The X Woof', 199000, '<p>The X Woof sebenarnya adalah merk fashion pria yang bergelut di Sports and Travel. Menariknya, mereka juga meluncurkan produk berupa dompet.</p>\r\n', '3-C010.jpg', 1, '2023-05-20 10:32:55'),
(96, 3, '#C011 Eiger', 49999, '<p>Demikian halnya seperti Eiger, brand ini juga lebih dikenal sebagai penyedia peralatan mendaki. Mereka juga menjual dompet pria dengan kualitas yang tak kalah bagusnya dengan produk lain.</p>\r\n', '3-C011.jpg', 1, '2023-05-20 10:34:34'),
(97, 2, '#B001 The Goods Dept', 49000, '<p>Rekomendasi merk totebag yang pertama datang dari The Goods Dept. Tak hanya untuk wanita, tote bag ini juga bisa digunakan oleh laki-laki alias unisex. Rata-rata desain tote bag dari merk yang satu ini biasanya oversize yang akan bisa membawa banyak kebutuhan sehari-hari. Beberapa tote bag dari The Goods Dept juga menggunakan bahan yang ramah lingkungan.</p>\r\n', '2-B001.jpg', 1, '2023-05-20 10:37:19'),
(98, 2, '#B002 Triple F', 70000, '<p>Triple F menyuguhkan printed tote bag dengan gaya casual yang cool tas ini akan cocok digunakan untuk kamu yang senang menggunakan style boyish dengan warna-warna netral dan desain gambar yang simple.</p>\r\n', '2-B002.jpg', 1, '2023-05-20 10:38:57'),
(99, 2, '#B003 Pamole', 170000, '<p>Jika beberapa merk totebag wanita sebelumnya bergaya casual dan cenderung unisex, yang satu ini memiliki model yang sangat beragam mulai dari tote bag kanvas bermotif, tote bag casual, hingga artificial leather tote bag yang semi formal. Tak hanya model yang beragam, kamu akan diberikan pilihan warna yang banyak mulai dari warna-warna netral seperti hitam atau abu-abu hingga warna cerah seperti kuning dan pink.</p>\r\n', '2-B003.jpg', 1, '2023-05-20 10:40:54'),
(100, 2, '#B004 Hush Puppies', 399500, '<p>Rekomendasi tote bag terbaik ada dari merk Hush Puppies. Ada berbagai desain dan warna tote bag yang kamu bisa pilih dari merk ini. Rata-rata tote bag Hush Puppies menggunakan bahan canvas dengan bordir yang kuat. Kompartemen yang disediakan juga cukup banyak, sehingga kamu dapat membawa berbagai barang untuk kebutuhan kuliah atau kerja, Toppers. Selain itu, sangat mudah untuk membersihkan tas tote bag ini, cukup menggunakan sikat gigi yang diberi air sabun lalu keringkan dengan angin.</p>\r\n', '2-B004.jpg', 1, '2023-05-20 10:42:54'),
(101, 2, '#B005 Les Catino', 499000, '<p>Les Catino adalah salah satu merk tas yang cukup terkenal dan memiliki harga terjangkau. Pilihan tas tote bag dari les catino lebih memiliki style girly dan memberikanmu tampilan yang lebih dewasa. Kamu akan menemukan banyak model tote bag mulai dari tote bag bermotif yang playful hingga tote bag sederhana yang akan sangat cocok kamu gunakan ke kampus.</p>\r\n', '2-B005.jpg', 1, '2023-05-20 10:44:49'),
(102, 2, '#B006 Visval', 350000, '<p>Visval merupakan merk lokal asal Bandung yang menjual berbagai tas dan apparel dengan kualitas terbaik. Selain menawarkan tas selempang, tas pinggang, backpack, ada juga tote bag dengan desain simpel, tapi keren. Salah satunya adalah tote bag Galla berwarna hitam. Galla Tote Bag memiliki bahan berkualitas premium dengan desain yang klasik yang cocok untuk dibawa aktivitas setiap hari. Tote bag ini memiliki zipper dan ada berbagai kompartemen untuk menampung banyak barang.</p>\r\n', '2-B006.jpg', 1, '2023-05-20 10:46:05'),
(103, 2, '#B007 Exsport', 399000, '<p>Merk tas yang satu ini mungkin akan mengingatkanmu dengan tas masa sekolahmu yang berwarna terang dengan motif-motif ceria. Exsport tak hanya menyediakan backpack, merk lokal yang satu ini juga punya beberapa tote bag. Seperti tas backpacknya, beberapa desain dari tote bag Exsport memiliki pilihan warna-warna yang ceria. Namun, kamu juga bisa menemukan warna-warna netral yang kalem seperti hitam, abu-abu, atau navy.</p>\r\n', '2-B007.jpg', 1, '2023-05-20 10:48:51'),
(104, 2, '#B008 Uniqlo', 35000, '<p>Terkenal dengan berbagai pilihan daily wear yang nyaman, merk fast fashion yang satu ini juga punya beberapa koleksi tote bag, lho! Uniqlo menyediakan beberapa model tas tote bag untuk digunakan sehari-hari seperti groceries bag dan tas kanvas bermotif yang eco friendly. Tak hanya itu, kamu juga akan menemukan tas berbahan faux leather mendukung berbagai style harianmu.</p>\r\n', '2-B008.jpg', 1, '2023-05-20 10:50:08'),
(105, 2, '#B009 Motiviga', 99000, '<p>Motiviga menawarkan tote bag yang dapat menyimpan laptop dan aksesorisnya. Tote bag Motiviga juga sangat cocok untuk dibawa piknik karena kamu bisa dengan leluasa bawa banyak berbagai barang. Sedangkan, dari segi desain, tote bag Motiviga cenderung simpel, dengan kesan modern.</p>\r\n', '2-B009.jpg', 1, '2023-05-20 10:51:52'),
(106, 2, '#B010 KEE', 89000, '<p>Merk KEE menawarkan tas totebag dengan berbagai desain modern dan warna yang bervariasi. Bahannya menggunakan Polyester Cordura Fabric dengan lining dari Torin 210D Urex Lining Fabric, serta resleting YKK Hardware membuat tas tote bag merk ini memiliki daya tahan yang kuat.</p>\r\n', '2-B010.jpg', 1, '2023-05-20 10:53:29'),
(107, 1, '#A002 Tas Ransel Gearbag', 250000, '<p>Tas ransel ini dilengkapi dengan tempat laptop dan mempunyai kapasitas yang besar didalamnya. Desain yang terlihat modern dan dilengkapi dengan rain cover membuat kamu tidak perlu takut tas kamu kena hujan dan data di dalamnya basah. Tas ini juga kuat dan tahan lama karena dilengkapi dengan dua jahitan sekaligus sehingga cocok untuk kamu bawa travelling dengan bawaan yang banyak.</p>\r\n', '1-A002.jpg', 1, '2023-05-20 10:55:21'),
(108, 1, '#A003 Tas Ransel Neosack', 245000, '<p>Dengan desain casual Neosack mampu menjadi brand yang dilirik oleh kaula muda. Dengan warna yang menarik yaitu Black and Red, Black and Blue, Black and Yellow. Tas ini juga dilengkapi rain cover dan Padded back system. Sehingga punggung kamu terasa nyaman walaupun kamu membawa barang berat sekali pun. Dengan ini, bepergian jauh dengan membawa barang cukup banyak tak akan terasa melelahkan.</p>\r\n', '1-A003.jpg', 1, '2023-05-20 10:56:33'),
(109, 1, '#A004 Tas Ransel Bounjour ', 280000, '<p>Tas original asal bandung ini cocok untuk kamu yang ringkas dan simple. Tas Bounjour berbahan kanvas dan Faux leather mempunyai gaya yang casual namun semi outdoor.</p>\r\n', '1-A004.jpg', 1, '2023-05-20 10:58:43'),
(110, 1, '#A005 Tas Ransel Reebok', 150000, '<p>Dari Merek lokal sampai merek luar, kali ini Reebok menjadi salah satu pilihan favorit bagi kamu. Tidak hanya terkenal akan sepatunya yang jempolan namun Reebok mempunyai tas berbahan sangat tipis dan enteng dengan desain yang sporty dan mempunyai beberapa warna menarik ini, Backpack Reebok tidak hanya dapat dikenakan saat kamu berolahraga, Melainkan dapat digunakan untuk bekerja, kuliah atau berpergian dengan kapasitas didalamnya yang cukup untuk membawa barang kamu.</p>\r\n', '1-A005.jpg', 1, '2023-05-20 11:00:18'),
(111, 1, '#A006 Tas Ransel Polo', 280000, '<p>Polo atau Polo Ralph Lauren memang sudah menjajaki dunia Fashion cukup lama. Terkenal dengan Polo shirt, aksesoris dan pakaian pria, Polo juga memproduksi tas yang berkapasitas besar dengan bahan kanvas yaitu jahitan yang dirancang sangat kuat kamu dapat mengisi tas kamu dengan barang yang cukup banyak sehingga tidak usah khawatir jebol saat pemakaian. Selain itu, Polo juga menyediakan gembok untuk tetap menjaga kerahasiaan isi data yang kamu punya dan rain cover untuk melindungi dari hujan.</p>\r\n', '1-A006.jpg', 1, '2023-05-20 11:02:11'),
(112, 1, '#A007 Tas Ransel BodyPack', 300000, '<p>Bodypack terkenal dengan penyimpanan dalam yang mempunyai bahan yang baik untuk alat elektronik kamu, sehingga perangkat tetap terjaga di dalamnya. Tas ini juga dilengkapi dengan ruang-ruang yang detail seperti untuk charger, laptop dan bagian-bagian kecil lainnya untuk penyimpanan aksesoris kamu. Selain itu, ada beberapa Backpack yang mempunyai bahan waterproof dan dilengkapi rain cover.</p>\r\n', '1-A007.jpg', 1, '2023-05-20 11:04:41'),
(113, 1, '#A008 Tas Ransel Inflico', 190000, '<p>Backpack Inflico yang terkenal akan backpack Outdoor mempunyai ketahanan yang cukup baik untuk dipakai kegiatan yang agak berat. Desain yang mempunyai semi carrier ini mempunyai jenis backpack untuk kamu para pekerja dengan penyimpanan di dalamnya yang cukup luas dan dilengkapi penyimpanan laptop kamu tidak perlu khawatir untuk menaruh banyak barang.</p>\r\n', '1-A008.jpg', 1, '2023-05-20 11:06:07'),
(114, 1, '#A009 Tas Ransel Kalibre', 500000, '<p>Kalibre masuk di market pada tahun 2014, bertarung dengan merk lokal dan global yang lebih lama eksis menguasai pasar Indonesia. Backpack yang mengangkat karakteristik urban ini mampu menarik pembeli puas dengan fitur-fitur yang ditawarkan dengan pembuatan yang tidak sembarangan Kalibre mempunyai kekuatan backpack yang luar biasa.</p>\r\n', '1-A009.jpg', 1, '2023-05-20 11:07:27'),
(115, 1, '#A010 Tas Ransel Nike', 1000000, '<p>Hampir sama dengan Reebok, Nike brand asal Amerika ini memproduksi tas berbahan enteng dan tipis namun waterproof. Nike mempunyai varian jenis dan warna yang ditawarkan. Dengan bahan tipis dan enteng ini kamu cocok memakai tas ini untuk berpergian, kuliah, serta berolahraga.</p>\r\n', '1-A010.jpg', 1, '2023-05-20 11:09:12'),
(116, 1, '#A011 Tas Ransel Adidas', 800000, '<p>Brand asal dari Jerman yang mempunyai desain stylish. Dengan menggunakan bahan yang cukup variatif seperti kanvas, dan polyester akan membuat hari-harimu selalu nyaman saat menggunakan backpack ini. Satu tas multifungsi untuk menemani berbagai aktivitasmu. Setiap bagiannya didesain demi kenyamanan pemakai, seperti padding pada kompartemen dan strap yang bisa diatur sesuai kebutuhan. Kompartemen utama dilengkapi resleting penutup yang kuat sehingga barangmu terjaga dengan baik.</p>\r\n', '1-A011.jpg', 1, '2023-05-20 11:10:21'),
(117, 8, '#H011 Tas Pesta JULIETTE Kondangan Wanita Import Clutch', 143800, '<p>Tas tangan/Clutch dengan design yang elegan, sangat cocok untuk menghadiri acara pesta pernikahan, ulang tahun maupun acara formal lainnya</p>\r\n\r\n<p>Keterangan:</p>\r\n\r\n<p>-All real pic</p>\r\n\r\n<p>-Tali pendek besi dan tali panjang rantai</p>\r\n\r\n<p>-Ukuran 20 x 6 x 13 cm</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Mohon dikonfirmasi terlebih dahulu untuk stock warna yang tersedia. Terima kasih.</p>\r\n', '8-H011.jpg', 1, '2023-05-22 04:33:28'),
(118, 3, '#C012 BAELLERRY N5013 Dompet Wanita Kecil Bahan Kulit PU Leather Premium BAEOS', 110000, '<p>Brand : BAELLERRY</p>\r\n\r\n<p>Model : N5013</p>\r\n\r\n<p>Quality : Premium+</p>\r\n\r\n<p>Tipe : Dompet Lipat, Dompet Pendek</p>\r\n\r\n<p>Panjang : 12.5cm</p>\r\n\r\n<p>Lebar : 10cm</p>\r\n\r\n<p>Tinggi : 2cm</p>\r\n\r\n<p>Bahan : Premium PU Leather</p>\r\n\r\n<p>Style : Korean Fashion Style</p>\r\n\r\n<p>Berat : 178g</p>\r\n\r\n<p>Tempat Penyimpanan :</p>\r\n\r\n<p>- 6 Slot Kartu dan 2 Tempat Foto di Lipatan Pertama</p>\r\n\r\n<p>- 9 Slot Kartu dan 1 Tempat Foto di Lipatan Kedua</p>\r\n\r\n<p>- 1 Tempat Uang Kertas / Catatan</p>\r\n\r\n<p>- 1 Tempat Koin</p>\r\n\r\n<p>Total Slot : 18 Slot Kartu</p>\r\n\r\n<p><a href=\"https://shopee.co.id/BAELLERRY-N5013-Dompet-Wanita-Kecil-Bahan-Kulit-PU-Leather-Premium-BAEOS-i.6023933.13944502139\">https://shopee.co.id/BAELLERRY-N5013-Dompet-Wanita-Kecil-Bahan-Kulit-PU-Leather-Premium-BAEOS-i.6023933.13944502139</a></p>\r\n', '3-C012.png', 1, '2023-06-14 09:33:56'),
(119, 5, '#E011 Tas Laptop / Notebook Custom ZEROPROMOSI', 60000, '<p>Tas laptop custom promosi merupakan salah satu model tas yang diperuntukan untuk melindungi laptop / gadget anda dan bisa dicetak logo anda (untuk promosi) sangat cocok untuk kebutuhan tas laptop seminar, promosi, maupun event - event perusahaan<br />\r\n<br />\r\nBahan tas : Jenis bahan dapat dipilih sesuai dengan anggaran yang telah ditentukan / jika ada contoh bisa dikirimkan ke kami untuk kami hitung harganya.</p>\r\n\r\n<p>Design / model tas : untuk lebih mudah dalam pemesanan berikan kami contoh tas yang anda inginkan kami akan buatkan sesuai permintaan.</p>\r\n\r\n<p>Sistem Cetak logo : ada 2 pilihan yaitu dengan sablon dan bordir</p>\r\n\r\n<p>Harga tergantung banyak pemesanan, jenis bahan, jenis cetakan logo dan model (hubungi kami untuk konsultasi ). Untuk Harga model yang sudah kami sediakan :</p>\r\n\r\n<p>Tas laptop custom no 1 : Bahan D1682 41x32x10cm @66.000, klo pake bahan d300 @56.000</p>\r\n\r\n<p>Tas laptop custom no 2 : Bahan D300 ukuran 38x10x27cm @51.000</p>\r\n\r\n<p>Tas laptop custom no 3 : Bahan D300 38x27x10cm sablon 1warna 1sisi @51.000</p>\r\n\r\n<p>Tas laptop custom no 4 : Bahan D300 38x27x10cm sablon 1warna 1sisi @56.000<br />\r\n<br />\r\nSumber :&nbsp;<a href=\"https://www.zeropromosi.com/2016/09/produksi-tas-laptop-atau-notebook.html\">https://www.zeropromosi.com/2016/09/produksi-tas-laptop-atau-notebook.html</a></p>\r\n', '5-E011.jpg', 1, '2023-06-14 10:02:15'),
(120, 11, '#K012 Special 1 Pride Month Keychain ( ͡° ͜ʖ ͡°)', 420666, '<p>Do you love books or is your loved one completely in another world while reading a book? Then these stacked book earrings are a must have!<br />\r\n<br />\r\nThese cuties match the pride flag colours, yet are subtle enough to wear if you haven&rsquo;t come out publicly. Only people who know will know!<br />\r\n<br />\r\nAvailable in different subtle pride flags:<br />\r\n1. Genderqeer<br />\r\n2. Bisexual<br />\r\n3. Pansexual<br />\r\n4. Demiboy<br />\r\n5. Demigirl<br />\r\n6. Agender<br />\r\n7. Polysexual<br />\r\n8. Asexual/Demisexual (of course not the same but flag has the same colour combinations)<br />\r\n9. Non-binary<br />\r\n10. Genderfluid<br />\r\n11. Aromantic<br />\r\n12. Lesbian<br />\r\n13. Transgender<br />\r\n14. Rainbow<br />\r\n<br />\r\nThese adorable keychains are shaped like a little stacks colourful books and are available in different colours and even necklaces/earrings! The 3-5 stackes are about 2 cm / 0.78 inches and the 6 tier stack measures about 2.5 cm / 0.98 inches in height.<br />\r\n<br />\r\nUsage warning: Please note these keychains are handmade from polymer clay, and are unfortunately not as sturdy as something made from materials like plastic/metal. They&#39;re not made for intensive use and won&#39;t be able to withstand a lot of wear and tear. An example of recommended usage could be on the zipper of your coat/backpack (don&#39;t forget to take it off before putting it in the laundry though!). Please use them with care.<br />\r\nRequest for a refund where the charm shows obvious wear and tear will therefore not be granted.<br />\r\n<br />\r\nThey are 100% handmade from polymer clay.<br />\r\n<br />\r\nAll items are packaged and shipped in a sturdy cardboard box or envelope that fits through the mail slot to ensure their safe arrival. The pride collection will be packaged discretely and no information about the meaning of the pride colours will be on or inside the box, so no one shall know, even if they open your package.<br />\r\n<br />\r\nHandmade to order<br />\r\nPlease keep in mind that all my jewellery is handmade and you will receive an unique item. The size and colour will be as close as possible to the ones pictured, but slight differences in appearance may occur.</p>\r\n\r\n<p>Keychain from ShinyStuffCreations:&nbsp;https://www.etsy.com/listing/501573681/</p>\r\n\r\n<p>( ͡&deg; ͜ʖ ͡&deg;)</p>\r\n', '11-K012.png', 1, '2023-06-19 11:45:42'),
(121, 11, '#K013 Special 2 Pride Month Keychain ( ͡° ͜ʖ ͡°)', 420069, '<p>Dinosaur keychain made of epoxy resin in the colors of Pride flags<br />\r\n<br />\r\nYou need to choose:<br />\r\nA) Dinosaur: Trex, Diplodocus, Stegosaurus or Triceratops<br />\r\nB) Style: choose your flag<br />\r\n<br />\r\nSee Rainbow Pride dinosaur keychains from WildDecoResin:&nbsp;<a href=\"http://www.etsy.com/es/listing/820807128/lgbtq-keychain-lgbt-art-subtle-gay\" target=\"_blank\">https://www.etsy.com/listing/805988662/</a><br />\r\n<br />\r\nMessage me if you want another design or a little medal with letter engraved :)</p>\r\n\r\n<p>( ͡&deg; ͜ʖ ͡&deg;)</p>\r\n', '11-K013.png', 1, '2023-06-19 12:22:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_product_purchase`
--

CREATE TABLE `tb_product_purchase` (
  `product_purchase_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `sub_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_product_purchase`
--

INSERT INTO `tb_product_purchase` (`product_purchase_id`, `purchase_id`, `product_id`, `product_quantity`, `product_name`, `product_price`, `sub_price`) VALUES
(1, 1, 38, 1, '', 0, 0),
(2, 1, 112, 1, '', 0, 0),
(3, 7, 1, 3, '', 0, 0),
(4, 8, 114, 2, '', 0, 0),
(5, 8, 107, 1, '', 0, 0),
(6, 9, 114, 2, '', 0, 0),
(7, 9, 107, 1, '', 0, 0),
(8, 10, 114, 2, '', 0, 0),
(9, 10, 107, 1, '', 0, 0),
(10, 11, 114, 2, '', 0, 0),
(11, 11, 107, 1, '', 0, 0),
(12, 11, 99, 1, '', 0, 0),
(13, 15, 99, 3, '#C001 Dompet Lucu Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor in', 20000, 60000),
(14, 16, 99, 3, '#C001 Dompet Lucu Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor in', 20000, 60000),
(15, 16, 82, 1, '#C001 Dompet Lucu Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor in', 20000, 20000),
(16, 23, 42, 2, '#H006 Tas Dompet Clutch Bag', 55000, 110000),
(17, 23, 119, 1, '#E011 Tas Laptop / Notebook Custom ZEROPROMOSI', 60000, 60000),
(18, 24, 42, 2, '#H006 Tas Dompet Clutch Bag', 55000, 110000),
(19, 24, 119, 3, '#E011 Tas Laptop / Notebook Custom ZEROPROMOSI', 70000, 210000),
(20, 25, 42, 2, '#H006 Tas Dompet Clutch Bag', 55000, 110000),
(21, 25, 119, 3, '#E011 Tas Laptop / Notebook Custom ZEROPROMOSI', 70000, 210000),
(22, 25, 116, 1, '#A011 Tas Ransel Adidas', 800000, 800000),
(23, 26, 113, 5, '#A008 Tas Ransel Inflico', 190000, 950000),
(24, 26, 119, 2, '#E011 Tas Laptop / Notebook Custom ZEROPROMOSI', 70000, 140000),
(25, 27, 121, 9, '#K013 Special 2 Pride Month Keychain ( ͡° ͜ʖ ͡°)', 420069, 3780621),
(26, 27, 120, 7, '#K012 Special 1 Pride Month Keychain ( ͡° ͜ʖ ͡°)', 420666, 2944662),
(27, 28, 119, 2, '#E011 Tas Laptop / Notebook Custom ZEROPROMOSI', 60000, 120000),
(28, 28, 4, 5, '#K001 Boneka Prajurit Squid Game', 36000, 180000),
(29, 29, 118, 2, '#C012 BAELLERRY N5013 Dompet Wanita Kecil Bahan Kulit PU Leather Premium BAEOS', 110000, 220000),
(30, 29, 39, 2, '#H003 Tas clucth wanita terkinian cantik', 85500, 171000),
(31, 30, 97, 5, '#B001 The Goods Dept', 49000, 245000),
(32, 30, 62, 2, '#F006 Tas Koper Anak Troli Roda 4 Ukuran 18 Inch', 155000, 310000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_purchase`
--

CREATE TABLE `tb_purchase` (
  `purchase_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_total` int(11) NOT NULL,
  `shipping_service` varchar(20) NOT NULL,
  `shipping_rates` int(11) NOT NULL,
  `shipping_address` text NOT NULL,
  `purchase_state` varchar(100) NOT NULL DEFAULT 'Pending',
  `shipping_receipt` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_purchase`
--

INSERT INTO `tb_purchase` (`purchase_id`, `customer_id`, `shipping_id`, `purchase_date`, `purchase_total`, `shipping_service`, `shipping_rates`, `shipping_address`, `purchase_state`, `shipping_receipt`) VALUES
(1, 1, 1, '2023-06-14', 399000, '', 0, '', 'Pending', ''),
(2, 1, 1, '2023-06-14', 800000, '', 0, '', 'Pending', ''),
(3, 2, 4, '2023-06-15', 2991000, '', 0, '', 'Pending', ''),
(4, 2, 6, '2023-06-15', 2991000, '', 0, '', 'Pending', ''),
(5, 1, 6, '2023-06-16', 1818000, '', 0, '', 'Pending', ''),
(6, 1, 5, '2023-06-16', 1770000, '', 0, '', 'Pending', ''),
(7, 1, 4, '2023-06-16', 80000, '', 0, '', 'Pending', ''),
(8, 1, 7, '2023-06-16', 1264000, '', 0, '', 'Pending', ''),
(9, 1, 3, '2023-06-16', 1268000, '', 0, '', 'Pending', ''),
(10, 1, 7, '2023-06-16', 1264000, '', 0, '', 'Pending', ''),
(11, 1, 5, '2023-06-16', 1430000, '', 0, '', 'Pending', ''),
(12, 2, 1, '2023-06-17', 360000, '', 0, '', 'Pending', ''),
(13, 2, 2, '2023-06-17', 360000, '', 0, '', 'Pending', ''),
(14, 2, 5, '2023-06-17', 530000, '', 0, '', 'Pending', ''),
(15, 2, 6, '2023-06-17', 528000, '', 0, '', 'Pending', ''),
(16, 2, 2, '2023-06-17', 669000, '', 0, '', 'Pending', ''),
(17, 2, 7, '2023-06-17', 379000, '', 0, '', 'Pending', ''),
(18, 2, 1, '2023-06-17', 190000, '', 0, '', 'Pending', ''),
(19, 2, 2, '2023-06-17', 190000, '', 0, '', 'Pending', ''),
(20, 2, 4, '2023-06-17', 190000, '', 0, '', 'Pending', ''),
(21, 2, 5, '2023-06-17', 190000, '', 0, '', 'Pending', ''),
(22, 2, 3, '2023-06-17', 188000, '', 0, '', 'Pending', ''),
(23, 2, 7, '2023-06-17', 184000, '', 0, '', 'Pending', ''),
(24, 2, 8, '2023-06-17', 336000, 'POS', 16000, '', 'Pending', ''),
(25, 1, 2, '2023-06-17', 1140000, 'JNE', 20000, 'Jalan Henti 420, RT 06 RW 09, Kelurahan Sulit, Kecamatan Sulit, Kota Saki, Jepun, 177013', 'Sedang Dikirim', 'ABC234'),
(26, 1, 1, '2023-06-19', 1110000, 'J&T Express', 20000, 'Jl. Kyai Maja No.420', 'Pending', ''),
(27, 6, 3, '2023-06-20', 6743283, 'Ninja Xpress', 18000, 'Jl. Buyer', 'Telah Diterima', 'ABC1234'),
(28, 6, 1, '2023-06-21', 320000, 'J&T Express', 20000, 'Jl. Buyer No. 420', 'Pending', ''),
(29, 6, 7, '2023-06-28', 405000, 'Wahana', 14000, 'Jl. Buyer No.420 Rt6 Rw9', 'Pending', ''),
(30, 7, 2, '2023-07-22', 575000, 'JNE', 20000, 'Jl. Lele No.420 Rt.06 Rw.09', 'Telah Diterima', 'SS4IN545NM4M800C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_shipping`
--

CREATE TABLE `tb_shipping` (
  `shipping_id` int(11) NOT NULL,
  `shipping_service` varchar(20) NOT NULL,
  `shipping_rates` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_shipping`
--

INSERT INTO `tb_shipping` (`shipping_id`, `shipping_service`, `shipping_rates`) VALUES
(1, 'J&T Express', 20000),
(2, 'JNE', 20000),
(3, 'Ninja Xpress', 18000),
(4, 'SiCepat', 20000),
(5, 'TIKI', 20000),
(6, 'AntarAja', 18000),
(7, 'Wahana', 14000),
(8, 'POS', 16000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `purchase_id` (`purchase_id`);

--
-- Indeks untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `tb_product_purchase`
--
ALTER TABLE `tb_product_purchase`
  ADD PRIMARY KEY (`product_purchase_id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `tb_purchase`
--
ALTER TABLE `tb_purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `shipping_id` (`shipping_id`);

--
-- Indeks untuk tabel `tb_shipping`
--
ALTER TABLE `tb_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_payment`
--
ALTER TABLE `tb_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT untuk tabel `tb_product_purchase`
--
ALTER TABLE `tb_product_purchase`
  MODIFY `product_purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `tb_purchase`
--
ALTER TABLE `tb_purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `tb_shipping`
--
ALTER TABLE `tb_shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD CONSTRAINT `tb_payment_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `tb_purchase` (`purchase_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_product_purchase`
--
ALTER TABLE `tb_product_purchase`
  ADD CONSTRAINT `tb_product_purchase_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_product_purchase_ibfk_2` FOREIGN KEY (`purchase_id`) REFERENCES `tb_purchase` (`purchase_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_purchase`
--
ALTER TABLE `tb_purchase`
  ADD CONSTRAINT `tb_purchase_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_purchase_ibfk_2` FOREIGN KEY (`shipping_id`) REFERENCES `tb_shipping` (`shipping_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
