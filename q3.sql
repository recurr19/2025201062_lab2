-- Answer to Q3
ALTER TABLE ShowsDB.Subscribers
MODIFY SubscriberID INT AUTO_INCREMENT;
DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;
DELIMITER ^^
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
	DECLARE existing_count INT;
    SELECT COUNT(*) INTO existing_count
    FROM ShowsDB.Subscribers AS sub
    WHERE sub.SubscriberName = subName;
    
    IF existing_count = 0 THEN
        INSERT INTO ShowsDB.Subscribers (SubscriberName)
        VALUES (subName);
    END IF;
END ^^
DELIMITER ;
CALL AddSubscriberIfNotExists('pranjit gautam');
Select * from ShowsDB.Subscribers;