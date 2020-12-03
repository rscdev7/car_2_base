delimiter //
CREATE PROCEDURE o29 (IN ms INT,IN ut INT,IN vend VARCHAR(16),OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE; 
	IF (EXISTS(SELECT * FROM Utente_Registrato WHERE Codice_Utente=ut)
	 && EXISTS(SELECT * FROM Invia_C_Ut AS i,Messaggi_Chat AS m,Riceve_C_Ve AS r 
	 WHERE i.Cod_Mes=m.Cod_Mes
	 AND r.Cod_Mes=m.Cod_Mes
	 AND STRCMP(vend,r.Cod_Venditore)=0
	 AND i.Cod_Mes=ms 
	 AND i.Codice_Utente=ut)) THEN
		UPDATE Invia_C_Ut SET Cancellato=TRUE
		WHERE Codice_Utente=ut AND Cod_Mes=ms;
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;