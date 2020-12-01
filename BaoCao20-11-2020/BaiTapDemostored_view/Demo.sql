
 --DROP TABLE public.employee;

CREATE TABLE public.employee (
	employeeid varchar NOT NULL,
	employeelastname varchar NOT NULL,
	employeefirstname varchar NOT NULL,
	employeehiredate date ,
	employeestatus varchar NOT NULL,
	supervisorid varchar NOT NULL,
	sociasecuritynumber varchar NOT NULL,
	CONSTRAINT employee_pk PRIMARY KEY (employeeid)
);


--DROP TABLE public.projects;

CREATE TABLE public.projects (
	projectid varchar NOT NULL,
	projectname varchar NOT NULL,
	projectstartdate date ,
	projectdescription varchar NOT NULL,
	projectdetailt varchar NOT NULL,
	projectcompletedon date ,
	managerid varchar REFERENCES employee(employeeid),
	CONSTRAINT projects_pk PRIMARY KEY (projectid)
);
--DROP TABLE public.project_modules;
CREATE TABLE public.project_modules (
	moduleID varchar NOT NULL,
	projectid varchar REFERENCES projects(projectid),
	employeeid varchar REFERENCES employee(employeeid),
	projectModulesDate date ,
	projectModulescompletedon date,
	projectmodulesdescription varchar NOT NULL,
	CONSTRAINT project_modules_pk PRIMARY KEY (moduleID)
);

--DROP TABLE public.work_done;
CREATE TABLE public.work_done (
	workdoneID varchar NOT NULL,
	moduleID varchar REFERENCES project_modules(moduleID) ,
	employeeid varchar REFERENCES employee(employeeid),
	workdoneDate date ,
	workdonedescription varchar NOT NULL,
	workdoneStatus varchar NOT NULL,
	CONSTRAINT work_done_pk PRIMARY KEY (workdoneID)
);

--Insert Employee
insert into "public".employee values
('NV001', 'Tiến' , 'Đặng Văn', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596'),
('NV002', 'Trường' , 'Bùi Tuấn', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596'),
('NV003', 'Hiêu' , 'Hứa Minh', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596'),
('NV004', 'Thế' , 'Bùi Như', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596'),
('NV005', 'Long' , 'Nguyễn Xuân', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596'),
('NV006', 'Huỳnh' , 'Cao Bá', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596'),
('NV007', 'Hải' , 'Nguyễn Quang', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596'),
('NV008', 'Hùng' , 'Nguyễn Huy', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596'),
('NV009', 'Trọng' , 'Nguyễn Đình', '2020/03/01', 'Đi Làm' , 'GS001', '001099001596');

--Insert projects
insert into "public".projects values 
('PJ001','Sàn Giao Dịch FSX', '2020/08/10', 'Mô Tả' ,'Chi Tiết project','2020/12/12','NV001'),
('PJ002','Sàn Giao Dịch Japan', '2020/08/10', 'Mô Tả' ,'Chi Tiết project','2020/12/12','NV003'),
('PJ003','S?n Ch?ng Kho?n', '2020/08/10', 'Mô Tả' ,'Chi Tiết project','2020/12/12','NV002'),
('PJ004','Sàn Giao Dịch TeckComBank', '2019/10/01', 'Mô Tả' ,'Chi Tiết project','2020/01/01','NV004'),
('PJ005','Sàn Giao Dịch Canifolia', '2019/10/01', 'Mô Tả' ,'Chi Tiết project','2020/01/01','NV005'),
('PJ006','Sàn Giao Dịch Canada', '2020/08/10', 'Mô Tả' ,'Chi Tiết project','2020/12/12','NV006');

--Insert projects project_modules
insert into "public".project_modules values 
('MD011','PJ006','NV006','2020/08/09',null,'Mô tả modules'),
('MD010','PJ001','NV005','2020/08/09',null,'Mô tả modules'),
('MD001','PJ001','NV005','2020/08/09','2020/09/11','Mô tả modules'),
('MD002','PJ001','NV005','2020/08/09','2020/09/11','Mô tả modules'),
('MD003','PJ002','NV005','2020/08/09','2020/09/11','Mô tả modules'),
('MD004','PJ002','NV005','2020/08/09','2020/09/11','Mô tả modules'),
('MD005','PJ003','NV005','2020/08/09','2020/09/11','Mô tả modules'),
('MD006','PJ003','NV005','2020/08/09','2020/09/11','Mô tả modules'),
('MD007','PJ004','NV005','2020/01/09','2020/01/11','Mô tả modules'),
('MD008','PJ005','NV005','2020/01/09','2020/01/11','Mô tả modules'),
('MD009','PJ006','NV005','2020/08/09','2020/09/11','Mô tả modules');

--Insert projects work_done
insert into "public".work_done values 
('WD001', 'MD001','NV001','2020/09/08','Bao Cao','Hoàn Thành'),
('WD002', 'MD002','NV002','2020/09/08','Bao Cao','Hoàn Thành'),
('WD003', 'MD003','NV003','2020/09/08','Bao Cao','Hoàn Thành'),
('WD004', 'MD004','NV004','2020/09/08','Bao Cao','Hoàn Thành'),
('WD005', 'MD005','NV005','2020/09/08','Bao Cao','Hoàn Thành'),
('WD006', 'MD006','NV006','2020/09/08','Bao Cao','Hoàn Thành'),
('WD007', 'MD007','NV007','2020/09/08','Bao Cao','Hoàn Thành'),
('WD008', 'MD008','NV008','2020/09/08','Bao Cao','Hoàn Thành'),
('WD009', 'MD009','NV009','2020/09/08','Bao Cao','Hoàn Thành');

/* Viết stored procedure (không parameter) để Remove tất cả thông  tin
project đã hoàn thành sau 3 tháng kể tính từ ngày hiện tại. */
create or replace
function public.Remove() returns setof "projects" as $$ begin
delete
from
	projects
where
	(date_part('year', now()) - date_part('year', projectstartdate))* 12 + (date_part('month', now()) - date_part('month', projectstartdate)) > 3;
	
end;

$$ language plpgsql;

select public.Remove();
select * from projects;

--Viết stored procedure (có parameter) để in ra các module đang được thực
--hiện
create or replace function public.HienThi(idProject varchar)
returns setof "project_modules" 
as $$ 
begin
	return query select *
	from project_modules 
	where projectModulescompletedon is null
	and projectid = idProject ;
end;	
$$ language plpgsql;

select * from public.HienThi('PJ001');

-- Tạo view lấy ra các project và tên nhân viên phụ trách project đó

CREATE VIEW projects_employee AS
SELECT p2.projectid , p2.projectname ,e2.employeeid ,e2.employeefirstname , e2.employeelastname 
FROM projects p2 
inner join employee e2 
on p2.managerid  = e2.employeeid 

select * from projects_employee;
