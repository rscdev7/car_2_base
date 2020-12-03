delimiter //
CREATE PROCEDURE o11 (IN ut VARCHAR(16),IN descr VARCHAR(150),IN d DATETIME) 
BEGIN 
	IF(EXISTS(SELECT * FROM Utente_Venditore WHERE CF_P_IVA=ut)) THEN
		INSERT INTO Topic_F_Ve VALUES(NULL,descr,ut,d);
	END IF;
END;
//
delimiter ;
