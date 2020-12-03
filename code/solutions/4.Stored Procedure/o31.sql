delimiter //
CREATE PROCEDURE o31 (IN ms INT,IN vend VARCHAR(16),IN ut INT,OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE; 
	IF (EXISTS(SELECT * FROM Utente_Registrato WHERE Codice_Utente=ut)
	 && EXISTS(SELECT * 
	 FROM Riceve_C_Ut AS r,Messaggi_Chat AS m,Invia_C_Ve AS i
	 WHERE 
	 m.Cod_Mes=i.Cod_Mes
	 AND m.Cod_Mes=r.Cod_Mes
	 AND r.Cod_Mes=ms 
	 AND r.Codice_Utente=ut
	 AND STRCMP(i.Codice_Venditore,vend)=0)) THEN
		UPDATE Riceve_C_Ut SET Cancellato=TRUE
		WHERE Codice_Utente=ut AND Cod_Mes=ms;
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;