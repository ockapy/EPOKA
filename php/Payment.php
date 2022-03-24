<?php 
    header("Access-Control-Allow-Origin: *");
    $host = '127.0.0.1';
    $db   = 'epoka';
    $user = 'root';
    $pass = 'root';
    $charset = 'utf8mb4';
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $pdo = new PDO($dsn, $user, $pass);
    $requete = 
    "SELECT mission.Id, utilisateur.Nom as NomUtilisateur , commune.Nom as NomCommune , agence.Nom as NomAgence, mission.DateDebut , mission.DateFin , mission.Intituler , mission.Description
     FROM utilisateur , mission , agence , commune
     WHERE Mission.IdUtilisateur = utilisateur.Id
     AND mission.IdCommune = commune.Id
     AND utilisateur.IdAgence = agence.Id
     AND mission.EtatMission = 'Payment'";
    $resultats = $pdo->prepare($requete);
    $resultats->execute();
    $userData = $resultats->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($userData)
?>