CREATE DATABASE BaoCao16_11_2020;

 USE BaoCao16_11_2020;
 
 CREATE TABLE employee(
	id_employee int PRIMARY KEY,
    name_employee NVARCHAR(255)
 );
 
 CREATE TABLE role(
	id_role int PRIMARY KEY,
    name_role NVARCHAR(255),
    id_employee int,
    FOREIGN KEY(id_employee) REFERENCES employee(id_employee)
 );
 
 INSERT INTO employee VALUES(1,"Đặng Văn Tiến");
INSERT INTO employee VALUES(2,"Nguyễn Thành Đạt");
 INSERT INTO employee VALUES(3,"Ngô Thanh Tâm");
 
 INSERT INTO role VALUES(1,"Dev",1);
 INSERT INTO role VALUES (2,"Tester", 1);
  INSERT INTO role VALUES (3,"OM", 1);
  
  SELECT *
  FROM employee
  LEFT JOIN role
  ON employee.id_employee = role.id_employee;
 
 