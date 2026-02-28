-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 28, 2026 alle 13:32
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinica`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ambulatori`
--

CREATE TABLE `ambulatori` (
  `id_ambulatorio` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `citta` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ambulatori`
--

INSERT INTO `ambulatori` (`id_ambulatorio`, `nome`, `citta`) VALUES
(1, 'San Luca', 'Ascoli Piceno'),
(2, 'Salus', 'S. Benedetto'),
(3, 'Centro Vita', 'Fermo'),
(4, 'Polimed', 'Macerata'),
(5, 'Sant\'Anna', 'Ancona'),
(6, 'Diagnostica', 'Jesi'),
(7, 'San Giorgio', 'Pesaro'),
(8, 'MedCare', 'Urbino'),
(9, 'Clinica Blu', 'Osimo'),
(10, 'AmbuPlus', 'Senigallia'),
(11, 'San Marco', 'Fabriano'),
(12, 'Wellness', 'Falconara'),
(13, 'LifeCare', 'Civitanova'),
(14, 'MedicaLab', 'Tolentino'),
(15, 'Centro Cuore', 'Loreto'),
(16, 'San Paolo', 'Grottammare'),
(17, 'MedOne', 'Offida'),
(18, 'Clinica Verde', 'Amandola'),
(19, 'Salute +', 'Porto Recanati'),
(20, 'Aurora', 'Montegranaro');

-- --------------------------------------------------------

--
-- Struttura della tabella `medici`
--

CREATE TABLE `medici` (
  `id` int(11) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `specializzazione` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ambulatorio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `medici`
--

INSERT INTO `medici` (`id`, `cognome`, `nome`, `specializzazione`, `email`, `ambulatorio_id`) VALUES
(1, 'Ferrari', 'Giorgio', 'Cardiologia', 'g.ferrari@clinica.it', 1),
(2, 'Conti', 'Sara', 'Dermatologia', 's.conti@clinica.it', 2),
(3, 'Moretti', 'Lorenzo', 'Ortopedia', 'l.moretti@clinica.it', 3),
(4, 'De Angelis', 'Marta', 'Pediatria', 'm.deangelis@clinica.it', 4),
(5, 'Ricci', 'Alessandro', 'Neurologia', 'a.ricci@clinica.it', 5),
(6, 'Lucca', 'Lorenzo', 'Radiografia', NULL, 1),
(7, 'Corsi', 'Lucio', 'Otorino', NULL, 2),
(8, 'Lucca', 'Lorenz', 'Radiografia', NULL, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `pazienti`
--

CREATE TABLE `pazienti` (
  `id` int(11) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `data_registrazione` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `pazienti`
--

INSERT INTO `pazienti` (`id`, `cognome`, `nome`, `email`, `codice_fiscale`, `data_registrazione`) VALUES
(1, 'Rossi', 'Marco', 'marco.rossi@example.com', 'RSSMRC90A01H501U', '2024-01-10'),
(2, 'Bianchi', 'Luca', 'luca.bianchi@example.com', 'BNCLCU85B15F205Z', '2024-02-20'),
(3, 'Verdi', 'Anna', 'anna.verdi@example.com', 'VRDANN92C30H501X', '2024-03-05'),
(4, 'Neri', 'Giulia', 'giulia.neri@example.com', 'NREGLL88D12F205Q', '2024-04-18'),
(5, 'Romani', 'Paolo', 'paolo.romani@example.com', 'RMNPLA95E22H501T', '2024-05-01'),
(6, 'Mirti', 'Luca', 'mirti@gmial.com', '11111111111111', '2026-02-27'),
(7, 'creodino', 'dino', 'crodino@gmail.com', '121345678', '2026-02-27');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `id` int(11) NOT NULL,
  `paziente_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `stato` varchar(20) NOT NULL,
  `note` text DEFAULT NULL,
  `data_prenotazione` date NOT NULL,
  `ora_prenotazione` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `prenotazioni`
--

INSERT INTO `prenotazioni` (`id`, `paziente_id`, `medico_id`, `stato`, `note`, `data_prenotazione`, `ora_prenotazione`) VALUES
(1, 1, 1, 'confermato', 'Controllo annuale', '2025-02-10', '09:00:00'),
(2, 2, 3, 'in attesa', 'Dolore al ginocchio', '2025-02-12', '11:30:00'),
(3, 3, 2, 'confermato', 'Visita dermatologica', '2025-02-15', '15:00:00'),
(4, 4, 5, 'annullato', 'Paziente non disponibile', '2025-02-18', '10:45:00'),
(5, 5, 4, 'confermato', 'Visita pediatrica per figlio', '2025-02-20', '08:30:00'),
(6, 6, 6, 'confermato', 'Visita Cardiologa', '2026-02-27', '16:03:00'),
(7, 6, 7, 'confermato', 'Visita Otorino', '2026-02-27', '18:13:00'),
(8, 6, 7, 'confermato', 'Visita Otorino', '2026-02-27', '18:13:00'),
(9, 7, 8, 'confermato', 'Visita Cardiologa', '2026-02-27', '19:21:00'),
(10, 7, 6, 'confermato', 'Visita Cardiologa', '2026-02-27', '19:21:00');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `ambulatori`
--
ALTER TABLE `ambulatori`
  ADD PRIMARY KEY (`id_ambulatorio`);

--
-- Indici per le tabelle `medici`
--
ALTER TABLE `medici`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ambulatorio_id` (`ambulatorio_id`);

--
-- Indici per le tabelle `pazienti`
--
ALTER TABLE `pazienti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codice_fiscale` (`codice_fiscale`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paziente_id` (`paziente_id`),
  ADD KEY `medico_id` (`medico_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `ambulatori`
--
ALTER TABLE `ambulatori`
  MODIFY `id_ambulatorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `medici`
--
ALTER TABLE `medici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `pazienti`
--
ALTER TABLE `pazienti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `medici`
--
ALTER TABLE `medici`
  ADD CONSTRAINT `medici_ibfk_1` FOREIGN KEY (`ambulatorio_id`) REFERENCES `ambulatori` (`id_ambulatorio`);

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`paziente_id`) REFERENCES `pazienti` (`id`),
  ADD CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medici` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
