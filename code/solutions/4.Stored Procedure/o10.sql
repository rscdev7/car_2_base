delimiter //
CREATE PROCEDURE o10 (IN ut INT,IN descr VARCHAR(150),IN d DATETIME) 
BEGIN 
	IF(EXISTS(SELECT * FROM Utente_Registrato WHERE Codice_Utente=ut)) THEN
		INSERT INTO Topic_F_Ut VALUES(NULL,descr,ut,d);
	END IF;
END;
//
delimiter ;