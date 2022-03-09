<?php 

    $host = '127.0.0.1';
    $db   = 'mabase';
    $user = 'root';
    $pass = 'root';

    $charset = 'utf8mb4';
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $pdo = new PDO($dsn, $user, $pass);
    $requete = "SELECT * FROM matable";
    $resultats = $pdo->prepare($requete);
    $resultats->execute();
    $userData = $resultats->fetch(PDO::FETCH_ASSOC);
    print_r($userData)
    
?>
