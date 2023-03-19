
CREATE TABLE team(
id int,
isim varchar(15),
yas int,
maas int,
email varchar(25)
);

insert into team (id,isim, yas, maas, email) values (1,'Ali', 39, 12500, 'ali@gmail.com');
insert into team (id,isim, yas, maas, email) values (2,'Derya', 28, 15000, 'derya@yahoo.com');
insert into team (id,isim, yas, maas, email) values (3,'Sevim', 24, 25000, 'sevim@hotmail.com');
insert into team (id,isim, yas, maas, email) values (4,'Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into team (id,isim, yas, maas, email) values (5,'Halil', 48, 22000, 'halil@gmail.com');
insert into team (id,isim, yas, maas, email) values (6,'Ece', 54, 21000, 'ece@gmail.com');
insert into team (id,isim, yas, maas, email) values (7,'Can', 38, 19000, 'can@gmail.com');
insert into team (id,isim, yas, maas, email) values (8,'Elif', 27, 14000, 'elif@gmail.com');
insert into team (id,isim, yas, maas, email) values (9,'Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into team (id,isim, yas, maas, email) values (NULL,'Sena', 25, 11000, NULL);

-- 1) Tablo bilgilerini listeleyiniz.
select * from team

-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
select isim,yas,maas from team;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from team where id =8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select isim,yas,email from team where id =5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from team where yas >30 order by yas desc;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from team where maas<>21000;

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.

select * from team where isim like 'A%';

-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from team where isim like '%n';

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from team where email like '%gmail%';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from team where email not like '%gmail%'

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from team where id in (3,5,7,9)

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from team where yas not in(39,48,54)

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from team where yas between 30 and 40

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from team where yas not between 30 and 40

-- 15) emaili olmayan personel bilgilerini listeleyiniz.
select * from team where email is NULL;

-- 16) emaili olan personel bilgilerini listeleyiniz.
select * from team where email is not NULL;

-- 17) personel bilgilerini yaşa göre sıralayınız.
select * from team order by yas;

-- 18) personel bilgilerini maaşa göre sıralayınız.
select * from team order by maas;

-- 19) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from team order by yas desc;

-- 20) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from team order by maas desc;

-- 21) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from team order by maas desc
fetch next 3 row only;


CREATE TABLE companies(
company_id SMALLINT,
company VARCHAR(20),
number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
select * from companies;

--1.Example: Find the company and number_of_employees
--whose number_of_employees is the second highest
select company, number_of_employees from companies order by number_of_employees desc
offset 1 row
fetch next 1 row only;

select company, number_of_employees from companies order by number_of_employees desc
offset 1
limit 1;

select max(number_of_employees) from companies
where number_of_employees <>(select max(number_of_employees) from companies)

--2.Example: Find the company names and number of employees whose number of employees
--is less than the average number of employees
select company, number_of_employees from companies 
where number_of_employees < (select avg(number_of_employees) from companies)

--3.Example: Update the number of employees of the IBM to 9999

update companies 
set number_of_employees = 9999
where company ='IBM'

select * from companies

--4.Example: Update the number of employees to 16000 if the number of employees
--is less than the average number of employees

update companies
set number_of_employees = 16000
where number_of_employees < (select avg(number_of_employees) from companies)

select * from companies order by number_of_employees

--5. example: add a new column named country with a default value of USA
alter table companies
add country varchar(20) default 'USA'

