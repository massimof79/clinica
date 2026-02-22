-- =========================================================
-- DDL - Database "Clinica"
-- Host previsto: 127.0.0.1
-- =========================================================

DROP DATABASE IF EXISTS Clinica;
CREATE DATABASE Clinica CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE Clinica;

-- Tabella AMBULATORI
DROP TABLE IF EXISTS AMBULATORI;
CREATE TABLE AMBULATORI (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  citta VARCHAR(80) NOT NULL
) ENGINE=InnoDB;

-- Tabella PAZIENTI
DROP TABLE IF EXISTS PAZIENTI;
CREATE TABLE PAZIENTI (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cognome VARCHAR(60) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  email VARCHAR(120) NOT NULL,
  codice_fiscale CHAR(16) NOT NULL UNIQUE,
  data_registrazione DATE NOT NULL
) ENGINE=InnoDB;

-- Tabella MEDICI
DROP TABLE IF EXISTS MEDICI;
CREATE TABLE MEDICI (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cognome VARCHAR(60) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  specializzazione VARCHAR(80) NOT NULL,
  email VARCHAR(120) NOT NULL,
  ambulatorio_id INT NOT NULL,
  CONSTRAINT fk_medici_ambulatori
    FOREIGN KEY (ambulatorio_id) REFERENCES AMBULATORI(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Tabella PRENOTAZIONI
DROP TABLE IF EXISTS PRENOTAZIONI;
CREATE TABLE PRENOTAZIONI (
  id INT AUTO_INCREMENT PRIMARY KEY,
  paziente_id INT NOT NULL,
  medico_id INT NOT NULL,
  data_ora DATETIME NOT NULL,
  stato ENUM('prenotata','confermata','annullata','completata') NOT NULL DEFAULT 'prenotata',
  note VARCHAR(255) NULL,
  CONSTRAINT fk_prenotazioni_pazienti
    FOREIGN KEY (paziente_id) REFERENCES PAZIENTI(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_prenotazioni_medici
    FOREIGN KEY (medico_id) REFERENCES MEDICI(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  INDEX idx_prenotazioni_dataora (data_ora),
  INDEX idx_prenotazioni_paziente (paziente_id),
  INDEX idx_prenotazioni_medico (medico_id)
) ENGINE=InnoDB;
