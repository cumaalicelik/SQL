-- INRETVIEW QUESTIONS

CREATE TABLE people 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20) );
INSERT INTO people VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO people VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO people VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO people VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO people VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO people VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO people VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');

CREATE TABLE workers
(
id int, 
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');


select * from people
select * from workers
--1)Her iki tablodaki ortak id’leri ve people tablosunda bu id’ye sahip isimleri listeleyen query yaziniz
select people.isim, people.id from people join workers
on people.id = workers.id

select isim, id from people where id in (select id from workers where people.id = workers.id);

--2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
select id , isim from people
INTERSECT
SELECT id, isim from workers

--3) Personel tablosunda kac farkli sehirden personel var?
select count(distinct(sehir)) from people;

--4) Personel tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Query yaziniz
select * from people where mod(id,2)=0 ;

--5) Personel tablosunda kac tane kayit oldugunu gosteren query yazin
select count(*) from people 
select count(id) from people

--6) people tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
select * from people order by maas desc 
fetch next 1 row only;

--7) Personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
select * from people order by maas
fetch next 1 row only;

--8) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
select * from workers order by maas desc
offset 1 row
fetch next 1 row only;

select max(maas) from workers
where maas <>(select max(maas) from workers);

-9) workers tablosunda ikinci en dusuk maasi alan iscinin tum bilgilerini gosteren query yazin
select * from workers order by maas
offset 1 row
fetch next 1 row only;

select min(maas) from workers
where maas <>(select min(maas) from workers);

--10) workers tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini
--gosteren query yazin
select * from workers order by maas desc
offset 1 row
fetch next 6 rows only

select * from workers 
where maas <>(select max(maas) from workers) order by maas desc ;






