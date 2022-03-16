<?php 

    $host = '127.0.0.1';
    $db   = 'epoka';
    $user = 'root';
    $pass = 'root';
    $charset = 'utf8mb4';
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $pdo = new PDO($dsn, $user, $pass);
    $requete = 
    "SELECT utilisateur.Nom as NomUtilisateur , commune.Nom as NomCommune , agence.Nom as NomAgence, mission.DateDebut , mission.DateFin , mission.Intituler , mission.Description
     FROM utilisateur , mission , agence , commune, etatmission
     WHERE Mission.IdUtilisateur = utilisateur.Id
     AND mission.IdCommune = commune.Id
     AND mission.IdEtatMission = etatmission.Id
     AND etatmission.Nom = 'Remboursement'";
    $resultats = $pdo->prepare($requete);
    $resultats->bindValue(':identifier',$_GET['identifier']);
    $resultats->bindValue(':mdp',$_GET['mdp']);
    $resultats->execute();
    $userData = $resultats->fetch(PDO::FETCH_ASSOC);
    echo json_encode($userData)
?>