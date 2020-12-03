delimiter //
CREATE PROCEDURE o21 (IN ut VARCHAR(16),IN topic INT,OUT esito BOOLEAN) 
BEGIN
	SET esito=FALSE;
	IF(EXISTS(SELECT * FROM Topic_Preferiti_Venditori
	WHERE Codice_Venditore=ut AND Codice_Topic=topic))THEN
		SET esito=TRUE;
		DELETE FROM Topic_Preferiti_Venditori WHERE
		Codice_Venditore=ut AND
		Cod_Topic=topic;
	END IF;
END;
//
delimiter ;