delimiter //
CREATE PROCEDURE o19 (IN ut VARCHAR(16),IN topic INT,IN link VARCHAR(300),OUT esito BOOLEAN) 
BEGIN 
	SET esito=false;
	IF(EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP(ut,CF_P_IVA)=0)&&
	   EXISTS(SELECT * FROM Topic_F_Ve WHERE codice=codice))THEN
	  SET esito=TRUE;
	  INSERT INTO Topic_Preferiti_Venditori VALUES(ut,topic,link);
	 END IF;
END;
//
delimiter ;