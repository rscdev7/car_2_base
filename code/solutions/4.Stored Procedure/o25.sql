delimiter //
CREATE PROCEDURE o25 (IN ut INT,IN mail VARCHAR(25),IN testo VARCHAR(1000),IN allegato VARCHAR(1000),IN d DATETIME,OUT esito BOOLEAN) 
BEGIN 
	DECLARE F INT DEFAULT 0;
	DECLARE Z INT DEFAULT 0;
	SET esito=false;
	IF (EXISTS(SELECT * FROM Utente_Registrato 
	WHERE Codice_Utente=ut)&&EXISTS(SELECT * FROM 
	Utente_Venditore WHERE STRCMP(Email,mail)=0))THEN
		INSERT INTO Messaggi_Chat
		VALUE(NULL,testo,allegato);
		SELECT MAX(Cod_Mes) INTO F FROM Messaggi_Chat;
		INSERT INTO Invia_C_Ut VALUES(F,ut,d,FALSE,FALSE);
		SELECT CF_P_IVA INTO Z FROM Utente_Venditore WHERE STRCMP(Email,mail)=0;
		INSERT INTO Riceve_C_Ve VALUES(F,Z,d,FALSE);
		SET esito=true;
	END IF;
END;
//
delimiter ;