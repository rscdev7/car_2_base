SELECT *
FROM Accessi AS a,Accessi_X_Utenti AS u
WHERE a.Codice=u.Cod_Acc
AND STRCMP(u.Codice_Utente,@utente)=0;