# Rilevamento usura pala a partire dall'analisi del log di volo di un drone esarotore

Questo repository contiene il codice MATLAB sviluppato per il progetto "E1 - RILEVAMENTO USURA PALA A PARTIRE DALL'ANALISI DEL LOG DI VOLO DI UN DRONE ESAROTORE" nel contesto del corso di Manutenzione Preventiva per la Robotica e l'Automazione Intelligente tenuto durante l'anno accademico 2024-2025 dal Prof. Alessandro Freddi dell'Università Politecnica delle Marche.

Il codice si occupa della sincronizzazione dei dati grezzi e della preparazione delle feature diagnostiche, utilizzabili successivamente per la classificazione dei guasti.

## Descrizione

Il progetto si articola in tre fasi principali:
- **Sincronizzazione dei Dati:**  
  I file `.mat` contenenti log di volo (con dati IMU, VIBE, PWM, ESC, CURR, Attitude, RATE, ecc.) vengono caricati, allineati e sincronizzati tramite la tecnica Zero-Order-Hold (ZOH). I timestamp vengono convertiti in secondi, normalizzati (shiftati in modo che il primo campione corrisponda a t = 0) e viene generato un vettore temporale uniforme a 350 Hz.

- **Estrazione delle Feature:**  
  Da questi segnali sincronizzati vengono estratte feature in dominio temporale (Mean, RMS, Deviazione Standard, Skewness, Kurtosis, Crest Factor, Peak Value) e in dominio frequenziale (Peak Frequency e Band Power). Le feature ottenute forniscono una rappresentazione numerica completa dello stato del drone per l’analisi dei guasti.

- **Addestramento di tre classificatori:**
  Con le feature estratte sono stati addestrati un classificatore binario, un classificatore multiclasse per tipo di guasto e un classificatore multiclasse per isolamento sul motore danneggiato. È stato poi addestrato anche un classificatore multiclasse che comprendesse sia il tipo di guasto che l'isolamento, in modo da effettuare un esperimento aggiuntivo che esplorasse maggiormente il comportamento dei modelli. Gli addestramenti sono stati eseguiti mediante il Classification Learner di MATLAV, tuttavia le sessioni non sono incluse completamente per evitare di superare i limiti imposti da GitHub per la bandwidth del repository.

## Struttura del Repository

- **syncAndPrepare.m**  
  Script principale per la sincronizzazione e la preparazione dei dati.

- **zoh.m**  
  Funzione per l'applicazione della tecnica Zero-Order-Hold (ZOH).

- **mergeSignals.m**  
  Funzione per allineare e fondere i segnali provenienti da sensori multipli (IMU e VIBE).

- **Altri script e funzioni**  
  File di supporto per il pre-processing e l'estrazione delle feature.

## Requisiti

- MATLAB
- Diagnostic Feature Designer
- Classification Learner

## Autori

- **Nicolò Bartolini**
- **Nicola Picciafuoco**
