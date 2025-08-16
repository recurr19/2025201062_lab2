-- Answer to Q2
DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;
DELIMITER ^^
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN subscriber_ID INT)
BEGIN
	SELECT shows.Title as Shows_Watched , watchHist.WatchTime as Watch_Time, sub.SubscriberID as Subscriber_ID
    FROM ShowsDB.Subscribers AS sub, ShowsDB.Shows AS shows , ShowsDB.WatchHistory AS watchHist
    WHERE sub.SubscriberID = subscriber_ID AND sub.SubscriberID = watchHist.SubscriberID AND shows.ShowID = watchHist.ShowID;
END ^^
DELIMITER ;
CALL GetWatchHistoryBySubscriber(1);