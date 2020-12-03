(SELECT v.Codice_Utente AS Mittente,m.Testo
FROM Messaggi_Chat AS m,Riceve_C_Ve AS r,Invia_C_Ut AS v
WHERE m.Cod_Mes=r.Cod_Mes 
AND v.Cod_Mes=m.Cod_Mes
AND v.Letto=FALSE
AND STRCMP(@ven,r.Cod_Venditore)=0)


UNION

(SELECT v.Codice_Utente AS Mittente,m.Testo
FROM FeedBack AS m,Riceve_F_Ve AS r,Invia_F_Ut AS v
WHERE m.Cod_Mes=r.Cod_FeedBack 
AND v.Cod_FeedBack=m.Cod_Mes
AND v.Letto=FALSE
AND STRCMP(@ven,r.Cod_Venditore)=0);