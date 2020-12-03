delimiter //
CREATE PROCEDURE o45 (IN ut INT,IN vend VARCHAR(16),OUT esito BOOLEAN) 
BEGIN 
	DECLARE X INT DEFAULT 5;
	DECLARE W INT DEFAULT 4;
	DECLARE Q INT DEFAULT 5;			  
	DECLARE d CURSOR FOR (SELECT Cod_FeedBack
						  FROM Riceve_F_Ve AS r,Messaggi_FeedBack AS m,Invia_F_Ut AS i
						  WHERE r.Cod_FeedBack=m.Cod_Mes
						  AND m.Cod_Mes=i.Cod_FeedBack
						  AND STRCMP(vend,r.Cod_Venditore)=0 
						  AND i.Codice_Utente=ut);					  	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET X=0;	
	SET esito=FALSE;
	OPEN d;
	IF (X=5) THEN
		REPEAT
			FETCH d INTO Q;
			IF (X=5) THEN
				UPDATE Invia_F_Ut SET Letto=TRUE WHERE Cod_FeedBack=Q;
			END IF;
		UNTIL (X=0) END REPEAT;
		SET esito=true;
	END IF;
	CLOSE d;
END;
//
delimiter ;
