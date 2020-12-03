delimiter //
CREATE PROCEDURE o39 (IN ut INT,IN vend VARCHAR(16),OUT esito BOOLEAN) 
BEGIN 
	DECLARE X INT DEFAULT 5;
	DECLARE W INT DEFAULT 4;
	DECLARE Q INT DEFAULT 5;
	DECLARE c CURSOR FOR (SELECT Cod_FeedBack
						  FROM Invia_F_Ut AS i,FeedBack AS m,Riceve_F_Ve AS r
						  WHERE i.Cod_FeedBack=m.Cod_Mes
						  AND m.Cod_Mes=r.Cod_FeedBack
						  AND i.Codice_Utente=ut
						  AND STRCMP(vend,r.Cod_Venditore)=0);				  
	DECLARE d CURSOR FOR (SELECT Cod_FeedBack
						  FROM Riceve_F_Ut AS r,FeedBack AS m,Invia_F_Ve AS i
						  WHERE r.Cod_FeedBack=m.Cod_Mes
						  AND m.Cod_Mes=i.Cod_FeedBack
						  AND r.Codice_Utente=ut 
						  AND STRCMP(vend,i.Cod_Venditore)=0);					  	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET X=0;	
	SET esito=FALSE;
	OPEN c;
	IF (X=5) THEN
		REPEAT
			FETCH c INTO W;
			IF (X=5) THEN
				UPDATE Invia_F_Ut SET Cancellato=TRUE WHERE Cod_FeedBack=W;
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
				UPDATE Riceve_F_Ut SET Cancellato=TRUE WHERE Cod_FeedBack=Q;
			END IF;
		UNTIL (X=0) END REPEAT;
	END IF;
	CLOSE d;
END;
//
delimiter ;
