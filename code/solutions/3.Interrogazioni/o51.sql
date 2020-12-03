(SELECT w.Marca,w.Modello,w.Serie
FROM Annunci_Auto AS a,Auto_Ve_X_Ann AS w
WHERE w.Cod_Annuncio=a.Cod_Annuncio 
AND a.Cancellato=FALSE);

UNION

(SELECT w.Cod_ricambio
FROM Annunci_Ricambi AS a,Ric_Ve_X_Ann AS w
WHERE w.Cod_Annuncio=a.Cod_Annuncio 
AND a.Cancellato=FALSE);