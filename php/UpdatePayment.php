<?php 
    header("Access-Control-Allow-Origin: *");
    $host = '127.0.0.1';
    $db   = 'epoka';
    $user = 'root';
    $pass = 'root';
    $charset = 'utf8mb4';
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $pdo = new PDO($dsn, $user, $pass);
    $requete = "UPDATE mission SET EtatMission = 'Archivé' WHERE mission.id=:ID";
    $resultats = $pdo->prepare($requete);
    $resultats->bindValue(':ID',$_GET['ID']);
    $resultats->execute();
    $userData = $resultats->fetch(PDO::FETCH_ASSOC);
    echo json_encode($userData)
?>