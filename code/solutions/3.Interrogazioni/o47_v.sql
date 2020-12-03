SELECT *
FROM Accessi AS a,Accessi_X_Venditori AS v
WHERE a.Codice=v.Cod_Acc
AND STRCMP(v.Codice_Venditore,@venditore)=0;