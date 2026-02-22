<?php
// api_prenotazioni_list.php
require __DIR__ . "/config.php";

header("Content-Type: application/json; charset=utf-8");

try {
    // Esercizio 2 (senza ottimizzazione): elenco prenotazioni con join
    $sql = "
        SELECT
            pr.id AS prenotazione_id,
            pr.data_ora,
            pr.stato,
            pr.note,

            pa.id AS paziente_id,
            pa.cognome AS paziente_cognome,
            pa.nome AS paziente_nome,
            pa.email AS paziente_email,

            me.id AS medico_id,
            me.cognome AS medico_cognome,
            me.nome AS medico_nome,
            me.specializzazione,

            am.id AS ambulatorio_id,
            am.nome AS ambulatorio_nome,
            am.citta AS ambulatorio_citta
        FROM PRENOTAZIONI pr
        JOIN PAZIENTI pa ON pa.id = pr.paziente_id
        JOIN MEDICI me ON me.id = pr.medico_id
        JOIN AMBULATORI am ON am.id = me.ambulatorio_id
        ORDER BY pr.data_ora DESC, pr.id DESC
    ";

    // Prepared statement (anche senza parametri, come richiesto)
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $rows = $stmt->fetchAll();

    echo json_encode([
        "ok" => true,
        "count" => count($rows),
        "data" => $rows
    ], JSON_UNESCAPED_UNICODE);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "ok" => false,
        "error" => "Errore durante la lettura delle prenotazioni",
        "detail" => $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
}
?>
