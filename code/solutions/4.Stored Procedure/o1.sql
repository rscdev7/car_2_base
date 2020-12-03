delimiter //
CREATE PROCEDURE o1 (IN d DATETIME,IN agent VARCHAR(20),IN browser VARCHAR(20)) 
BEGIN 
	DECLARE X INT DEFAULT 0;
	INSERT INTO Utente VALUES (NULL,d);
	SELECT MAX(Codice_Utente) INTO X FROM Utente;
	INSERT INTO Utente_Guest VALUES (X,agent,browser);
END;
//
delimiter ;