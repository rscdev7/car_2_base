CREATE VIEW V AS(
SELECT r.Codice_Topic,COUNT(*) AS N
FROM Letture_F_Ve AS r
GROUP BY r.Codice_Topic
);

SELECT Codice_Topic
FROM V
WHERE N=(SELECT MAX(N) FROM V);