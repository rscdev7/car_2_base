delimiter //
CREATE PROCEDURE o35 (IN ms INT,IN vend VARCHAR(16),IN ut INT,OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE; 
	IF (EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP (vend,CF_P_IVA))
	 && EXISTS(SELECT * 
	 FROM Riceve_C_Ve AS r,Messaggi_Chat AS m,Invia_C_Ut AS i
	 WHERE 
	 m.Cod_Mes=i.Cod_Mes
	 AND m.Cod_Mes=r.Cod_Mes
	 AND r.Cod_Mes=ms 
	 AND STRCMP(r.Cod_Venditore,vend)=0
	 AND i.Codice_Utente=ut)) THEN
		UPDATE Riceve_C_Ve SET Cancellato=TRUE
		WHERE STRCMP(Cod_Venditore,vend) AND Cod_Mes=ms;
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;