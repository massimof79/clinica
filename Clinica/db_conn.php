<?php
    $host='127.0.0.1';
    $dbname='Clinica';
    $password="Ykkmacbook79";
    $user='root';

    $OPTION = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_TIMEOUT => 5
    ];

    try{
        $pdo=new PDO("mysql:host=$host;dbname=$dbname;charset=utf8",$user,$password);
    }catch(PDOException $e){
        die("Errore connessione database".$e->getMessage());
    }

    //echo "Connesso!";
?>