<?php
declare(strict_types=1);

require "auth.php";

if (is_logged_in()) {
    header("Location: dashboard_prenotazioni.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Login</title>
  <style>
    body{font-family:Inter,Arial,sans-serif;background:#f5f7fa;margin:0;padding:40px;color:#333}
    .box{max-width:420px;margin:0 auto;background:#fff;border-radius:10px;box-shadow:0 2px 10px rgba(0,0,0,.08);padding:22px}
    h1{margin:0 0 14px 0;font-size:22px;color:#2c3e50}
    label{display:block;margin-top:12px;font-size:14px;color:#444}
    input{width:100%;padding:10px 12px;margin-top:6px;border:1px solid #ccc;border-radius:6px;font-size:15px}
    button{margin-top:16px;width:100%;padding:10px 12px;border:0;border-radius:6px;background:#3498db;color:#fff;font-size:16px;cursor:pointer}
    button:hover{background:#2980b9}
    .msg{margin-top:12px;font-size:14px}
    .err{color:#b00020}
    .ok{color:#2e7d32}
    .muted{color:#666;font-size:13px;margin-top:10px}
  </style>
</head>
<body>
  <div class="box">
    <h1>Accesso</h1>

    <form id="f">
      <label>Username
        <input id="u" autocomplete="username" required>
      </label>

      <label>Password
        <input id="p" type="password" autocomplete="current-password" required>
      </label>

      <button type="submit">Entra</button>
      <div id="m" class="msg"></div>
      <div class="muted">Demo: admin / admin123 (cambiare subito in produzione).</div>
    </form>
  </div>

<script>
  // Se per qualche motivo sei già autenticato, vai in dashboard
  fetch("api_session.php")
    .then(r => r.json())
    .then(s => { if (s && s.authenticated) location.href = "dashboard_prenotazioni.php"; })
    .catch(()=>{});

  document.getElementById("f").addEventListener("submit", async (e) => {
    e.preventDefault();
    const m = document.getElementById("m");
    m.className = "msg";
    m.textContent = "Verifica credenziali...";

    try{
      const resp = await fetch("api_login.php", {
        method: "POST",
        headers: {"Content-Type":"application/json"},
        body: JSON.stringify({username: document.getElementById("u").value.trim(), password: document.getElementById("p").value}),
      });

      const data = await resp.json().catch(()=> ({}));

      if (!resp.ok) {
        m.className = "msg err";
        m.textContent = data.error || "Login non riuscito";
        return;
      }

      m.className = "msg ok";
      m.textContent = "OK. Reindirizzo...";
      location.href = "dashboard_prenotazioni.php";
    }catch(err){
      m.className = "msg err";
      m.textContent = "Errore di rete";
    }
  });
</script>
</body>
</html>
