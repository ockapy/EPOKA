<?php 

    header("Access-Control-Allow-Origin: *")

    $host = '127.0.0.1';
    $db   = 'epoka';
    $user = 'root';
    $pass = 'root';
    $charset = 'utf8mb4';
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $pdo = new PDO($dsn, $user, $pass);
    $requete = "SELECT * FROM utilisateur WHERE Clee=:identifier AND Mdp=:mdp";
    $resultats = $pdo->prepare($requete);
    $resultats->bindValue(':identifier',$_GET['identifier']);
    $resultats->bindValue(':mdp',$_GET['mdp']);
    $resultats->execute();
    $userData = $resultats->fetch(PDO::FETCH_ASSOC);
    echo json_encode($userData)
?>
