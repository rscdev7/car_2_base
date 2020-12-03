delimiter //
CREATE PROCEDURE o6 (IN vend VARCHAR(16),IN marca VARCHAR(20),IN modello VARCHAR(20),IN serie VARCHAR(20),IN allestimento VARCHAR(20),IN anno_Im YEAR,IN potenza INT,IN cambio VARCHAR(20),IN porte INT,IN carb VARCHAR(20),IN km INT,IN emi VARCHAR(20),IN tagliandi BOOLEAN,IN colore VARCHAR(18),IN data_ul_rev DATE,IN titolo VARCHAR(13),IN descr VARCHAR(150),IN foto VARCHAR(1000),IN d DATE,IN o TIME,IN prezzo INT,IN regione VARCHAR(14),IN provincia VARCHAR(14),IN citta VARCHAR(14))   
BEGIN 
	DECLARE X INT DEFAULT 0;
	DECLARE Y INT DEFAULT 0;
	DECLARE W INT DEFAULT 10;
	DECLARE T INT DEFAULT 10;
	SELECT EXISTS(SELECT * FROM 
		Utente_Venditore 
		WHERE CF_P_IVA=vend) INTO W;
	SELECT EXISTS(SELECT * FROM Auto AS a 
		WHERE (STRCMP(a.Marca,marca)=0 
		AND STRCMP(a.Modello,modello)=0
		AND STRCMP(a.Serie,serie)=0)) INTO T;
	IF (W=1&&T=1) THEN
			INSERT INTO Auto_X_Venditori VALUES(NULL,vend,marca,modello,serie,allestimento,anno_Im,potenza,cambio,porte,carb,km,emi,tagliandi,colore,data_ul_rev);
			INSERT INTO Annunci_Auto VALUES(NULL,titolo,descr,foto,d,o,prezzo,regione,provincia,citta,FALSE);
			SELECT MAX(Codice) INTO X FROM Auto_X_Venditori;
			SELECT MAX(Cod_Annuncio) INTO Y FROM Annunci_Auto;
			INSERT INTO Auto_Ve_X_Ann VALUES(X,vend,marca,modello,serie,Y);
	END IF;
END;
//
delimiter ;