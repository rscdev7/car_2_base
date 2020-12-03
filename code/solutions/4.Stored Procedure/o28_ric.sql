delimiter //
CREATE PROCEDURE o28_ric (IN ut VARCHAR(16),IN dest VARCHAR(25),IN testo VARCHAR(1000),IN codice INT,IN prod VARCHAR(18),IN d DATETIME,OUT esito BOOLEAN) 
BEGIN 
	DECLARE Y INT DEFAULT 0;
	DECLARE X INT DEFAULT 0;
	SET esito=FALSE;
	SELECT Codice_Utente INTO Y FROM Utente_Registrato WHERE STRCMP(Email,dest)=0;
	IF(EXISTS(SELECT * FROM Utente_Registrato WHERE STRCMP(Email,dest)=0)
	&& NOT EXISTS(SELECT *
	FROM Ricambi_X_FeedBack AS w,FeedBack AS f
	WHERE f.Cod_Mes=w.FeedBack
	AND w.Cod_Prod=codice
	AND STRCMP(w.Cod_Venditore,ut)=0
	AND STRCMP(w.Cod_Ricambio,prod)=0)&&
	EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP(CF_P_IVA,ut)=0))THEN
		INSERT INTO FeedBack VALUES(NULL,testo,NULL);
		SELECT MAX(Cod_Mes) INTO X FROM FeedBack;
		INSERT INTO Invia_F_Ve VALUES(X,ut,d,FALSE,FALSE);
		INSERT INTO Riceve_F_Ut VALUES(X,Y,d,FALSE);
		INSERT INTO Ricambi_X_FeedBack VALUES(X,codice,ut,prod);
		SET esito=TRUE;
	END IF;
END;
//
delimiter ;