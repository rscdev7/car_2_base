delimiter //
CREATE PROCEDURE o38 (IN ut INT,IN vend VARCHAR(16),OUT esito BOOLEAN) 
BEGIN 
	DECLARE X INT DEFAULT 5;
	DECLARE W INT DEFAULT 4;
	DECLARE Q INT DEFAULT 5;
	DECLARE c CURSOR FOR (SELECT Cod_Mes
						  FROM Invia_C_Ve AS i,Messaggi_Chat AS m,Riceve_C_Ut AS r
						  WHERE i.Cod_Mes=m.Cod_Mes
						  AND m.Cod_Mes=r.Cod_Mes
						  AND STRCMP(vend,i.Cod_Venditore)=0 
						  AND r.Codice_Utente=ut);				  
	DECLARE d CURSOR FOR (SELECT Cod_Mes
						  FROM Riceve_C_Ve AS r,Messaggi_Chat AS m,Invia_C_Ut AS i
						  WHERE r.Cod_Mes=m.Cod_Mes
						  AND m.Cod_Mes=i.Cod_Mes
						  AND STRCMP(vend,r.Cod_Venditore)=0 
						  AND i.Codice_Utente=ut);					  	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET X=0;	
	SET esito=FALSE;
	OPEN c;
	IF (X=5) THEN
		REPEAT
			FETCH c INTO W;
			IF (X=5) THEN
				UPDATE Invia_C_Ve SET Cancellato=TRUE WHERE Cod_Mes=W;
			END IF;
		UNTIL (X=0) END REPEAT;
		SET esito=TRUE;
	END IF;
	CLOSE c;
	OPEN d;
	SET X=5;
	IF (X=5) THEN
		REPEAT
			FETCH d INTO Q;
			IF (X=5) THEN
				UPDATE Riceve_C_Ve SET Cancellato=TRUE WHERE Cod_Mes=Q;
			END IF;
		UNTIL (X=0) END REPEAT;
	END IF;
	CLOSE d;
END;
//
delimiter ;
 	