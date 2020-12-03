delimiter //
CREATE TRIGGER o12
AFTER DELETE ON Topic_F_Ut
FOR EACH ROW
BEGIN
	DELETE FROM Post_F_Ut WHERE Topic=old.Codice;
END;
//
delimiter ;