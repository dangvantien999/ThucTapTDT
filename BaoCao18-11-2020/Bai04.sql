-- Tạo index Btre cho User01--
CREATE INDEX Btree ON "public".user01 (age2);
-- Tạo index Hash cho User02--
CREATE INDEX Hash ON "public".user02 using hash (age2);
--Insert Bảng user01--
do $$
declare x int;
begin
for i in 1..1000000 loop
	x = floor(random()* (100-1 + 1) + 1);
	INSERT INTO "public".user01(id_user01,emal,age1,age2) VALUES (i,i,x,x);
end loop;
end;
$$
--Insert Bảng user02--
do $$
declare x int;
begin
for i in 1..1000000 loop
	x = floor(random()* (100-1 + 1) + 1);
	INSERT INTO "public".user02(id_user02,emal,age1,age2) VALUES (i,i,x,x);
end loop;
end;
$$

--Thao Tác với User01--
-- 4 Lấy ra các dữ liệu trong khoảng 20 < age1 < 35 Thời gian vào khoảng 120-140ms --
SELECT COUNT(age1) 
FROM user01 
WHERE 20<age1 AND age1 < 35;
-- 5 Lấy ra các dữ liệu trong khoảng 20 < age2 < 35 Thời gian vào khoảng 18-30ms --
SELECT COUNT(age2)
FROM user01 
WHERE 20<age2 AND age2 < 35;
-- 6 Lấy ra các dữ liệu age1=35 Thời gian vào khoảng 118 - 128ms --
SELECT COUNT(age1)
FROM user01 
WHERE age1  = 35;
-- 7 Lấy ra các dữ liệu age2 = 35 Thời gian vào khoảng 3ms - 4ms --
SELECT COUNT(age2)
FROM user01 
WHERE age2 = 35;


--Thao tác với User02--
-- 4 Lấy ra các dữ liệu trong khoảng 20 < age1 < 35 Thời gian vào khoảng 120-140ms --
SELECT COUNT(age1) 
FROM user02
WHERE 20<age1 AND age1 < 35;
-- 5 Lấy ra các dữ liệu trong khoảng 20 < age2 < 35 Thời gian vào khoảng 108-130ms --
SELECT COUNT(age2)
FROM user02
WHERE 20<age2 AND age2 < 35;
-- 6 Lấy ra các dữ liệu age1=35 Thời gian vào khoảng 99 - 108ms --
SELECT COUNT(age1)
FROM user02
WHERE age1  = 35;
-- 7 Lấy ra các dữ liệu age2 = 35 Thời gian vào khoảng 13-15ms --
SELECT COUNT(age2)
FROM user02
WHERE age2 = 35;
