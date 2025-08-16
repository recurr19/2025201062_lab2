CREATE DATABASE IF NOT EXISTS ShowsDB; 
USE ShowsDB;
CREATE TABLE Shows (
ShowID INT AUTO_INCREMENT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT
);
CREATE TABLE Subscribers (
SubscriberID INT AUTO_INCREMENT PRIMARY KEY,
SubscriberName VARCHAR(100),
SubscriptionDate DATE
);
CREATE TABLE WatchHistory (
HistoryID INT AUTO_INCREMENT PRIMARY KEY,
ShowID INT,
SubscriberID INT,
WatchTime INT,
FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
FOREIGN KEY (SubscriberID) REFERENCES
Subscribers(SubscriberID)
);
-- Insert Sample Data
INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
(1,'Stranger Things','Sci-Fi', 2016),
(2,'The Crown','Drama', 2016),
(3,'The Witcher','Fantasy', 2019);

INSERT INTO Subscribers (SubscriberID, SubscriberName,
SubscriptionDate) VALUES
(1,'Emily Clark','2023-01-10'),
(2,'Chris Adams','2023-02-15'),
(3,'Jordan Smith','2023-03-05');

INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID,
WatchTime) VALUES
(1, 1, 1, 100),
(2, 1, 2, 10),
(3, 2, 1, 20),
(4, 2, 2, 40),
(5, 2, 3, 10),
(6, 3, 2, 10),
(7, 3, 1, 10);

-- Answer to Q1
DROP PROCEDURE IF EXISTS ListAllSubscribers;
DELIMITER ^^
CREATE PROCEDURE ListAllSubscribers()
BEGIN
	DECLARE done INT DEFAULT false;
    DECLARE subscriber_name VARCHAR(100);
    DECLARE cursor_sub_name CURSOR FOR
		-- cursors are pointers that holds the memory address of every tuple from the set and lets to process each tuple individually
		SELECT s.SubscriberName FROM ShowsDB.Subscribers AS s;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    OPEN cursor_sub_name;
    read_loop: LOOP
        FETCH cursor_sub_name INTO subscriber_name;
		IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT subscriber_name;
    END LOOP;
END ^^

DELIMITER ;

CALL ListAllSubscribers();