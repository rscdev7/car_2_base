delimiter //
CREATE PROCEDURE o14 (IN ut INT,IN topic INT,IN testo VARCHAR(1000),IN d DATETIME) 
BEGIN 
	IF (EXISTS(SELECT * FROM Utente_Registrato WHERE Codice_Utente=ut)&&
	EXISTS(SELECT * FROM Topic_F_Ut WHERE Codice=topic))THEN
		INSERT INTO Post_F_Ut VALUES(NULL,testo,topic,autore,d);
	END IF;
END;
//
delimiter ;