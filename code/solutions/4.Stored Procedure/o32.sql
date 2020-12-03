delimiter //
CREATE PROCEDURE o32 (IN ms INT,IN vend VARCHAR(16),IN ut INT,OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE; 
	IF (EXISTS(SELECT * FROM Utente_Registrato WHERE Codice_Utente=ut)
	 && EXISTS(SELECT * 
	 FROM Riceve_F_Ut AS r,FeedBack AS m,Invia_F_Ve AS i
	 WHERE 
	 m.Cod_Mes=i.Cod_FeedBack
	 AND m.Cod_Mes=r.Cod_FeedBack
	 AND r.Cod_Mes=ms 
	 AND r.Codice_Utente=ut
	 AND STRCMP(i.Codice_Venditore,vend)=0)) THEN
		UPDATE Riceve_F_Ut SET Cancellato=TRUE
		WHERE Codice_Utente=ut AND Cod_FeedBack=ms;
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;