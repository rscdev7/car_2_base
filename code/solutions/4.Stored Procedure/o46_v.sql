delimiter //
CREATE PROCEDURE o46_v (IN ut INT,IN ol VARCHAR(12),IN np varchar(12),OUT esito BOOLEAN) 
BEGIN 
	SET esito=FALSE;
	IF (EXISTS(SELECT * FROM Utente_Venditore AS u WHERE u.CF_P_IVA=ut AND STRCMP(SHA2(ol,224),u.Password)=0)) THEN
		SET esito=TRUE;
		UPDATE Utente_Venditore AS u SET u.Password=SHA2(np,224) WHERE u.CF_P_IVA=ut; 
	END IF;
END;
//
delimiter ;