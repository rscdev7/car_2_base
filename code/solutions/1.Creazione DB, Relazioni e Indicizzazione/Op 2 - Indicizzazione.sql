CREATE INDEX p USING HASH ON Utente_Venditore (Email,Password);

CREATE INDEX w USING HASH ON Utente_Registrato (Email,Password);

CREATE INDEX x USING BTREE ON Utente_Venditore (Rating);

CREATE INDEX g USING BTREE ON Annunci_Auto (Prezzo);

CREATE INDEX a USING BTREE ON Annunci_Ricambi (Prezzo);

CREATE INDEX b USING HASH ON Auto_X_Venditori (Marca,Modello,Serie);

CREATE INDEX c USING BTREE ON Auto_X_Venditori (Anno_Im,Chilometri);

CREATE INDEX e USING HASH ON Ricambi_Auto (Tipo);

