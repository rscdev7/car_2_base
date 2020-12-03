delimiter //
CREATE PROCEDURE o20 (IN ut INT,IN topic INT,OUT esito BOOLEAN) 
BEGIN
	SET esito=FALSE;
	IF(EXISTS(SELECT * FROM Topic_Preferiti_Utenti
	WHERE Codice_Utente=ut AND Codice_Topic=topic))THEN
		SET esito=TRUE;
		DELETE FROM Topic_Preferiti_Utenti WHERE
		Codice_Utente=ut AND
		Cod_Topic=topic;
	END IF;
END;
//
delimiter ;