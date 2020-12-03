delimiter //
CREATE PROCEDURE o33 (IN ms INT,IN ut INT,IN vend VARCHAR(16),OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE; 
	IF (EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP(vend,CF_P_IVA)
	 && EXISTS(SELECT * FROM Invia_C_Ve AS i,Messaggi_Chat AS m,Riceve_C_Ut AS r 
	 WHERE i.Cod_Mes=m.Cod_Mes
	 AND r.Cod_Mes=m.Cod_Mes
	 AND STRCMP(vend,i.Cod_Venditore)=0
	 AND i.Cod_Mes=ms 
	 AND r.Codice_Utente=ut))) THEN
		UPDATE Invia_C_Ve SET Cancellato=TRUE
		WHERE STRCMP(vend,Cod_Venditore)=0 AND Cod_Mes=ms;
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;