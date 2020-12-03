CREATE VIEW V AS (

SELECT r.Codice_Utente,COUNT(*) AS N_Acc
FROM Ricerche_Auto_X_Utenti AS r
GROUP BY r.Codice_Utente);

SELECT r.Codice_Utente
FROM V AS r
WHERE r.N_Acc=(SELECT MAX(N_Acc)
				FROM V);