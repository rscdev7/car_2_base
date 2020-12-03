CREATE VIEW V AS(
SELECT r.Cod_Annuncio,COUNT(*) AS N
FROM Risultati_Ricambi_X_Annunci AS r
GROUP BY r.Cod_Annuncio
);

SELECT Cod_Annuncio
FROM V
WHERE N=(SELECT MAX(N) FROM V);
