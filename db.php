<?php 
    $hostname = 'localhost';
    $username = 'aku';
    $password = 'kepo';
    $dbname = 'db_baggin';

    $conn = mysqli_connect($hostname, $username, $password, $dbname) or die('Gagal terhubung ke database');
?>