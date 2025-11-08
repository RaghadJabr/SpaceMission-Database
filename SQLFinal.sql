CREATE DATABASE SpaceMission;

CREATE TABLE Astronaut(
AstroID INT PRIMARY KEY,
AstroFname VARCHAR(10) NOT NULL,
AstroLname VARCHAR(10) NOT NULL,
Gender CHAR(1) NOT NULL,
Degree VARCHAR(10) NOT NULL,
Age INT NOT NULL,
AgencyID INT,
FOREIGN KEY (AgencyID) REFERENCES Agency(AgencyID)ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Agency(
AgencyID INT PRIMARY KEY,
AgencyName VARCHAR(20) NOT NULL,
Country VARCHAR(10) DEFAULT'USA',
City VARCHAR(10) NOT NULL,
StreetName VARCHAR(10) NOT NULL,
BuildingNumber INT NOT NULL,
Capacity INT NOT NULL,
PhoneNumber INT NOT NULL,
);

CREATE TABLE PreviousMissions(
MissionID INT PRIMARY KEY,
MissionDate DATE NOT NULL,
MissionName VARCHAR(10) NOT NULL,
Planet VARCHAR(10) NOT NULL,
Xcoordinate DECIMAL(8,4) NOT NULL,
Ycoordinate DECIMAL(8,4) NOT NULL,
AstroID INT,
FOREIGN KEY (AstroID) REFERENCES Astronaut(AstroID)ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Voter(
VoterID INT PRIMARY KEY,
VoterFname VARCHAR(10) NOT NULL,
VoterLname VARCHAR(10) NOT NULL,
Proficiency VARCHAR(20) NOT NULL,
Gender VARCHAR(2) NOT NULL,
PhoneNumber INT NOT NULL,
Email VARCHAR(25) NOT NULL UNIQUE,
Age INT NOT NULL,
AgencyID INT,
FOREIGN KEY (AgencyID) REFERENCES Agency(AgencyID)ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Astronaut_PhoneNumber(
PhoneNumber INT,
AstroID INT,
FOREIGN KEY (AstroID) REFERENCES Astronaut(AstroID)ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (PhoneNumber, AstroID),
);

CREATE TABLE Selected(
VoterID INT,
FOREIGN KEY (VoterID) REFERENCES Voter(VoterID)ON DELETE NO ACTION ON UPDATE NO ACTION,
AstroID INT,
FOREIGN KEY (AstroID) REFERENCES Astronaut(AstroID) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (VoterID, AstroID),
);

CREATE TABLE AgencyPreMissions(
AgencyID INT,
MissionID INT,
MissionDescription VARCHAR(55),
FOREIGN KEY (AgencyID) REFERENCES Agency(AgencyID)ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (MissionID) REFERENCES PreviousMissions(MissionID)ON DELETE NO ACTION ON UPDATE NO ACTION,
PRIMARY KEY (MissionID, AgencyID),
);

SELECT * FROM PreviousMissions;
SELECT * FROM Astronaut_PhoneNumber;
SELECT * FROM Astronaut;
SELECT * FROM Voter;
SELECT * FROM Selected;
SELECT * FROM Astro_experience;
SELECT * FROM Agency_Mission_Data;

INSERT INTO Voter (VoterID, VoterFname, VoterLname, Proficiency, Gender, PhoneNumber, Email, Age, AgencyID) VALUES
(21, 'Ali', 'Seth', 'Computer Science', 'F', 123456, 'ali.seth@.com', 30, 1),
(22, 'Bob', 'thebuilder', 'AI', 'M', 23456789, 'ali.seth@.com', 45, 2);

INSERT INTO Agency (AgencyID, AgencyName, Country, City, StreetName, BuildingNumber, Capacity, PhoneNumber) VALUES 
(1, 'NASA', 'USA', 'Houston', 'Space', 100, 5000, '1234567890'),
(2, 'ROSCOSMOS', 'RUSSIA', 'Mosscow', 'Galileo', 200, 3000, '0987654321');

INSERT INTO PreviousMissions (MissionID, MissionDate, MissionName, Planet, Xcoordinate, Ycoordinate) VALUES (1, '2022-01-15', 'Apollo', 'Mars', 5.3, 7.9);
INSERT INTO PreviousMissions (MissionID, MissionDate, MissionName, Planet, Xcoordinate, Ycoordinate) VALUES (2, '2023-03-20', 'Viking', 'Venus', 12.34, 56.78);
INSERT INTO PreviousMissions (MissionID, MissionDate, MissionName, Planet, Xcoordinate, Ycoordinate) VALUES (3, '2021-11-10', 'Voyager', 'Jupiter', 23.45, 78.90);
INSERT INTO PreviousMissions (MissionID, MissionDate, MissionName, Planet, Xcoordinate, Ycoordinate) VALUES (4, '2020-06-05', 'Pioneer', 'Saturn', 34.56, 89.01);
INSERT INTO PreviousMissions (MissionID, MissionDate, MissionName, Planet, Xcoordinate, Ycoordinate) VALUES (5, '2024-08-21', 'Galileo', 'Neptune', 90.12, 12.34);
UPDATE PreviousMissions SET AstroID = 9 WHERE MissionID = 1;
UPDATE PreviousMissions SET AstroID = 3 WHERE MissionID = 2;
UPDATE PreviousMissions SET AstroID = 10 WHERE MissionID = 3;
UPDATE PreviousMissions SET AstroID = 5 WHERE MissionID = 4;
UPDATE PreviousMissions SET AstroID = 11 WHERE MissionID = 5;

INSERT INTO Voter (VoterID, VoterFname, VoterLname, Proficiency, Gender, PhoneNumber, Email, Age, AgencyID) VALUES
(1, 'Alice', 'Smith', 'Computer Science', 'F', 123456, 'alice.smith@.com', 30, 1),
(2, 'Bob', 'Johnson', 'Electric Engineer', 'M', 23456789, 'bob.johnson@.com', 45, 2),
(3, 'Layla', 'Hassan', 'Engineer', 'F', 34567890, 'layla.hassan@.com', 27, 1),
(4, 'David', 'Brown', 'Physics', 'M', 45678901, 'david.brown@.com', 35, 2),
(5, 'Eve', 'Jones', 'Mathematics', 'F', 56701234, 'eve.jones@.com', 29, 2),
(6, 'Omar', 'Ali', 'Civil ', 'M', 67890125, 'omar.ali@.com', 40, 2),
(7, 'Grace', 'Martinez', 'Chemistry', 'F', 90123456, 'grace.martinez@.com', 32, 1),
(8, 'Hank', 'Hernandez', 'Biology', 'M', 01234567, 'hank.hernandez@.com', 50, 2),
(9, 'Zainab', 'Khan', 'Environment Scie', 'F', 90145678, 'zainab.khan@.com', 28, 1),
(10, 'Jack', 'Moore', 'Data Science', 'M', 12345801, 'jack.moore@.com', 41, 1),
(11, 'Karen', 'Taylor', 'Eng Physics', 'F', 23678912, 'karen.taylor@.com', 34, 2),
(12, 'Youssef', 'Mohamed', 'Aerospace Engineer', 'M', 56789023, 'youssef.mohamed@.com', 38, 1),
(13, 'Mona', 'El-Sayed', 'Statistics', 'F', 45678901, 'mona.el-sayed@.com', 26, 1),
(14, 'Nina', 'Jackson', 'Computer Engineer', 'F', 78901245, 'nina.jackson@.com', 48, 2),
(15, 'Samir', 'Zayed', 'Math Physics', 'M', 67892356, 'samir.zayed.com', 31, 1),
(16, 'Paul', 'Harris', ' Engineer', 'M', 78901467, 'paul.harris.com', 36, 2),
(17, 'Quinn', 'Martin', 'Bioinformatics', 'F', 89034578, 'quinn.martin@.com', 25, 2),
(18, 'Rita', 'Thompson', 'Geology', 'F', 90123459, 'rita.thompson@.com', 43, 1),
(19, 'Steve', 'Garcia', 'Software', 'M', 12367892, 'steve.garcia@e.com', 29, 2);

INSERT INTO Astronaut (AstroID, AstroFname, AstroLname, Gender, Degree, Age, AgencyID) VALUES 
(1, 'Jhon', 'Mark', 'M', 'phD', 34, 1),
(2, 'Jacob', 'elo', 'M', 'Ms', 21, 2),
(3, 'Emily', 'Clark', 'F', 'BSc', 29, 1),
(4, 'Sarah', 'Jones', 'F', 'MSc', 32, 2),
(5, 'Michael', 'Smith', 'M', 'phD', 36, 2),
(6, 'Olivia', 'Taylor', 'F', 'MSc', 27, 1),
(7, 'David', 'Wilson', 'M', 'BSc', 30, 2),
(8, 'Sophia', 'Brown', 'F', 'MEng', 28, 1),
(9, 'Daniel', 'White', 'M', 'phD', 40, 2),
(10, 'Ava', 'Green', 'F', 'MSc', 35, 1),
(11, 'James', 'Hall', 'M', 'BEng', 33, 1),
(12, 'Mia', 'Adams', 'F', 'MSc', 26, 2); 

INSERT INTO Astronaut (AstroID, AstroFname, AstroLname, Gender, Degree, Age, AgencyID) VALUES 
( NULL ,'Ahmad', 'Jabr', 'M', 'phD', 40, 1);

INSERT INTO Astronaut_PhoneNumber (PhoneNumber, AstroID) VALUES 
('1234567891', 1),
('1234567892', 2),
('1234567893', 3),
('1234567894', 4),
('1234567895', 5),
('1234567896', 6),
('1234567897', 7),
('1234567898', 8),
('1234567899', 9),
('1234567800', 10),
('1234567801', 11),
('1234567802', 12),
('1234561111', 1),
('1234562222', 2),
('1234563333', 3),
('1234564444', 4);


INSERT INTO Selected (VoterID, AstroID) VALUES 
(1, 3),  
(2, 6),  
(3, 8),  
(4, 9),  
(5, 7),  
(6, 1),  
(7, 10), 
(8, 2),  
(9, 4),  
(10, 11), 
(11, 12), 
(12, 6),  
(13, 8), 
(6, 3),  
(7, 11), 
(8, 12),  
(9, 6),  
(10, 1), 
(11, 14), 
(12, 7),  
(13, 2); 

INSERT INTO AgencyPreMissions (AgencyID, MissionID, MissionDescription) VALUES
(2, 1, 'First mission to Mars'),
(2, 2, 'Exploration of Venus'),
(1, 3, 'Jupiter probe mission'),
(1, 5, 'Neptune deep space study');

CREATE VIEW Astro_experience AS 
SELECT 
m.MissionName, am.MissionDescription, ag.AgencyName, a.AstroFname, a.AstroLname
FROM Astronaut a
JOIN PreviousMissions m ON a.AstroID = m.AstroID
JOIN AgencyPreMissions am ON m.MissionID = am.MissionID
JOIN Agency ag ON am.AgencyID = ag.AgencyID;

CREATE VIEW Agency_Mission_Data AS SELECT 
ag.AgencyName, 
COUNT(am.MissionID) AS TotalMissions, 
AVG(a.Age) AS AverageAstronautAge
FROM Agency ag
JOIN Astronaut a ON ag.AgencyID = a.AgencyID
JOIN PreviousMissions am ON a.AstroID = am.AstroID
GROUP BY ag.AgencyName;

CREATE PROCEDURE HireAstronaut
@AstroID INT,
@AstroFname VARCHAR(10),
@AstroLname VARCHAR(10),
@Gender CHAR(2),
@Degree VARCHAR(10),
@Age INT,
@AgencyID INT
AS
INSERT INTO Astronaut VALUES (@AstroID, @AstroFname, @AstroLname, @Gender, @Degree, @Age, @AgencyID);
SELECT * FROM Astronaut;
GO
EXEC HireAstronaut @AstroID = 1, @AstroFname = 'Raghad', @AstroLname = 'Jabr', @Gender = 'F', @Degree = 'AI', @Age = 19, @AgencyID = 1

CREATE PROCEDURE EditingMissionDescription
@MissionID INT,
@MissionDescription VARCHAR(55)
AS 
UPDATE AgencyPreMissions 
SET MissionDescription = @MissionDescription
WHERE MissionID = @MissionID;
SELECT
ag.AgencyName,
m.MissionName,
am.MissionDescription
FROM 
AgencyPreMissions am
JOIN Agency ag ON am.AgencyID = ag.AgencyID
JOIN PreviousMissions m ON am.MissionID = m.MissionID
GO
EXEC EditingMissionDescription @MissionID = 1, @MissionDescription = 'New data for the Relativity theory';
