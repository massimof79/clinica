<?php
declare(strict_types=1);

require "db_conn.php";
require "auth.php";

header("Content-Type: application/json; charset=utf-8");

$input = json_decode(file_get_contents("php://input"), true);

if (!$input || !isset($input["username"]) || !isset($input["password"])) {
    http_response_code(400);
    echo json_encode(["error" => "Richiesta non valida"]);
    exit;
}

$username = trim((string)$input["username"]);
$password = (string)$input["password"];

if ($username === "" || $password === "") {
    http_response_code(400);
    echo json_encode(["error" => "Username e password obbligatori"]);
    exit;
}

$stmt = $pdo->prepare("SELECT id, username, password_hash, ruolo FROM utenti WHERE username = ? LIMIT 1");
$stmt->execute([$username]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user || !password_verify($password, $user["password_hash"])) {
    http_response_code(401);
    echo json_encode(["error" => "Credenziali non valide"]);
    exit;
}

// login ok
$_SESSION["user_id"] = (int)$user["id"];
$_SESSION["username"] = $user["username"];
$_SESSION["ruolo"] = $user["ruolo"] ?? "utente";

// (opzionale) riduce rischio session fixation
session_regenerate_id(true);

echo json_encode(["ok" => true, "username" => $_SESSION["username"], "ruolo" => $_SESSION["ruolo"]]);
?>