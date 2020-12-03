delimiter //
CREATE PROCEDURE o3_o5 (
IN ut INT,
IN tipo_pezzo VARCHAR(20),
IN marca VARCHAR(20),
IN modello VARCHAR(20),
IN serie VARCHAR(20),
IN prezzo_min INT,
IN prezzo_max INT,
IN tipo_vend VARCHAR(20),
IN regione VARCHAR(14),
IN provincia VARCHAR(14),
IN citta VARCHAR(14),
IN rating FLOAT 
) 
BEGIN
	DECLARE X INT DEFAULT 2;
	DECLARE Y INT DEFAULT 5;
	DECLARE Z INT DEFAULT 6;
	DECLARE F INT DEFAULT 10;
	DECLARE c CURSOR FOR (SELECT Cod_Annuncio
						  FROM Annunci_Ricambi AS a,Ric_Ve_X_Ann AS w,Ricambi_X_Venditore AS r,Ricambi_Auto AS t,Ricambi_X_Auto AS j,Utente_Venditore AS u
					      WHERE a.Cod_Annuncio=w.Cod_Annuncio
						  AND STRCMP(w.Cod_Ricambio,r.Cod_Ricambio)=0
						  AND STRCMP(w.Codice,r.Codice)=0
						  AND STRCMP(w.Cod_Venditore,r.Cod_Venditore)=0
						  AND STRCMP(w.Cod_Annuncio,a.Cod_Annuncio)=0
						  AND STRCMP(r.Cod_Venditore,u.CF_P_IVA)=0
				          AND STRCMP(r.Cod_Ricambio,t.Cod_Ricambio)=0
						  AND STRCMP (t.Cod_Ricambio,j.Cod_Ricambio)=0
						  AND (STRCMP(tipo_pezzo,t.Tipo)=0)
						  AND (STRCMP(j.Marca,marca)=0)
						  AND (STRCMP(j.Modello,modello)=0)
						  AND (STRCMP(j.serie,serie)=0)
						  AND (prezzo_min IS NULL OR (a.Prezzo>=prezzo_min))
						  AND (a.Prezzo<=prezzo_max)
						  AND (tipo_vend IS NULL OR (STRCMP(tipo_vend,"Privato")=0 AND u.Cognome IS NOT NULL) OR (STRCMP(tipo_vend,"Azienda")=0 AND u.Cognome IS NULL))
						  AND (STRCMP(regione,a.Regione)=0)
						  AND (provincia IS NULL OR (STRCMP(provincia,a.Provincia)=0))
						  AND (citta IS NULL OR (STRCMP (citta,a.citta)=0))
						  AND (rating IS NULL OR (u.Rating>=rating))
						  );
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET X = 0; 
	OPEN c;
	IF (EXISTS(SELECT * FROM Utente WHERE Codice_Utente=ut)) THEN
		INSERT INTO Ricerche_Ricambi_Auto VALUES(NULL,tipo_pezzo,marca,modello,serie,prezzo_min,prezzo_max,tipo_vend,regione,provincia,citta,rating);
		SELECT MAX(Cod_ricerca) INTO Z FROM Ricerche_Ricambi_Auto;
		INSERT INTO Ricerche_Ricambi_X_Utenti VALUES(ut,Z,CURDATE(),CURTIME()); 
		IF (X=2) THEN 
			REPEAT
				FETCH c INTO Y;
				IF (X=2) THEN 
					INSERT INTO Risultati_Ricerca_Ricambi VALUES(NULL,CURDATE(),CURTIME());
					SELECT MAX(Codice) INTO F FROM Risultati_Ricerca_Ricambi;
					INSERT INTO Ricerca_Ricambi_X_Risultati VALUES(F,Z);
					INSERT INTO Risultati_Ricambi_X_Annunci VALUES(y,F);	
				END IF;
			UNTIL (X=0) END REPEAT;
		END IF;
	END IF;
	CLOSE c;
END;
//
delimiter ;