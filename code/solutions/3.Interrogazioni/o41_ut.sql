(SELECT v.Cod_Venditore AS Mittente,m.Testo
FROM Messaggi_Chat AS m,Riceve_C_Ut AS r,Invia_C_Ve AS v
WHERE m.Cod_Mes=r.Cod_Mes 
AND v.Cod_Mes=m.Cod_Mes
AND v.Letto=FALSE
AND r.Codice_Utente=@utente)


UNION

(SELECT v.Cod_Venditore AS Mittente,m.Testo
FROM FeedBack AS m,Riceve_F_Ut AS r,Invia_F_Ve AS v
WHERE m.Cod_Mes=r.Cod_FeedBack 
AND v.Cod_FeedBack=m.Cod_Mes
AND v.Letto=FALSE
AND r.Codice_Utente=@utente);