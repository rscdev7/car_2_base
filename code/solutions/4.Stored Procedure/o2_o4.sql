delimiter //
CREATE PROCEDURE o2_o4 
(IN ut INT,
IN carb VARCHAR(10),
IN prezzo_min INT,
IN prezzo_max INT,
IN marca VARCHAR(20),
IN modello VARCHAR(20),
IN serie VARCHAR(20),
IN allestimento VARCHAR(20),
IN cambio VARCHAR(20),
IN pot_min INT,
IN pot_max INT,
IN anno_min YEAR,
IN anno_max YEAR,
IN chilometri INT,
IN tipo_v VARCHAR(20),
IN data_ul_rev DATE,
IN tipo_car VARCHAR(15),
IN tagliandi BOOLEAN,
IN colore VARCHAR(18),
IN n_porte INT,
IN prec INT,
IN emi VARCHAR(20),
IN rating FLOAT,
IN regione VARCHAR(14),
IN provincia VARCHAR(14),
IN citta VARCHAR(14))   
BEGIN
	DECLARE X INT DEFAULT 2;
	DECLARE Y INT DEFAULT 7;
	DECLARE Z INT DEFAULT 9;
	DECLARE F INT DEFAULT 2;
	DECLARE c CURSOR FOR (SELECT a.Cod_Annuncio 
						  FROM Annunci_Auto AS a,Auto_Ve_X_Ann AS e,Auto_X_Venditore AS c,Utente_Venditore AS u,Auto AS j 
						  WHERE a.Cod_Annuncio=e.Cod_Annuncio
						  AND e.Codice=c.Codice 
                          AND STRCMP(e.Codice_Venditore,c.Codice_Venditore)=0
                          AND STRCMP(e.Marca,c.Marca)=0
                          AND STRCMP(e.Modello,c.Modello)=0
                          AND STRCMP(e.Serie,c.Serie)=0
                          AND STRCMP(c.Codice_Venditore,u.CF_P_IVA)=0
                          AND a.Cod_Annuncio=e.Cod_Annuncio
						  AND STRCMP(j.Marca,c.Marca)=0 
						  AND STRCMP(j.Modello,c.Modello)=0
						  AND STRCMP(j.Serie,c.Serie)=0
						  AND (carb IS NULL OR ((c.Tipo_Carburante IS NOT NULL) AND (STRCMP (c.Tipo_Carburante,carb)=0)))
						  AND (prezzo_min IS NULL OR (a.prezzo>=prezzo_min))
						  AND (a.prezzo<=prezzo_max)
						  AND (STRCMP(marca,c.Marca)=0)
						  AND (STRCMP(modello,c.Modello)=0)
						  AND (STRCMP(serie,c.Serie)=0)
						  AND (allestimento IS NULL OR (c.Allestimento IS NOT NULL AND STRCMP(c.Allestimento,allestimento)=0))
						  AND (cambio IS NULL OR (c.Tipo_Cambio IS NOT NULL AND STRCMP(c.Tipo_Cambio,cambio)=0))
						  AND (pot_min IS NULL OR (c.Potenza>=pot_min))
						  AND (pot_max IS NULL OR (c.Potenza<=pot_max))
						  AND (anno_min IS NULL OR (c.Anno_Im>=anno_min))
						  AND (anno_max IS NULL OR (c.Anno_Im<=anno_max))
						  AND (chilometri IS NULL OR (c.chilometri<=chilometri))
						  AND (tipo_v IS NULL OR (STRCMP(tipo_v,"Privato")=0 AND c.Cognome IS NOT NULL) OR (STRCMP(tipo_v,"Azienda")=0 AND u.Cognome IS NULL))
						  AND (data_ul_rev IS NULL OR (c.Data_Ul_Rev IS NOT NULL AND c.Data_Ul_Rev<data_ul_rev))
						  AND (tipo_car IS NULL OR (STRCMP(j.Tipo_Carrozzeria,tipo_car)=0))
						  AND (tagliandi IS NULL OR (c.Cert_Tagl=tagliandi))
						  AND (colore IS NULL OR (STRCMP(c.colore,colore)=0))
						  AND (n_porte IS NULL OR (n_porte=c.N_Porte))
						  AND (emi IS NULL OR (c.Cl_Em IS NOT NULL AND STRCMP(emi,c.Cl_Em)=0))
						  AND (rating IS NULL OR (u.Rating>-1 AND u.Rating>=rating))
						  AND (STRCMP (a.Regione,regione)=0)
						  AND (provincia IS NULL OR (STRCMP (a.Provincia,provincia)=0))
						  AND (citta IS NULL OR (STRCMP (a.Citta,citta)=0))
						  );
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET X = 0;
	OPEN c;
	IF (EXISTS(SELECT * FROM Utente WHERE Codice_Utente=ut)) THEN
		INSERT INTO Ricerche_Auto VALUES(NULL,carb,prezzo_min,prezzo_max,marca,modello,serie,allestimento,cambio,pot_min,pot_max,anno_min,anno_max,chilometri,tipo_v,data_ul_rev,tipo_car,tagliandi,colore,n_porte,prec,emi,rating,regione,provincia,citta);
		SELECT MAX(Cod_ricerca) INTO Z FROM Ricerche_Auto;
		INSERT INTO Ricerche_Auto_X_Utenti VALUES (ut,Z,CURDATE(),CURTIME());
		IF (X=2) THEN 
			REPEAT
				FETCH c INTO Y;
				IF (X=2) THEN 
					INSERT INTO Risultati_Ricerca_Auto VALUES (NULL,CURDATE(),CURTIME());
					SELECT MAX(Codice) INTO F FROM Risultati_Ricerca_Auto;
					INSERT INTO Ricerche_Auto_X_Risultati VALUES (Z,F);
					INSERT INTO Risultati_Auto_X_Annunci VALUES(y,F); 
				END IF;
			UNTIL (X=0) END REPEAT;
		END IF;
	END IF;
	CLOSE c;
END;
//
delimiter ;