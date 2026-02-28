<?php
    require "db_conn.php";
    header("Content-Type: application/json");

    $input = json_decode(file_get_contents("php://input"), true);

    if (!$input) {
        echo json_encode(["error" => "Dati mancanti"]);
        exit;
    }

    /* --- 1. PAZIENTE --- */
    $stmt = $pdo->prepare("SELECT id FROM pazienti WHERE codice_fiscale = ?");
    $stmt->execute([$input["p_cf"]]);
    $paz = $stmt->fetch();

    if (!$paz) {
        $stmt = $pdo->prepare("
            INSERT INTO pazienti (nome, cognome, email, codice_fiscale, data_registrazione)
            VALUES (?, ?, ?, ?, CURDATE())
        ");
        $stmt->execute([
            $input["p_nome"], $input["p_cognome"], $input["p_email"], $input["p_cf"]
        ]);
        $paz_id = $pdo->lastInsertId();
    } else {
        $paz_id = $paz["id"];
    }

    /* --- 2. MEDICO --- */
    $stmt = $pdo->prepare("SELECT id FROM medici WHERE nome = ? AND cognome = ?");
    $stmt->execute([$input["m_nome"], $input["m_cognome"]]);
    $med = $stmt->fetch();

    if (!$med) {
        $stmt = $pdo->prepare("
            INSERT INTO medici (nome, cognome, specializzazione, email,ambulatorio_id)
            VALUES (?, ?, ?, ?,?)
        ");
        $stmt->execute([
            $input["m_nome"], $input["m_cognome"], $input["m_spec"],$input['m_email'], $input["m_amb"]
        ]);
        $med_id = $pdo->lastInsertId();
    } else {
        $med_id = $med["id"];
    }

    /* --- 3. PRENOTAZIONE --- */
    $stmt = $pdo->prepare("
        INSERT INTO prenotazioni (paziente_id, medico_id, data_prenotazione, ora_prenotazione, stato, note)
        VALUES (?, ?, ?, ?, 'confermato', ?)
    ");

    $stmt->execute([
        $paz_id,
        $med_id,
        $input["data"],
        $input["ora"],
        $input["note"]
    ]);

    echo json_encode(["success" => true]);

?>
