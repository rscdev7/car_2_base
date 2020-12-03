delimiter //
CREATE PROCEDURE o23 (IN d DATETIME,IN nome VARCHAR(20),IN cognome VARCHAR(20),IN nazionalita VARCHAR(14),IN email VARCHAR(25),IN password VARCHAR(12),IN regione VARCHAR(14),IN provincia VARCHAR(14),IN citta VARCHAR(14))  
BEGIN 
	DECLARE X INT DEFAULT 0;
	INSERT INTO Utente VALUES (NULL,d);
	SELECT MAX(Codice_Utente) INTO X FROM Utente;
	INSERT INTO Utente_Registrato VALUES (X,nome,cognome,nazionalita,email,SHA2(password,224),regione,provincia,citta);
END;
//
delimiter ;