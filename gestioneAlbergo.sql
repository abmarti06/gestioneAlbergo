use gestioneAlbergo;

CREATE TABLE Albergo (
    AlbergoID INT PRIMARY KEY IDENTITY (1,1),
    Nome VARCHAR(255) NOT NULL,
    Indirizzo VARCHAR(255) NOT NULL,
    Valutazione DECIMAL(3, 1)
);

CREATE TABLE Camera (
    CameraID INT PRIMARY KEY IDENTITY (1,1),
    AlbergoRIF INT,
    Tipo VARCHAR(50) NOT NULL,
    CapacitaOspiti INT,
    Tariffa DECIMAL(6, 2),
    FOREIGN KEY (AlbergoRIF) REFERENCES Albergo(AlbergoID)
);

CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    Contatto VARCHAR(100)
);

CREATE TABLE Dipendente (
    DipendenteID INT PRIMARY KEY IDENTITY(1,1),
    AlbergoRIF INT,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    Posizione VARCHAR(50),
    FOREIGN KEY (AlbergoRIF) REFERENCES Albergo(AlbergoID)
);

CREATE TABLE Facilities (
    FacilitiesID INT PRIMARY KEY IDENTITY(1,1),
    AlbergoRIF INT,
    Nome VARCHAR(50) NOT NULL,
    Descrizione TEXT,
    OrariApertura VARCHAR(100),
    FOREIGN KEY (AlbergoRIF) REFERENCES Albergo(AlbergoID)
);

CREATE TABLE Prenotazione (
    PrenotazioneID INT PRIMARY KEY,
    ClienteRIF INT,
    CameraRIF INT,
    DataCheckIn DATE,
    DataCheckOut DATE,
    FOREIGN KEY (ClienteRIF) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (ClienteRIF) REFERENCES Camera(CameraID)
);
