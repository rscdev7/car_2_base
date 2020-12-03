delimiter //
CREATE PROCEDURE o13 (IN ut VARCHAR(16),IN topic INT) 
BEGIN 
	IF (EXISTS(SELECT * FROM Utente_Venditore WHERE Codice_Utente=ut)&&
	EXISTS(SELECT * FROM Topic_F_Ut WHERE Codice=topic AND STRCMP(ut,Autore)=0))THEN
		DELETE FROM Topic_F_Ve WHERE Codice=topic;
	END IF;
END;
//
delimiter ;