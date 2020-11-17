CREATE DATABASE BaiTap1_2;
USE BaiTap1_2;
CREATE TABLE Department(
	Id_Department INT PRIMARY KEY,
    Name VARCHAR(200)
);
CREATE TABLE Employee(
	Id_Employee INT PRIMARY KEY,
    Name VARCHAR(200),
    Salary DECIMAL,
    Id_Department int,
    FOREIGN KEY(Id_Department) REFERENCES Department(Id_Department)
);
INSERT INTO Department VALUES(1, "IT");
INSERT INTO Department VALUES(2, "Sale");
INSERT INTO Employee VALUES
(1, "Joe",70000,1),
(2, "Jim",90000,1),
(3, "Henry",80000,2),
(4, "Sam",60000,2),
(5, "Max",90000,1);

-- Lấy Viết một truy vấn SQL để nhận mức lương cao thứ hai từ bảng Employee.--

SELECT DISTINCT Id_Employee,  Salary As LuongTop2
FROM Employee
ORDER BY Salary DESC
LIMIT 2,1;

-- truy vấn SQL để tìm nhân viên có mức lương cao nhất trong mỗi bộ phận --
-- Cách 1 --
SELECT Department.Name, Employee.Name, Employee.Salary
 FROM Employee 
 JOIN Department
 ON Department.Id_Department = Employee.Id_Department
 ORDER BY Salary DESC LIMIT 0,3;
 
 -- Cách 2 --
 SELECT d.Name as Department , e.Name as Employee, e.Salary
 FROM Employee e
 JOIN Department d
 ON d.Id_Department = e.Id_Department
 AND e.Salary = (SELECT MAX(Salary) FROM Employee as e2 WHERE e2.Id_Department = e.Id_Department)
