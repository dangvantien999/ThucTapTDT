CREATE DATABASE BaiTap03;
USE BaiTap03;

CREATE TABLE Users(
	UserId INT PRIMARY KEY,
    Banned BOOLEAN,
    Role ENUM('client' ,'driver' )
);

CREATE TABLE Trips(
	Id INT PRIMARY KEY,
    Id_Client INT ,
    Id_Driver INT,
    Id_City INT,
    Status ENUM('completed' , 'cancelled_by_driver','cancelled_by_client'),
    repuest_at DATE,
    FOREIGN KEY(Id_Client) REFERENCES Users(UserId),
    FOREIGN KEY(Id_Driver) REFERENCES Users(UserId)
);
INSERT INTO Users VALUES 
(1 , FALSE,'client'),
(2 , TRUE,'client'),
(3 , FALSE,'client'),
(4 , FALSE,'client'),
(10 , FALSE,'driver'),
(11, FALSE,'driver'),
(12, FALSE,'driver'),
(13 , FALSE,'driver');
INSERT INTO Trips VALUES(1, 1, 10 , 1,'completed','2013-10-01');
INSERT INTO Trips VALUES
(2, 2, 10 , 1,'cancelled_by_driver','2013-10-01'),
(3, 3, 11 , 1,'completed','2013-10-01'),
(4, 4, 12, 6,'cancelled_by_client','2013-10-01'),
(5, 1, 13 , 6,'completed','2013-10-02'),
(6, 2, 10 , 1,'completed','2013-10-02'),
(7, 3, 11 , 1,'completed','2013-10-02'),
(8, 2, 12 , 12,'completed','2013-10-03'),
(9, 3, 10 , 12,'completed','2013-10-03'),
(10,4, 13 , 12,'cancelled_by_driver','2013-10-03');

SELECT t.Repuest_at as Ngay , ROUND(SUM(CASE WHEN t.Status LIKE 'cancelled%' THEN 1 ELSE 0 END)/COUNT(t.Status), 2) as tyle
FROM Trips t 
JOIN Users u 
ON t.Id_Client = u.UserId 
WHERE t.Repuest_at BETWEEN '2013-10-01' AND '2013-10-03' AND u.Banned = 'No'  GROUP BY t.Repuest_at;
