SELECT *
FROM Annunci_Ricambi AS a,Ric_Ve_X_Ann AS w,Ricambi_X_Venditore AS r,Ricambi_Auto AS t,Ricambi_X_Auto AS j,Utente_Venditore AS u
WHERE a.Cod_Annuncio=w.Cod_Annuncio
AND STRCMP(w.Cod_Ricambio,r.Cod_Ricambio)=0
AND STRCMP(w.Codice,r.Codice)=0
AND STRCMP(w.Cod_Venditore,r.Cod_Venditore)=0
AND STRCMP(w.Cod_Annuncio,a.Cod_Annuncio)=0
AND STRCMP(r.Cod_Venditore,u.CF_P_IVA)=0
AND STRCMP(r.Cod_Ricambio,t.Cod_Ricambio)=0
AND STRCMP (t.Cod_Ricambio,j.Cod_Ricambio)=0
AND (STRCMP(tipo_pezzo,t.Tipo)=0)
AND (STRCMP(j.Marca,marca)=0)
AND (STRCMP(j.Modello,modello)=0)
AND (STRCMP(j.serie,serie)=0)
AND (prezzo_min IS NULL OR (a.Prezzo>=prezzo_min))
AND (a.Prezzo<=prezzo_max)
AND (tipo_vend IS NULL OR (STRCMP(tipo_vend,"Privato")=0 AND u.Cognome IS NOT NULL) OR (STRCMP(tipo_vend,"Azienda")=0 AND u.Cognome IS NULL))
AND (STRCMP(regione,a.Regione)=0)
AND (provincia IS NULL OR (STRCMP(provincia,a.Provincia)=0))
AND (citta IS NULL OR (STRCMP (citta,a.citta)=0))
AND (rating IS NULL OR (u.Rating>=rating));