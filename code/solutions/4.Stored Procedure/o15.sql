delimiter //
CREATE PROCEDURE o15 (IN ut VARCHAR(16),IN topic INT,IN testo VARCHAR(1000),IN d DATETIME) 
BEGIN 
	IF (EXISTS(SELECT * FROM Utente_Venditore WHERE STRCMP(ut,CF_P_IVA)=0)&&
	EXISTS(SELECT * FROM Topic_F_Ve WHERE Codice=topic))THEN
		INSERT INTO Post_F_Ve VALUES(NULL,testo,topic,autore,d);
	END IF;
END;
//
delimiter ;