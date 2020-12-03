delimiter //
CREATE PROCEDURE o30 (IN ms INT,IN ut INT,IN vend VARCHAR(16),OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE; 
	IF (EXISTS(SELECT * FROM Utente_Registrato WHERE Codice_Utente=ut)
	 && EXISTS(SELECT * FROM Invia_F_Ut AS i,FeedBack AS m,Riceve_F_Ve AS r 
	 WHERE i.Cod_FeedBack=m.Cod_Mes
	 AND r.Cod_FeedBack=m.Cod_Mes
	 AND STRCMP(vend,r.Cod_Venditore)=0
	 AND i.Cod_FeedBack=ms 
	 AND i.Codice_Utente=ut)) THEN
		UPDATE Invia_F_Ut SET Cancellato=TRUE
		WHERE Codice_Utente=ut AND Cod_FeedBack=ms;
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;