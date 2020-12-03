delimiter //
CREATE PROCEDURE o27 (IN ut VARCHAR(18),IN dest VARCHAR(25),IN testo VARCHAR(1000),IN allegato VARCHAR(1000),OUT esito BOOLEAN) 
BEGIN 
	DECLARE X INT DEFAULT 0;
	DECLARE T INT DEFAULT 5;
	SET esito=FALSE;
	SELECT Codice_Utente INTO T FROM Utente_Registrato WHERE STRCMP(Email,mail)=0;
	IF (EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP(CF_P_IVA,ut)=0)
	&&EXISTS(SELECT * FROM Utente_Registrato WHERE STRCMP(Email,mail)=0)
	&& EXISTS(SELECT * FROM 
	Messaggi_Chat AS m,Invia_C_Ut AS d,Riceve_C_Ve AS g
	WHERE m.Cod_Mes=d.Cod_Mes
	AND d.Codice_Utente=T
	AND STRCMP(ut,g.Cod_Venditore)=0
	AND g.Cod_Mes=m.Cod_Mes))THEN
		INSERT INTO Messaggi_Chat VALUES(NULL,testo,allegato);
		SELECT MAX(Cod_Mes) INTO X FROM Messaggi_Chat;
		INSERT INTO Invia_C_Ve VALUES (X,ut,d,FALSE,FALSE);
		INSERT INTO Riceve_C_Ut VALUES (X,T,d,FALSE);
	END IF;
END;
//
delimiter ;