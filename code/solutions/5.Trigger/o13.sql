delimiter //
CREATE TRIGGER o13
AFTER DELETE ON Topic_F_Ve
FOR EACH ROW
BEGIN
	DELETE FROM Post_F_Ve WHERE Topic=old.Codice;
END;
//
delimiter ;