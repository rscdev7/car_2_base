delimiter //
CREATE PROCEDURE o26_auto (IN ut INT,IN T VARCHAR(16),IN testo VARCHAR(1000),IN valutazione INT,IN d DATETIME,IN codice INT,IN marca VARCHAR(20),IN modello VARCHAR(20),IN serie VARCHAR(20),OUT esito BOOLEAN) 
BEGIN 
	DECLARE F INT DEFAULT 0;
	DECLARE Z INT DEFAULT 0;
	DECLARE H FLOAT;
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
	NOT EXISTS(SELECT * FROM Auto_X_FeedBack AS a,FeedBack AS f 
	WHERE STRCMP(a.Marca,marca)=0
	AND STRCMP(a.Cod_Venditore,T)=0
	AND STRCMP(a.Modello,modello)=0
	AND STRCMP(a.serie,serie)=0
	AND a.Cod_Prod=codice
	AND f.Cod_Mes=a.FeedBack
	AND f.valutazione IS NOT NULL)&& valutazione>=0&&
	valutazione<=10 && 
	EXISTS (SELECT * 
	FROM Auto_X_FeedBack AS a,FeedBack AS f,Riceve_F_Ut AS p,Invia_F_Ve as d 
	WHERE STRCMP(a.Marca,marca)=0
	AND STRCMP(a.Cod_Venditore,T)=0
	AND STRCMP(a.Modello,modello)=0
	AND STRCMP(a.serie,serie)=0
	AND a.Cod_Prod=codice
	AND f.Cod_Mes=a.FeedBack
	AND f.valutazione IS NULL
	AND f.Cod_Mes=p.Cod_FeedBack
	AND p.Codice_Utente=ut
	AND f.Cod_Mes=d.Cod_FeedBack
	AND STRCMP(d.Cod_Venditore,T)=0))THEN
		INSERT INTO FeedBack VALUES(NULL,testo,valutazione);
		SELECT MAX(Cod_Mes) INTO F FROM FeedBack;
		INSERT INTO Invia_F_Ut VALUES(F,ut,d,FALSE,FALSE);
		INSERT INTO Riceve_F_Ve VALUES(F,T,d,FALSE);
		INSERT INTO Auto_X_FeedBack 
		VALUES(F,codice,T,marca,modello,serie);
		SET esito=true;
		SELECT a.Cod_Annuncio INTO M 
		FROM Annunci_Auto AS a,Auto_Ve_X_Ann AS e,Auto_X_Venditori AS w
		WHERE a.Cod_Annuncio=e.Cod_Annuncio
		AND STRCMP(w.Codice_Venditore,e.Codice_Venditore)=0
		AND STRCMP(w.Codice,e.Codice)=0
		AND STRCMP(w.Marca,e.Marca)=0
		AND STRCMP(w.Modello,e.Modello)=0
		AND STRCMP(w.Serie,e.Serie)=0
		AND STRCMP(w.Codice_Venditore,T)=0
		AND STRCMP(w.Codice,codice)=0
		AND STRCMP(w.Marca,marca)=0
		AND STRCMP(w.Modello,modello)=0
		AND STRCMP(w.Serie,serie)=0;
		UPDATE Annunci_Auto SET Cancellato=TRUE
		WHERE Cod_Annuncio=M;
		OPEN o;
		IF (U=2) THEN
			FETCH o INTO somma,NUM;
			IF (U=2)THEN			
				UPDATE Utente_Venditore SET Rating=(somma/NUM) WHERE STRCMP(CF_P_IVA,T)=0;
			END IF;
		END IF;
	END IF;
END;
//
delimiter ;