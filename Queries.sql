-- Create Database
CREATE DATABASE IF NOT EXISTS Online_railway_reservation;
USE Online_railway_reservation;

-- Create Station Table
CREATE TABLE IF NOT EXISTS Station (
    ID INT PRIMARY KEY,
    Station_Name VARCHAR(50),
    Location VARCHAR(50),
    Capacity VARCHAR(50)
);

-- Insert Data into Station Table
INSERT INTO Station (ID, Station_Name, Location)
VALUES  (1, 'station1', 'Cairo'),
        (2, 'station2', 'Damietta'),
        (3, 'station3', 'Mansoura'),
        (4, 'station4', 'Tanta'),
        (5, 'station5', 'Alex');

-- Update & Delete Operations on Station Table
UPDATE Station SET Location = 'Menia' WHERE ID = 1;
DELETE FROM Station WHERE ID = 3;
SELECT * FROM Station;

-- Create Passenger Table
CREATE TABLE IF NOT EXISTS Passenger (
    ID INT PRIMARY KEY,
    Gender VARCHAR(50),
    Address VARCHAR(50),
    Phone_num VARCHAR(50),
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Full_name VARCHAR(100),
    Birth_date DATE
);

-- Insert Data into Passenger Table
INSERT INTO Passenger (ID, Gender, Address, Phone_num, First_name, Last_name, Full_name, Birth_date)
VALUES  (1, 'Female', 'Damietta', '01234567891', 'Nada', 'Ahmad', 'Nada Ahmad', '2000-07-15'),
        (2, 'Male', 'Cairo', '01159353428', 'Ahmed', 'Omar', 'Ahmed Omar', '1997-05-12'),
        (3, 'Male', 'Alex', '01111353428', 'Yasser', 'Khaled', 'Yasser Khaled', '2005-08-22'),
        (4, 'Female', 'Tanta', '01111377728', 'Jana', 'Mohammed', 'Jana Mohammed', '2006-08-22'),
        (5, 'Female', 'Menia', '01175432428', 'Aya', 'Ali', 'Aya Ali', '2007-08-22');

-- Update & Delete Operations on Passenger Table
UPDATE Passenger SET Phone_num = '01645367954' WHERE ID = 1;
DELETE FROM Passenger WHERE ID = 5;
SELECT ID, Gender, Phone_num, Full_name, TIMESTAMPDIFF(YEAR, Birth_date, CURDATE()) AS Age FROM Passenger;

-- Create Trip Table
CREATE TABLE IF NOT EXISTS Trip (
    ID INT PRIMARY KEY,
    Passenger_ID INT,
    Train_Number INT,
    Train_Type VARCHAR(50),
    Arrival_time TIME,
    Leaving_time TIME,
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(ID)
);

-- Insert Data into Trip Table
INSERT INTO Trip (ID, Passenger_ID, Train_Number, Train_Type, Arrival_time, Leaving_time)
VALUES  (1, 1, 101, 'Level 3', '10:00:00', '08:00:00'),
        (3, 3, 103, 'Level 1', '12:00:00', '10:00:00'),
        (4, 2, 101, 'Level 3', '14:00:00', '12:00:00'),
        (5, 1, 103, 'Level 1', '16:00:00', '14:00:00');

-- Update Trip Table
UPDATE Trip SET Train_Type = 'Level 2' WHERE ID = 1;
SELECT ID, Train_Type, TIMEDIFF(Arrival_time, Leaving_time) AS Trip_duration FROM Trip WHERE ID IN (1, 4);

-- Create Includes Table (Relationship Between Trip and Station)
CREATE TABLE IF NOT EXISTS Includes (
    Trip_ID INT,
    Station_ID INT,
    PRIMARY KEY (Trip_ID, Station_ID),
    FOREIGN KEY (Trip_ID) REFERENCES Trip(ID),
    FOREIGN KEY (Station_ID) REFERENCES Station(ID)
);

-- Create Ticket Table
CREATE TABLE IF NOT EXISTS Ticket (
    ID INT PRIMARY KEY,
    Passenger_ID INT,
    Class VARCHAR(50),
    Departure_station VARCHAR(50),
    Arrival_station VARCHAR(50),
    Trip_date TIME,
    Seat_number INT,
    Booking_date TIME,
    Cancellation_date TIME,
    Price DECIMAL(10,2) DEFAULT 100,
    Pay_method VARCHAR(50),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(ID)
);

-- Insert Data into Ticket Table
INSERT INTO Ticket (ID, Passenger_ID, Class, Departure_station, Arrival_station, Trip_date, Seat_number, Booking_date, Cancellation_date, Pay_method)
VALUES  (1, 1, 'Level 2', 'Cairo', 'Alex', '10:00:00', 15, '08:00:00', NULL, 'Credit Card'),
        (2, 2, 'Level 1', 'Damietta', 'Cairo', '12:00:00', 20, '10:00:00', '11:30:00', 'Credit Card'),
        (3, 4, 'Level 3', 'Tanta', 'Mansoura', '14:00:00', 5, '13:00:00', NULL, 'Online Payment');

-- Update & Delete Operations on Ticket Table
UPDATE Ticket SET Price = 200 WHERE Class = 'Level 2';
UPDATE Ticket SET Price = 300 WHERE Class = 'Level 1';
UPDATE Ticket SET Seat_number = 5 WHERE ID = 2;
DELETE FROM Ticket WHERE ID = 2;
SELECT * FROM Ticket;

-- Uncomment the following line if you want to drop the database
-- DROP DATABASE Online_railway_reservation;
