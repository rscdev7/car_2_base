(SELECT i.Codice_Utente AS Mittente,m.testo,r.Data_Ora
FROM FeedBack AS m,Riceve_F_Ve AS r,Invia_F_Ut AS i
WHERE m.Cod_Mes=r.Cod_FeedBack
AND i.Cod_FeedBack=m.Cod_Mes
AND STRCMP(r.Cod_Venditore,@vend)=0
AND i.Codice_Utente=@ut
AND r.Cancellato=FALSE)

UNION

(SELECT "IO",m.testo,r.Data_Ora
FROM FeedBack AS m,Invia_F_Ve AS i,Riceve_F_Ut AS r
WHERE m.Cod_Mes=r.Cod_FeedBack
AND i.Cod_FeedBack=m.Cod_Mes
AND STRCMP(i.Cod_Venditore,@vend)=0
AND r.Codice_Utente=@ut
AND i.Cancellato=FALSE);