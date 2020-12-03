delimiter //
CREATE PROCEDURE o17 (IN ut VARCHAR(16),IN codice INT,IN topic INT) 
BEGIN 
	IF(EXISTS(SELECT * FROM Post_F_Ve WHERE Codice=codice AND Topic=topic AND STRCMP(ut,Autore)=0))THEN
		DELETE FROM Post_F_Ve WHERE 
		Codice=codice AND topic=topic 
		AND Autore=ut;
	END IF;
END;
//
delimiter ;