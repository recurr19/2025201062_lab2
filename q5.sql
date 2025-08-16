-- Answer Q5
DROP PROCEDURE IF EXISTS WatchTimeByEachSubscriber;
DELIMITER ^^
CREATE PROCEDURE WatchTimeByEachSubscriber()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    DECLARE cursor_sub_id CURSOR FOR
		SELECT subs.SubscriberID
        FROM ShowsDB.Subscribers as subs;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cursor_sub_id;
    read_loop:LOOP
		FETCH cursor_sub_id into sub_id;
        IF done THEN
			LEAVE read_loop;
		END IF;
        CALL GetWatchHistoryBySubscriber(sub_id);
    END LOOP;
    CLOSE cursor_sub_id;
END^^
DELIMITER ;
CALL WatchTimeByEachSubscriber();