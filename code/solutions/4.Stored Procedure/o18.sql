delimiter //
CREATE PROCEDURE o18 (IN ut INT,IN topic INT,IN link VARCHAR(300),OUT esito BOOLEAN) 
BEGIN 
	SET esito=false;
	IF(EXISTS(SELECT * FROM Utente_Registrato WHERE Codice_Utente=ut)&&
	   EXISTS(SELECT * FROM Topic_F_Ut WHERE codice=codice))THEN
	  SET esito=TRUE;
	  INSERT INTO Topic_Preferiti_Utenti VALUES(ut,topic,link);
	 END IF;
END;
//
delimiter ;