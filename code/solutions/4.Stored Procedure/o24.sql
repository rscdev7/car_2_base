delimiter //
CREATE PROCEDURE o24 (IN cd DATETIME,IN cf VARCHAR(16),IN d DATE,IN nome VARCHAR(20),IN cognome VARCHAR(20),IN email VARCHAR(25),IN password VARCHAR(12),IN telefono VARCHAR(14),IN nazionalita VARCHAR(14),IN regione VARCHAR(14),IN provincia VARCHAR(14),IN citta VARCHAR(14),IN ubic VARCHAR(20))  
BEGIN
	DECLARE X INT DEFAULT 0;
	INSERT INTO Utente_Venditore VALUES (cf,d,nome,cognome,-1,email,SHA2(password,224),telefono,nazionalita,regione,provincia,citta,ubic);
	INSERT INTO Utente VALUES (NULL,cd);
	SELECT MAX(Codice_Utente) INTO X FROM Utente;
	INSERT INTO Utenti_X_Venditori VALUES(X,cf);
END;
//
delimiter ;