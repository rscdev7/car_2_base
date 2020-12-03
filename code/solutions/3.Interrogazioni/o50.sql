(SELECT a.Marca,a.Modello.a.Serie,a.Cod_Prod
FROM Utente_Venditore AS u,Riceve_F_Ve AS ve,Feedback AS f,Auto_X_Feedback AS a 
WHERE u.CF_P_IVA=@vend
AND ve.Cod_Venditore=@vend
AND ve.Cod_Feedback=f.Cod_Mes
AND f.Cod_Mes=a.Feedback);

UNION

(SELECT a.Cod_Ricambio,a.Cod_Prod
FROM Utente_Venditore AS u,Riceve_F_Ve AS ve,Feedback AS f,Ricambi_X_Feedback AS a 
WHERE u.CF_P_IVA=@vend
AND ve.Cod_Venditore=@vend
AND ve.Cod_Feedback=f.Cod_Mes
AND f.Cod_Mes=a.Feedback);