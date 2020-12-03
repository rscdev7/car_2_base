(SELECT i.Cod_Venditore AS Mittente,m.testo,r.Data_Ora
FROM Messaggi_Chat AS m,Riceve_C_Ut AS r,Invia_C_Ve AS i
WHERE m.Cod_Mes=r.Cod_Mes
AND i.Cod_Mes=m.Cod_Mes
AND STRCMP(i.Cod_Venditore,@vend)=0
AND r.Codice_Utente=@ut
AND r.Cancellato=FALSE)

UNION

(SELECT "IO",m.testo,r.Data_Ora
FROM Messaggi_Chat AS m,Invia_C_Ut AS i,Riceve_C_Ve AS r
WHERE m.Cod_Mes=r.Cod_Mes
AND i.Cod_Mes=m.Cod_Mes
AND STRCMP(r.Cod_Venditore,@vend)=0
AND i.Codice_Utente=@ut
AND i.Cancellato=FALSE);