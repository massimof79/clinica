<?php
    require "db_conn.php";
    header("Content-Type: application/json");

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: Content-Type");
    header("Access-Control-Allow-Methods: POST, OPTIONS");
    header("Content-Type: application/json");

    $input = json_decode(file_get_contents("php://input"), true);

    if (!$input || !isset($input['cognome'])) {
        echo json_encode(["error" => "Richiesta non valida"]);
        exit;
    }

    $cognome = $input['cognome'];

    $query = "
        SELECT 
            prenotazioni.id,
            prenotazioni.data_prenotazione,
            prenotazioni.ora_prenotazione,

            pazienti.cognome AS cognome_paziente,
            pazienti.nome AS nome_paziente,

            medici.cognome AS cognome_medico,
            medici.nome AS nome_medico,
            medici.specializzazione,

            ambulatori.nome AS ambulatorio_nome,
            ambulatori.citta AS ambulatorio_citta

        FROM prenotazioni
        JOIN pazienti ON prenotazioni.paziente_id = pazienti.id
        JOIN medici ON prenotazioni.medico_id = medici.id
        JOIN ambulatori ON medici.ambulatorio_id = ambulatori.id_ambulatorio
        WHERE pazienti.cognome = ?

    ";

    $stmt = $pdo->prepare($query);
    $stmt->execute([$cognome]);

    $prenotazioni = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($prenotazioni);
?>
