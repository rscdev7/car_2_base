delimiter //
CREATE PROCEDURE o12 (IN ut INT,IN topic INT) 
BEGIN 
	IF (EXISTS(SELECT * FROM Utente_Registrato WHERE Codice_Utente=ut)&&
	EXISTS(SELECT * FROM Topic_F_Ut WHERE Codice=topic AND Autore=ut))THEN
		DELETE FROM Topic_F_Ut WHERE Codice=topic;
	END IF;
END;
//
delimiter ;