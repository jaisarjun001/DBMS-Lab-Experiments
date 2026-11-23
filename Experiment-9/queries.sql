
-- Experiment 9: Railway Booking and SQL Query Optimization

-- Create Railway Booking Table
CREATE TABLE RailwayBooking (
    BookingID INT PRIMARY KEY,
    PassengerName VARCHAR(50),
    TrainID INT,
    JourneyDate DATE,
    SeatNo INT,
    Status VARCHAR(20)
);

-- Insert 5000 Records
DELIMITER //

CREATE PROCEDURE InsertBookings()
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 5000 DO
        INSERT INTO RailwayBooking
        VALUES (
            i,
            CONCAT('Passenger', i),
            100 + (i % 20),
            DATE_ADD('2026-01-01',
                INTERVAL (i % 365) DAY),
            i % 100 + 1,
            IF(i % 2 = 0, 'Confirmed', 'Waiting')
        );

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL InsertBookings();

-- Verify Total Records
SELECT COUNT(*) FROM RailwayBooking;

-- 1. Query Before Indexing
EXPLAIN
SELECT * FROM RailwayBooking
WHERE TrainID = 105;

SELECT * FROM RailwayBooking
WHERE TrainID = 105;

-- 2. Create Single Index
CREATE INDEX idx_train
ON RailwayBooking(TrainID);

-- Query After Single Index
EXPLAIN
SELECT * FROM RailwayBooking
WHERE TrainID = 105;

SELECT * FROM RailwayBooking
WHERE TrainID = 105;

-- 3. Create Composite Index
CREATE INDEX idx_train_date
ON RailwayBooking(TrainID, JourneyDate);

-- Query After Composite Index
EXPLAIN
SELECT * FROM RailwayBooking
WHERE TrainID = 105
AND JourneyDate = '2026-01-06';

SELECT * FROM RailwayBooking
WHERE TrainID = 105
AND JourneyDate = '2026-01-06';

-- 4. Display Indexes
SHOW INDEX FROM RailwayBooking;

-- 5. Check Query Execution Plan
EXPLAIN
SELECT * FROM RailwayBooking
WHERE TrainID = 105
AND JourneyDate = '2026-01-06';
