delimiter //
CREATE PROCEDURE o36 (IN ms INT,IN vend VARCHAR(16),IN ut INT,OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE; 
	IF (EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP (vend,CF_P_IVA))
	 && EXISTS(SELECT * 
	 FROM Riceve_F_Ve AS r,FeedBack AS m,Invia_F_Ut AS i
	 WHERE 
	 m.Cod_Mes=i.Cod_FeedBack
	 AND m.Cod_Mes=r.Cod_FeedBack
	 AND r.Cod_FeedBack=ms 
	 AND STRCMP(r.Cod_Venditore,vend)=0
	 AND i.Codice_Utente=ut)) THEN
		UPDATE Riceve_F_Ve SET Cancellato=TRUE
		WHERE STRCMP(Cod_Venditore,vend)=0 AND Cod_FeedBack=ms;
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;