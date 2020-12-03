CREATE VIEW Group_Ve AS 
(SELECT a.Codice_Venditore,COUNT(*) AS N_Acc 
FROM Accessi_X_Venditori AS a 
GROUP BY a.Codice_Venditore);
						

SELECT u.Codice_Venditore
FROM Group_Ve AS u 
WHERE u.Codice_Utente =(SELECT MAX(N_Acc)
						FROM Group_Ve AS m
						WHERE m.Codice_Venditore=u.Codice_Venditore);