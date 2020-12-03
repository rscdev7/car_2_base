/*Creazione Relazioni DB sfruttando lo Schema Logico*/


CREATE TABLE Utente(
	Codice_Utente INT NOT NULL AUTO_INCREMENT,
	Data_Ora_Iscrizione DATETIME NOT NULL,
	PRIMARY KEY (Codice_Utente),
	KEY (Codice_Utente)
)ENGINE=InnoDB;

CREATE TABLE Utente_Venditore(
	CF_P_IVA VARCHAR(16) NOT NULL,
	Data_Nasc DATE NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Cognome VARCHAR(20) NULL,
	Rating FLOAT NULL,
	Email VARCHAR (25) NOT NULL,
	Password VARCHAR(500) NOT NULL,
	Telefono VARCHAR(14) NOT NULL,
	Nazionalita VARCHAR(14) NOT NULL,
	Regione_Res VARCHAR(14) NOT NULL,
	Provincia_Res VARCHAR(14) NOT NULL,
	Citta_Res VARCHAR(14) NOT NULL,
	Ubicazione_Res VARCHAR(20) NOT NULL,
	PRIMARY KEY (CF_P_IVA),
	KEY (CF_P_IVA)
)ENGINE=InnoDB;

CREATE TABLE Utenti_X_Venditori(
	Codice_Utente INT NOT NULL,
	Codice_Venditore VARCHAR(16) NOT NULL,
	PRIMARY KEY (Codice_Utente,Codice_Venditore),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente(Codice_Utente),
	FOREIGN KEY (Codice_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	KEY (Codice_Utente,Codice_Venditore)
)ENGINE=InnoDB;

CREATE TABLE Utente_Registrato(
	Codice_Utente INT NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Cognome VARCHAR(20) NOT NULL,
	Nazionalita VARCHAR(14) NOT NULL,
	Email VARCHAR(25) NOT NULL,
	Password VARCHAR(500) NOT NULL,
	Regione_Res VARCHAR(14) NOT NULL,
	Provincia_Res VARCHAR(14) NOT NULL,
	Citta_Res VARCHAR(14) NOT NULL,
	PRIMARY KEY (Codice_Utente),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente(Codice_Utente),
	KEY (Codice_Utente)
)ENGINE=InnoDB;

CREATE TABLE Utente_Guest(
	Codice_Utente INT NOT NULL,
	User_Agent VARCHAR(20) NOT NULL,
	Browser VARCHAR(20) NOT NULL,
	PRIMARY KEY (Codice_Utente),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente(Codice_Utente),
	KEY (Codice_Utente)
)ENGINE=InnoDB;

CREATE TABLE Ricerche_Auto(
	Cod_ricerca INT NOT NULL AUTO_INCREMENT,
	Tipo_Carburante VARCHAR(10) NULL,
	Prezzo_Minimo INT NULL,
	Prezzo_Massimo INT NOT NULL,
	Marca VARCHAR(20) NOT NULL,
	Modello VARCHAR(20) NOT NULL,
	Serie VARCHAR(20) NOT NULL,
	Allestimento VARCHAR(20) NULL,
	Tipo_Cambio VARCHAR(20) NULL,
	Pot_Min INT NULL,
	Pot_Max INT NULL,
	Anno_Im_Min YEAR NULL,
	Anno_Im_Max YEAR NULL,
	Chilometri INT NULL,
	Tipo_Venditore VARCHAR(20) NULL,
	Data_Ul_Rev DATE NULL,
	Tipo_Car VARCHAR(15) NULL,
	Cert_Tagl BOOLEAN NULL,
	Colore VARCHAR(18) NULL,
	N_Porte INT NULL,
	N_Prec_Prop INT NULL,
	Cl_Em VARCHAR(20) NULL,
	Rating_V FLOAT NULL,
	Regione VARCHAR(14) NOT NULL,
	Provincia VARCHAR(14) NULL,
	Citta VARCHAR(14) NULL,
	PRIMARY KEY (Cod_ricerca),
	KEY (Cod_ricerca)
)ENGINE=InnoDB;

CREATE TABLE Ricerche_Auto_X_Utenti(
	Codice_Utente INT NOT NULL,
	Cod_ricerca INT NOT NULL,
	Data_R DATE NOT NULL,
	Ora TIME NOT NULL,
	PRIMARY KEY (Codice_Utente,Cod_ricerca),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente(Codice_Utente),
	FOREIGN KEY (Cod_ricerca) REFERENCES Ricerche_Auto(Cod_ricerca),
	KEY (Codice_Utente,Cod_ricerca)
)ENGINE=InnoDB;

CREATE TABLE Annunci_Auto(
	Cod_Annuncio INT NOT NULL AUTO_INCREMENT,
	Titolo VARCHAR(13) NOT NULL,
	Descrizione VARCHAR(150) NOT NULL,
	Foto VARCHAR(1000) NOT NULL,
	Data_Creazione DATE NOT NULL,
	Ora_Creazione TIME NOT NULL,
	Prezzo INT NOT NULL,
	Regione VARCHAR(14) NOT NULL,
	Provincia VARCHAR(14) NOT NULL,
	Citta VARCHAR(14) NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_Annuncio),
	KEY (Cod_Annuncio)
)ENGINE=InnoDB;

CREATE TABLE Risultati_Ricerca_Auto(
	Codice INT NOT NULL AUTO_INCREMENT,
	Data_R DATE NOT NULL,
	Ora TIME NOT NULL,
	PRIMARY KEY (Codice),
	KEY (Codice)
)ENGINE=InnoDB;

CREATE TABLE Ricerche_Auto_X_Risultati(
	Cod_ricerca INT NOT NULL,
	Cod_ris INT NOT NULL,
	PRIMARY KEY (Cod_ricerca,Cod_ris),
	FOREIGN KEY (Cod_ricerca) REFERENCES Ricerche_Auto(Cod_ricerca),
	FOREIGN KEY (Cod_ris) REFERENCES Risultati_Ricerca_Auto(Codice),
	KEY (Cod_ricerca,Cod_ris)
)ENGINE=InnoDB;

CREATE TABLE Risultati_Auto_X_Annunci(
	Cod_Annuncio INT NOT NULL,
	Cod_ris INT NOT NULL,
	PRIMARY KEY (Cod_Annuncio,Cod_ris),
	FOREIGN KEY (Cod_Annuncio) REFERENCES Annunci_Auto(Cod_Annuncio),
	FOREIGN KEY (Cod_ris) REFERENCES Risultati_Ricerca_Auto(Codice),
	KEY (Cod_Annuncio,Cod_ris)
)ENGINE=InnoDB;

CREATE TABLE Ricerche_Ricambi_Auto(
	Cod_ricerca INT NOT NULL AUTO_INCREMENT,
	Tipo_Pezzo VARCHAR(20) NOT NULL,
	Marca VARCHAR(20) NOT NULL,
	Modello VARCHAR(20) NOT NULL,
	Serie VARCHAR(20) NOT NULL,
	Prezzo_Minimo INT NULL,
	Prezzo_Massimo INT NOT NULL,
	Tipo_Venditore VARCHAR(20) NULL,
	Regione VARCHAR(14) NOT NULL,
	Provincia VARCHAR(14) NULL,
	Citta VARCHAR(14) NULL,
	Rating_V FLOAT NULL,
	PRIMARY KEY (Cod_ricerca),
	KEY (Cod_ricerca)
)ENGINE=InnoDB;

CREATE TABLE Ricerche_Ricambi_X_Utenti(
	Codice_Utente INT NOT NULL,
	Cod_ricerca INT NOT NULL,
	Data_R DATE NOT NULL,
	Ora TIME NOT NULL,	
	PRIMARY KEY (Codice_Utente,Cod_ricerca),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente(Codice_Utente),
	FOREIGN KEY (Cod_ricerca) REFERENCES Ricerche_Ricambi_Auto(Cod_ricerca),
	KEY (Codice_Utente,Cod_ricerca)
)ENGINE=InnoDB;

CREATE TABLE Annunci_Ricambi(
	Cod_Annuncio INT NOT NULL AUTO_INCREMENT,
	Titolo VARCHAR(13) NOT NULL,
	Descrizione VARCHAR(150) NOT NULL,
	Foto VARCHAR(1000) NOT NULL,
	Data_Creazione DATE NOT NULL,
	Ora_Creazione TIME NOT NULL,
	Prezzo INT NOT NULL,
	Regione VARCHAR(14) NOT NULL,
	Provincia VARCHAR(14) NOT NULL,
	Citta VARCHAR(14) NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_Annuncio),
	KEY (Cod_Annuncio)
)ENGINE=InnoDB;

CREATE TABLE Risultati_Ricerca_Ricambi(
	Codice INT NOT NULL AUTO_INCREMENT,
	Data_R DATE NOT NULL,
	Ora TIME NOT NULL,
	PRIMARY KEY (Codice),
	KEY (Codice)
)ENGINE=InnoDB;

CREATE TABLE Ricerca_Ricambi_X_Risultati(
	Cod_ris INT NOT NULL,
	Cod_ricerca INT NOT NULL,
	PRIMARY KEY (Cod_ris,Cod_ricerca),
	FOREIGN KEY (Cod_ricerca) REFERENCES Ricerche_Ricambi_Auto(Cod_ricerca),
	FOREIGN KEY (Cod_ris) REFERENCES Risultati_Ricerca_Ricambi(Codice),
	KEY (Cod_ris,Cod_ricerca)
)ENGINE=InnoDB;

CREATE TABLE Risultati_Ricambi_X_Annunci(
	Cod_Annuncio INT NOT NULL,
	Cod_ris INT NOT NULL,
	PRIMARY KEY (Cod_Annuncio,Cod_ris),
	FOREIGN KEY (Cod_Annuncio) REFERENCES Annunci_Ricambi(Cod_Annuncio),
	FOREIGN KEY (Cod_ris) REFERENCES Risultati_Ricerca_Ricambi(Codice),
	KEY (Cod_Annuncio,Cod_ris)
)ENGINE=InnoDB;

CREATE TABLE Auto(
	Marca VARCHAR(20) NOT NULL,
	Modello VARCHAR(20) NOT NULL,
	Serie VARCHAR(20) NOT NULL,
	Tipo_Carrozzeria VARCHAR(15) NOT NULL,
	PRIMARY KEY (Marca,Modello,Serie),
	KEY (Marca,Modello,Serie)
)ENGINE=InnoDB;

CREATE TABLE Ricambi_Auto(
	Cod_Ricambio VARCHAR(18) NOT NULL,
	Tipo VARCHAR(20) NOT NULL,
	Descrizione VARCHAR(100) NOT NULL,
	PRIMARY KEY (Cod_Ricambio),
	KEY (Cod_Ricambio)
)ENGINE=InnoDB;

CREATE TABLE Ricambi_X_Auto(
	Marca VARCHAR(20) NOT NULL,
	Modello VARCHAR(20) NOT NULL,
	Serie VARCHAR(20) NOT NULL,
	Cod_Ricambio VARCHAR(18) NOT NULL,
	PRIMARY KEY (Marca,Modello,Serie,Cod_Ricambio),
	FOREIGN KEY (Marca,Modello,Serie) REFERENCES Auto(Marca,Modello,Serie),
	FOREIGN KEY (Cod_Ricambio) REFERENCES Ricambi_Auto(Cod_Ricambio),
	KEY (Marca,Modello,Serie,Cod_Ricambio)
)ENGINE=InnoDB;

CREATE TABLE Auto_X_Venditori(
	Codice INT NOT NULL AUTO_INCREMENT,
	Codice_Venditore VARCHAR(16) NOT NULL,
	Marca VARCHAR(20) NOT NULL,
	Modello VARCHAR(20) NOT NULL,
	Serie VARCHAR(20) NOT NULL,
	Allestimento VARCHAR (20) NULL,
	Anno_Im YEAR NOT NULL,
	Potenza INT NOT NULL,
	Tipo_Cambio VARCHAR(20) NOT NULL,
	N_Porte INT NOT NULL,
	Tipo_Carburante VARCHAR(20) NOT NULL,
	Chilometri INT NOT NULL,
	Cl_Em VARCHAR(20) NULL,
	Cert_Tagl BOOLEAN NULL,
	Colore VARCHAR(18) NOT NULL,
	Data_Ul_Rev DATE NULL,
	PRIMARY KEY (Codice,Codice_Venditore,Marca,Modello,Serie),
	FOREIGN KEY (Marca,Modello,Serie) REFERENCES Auto(Marca,Modello,Serie),
	FOREIGN KEY (Codice_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	KEY (Codice,Codice_Venditore,Marca,Modello,Serie)
)ENGINE=InnoDB;

CREATE TABLE Auto_Ve_X_Ann(
	Codice INT NOT NULL,
	Codice_Venditore VARCHAR(16) NOT NULL,
	Marca VARCHAR(20) NOT NULL,
	Modello VARCHAR(20) NOT NULL,
	Serie VARCHAR(20) NOT NULL,
	Cod_Annuncio INT NOT NULL,
	PRIMARY KEY (Codice,Codice_Venditore,Marca,Modello,Serie,Cod_Annuncio),
	FOREIGN KEY (Codice,Codice_Venditore,Marca,Modello,Serie) REFERENCES Auto_X_Venditori(Codice,Codice_Venditore,Marca,Modello,Serie),
	FOREIGN KEY (Cod_Annuncio) REFERENCES Annunci_Auto(Cod_Annuncio),
	KEY (Codice,Codice_Venditore,Marca,Modello,Serie,Cod_Annuncio)
)ENGINE=InnoDB;

CREATE TABLE Ricambi_X_Venditore(
	Codice INT NOT NULL AUTO_INCREMENT,
	Cod_Venditore VARCHAR(16) NOT NULL,
	Cod_Ricambio VARCHAR(18) NOT NULL,
	Descrizione VARCHAR(150) NULL,
	Data_Prod DATE NULL,
	PRIMARY KEY (Codice,Cod_Venditore,Cod_Ricambio),
	FOREIGN KEY (Cod_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	FOREIGN KEY (Cod_Ricambio) REFERENCES Ricambi_Auto(Cod_Ricambio),
	KEY (Codice,Cod_Venditore,Cod_Ricambio)
)ENGINE=InnoDB;

CREATE TABLE Ric_Ve_X_Ann(
	Codice INT NOT NULL,
	Cod_Venditore VARCHAR(16) NOT NULL,
	Cod_Ricambio VARCHAR(18) NOT NULL,
	Cod_Annuncio INT NOT NULL,
	PRIMARY KEY (Codice,Cod_Venditore,Cod_Ricambio,Cod_Annuncio),
	FOREIGN KEY (Codice) REFERENCES Ricambi_X_Venditore(Codice),
	FOREIGN KEY (Cod_Venditore) REFERENCES Ricambi_X_Venditore(Cod_Venditore),
	FOREIGN KEY (Cod_Ricambio) REFERENCES Ricambi_X_Venditore(Cod_Ricambio),
	FOREIGN KEY (Cod_Annuncio) REFERENCES Annunci_Ricambi(Cod_Annuncio),
	KEY (Codice,Cod_Venditore,Cod_Ricambio,Cod_Annuncio)
)ENGINE=InnoDB;

CREATE TABLE Messaggi_Chat(
	Cod_Mes INT NOT NULL AUTO_INCREMENT,
	Testo VARCHAR(1000) NOT NULL,
	Allegato VARCHAR(1000) NULL,
	PRIMARY KEY (Cod_Mes),
	KEY (Cod_Mes)
)ENGINE=InnoDB;

CREATE TABLE FeedBack(
	Cod_Mes INT NOT NULL AUTO_INCREMENT,
	Testo VARCHAR(1000) NOT NULL,
	Valutazione INT NULL,
	PRIMARY KEY (Cod_Mes),
	KEY (Cod_Mes)
)ENGINE=InnoDB;

CREATE TABLE Riceve_F_Ve(
	Cod_FeedBack INT NOT NULL,
	Cod_Venditore VARCHAR(16) NOT NULL,
	Data_Ora DATETIME NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_FeedBack,Cod_Venditore),
	FOREIGN KEY (Cod_FeedBack) REFERENCES FeedBack(Cod_Mes),
	FOREIGN KEY (Cod_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	KEY (Cod_FeedBack,Cod_Venditore)
)ENGINE=InnoDB;

CREATE TABLE Invia_F_Ve(
	Cod_FeedBack INT NOT NULL,
	Cod_Venditore VARCHAR(16) NOT NULL,
	Data_Ora DATETIME NOT NULL,
	Letto BOOLEAN NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_FeedBack,Cod_Venditore),
	FOREIGN KEY (Cod_FeedBack) REFERENCES FeedBack(Cod_Mes),
	FOREIGN KEY (Cod_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	KEY (Cod_FeedBack,Cod_Venditore)
)ENGINE=InnoDB;

CREATE TABLE Riceve_C_Ve(
	Cod_Mes INT NOT NULL,
	Cod_Venditore VARCHAR(16) NOT NULL,
	Data_Ora DATETIME NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_Mes,Cod_Venditore),
	FOREIGN KEY (Cod_Mes) REFERENCES Messaggi_Chat(Cod_Mes),
	FOREIGN KEY (Cod_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	KEY (Cod_Mes,Cod_Venditore)
)ENGINE=InnoDB;

CREATE TABLE Invia_C_Ve(
	Cod_Mes INT NOT NULL,
	Cod_Venditore VARCHAR(16) NOT NULL,
	Data_Ora DATETIME NOT NULL,
	Letto BOOLEAN NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_Mes,Cod_Venditore),
	FOREIGN KEY (Cod_Mes) REFERENCES Messaggi_Chat(Cod_Mes),
	FOREIGN KEY (Cod_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	KEY (Cod_Mes,Cod_Venditore)
)ENGINE=InnoDB;

CREATE TABLE Riceve_F_Ut(
	Cod_FeedBack INT NOT NULL,
	Codice_Utente INT NOT NULL,
	Data_Ora DATETIME NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_FeedBack,Codice_Utente),
	FOREIGN KEY (Cod_FeedBack) REFERENCES FeedBack(Cod_Mes),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente_Registrato(Codice_Utente),
	KEY (Cod_FeedBack,Codice_Utente)
)ENGINE=InnoDB;

CREATE TABLE Invia_F_Ut(
	Cod_FeedBack INT NOT NULL,
	Codice_Utente INT NOT NULL,
	Data_Ora DATETIME NOT NULL,
	Letto BOOLEAN NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_FeedBack,Codice_Utente),
	FOREIGN KEY (Cod_FeedBack) REFERENCES FeedBack(Cod_Mes),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente_Registrato(Codice_Utente),
	KEY (Cod_FeedBack,Codice_Utente)
)ENGINE=InnoDB;

CREATE TABLE Riceve_C_Ut(
	Cod_Mes INT NOT NULL,
	Codice_Utente INT NOT NULL,
	Data_Ora DATETIME NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_Mes,Codice_Utente),
	FOREIGN KEY (Cod_Mes) REFERENCES Messaggi_Chat(Cod_Mes),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente_Registrato(Codice_Utente),
	KEY (Cod_Mes,Codice_Utente)
)ENGINE=InnoDB;

CREATE TABLE Invia_C_Ut(
	Cod_Mes INT NOT NULL,
	Codice_Utente INT NOT NULL,
	Data_Ora DATETIME NOT NULL,
	Letto BOOLEAN NOT NULL,
	Cancellato BOOLEAN NOT NULL,
	PRIMARY KEY (Cod_Mes,Codice_Utente),
	FOREIGN KEY (Cod_Mes) REFERENCES Messaggi_Chat(Cod_Mes),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente_Registrato(Codice_Utente),
	KEY (Cod_Mes,Codice_Utente)
)ENGINE=InnoDB;

CREATE TABLE Auto_X_FeedBack(
	FeedBack INT NOT NULL,
	Cod_Prod INT NOT NULL,
	Cod_Venditore VARCHAR(16) NOT NULL,
	Marca VARCHAR(20) NOT NULL,
	Modello VARCHAR(20) NOT NULL,
	Serie VARCHAR(20) NOT NULL,
	PRIMARY KEY (FeedBack,Cod_Prod,Cod_Venditore,Marca,Modello,Serie),
	FOREIGN KEY (FeedBack) REFERENCES FeedBack(Cod_Mes),
	FOREIGN KEY (Cod_Prod,Cod_Venditore,Marca,Modello,Serie) REFERENCES Auto_X_Venditori(Codice,Codice_Venditore,Marca,Modello,Serie),
	KEY (FeedBack,Cod_Prod,Cod_Venditore,Marca,Modello,Serie)
)ENGINE=InnoDB;

CREATE TABLE Ricambi_X_FeedBack(
	FeedBack INT NOT NULL,
	Cod_Prod INT NOT NULL,
	Cod_Venditore VARCHAR(16) NOT NULL,
	Cod_Ricambio VARCHAR(18) NOT NULL,
	PRIMARY KEY (FeedBack,Cod_Prod,Cod_Venditore,Cod_Ricambio),
	FOREIGN KEY (FeedBack) REFERENCES FeedBack(Cod_Mes),
	FOREIGN KEY (Cod_Prod) REFERENCES Ricambi_X_Venditore(Codice),
	FOREIGN KEY (Cod_Venditore) REFERENCES Ricambi_X_Venditore(Cod_Venditore),
	FOREIGN KEY (Cod_Ricambio) REFERENCES Ricambi_X_Venditore(Cod_Ricambio),
	KEY (FeedBack,Cod_Prod,Cod_Venditore,Cod_Ricambio)
)ENGINE=InnoDB;

CREATE TABLE Topic_F_Ut(
	Codice INT NOT NULL AUTO_INCREMENT,
	Descrizione VARCHAR(150) NOT NULL,
	Autore INT NOT NULL,
	Data_Ora_Creazione DATETIME NOT NULL,
	PRIMARY KEY (Codice),
	FOREIGN KEY (Autore) REFERENCES Utente_Registrato(Codice_Utente),
	KEY (Codice)
)ENGINE=InnoDB;

CREATE TABLE Post_F_Ut(
	Codice INT NOT NULL AUTO_INCREMENT,
	Testo VARCHAR(1000) NOT NULL,
	Topic INT NOT NULL,
	Autore INT NOT NULL,
	Data_Ora_Creazione DATETIME NOT NULL,
	PRIMARY KEY (Codice),
	FOREIGN KEY (Autore) REFERENCES Utente_Registrato(Codice_Utente),
	FOREIGN KEY (Topic) REFERENCES Topic_F_Ut(Codice),
	KEY (Codice)
)ENGINE=InnoDB;

CREATE TABLE Topic_F_Ve(
	Codice INT NOT NULL AUTO_INCREMENT,
	Descrizione VARCHAR(150) NOT NULL,
	Autore VARCHAR(16) NOT NULL,
	Data_Ora_Creazione DATETIME NOT NULL,
	PRIMARY KEY (Codice),
	FOREIGN KEY (Autore) REFERENCES Utente_Venditore(CF_P_IVA),
	KEY (Codice)
)ENGINE=InnoDB;

CREATE TABLE Post_F_Ve(
	Codice INT NOT NULL AUTO_INCREMENT,
	Testo VARCHAR(1000) NOT NULL,
	Topic INT NOT NULL,
	Autore VARCHAR(16) NOT NULL,
	Data_Ora_Creazione DATETIME NOT NULL,
	PRIMARY KEY (Codice),
	FOREIGN KEY (Autore) REFERENCES Utente_Venditore(CF_P_IVA),
	FOREIGN KEY (Topic) REFERENCES Topic_F_Ve(Codice),
	KEY (Codice)
)ENGINE=InnoDB;

CREATE TABLE Letture_F_Ut(
	Codice_Utente INT NOT NULL,
	Codice_Topic INT NOT NULL,
	Data_Ora DATETIME NOT NULL,
	PRIMARY KEY (Codice_Utente,Codice_Topic,Data_Ora),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente(Codice_Utente),
	FOREIGN KEY (Codice_Topic) REFERENCES Topic_F_Ut(Codice),
	KEY (Codice_Utente,Codice_Topic,Data_Ora)
)ENGINE=InnoDB;

CREATE TABLE Letture_F_Ve(
	Codice_Utente INT NOT NULL,
	Codice_Topic INT NOT NULL,
	Data_Ora DATETIME NOT NULL,
	PRIMARY KEY (Codice_Utente,Codice_Topic,Data_Ora),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente(Codice_Utente),
	FOREIGN KEY (Codice_Topic) REFERENCES Topic_F_Ve(Codice),
	KEY (Codice_Utente,Codice_Topic,Data_Ora)
)ENGINE=InnoDB;

CREATE TABLE Topic_Preferiti_Utenti(
	Codice_Utente INT NOT NULL,
	Codice_Topic INT NOT NULL,
	Link VARCHAR(300) NOT NULL,
	PRIMARY KEY (Codice_Utente,Codice_Topic),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente_Registrato(Codice_Utente),
	FOREIGN KEY (Codice_Topic) REFERENCES Topic_F_Ut(Codice),
	KEY (Codice_Utente,Codice_Topic)
)ENGINE=InnoDB;

CREATE TABLE Topic_Preferiti_Venditori(
	Codice_Venditore VARCHAR(16) NOT NULL,
	Codice_Topic INT NOT NULL,
	Link VARCHAR(300) NOT NULL,
	PRIMARY KEY (Codice_Venditore,Codice_Topic),
	FOREIGN KEY (Codice_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	FOREIGN KEY (Codice_Topic) REFERENCES Topic_F_Ve(Codice),
	KEY (Codice_Venditore,Codice_Topic)
)ENGINE=InnoDB;

CREATE TABLE Accessi(
	Codice INT NOT NULL AUTO_INCREMENT,
	Browser VARCHAR(30) NOT NULL,
	User_Agent VARCHAR(20) NULL,
	Indirizzo_IP VARCHAR(100) NULL,
	PRIMARY KEY (Codice),
	KEY (Codice)
)ENGINE=InnoDB;

CREATE TABLE Accessi_X_Venditori(
	Codice_Venditore VARCHAR(16) NOT NULL,
	Cod_Acc INT NOT NULL,
	Data_Ora DATETIME NOT NULL,
	PRIMARY KEY (Codice_Venditore,Cod_Acc),
	FOREIGN KEY (Cod_Acc) REFERENCES Accessi(Codice),
	FOREIGN KEY (Codice_Venditore) REFERENCES Utente_Venditore(CF_P_IVA),
	KEY (Codice_Venditore,Cod_Acc)
)ENGINE=InnoDB;

CREATE TABLE Accessi_X_Utenti(
	Codice_Utente INT NOT NULL,
	Cod_Acc INT NOT NULL,
	Data_Ora DATETIME NOT NULL,
	PRIMARY KEY (Codice_Utente,Cod_Acc),
	FOREIGN KEY (Cod_Acc) REFERENCES Accessi(Codice),
	FOREIGN KEY (Codice_Utente) REFERENCES Utente_Registrato(Codice_Utente),
	KEY (Codice_Utente,Cod_Acc)
)ENGINE=InnoDB;