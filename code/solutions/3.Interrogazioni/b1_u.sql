CREATE VIEW Group_Ut AS 
(SELECT a.Codice_Utente,COUNT(*) AS N_Acc 
FROM Accessi_X_Utenti AS a 
GROUP BY a.Codice_Utente);

SELECT u.Codice_Utente
FROM Group_Ut AS u 
WHERE u.Codice_Utente =(SELECT MAX(N_Acc)
						FROM Group_Ut AS m
						WHERE m.Codice_Utente=u.Codice_Utente);