delimiter //
CREATE PROCEDURE o16 (IN ut INT,IN codice INT,IN topic INT) 
BEGIN 
	IF(EXISTS(SELECT * FROM Post_F_Ut WHERE Codice=codice AND Topic=topic AND Autore=ut))THEN
		DELETE FROM Post_F_Ut WHERE 
		Codice=codice AND topic=topic 
		AND Autore=ut;
	END IF;
END;
//
delimiter ;