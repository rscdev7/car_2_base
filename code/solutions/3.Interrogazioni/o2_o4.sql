SELECT * 
FROM Annunci_Auto AS a,Auto_Ve_X_Ann AS e,Auto_X_Venditore AS c,Utente_Venditore AS u,Auto AS j 
WHERE a.Cod_Annuncio=e.Cod_Annuncio
AND e.Codice=c.Codice 
AND STRCMP(e.Codice_Venditore,c.Codice_Venditore)=0
AND STRCMP(e.Marca,c.Marca)=0
AND STRCMP(e.Modello,c.Modello)=0
AND STRCMP(e.Serie,c.Serie)=0
AND STRCMP(c.Codice_Venditore,u.CF_P_IVA)=0
AND a.Cod_Annuncio=e.Cod_Annuncio
AND STRCMP(j.Marca,c.Marca)=0 
AND STRCMP(j.Modello,c.Modello)=0
AND STRCMP(j.Serie,c.Serie)=0
AND (carb IS NULL OR ((c.Tipo_Carburante IS NOT NULL) AND (STRCMP (c.Tipo_Carburante,carb)=0)))
AND (prezzo_min IS NULL OR (a.prezzo>=prezzo_min))
AND (a.prezzo<=prezzo_max)
AND (STRCMP(marca,c.Marca)=0)
AND (STRCMP(modello,c.Modello)=0)
AND (STRCMP(serie,c.Serie)=0)
AND (allestimento IS NULL OR (c.Allestimento IS NOT NULL AND STRCMP(c.Allestimento,allestimento)=0))
AND (cambio IS NULL OR (c.Tipo_Cambio IS NOT NULL AND STRCMP(c.Tipo_Cambio,cambio)=0))
AND (pot_min IS NULL OR (c.Potenza>=pot_min))
AND (pot_max IS NULL OR (c.Potenza<=pot_max))
AND (anno_min IS NULL OR (c.Anno_Im>=anno_min))
AND (anno_max IS NULL OR (c.Anno_Im<=anno_max))
AND (chilometri IS NULL OR (c.chilometri<=chilometri))
AND (tipo_v IS NULL OR (STRCMP(tipo_v,"Privato")=0 AND c.Cognome IS NOT NULL) OR (STRCMP(tipo_v,"Azienda")=0 AND u.Cognome IS NULL))
AND (data_ul_rev IS NULL OR (c.Data_Ul_Rev IS NOT NULL AND c.Data_Ul_Rev<data_ul_rev))
AND (tipo_car IS NULL OR (STRCMP(j.Tipo_Carrozzeria,tipo_car)=0))
AND (tagliandi IS NULL OR (c.Cert_Tagl=tagliandi))
AND (colore IS NULL OR (STRCMP(c.colore,colore)=0))
AND (n_porte IS NULL OR (n_porte=c.N_Porte))
AND (emi IS NULL OR (c.Cl_Em IS NOT NULL AND STRCMP(emi,c.Cl_Em)=0))
AND (rating IS NULL OR (u.Rating>-1 AND u.Rating>=rating))
AND (STRCMP (a.Regione,regione)=0)
AND (provincia IS NULL OR (STRCMP (a.Provincia,provincia)=0))
AND (citta IS NULL OR (STRCMP (a.Citta,citta)=0));