

Database : Contains 3 interrelated tables:
		Table 1: Shows - Stores information about shows available on the platform.
			 	 Attributes: 
						ShowID (Primary Key, Auto Increment)
						Title
						Genre
						ReleaseYear
						
		Table 2: Subscribers - Stores information about users subscribed to the platform.
				Attributes:
						SubscriberID (Primary Key, Auto Increment)
						SubscriberName
						SubscriptionDate
		Table 3: WatchHistory - Stores the watch history of subscribers (which subscriber watched which show and for how long).
				Attributes:
						HistoryID (Primary Key, Auto Increment)
						ShowID (Foreign Key → Shows.ShowID)
						SubscriberID (Foreign Key → Subscribers.SubscriberID)
						WatchTime

		Keys and Constraints
			Foreign Keys (FK):
						WatchHistory.ShowID → References Shows.ShowID
						WatchHistory.SubscriberID → References Subscribers.SubscriberID
		
		Procedures Implemented:
		
			ListAllSubscribers()- Iterated over all subscribers and displayed their names.

			GetWatchHistoryBySubscriber(sub_id)- Displayed all shows watched by a particular subscriber along with corresponding watch time.

			AddSubscriberIfNotExists(subName)- Inserted new subscribers only if the name did not already exist. Prevented duplicate entries.

			SendWatchTimeReport() - Iterated through all subscribers. For each subscriber with watch history, it invoked GetWatchHistoryBySubscriber() and displayed their report. Subscribers with no history 						were skipped.

			WatchTimeByEachSubscriber()- Used a cursor to loop through all subscribers and invoked GetWatchHistoryBySubscriber() for each. Unlike the previous procedure, this one displayed results for all 						     subscribers (including those with no history).



Steps to Execute the Scripts

			1. Open MySQL environment
			2. Use MySQL Workbench or the MySQL Command Line Client.
			3. Create database and tables
				Run the following commands:
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
						FOREIGN KEY (SubscriberID) REFERENCES Subscribers(SubscriberID)
					);

			4.Insert sample data
			5.Execute the INSERT statements provided in the script to add shows, subscribers, and watch history records.
			6.Create stored procedures
			7.For each procedure (ListAllSubscribers, GetWatchHistoryBySubscriber, AddSubscriberIfNotExists, SendWatchTimeReport, WatchTimeByEachSubscriber):
			8.Copy the code from the script.
			9.Execute it in MySQL.	
			10.Execute stored procedures
				Test the procedures using CALL statements:
					CALL ListAllSubscribers();
					CALL GetWatchHistoryBySubscriber(1);
					CALL AddSubscriberIfNotExists('New User');
					CALL SendWatchTimeReport();
					CALL WatchTimeByEachSubscriber();

			11.Verify results
				Use SELECT * FROM Subscribers; and SELECT * FROM WatchHistory; to confirm that data is correct.
				In MySQL Workbench, multiple result sets from SendWatchTimeReport() and WatchTimeByEachSubscriber() will appear one below the other.



Github Repository Link : https://github.com/recurr19/2025201062_lab2