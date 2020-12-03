delimiter //
CREATE PROCEDURE o34 (IN ms INT,IN ut INT,IN vend VARCHAR(16),OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE; 
	IF (EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP(vend,CF_P_IVA)
	 && EXISTS(SELECT * FROM Invia_F_Ve AS i,FeedBack AS m,Riceve_F_Ut AS r 
	 WHERE i.Cod_FeedBack=m.Cod_Mes
	 AND r.Cod_FeedBack=m.Cod_Mes
	 AND STRCMP(vend,i.Cod_Venditore)=0
	 AND i.Cod_FeedBack=ms 
	 AND r.Codice_Utente=ut))) THEN
		UPDATE Invia_F_Ve SET Cancellato=TRUE
		WHERE STRCMP(vend,Cod_Venditore)=0 AND Cod_FeedBack=ms;
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;