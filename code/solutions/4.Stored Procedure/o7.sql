delimiter //
CREATE PROCEDURE o7 (IN vend VARCHAR(16),IN ric VARCHAR(18),IN descr VARCHAR(150),IN d DATE,IN titolo VARCHAR(13),IN de VARCHAR(150),IN foto VARCHAR(1000),IN dat DATE,IN ora TIME,IN prezzo INT,IN regione VARCHAR(14),IN provincia VARCHAR(14),IN citta VARCHAR(14)) 
BEGIN 
	DECLARE X INT DEFAULT 0;
	DECLARE Y INT DEFAULT 0;
	IF (EXISTS(SELECT * 
		 FROM Utente_Venditore
		 WHERE CF_P_IVA=vend))THEN
		IF (EXISTS(SELECT * 
			 FROM Ricambi_Auto
			 WHERE Cod_Ricambio=ric
			))THEN
		INSERT INTO Ricambi_X_Venditore VALUES (NULL,vend,ric,descr,d);
		SELECT MAX(Codice) INTO X FROM Ricambi_X_Venditore;
		INSERT INTO Annunci_Ricambi VALUES (NULL,titolo,de,foto,dat,ora,prezzo,regione,provincia,citta,FALSE);
		SELECT MAX(Cod_Annuncio) INTO Y FROM Annunci_Ricambi;
		INSERT INTO Ric_Ve_X_Ann VALUES(X,vend,ric,Y);
	   END IF;
	   END IF;
END;
//
delimiter ;