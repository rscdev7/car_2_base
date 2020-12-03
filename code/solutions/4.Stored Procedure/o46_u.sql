delimiter //
CREATE PROCEDURE o46_u (IN ut INT,IN ol VARCHAR(12),IN np varchar(12),OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE;
	IF (EXISTS(SELECT * FROM Utente_Registrato AS u WHERE Codice_Utente=ut AND STRCMP(SHA2(ol,224),u.Password)=0)) THEN
		SET esito=TRUE;
		UPDATE Utente_Registrato AS u SET u.Password=SHA2(np,224) WHERE u.Codice_Utente=ut; 
	END IF;
END;
//
delimiter ;