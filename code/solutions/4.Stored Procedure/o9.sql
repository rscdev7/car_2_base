delimiter //
CREATE PROCEDURE o9 (IN topic INT,IN ut INT,IN d DATETIME) 
BEGIN 
	IF (EXISTS(SELECT * FROM Utenti WHERE Codice_Utente=ut)&&
	EXISTS(SELECT * FROM Topic_F_Ve WHERE Codice=topic))THEN
		INSERT INTO Letture_F_Ve VALUES(ut,topic,d);
	END IF;
END;
//
delimiter ;