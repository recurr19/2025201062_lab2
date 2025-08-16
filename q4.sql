-- Answer Q4
DROP PROCEDURE IF EXISTS SendWatchTimeReport;
DELIMITER ^^
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE subscriber_id INT;
    DECLARE cursor_sub_id CURSOR FOR
        SELECT SubscriberID
        FROM ShowsDB.Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cursor_sub_id;

    read_loop: LOOP
        FETCH cursor_sub_id INTO subscriber_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF EXISTS (
            SELECT *
            FROM ShowsDB.WatchHistory
            WHERE SubscriberID = subscriber_id
        ) THEN
            CALL GetWatchHistoryBySubscriber(subscriber_id);
        END IF;

    END LOOP;

    CLOSE cursor_sub_id;
END ^^
DELIMITER ;
CALL SendWatchTimeReport();