delimiter //
CREATE PROCEDURE o22_u (IN mail VARCHAR(25),IN pass VARCHAR(12),IN browser VARCHAR(30),IN agent VARCHAR(20),IN ip VARCHAR(100),IN d DATETIME,OUT esito BOOLEAN) 
BEGIN
	DECLARE Z INT DEFAULT 0;
	DECLARE Q INT DEFAULT 0;
	SET esito=FALSE;
	IF (EXISTS(SELECT * FROM Utente_Registrato AS u WHERE STRCMP(u.Email,mail)=0 AND STRCMP(u.Password,SHA2(pass,224))=0))THEN
		SET esito=TRUE;
		INSERT INTO Accessi VALUES (NULL,browser,agent,ip);
		SELECT MAX(Codice) INTO Q FROM Accessi;
		SELECT Codice_Utente INTO Z FROM Utente_Registrato AS u WHERE STRCMP(u.Email,mail)=0; 
		INSERT INTO Accessi_X_Utenti VALUES(Z,Q,d);
	END IF;
END;
//
delimiter ;