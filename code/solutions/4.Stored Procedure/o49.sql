delimiter //
CREATE PROCEDURE o49 (IN ut INT) 
BEGIN
	DECLARE t VARCHAR(16) DEFAULT "";
	IF (EXISTS(SELECT * FROM Utente AS u WHERE u.Codice_Utente=ut))THEN
		IF(EXISTS(SELECT * FROM Utente_Registrato AS u WHERE u.Codice_Utente=ut))THEN
			DELETE FROM Utente WHERE Codice_Utente=ut;
			DELETE FROM Utente_Registrato WHERE Codice_Utente=ut;
		END IF;
		IF(EXISTS(SELECT * FROM Utenti_X_Venditori AS u WHERE u.Codice_Utente=ut))THEN
			SELECT CF_P_IVA INTO t FROM Utenti_X_Venditori AS u WHERE u.Codice_Utente=ut; 
			DELETE FROM Utenti_X_Venditori WHERE Codice_Utente=ut;
			DELETE FROM Utente WHERE Codice_Utente=ut;
			DELETE FROM Utente_Venditore WHERE CF_P_IVA=t;
		END IF;
	END IF;
END;
//
delimiter ;