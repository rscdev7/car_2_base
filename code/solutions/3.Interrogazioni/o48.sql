(SELECT q.Codice,q.Codice_Venditore,q.Modello,q.Serie,q.Allestimento
FROM Utente_Registrato AS u,Riceve_F_Ut AS f,FeedBack AS p,Auto_X_FeedBack AS a,Auto_X_Venditori AS q
WHERE u.Codice_Utente=@utente 
AND f.Codice_Utente=@utente
AND f.Cod_Feedback=p.Cod_Mes
AND p.Valutazione IS NOT NULL
AND p.Cod_Mes=a.FeedBack
AND STRCMP(q.Codice,a.Cod_Prod)=0
AND STRCMP(q.Codice_Venditore,a.Cod_Venditore)=0
AND STRCMP(q.Marca,a.Marca)=0
AND STRCMP(q.Modello,a.Serie)=0
AND STRCMP(q.Serie,a.Venditore)=0
);

UNION

(SELECT q.Codice,q.Cod_Venditore,q.Cod_Ricambio,q.Descrizione,q.Data_Prod
FROM Utente_Registrato AS u,Riceve_F_Ut AS f,FeedBack AS p,Ricambi_X_FeedBack AS a,Ricambi_X_Venditore AS q
WHERE u.Codice_Utente=@utente 
AND f.Codice_Utente=@utente
AND f.Cod_Feedback=p.Cod_Mes
AND p.Valutazione IS NOT NULL
AND p.Cod_Mes=a.FeedBack
AND STRCMP(q.Codice,a.Cod_Prod)=0
AND STRCMP(q.Cod_Venditore,a.Cod_Venditore)=0
AND STRCMP(q.Cod_Ricambio,a.Cod_Ricambio)=0
);