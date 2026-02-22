-- =========================================================
-- DML - Dati di esempio (coerenti con le FK)
-- =========================================================

USE Clinica;

INSERT INTO AMBULATORI (nome, citta) VALUES
  ("Ambulatorio Centro", "Pesaro"),
  ("Poliambulatorio Mare", "Rimini"),
  ("Ambulatorio Stazione", "Ancona"),
  ("Centro Medico Nord", "Bologna");

INSERT INTO MEDICI (cognome, nome, specializzazione, email, ambulatorio_id) VALUES
  ("Rossi", "Laura", "Cardiologia", "laura.rossi1@clinica.local", 1),
  ("Bianchi", "Marco", "Dermatologia", "marco.bianchi2@clinica.local", 2),
  ("Verdi", "Giulia", "Ortopedia", "giulia.verdi3@clinica.local", 3),
  ("Conti", "Paolo", "Neurologia", "paolo.conti4@clinica.local", 4),
  ("Romano", "Elena", "Oculistica", "elena.romano5@clinica.local", 1),
  ("Galli", "Stefano", "Medicina Interna", "stefano.galli6@clinica.local", 2),
  ("Costa", "Chiara", "Ginecologia", "chiara.costa7@clinica.local", 3),
  ("Ferrari", "Davide", "Pediatria", "davide.ferrari8@clinica.local", 4),
  ("Greco", "Sara", "Cardiologia", "sara.greco9@clinica.local", 1),
  ("Marino", "Luca", "Dermatologia", "luca.marino10@clinica.local", 2),
  ("Rinaldi", "Francesca", "Ortopedia", "francesca.rinaldi11@clinica.local", 3),
  ("Barbieri", "Andrea", "Neurologia", "andrea.barbieri12@clinica.local", 4);

INSERT INTO PAZIENTI (cognome, nome, email, codice_fiscale, data_registrazione) VALUES
  ("Sereni", "Alessia", "alessia.sereni1@mail.local", "CFX0000000000001", "2025-12-23"),
  ("De Luca", "Matteo", "matteo.deluca2@mail.local", "CFX0000000000002", "2025-12-22"),
  ("Moretti", "Irene", "irene.moretti3@mail.local", "CFX0000000000003", "2025-12-21"),
  ("Ricci", "Tommaso", "tommaso.ricci4@mail.local", "CFX0000000000004", "2025-12-20"),
  ("Fabbri", "Noemi", "noemi.fabbri5@mail.local", "CFX0000000000005", "2025-12-19"),
  ("Giordano", "Giorgio", "giorgio.giordano6@mail.local", "CFX0000000000006", "2025-12-18"),
  ("Martinelli", "Beatrice", "beatrice.martinelli7@mail.local", "CFX0000000000007", "2025-12-17"),
  ("Lombardi", "Simone", "simone.lombardi8@mail.local", "CFX0000000000008", "2025-12-16"),
  ("Mancini", "Valeria", "valeria.mancini9@mail.local", "CFX0000000000009", "2025-12-15"),
  ("Esposito", "Alberto", "alberto.esposito10@mail.local", "CFX0000000000010", "2025-12-14"),
  ("Villa", "Marta", "marta.villa11@mail.local", "CFX0000000000011", "2025-12-13"),
  ("Parisi", "Nicola", "nicola.parisi12@mail.local", "CFX0000000000012", "2025-12-12"),
  ("Testa", "Elisa", "elisa.testa13@mail.local", "CFX0000000000013", "2025-12-11"),
  ("Pellegrini", "Fabio", "fabio.pellegrini14@mail.local", "CFX0000000000014", "2025-12-10"),
  ("Guerra", "Silvia", "silvia.guerra15@mail.local", "CFX0000000000015", "2025-12-09");

INSERT INTO PRENOTAZIONI (paziente_id, medico_id, data_ora, stato, note) VALUES
  (11, 2, "2026-02-02 16:30:00", "prenotata", "Controllo periodico"),
  (12, 2, "2026-02-23 16:00:00", "confermata", NULL),
  (1, 2, "2026-02-08 10:00:00", "confermata", "Referti disponibili"),
  (11, 12, "2026-02-19 12:15:00", "confermata", "Prima visita"),
  (13, 1, "2026-02-26 17:15:00", "confermata", "Prima visita"),
  (5, 3, "2026-02-08 17:30:00", "prenotata", "Follow-up"),
  (2, 6, "2026-03-01 11:30:00", "completata", "Referti disponibili"),
  (8, 9, "2026-02-05 12:00:00", "confermata", "Richiesta impegnativa"),
  (11, 10, "2026-03-02 17:30:00", "confermata", "Referti disponibili"),
  (2, 1, "2026-02-23 10:30:00", "completata", "Richiesta impegnativa"),
  (4, 2, "2026-02-14 11:45:00", "confermata", "Prima visita"),
  (3, 6, "2026-02-13 10:30:00", "annullata", "Referti disponibili"),
  (11, 2, "2026-02-21 16:15:00", "confermata", "Controllo periodico"),
  (3, 8, "2026-02-14 11:15:00", "confermata", "Richiesta impegnativa"),
  (13, 1, "2026-02-09 17:00:00", "completata", "Follow-up"),
  (5, 2, "2026-02-08 15:30:00", "prenotata", "Follow-up"),
  (7, 11, "2026-02-16 10:30:00", "prenotata", "Referti disponibili"),
  (9, 9, "2026-02-10 16:45:00", "completata", "Follow-up"),
  (6, 4, "2026-02-06 15:45:00", "prenotata", NULL),
  (14, 2, "2026-02-06 16:15:00", "annullata", "Follow-up"),
  (10, 2, "2026-02-14 12:45:00", "confermata", "Dolore persistente"),
  (14, 1, "2026-02-23 16:00:00", "confermata", "Dolore persistente"),
  (13, 5, "2026-02-26 16:30:00", "prenotata", "Follow-up"),
  (3, 8, "2026-02-02 16:30:00", "completata", "Richiesta impegnativa"),
  (3, 9, "2026-03-03 09:30:00", "completata", "Dolore persistente"),
  (10, 4, "2026-02-06 11:15:00", "confermata", "Richiesta impegnativa"),
  (15, 9, "2026-03-03 09:30:00", "confermata", NULL),
  (15, 6, "2026-03-02 17:30:00", "prenotata", "Controllo periodico"),
  (15, 10, "2026-03-04 09:00:00", "annullata", "Richiesta impegnativa"),
  (2, 9, "2026-02-26 10:15:00", "confermata", "Dolore persistente");
