delimiter //
CREATE PROCEDURE o42 (IN ut INT,IN vend VARCHAR(16),OUT esito BOOLEAN) 
BEGIN 
	DECLARE X INT DEFAULT 5;
	DECLARE W INT DEFAULT 4;
	DECLARE Q INT DEFAULT 5;			  
	DECLARE d CURSOR FOR (SELECT Cod_Mes
						  FROM Riceve_C_Ut AS r,Messaggi_Chat AS m,Invia_C_Ve AS i
						  WHERE r.Cod_Mes=m.Cod_Mes
						  AND m.Cod_Mes=i.Cod_Mes
						  AND r.Codice_Utente=ut 
						  AND STRCMP(vend,i.Cod_Venditore)=0);					  	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET X=0;	
	SET esito=FALSE;
	OPEN d;
	IF (X=5) THEN
		REPEAT
			FETCH d INTO Q;
			IF (X=5) THEN
				UPDATE Invia_C_Ve SET Letto=TRUE WHERE Cod_Mes=Q;
			END IF;
		UNTIL (X=0) END REPEAT;
		SET esito=TRUE;
	END IF;
	CLOSE d;
END;
//
delimiter ;