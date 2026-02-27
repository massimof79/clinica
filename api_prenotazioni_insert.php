<?php
// api_prenotazioni_insert.php

$pdo = new PDO(
  "mysql:host=127.0.0.1;dbname=AMBULATORI;charset=utf8mb4",
  "root",
  "",
  [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION]
);

$sql="INSERT INTO PRENOTAZIONI (paziente_id, medico_id, data_ora, stato, note)
      VALUES (?,?,?,?,?)";

$pdo->prepare($sql)->execute([
  $_POST["paziente_id"],
  $_POST["medico_id"],
  str_replace("T"," ",$_POST["data_ora"]).":00",
  $_POST["stato"],
  ($_POST["note"]==="") ? null : $_POST["note"]
]);

echo "OK id=".$pdo->lastInsertId();
