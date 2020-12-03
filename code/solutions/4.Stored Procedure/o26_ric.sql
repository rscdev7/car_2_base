delimiter //
CREATE PROCEDURE o26_ric (IN ut INT,IN T VARCHAR(16),IN testo VARCHAR(1000),IN valutazione INT,IN d DATETIME,IN codice INT,IN prod VARCHAR(18),OUT esito BOOLEAN) 
BEGIN 
	DECLARE F INT DEFAULT 0;
	DECLARE Z INT DEFAULT 0;
	DECLARE M INT DEFAULT 2;
	DECLARE U INT DEFAULT 5;
	DECLARE somma FLOAT DEFAULT 1;
	DECLARE NUM FLOAT DEFAULT 2;
	DECLARE o CURSOR FOR (SELECT SUM(f.valutazione) AS Somma,COUNT(*) AS N
						  FROM FeedBack AS f,Riceve_F_Ve AS ric
		                  WHERE f.Cod_Mes=riq.Cod_FeedBack
		                  AND riq.Cod_Venditore=T);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET U=0;	
	SET esito=false;
	IF (EXISTS(SELECT * FROM Utente_Registrato 
	WHERE Codice_Utente=ut)&& EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP(CF_P_IVA,T)=0)&&
	NOT EXISTS(SELECT * FROM Ricambi_X_FeedBack AS a,FeedBack AS f 
	WHERE STRCMP(a.Cod_Ricambio,prod)=0
	AND STRCMP(a.Cod_Venditore,T)=0
	AND a.Cod_Prod=codice
	AND f.Cod_Mes=a.FeedBack
	AND f.valutazione IS NOT NULL)&& valutazione>=0&&
	valutazione<=10 &&
	EXISTS(SELECT * FROM Ricambi_X_FeedBack AS a,FeedBack AS f,Riceve_F_Ut AS r,Invia_F_Ve AS i 
	WHERE STRCMP(a.Cod_Ricambio,prod)=0
	AND STRCMP(a.Cod_Venditore,T)=0
	AND a.Cod_Prod=codice
	AND f.Cod_Mes=a.FeedBack
	AND f.valutazione IS NULL
	AND f.Cod_Mes=r.Cod_FeedBack
	AND r.Codice_Utente=ut
	AND f.Cod_Mes=i.Cod_FeedBack
	AND STRCMP(i.Cod_Venditore,T)=0))THEN
		INSERT INTO FeedBack VALUES(NULL,testo,valutazione);
		SELECT MAX(Cod_Mes) INTO F FROM FeedBack;
		INSERT INTO Invia_F_Ut VALUES(F,ut,d,FALSE,FALSE);
		INSERT INTO Riceve_F_Ve VALUES(F,T,d,FALSE);
		INSERT INTO Ricambi_X_FeedBack 
		VALUES(F,codice,T,prod);
		SELECT a.Cod_Annuncio INTO M 
		FROM Annunci_Ricambi AS a,Ric_Ve_X_Ann AS e,Ricambi_X_Venditore AS w
		WHERE a.Cod_Annuncio=e.Cod_Annuncio
		AND STRCMP(w.Cod_Venditore,e.Cod_Venditore)=0
		AND STRCMP(w.Codice,e.Codice)=0
		AND STRCMP(w.Cod_Ricambio,e.Cod_Ricambio)=0
		AND STRCMP(w.Codice_Venditore,T)=0
		AND STRCMP(w.Codice,codice)=0
		AND STRCMP(w.Cod_Ricambio,prod)=0;
		UPDATE Annunci_Ricambi SET Cancellato=TRUE
		WHERE Cod_Annuncio=M;
		OPEN o;
		IF (U=2) THEN
			FETCH o INTO somma,NUM;
			IF (U=2)THEN			
				UPDATE Utente_Venditore SET Rating=(somma/NUM) WHERE STRCMP(CF_P_IVA,T)=0;
			END IF;
		END IF;
		SET esito=true;
	END IF;
END;
//
delimiter ;