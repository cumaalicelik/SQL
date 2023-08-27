-- Primary Key ve Forign Key Practise

Create table student(
st_no char(4) PRIMARY KEY,
name_ varchar(10),
surname varchar(20),
tel varchar(11),
email varchar(20),
city  varchar(20)
);

SELECT * FROM student;

INSERT INTO student VALUES ('1234' , 'Erol' , 'Evren', '05325689878' , 'erol@gmail.com','London');
INSERT INTO student VALUES ('1235' , 'Berk' , 'Can', '05325689879' , 'berk@gmail.com','Bursa');
INSERT INTO student VALUES ('1236' , 'Rumeysa' , 'Kaya', '05325689880' , 'rkaya@gmail.com','Paris');
INSERT INTO student VALUES ('1237' , 'ahmed' , 'Erkan', '05325689881' , 'ahmed@gmail.com','Sochi');
INSERT INTO student VALUES ('1238' , 'Emre' , 'Can', '05325689882' , 'emre@gmail.com','Lisbon');

create table notlar(
st_no char(4),
term varchar(10),
firstExam real,
secondExam real,
finalExam real ,
FOREIGN KEY (st_no) references student (st_no)
);

INSERT INTO notlar VALUES ('1234','1st Term', 75.5 , 80, 85.5);
INSERT INTO notlar VALUES ('1235','1st Term', 70 , 65, 82.5);
INSERT INTO notlar VALUES ('1236','1st Term', 65 , 95, 70);
INSERT INTO notlar VALUES ('1237','1st Term', 55 , 95, 70);
INSERT INTO notlar VALUES ('1238','1st Term', 0 , 50, 85);
INSERT INTO notlar VALUES ('1234','2nd Term', 65 , 80.5, 75);
INSERT INTO notlar VALUES ('1235','2nd Term', 55 , 75, 95);

-- DQL -> Data Query Lang. -> WHERE koşulu
-- Student tablosundan Berk'in tel ve email bilgilerini listeleyiniz
SELECT * FROM student

SELECT name_,tel,email FROM student  WHERE name_ = 'Berk';

-- Ogrenci no 1236 olan ogrencinin tum bilgileri
SELECT * FROM student WHERE st_no = '1236'

-- Ogrenci no 1236 olan ogrencinin isim,tel ve email
SELECT name_,tel,email FROM student WHERE st_no ='1236'

-- CHECK CONSTRAINT, değeri sınırlamak için kullanılır 
-- Negatif deger girilmesini engelleyebiliriz

create table notlar(
st_no char(4),
term varchar(10),
firstExam real,
secondExam real check (secondExam>45),
finalExam real check (finalExam>45),
FOREIGN KEY (st_no) references student (st_no)
);

INSERT INTO notlar VALUES ('1234','1st Term', 75.5 , 80, 85.5);
INSERT INTO notlar VALUES ('1235','1st Term', 70 , 65, 82.5);
INSERT INTO notlar VALUES ('1236','1st Term', 65 , 95, 70);
INSERT INTO notlar VALUES ('1237','1st Term', 55 , 95, 70);
INSERT INTO notlar VALUES ('1238','1st Term', 0 , 50, 85);
INSERT INTO notlar VALUES ('1234','2nd Term', 65 , 80.5, 75);
INSERT INTO notlar VALUES ('1235','2nd Term', 55 , 50, 50);

select * from notlar

-- Notlar tablosundan 80 üstündeki notları listele

select st_no ,secondExam from notlar where secondExam >90;

select st_no, finalExam from notlar where finalExam < 75;

-- DML -> DELETE komutu, DELETE from tablo_adi

DELETE FROM notlar; --her şeyi siler

DELETE FROM notlar WHERE st_no ='1234'; --spesific seyleri siler

DELETE FROM student WHERE st_no ='1234'; -- child dan sildiklerimizi parent dan da silebiliriz

select * from notlar 

-- TRUNCATE tüm verileri siler, şartlı silme yoktur

TRUNCATE TABLE notlar

-- ON DELETE CASCADE ->Parent tablodan istediğimiz veriyi silebiliriz
--riskli bir işlemdir, dikkatli olmak lazım!
-- child tablodan da otomatikman silinir
Create table notlar(
st_no char(4),
term varchar(10),
firstExam real,
secondExam real check (secondExam>45),
finalExam real check (finalExam>45),
FOREIGN KEY (st_no) references student (st_no)
ON DELETE CASCADE 
);

INSERT INTO notlar VALUES ('1234','1st Term', 75.5 , 80, 85.5);
INSERT INTO notlar VALUES ('1235','1st Term', 70 , 65, 82.5);
INSERT INTO notlar VALUES ('1236','1st Term', 65 , 95, 70);
INSERT INTO notlar VALUES ('1237','1st Term', 55 , 95, 70);
INSERT INTO notlar VALUES ('1238','1st Term', 0 , 50, 85);
INSERT INTO notlar VALUES ('1234','2nd Term', 65 , 80.5, 75);
INSERT INTO notlar VALUES ('1235','2nd Term', 55 , 50, 50);

SELECT * FROM notlar

-- Student tablosundan 1234 nolu ogrencinin tüm verilerini sil

DELETE FROM student WHERE st_no ='1234'

select * from student

DELETE FROM notlar WHERE st_no='1235'

DROP TABLE student cascade - veri tabanından siler

-- IN CONDITION 

CREATE TABLE musteriler(
urun_id int,  
musteri_isim varchar(50),  
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple');  
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');  
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');  
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');  
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');  
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT *  FROM musteriler

-- Ürün ismi orange, apple olan verileri listeleyiniz

SELECT * FROM musteriler WHERE urun_isim ='Orange' or urun_isim ='Apple'

--AND ->Her iki şartı birden sağlaması gerekir
--OR -> Tek bir şartı sağlasa yeterlidir
--Ürün ismi orange ile Apple olan müşteri isimlerini listeleyiniz
SELECT musteri_isim,urun_isim FROM musteriler WHERE urun_isim='Orange' or urun_isim='Apple';
--2. YOL --> IN CONDITION KULLANIMI
SELECT musteri_isim,urun_isim FROM musteriler WHERE urun_isim IN ('Orange','Apple');
--Müsteri ismi Amy olan ile urun_ismi Palm olan verileri listeleyiniz
SELECT musteri_isim,urun_isim From musteriler WHERE musteri_isim='Mark' and urun_isim='Orange';

-- NOT IN 
-- Ürün ismi  orange ile apple olmayan müsteri ve urun isimleri
SELECT musteri_isim, urun_isim FROM musteriler WHERE urun_isim NOT IN ('Orange', 'Apple');

-- BETWEEN CONDITION
--ID degerleri 20 ile 40 arasında olanlar
SELECT * FROM musteriler WHERE urun_id between 20 and 40; --20 ve 40 dahildir
SELECT * FROM musteriler WHERE 20 <= urun_id and urun_id <=40;

-- ID degerleri 20 ile 40 arasında olmayanlar
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 and 40;

/* Practice 6
id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
D ile Y arasındaki personel bilgilerini listeleyiniz
D ile Y arasında olmayan personel bilgilerini listeleyiniz
Maaşı 70000 ve ismi Sena olan personeli listeleyiniz */
drop table personel
CREATE table personel(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

select * from personel
--id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
select * from personel where id between '1003' and '1005';

--D ile Y arasındaki personellerin bilgilerini listeleyiniz
select * from personel where isim between 'Derya soylu' and 'Yavuz Bal';

--D ile Y arasında olmayan personellerin bilgilerini listeleyiniz
select * from personel where isim not between 'Derya soylu' and 'Yavuz Bal';

--Maaşı 70000 ve ismi Sena olan personellerin bilgilerini listeleyiniz
select * from personel where maas = 70000 or isim = 'Sena Beyaz';


CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar2

-- marka_id'si 101 den büyük olan marka çalışanlarının isim, maaş ve şehirlerini yazdır
select isim,maas,sehir from calisanlar2
where isyeri IN (select marka_isim from markalar where marka_id >101);

-- çalışan sayısı 15.00 den çok olan markaların isimlerini ve 
-- bu markalarda çalışanların isimlerini ve maaşlarını listeleyin
SELECT isyeri,isim,maas FROM calisanlar2 
WHERE isyeri IN (SELECT marka_isim from markalar WHERE calisan_sayisi>15000);

--AGGREGATE METHOD->(sum(),count(),min(),max(),avg()->ortalama)
select max(maas) as en_yuksek_maas from calisanlar2 where isyeri ='Vakko'
select min(maas) as min_maas from calisanlar2 where isim ='Veli Yilmaz'

--calısanlar tablosunda kaç kişi var?
select count(isim) as kisi_sayisi from calisanlar2
select * from calisanlar2

--avg() average
select avg(maas) from calisanlar2
select round(avg(maas)) from calisanlar2
select round(avg(maas),2) from calisanlar2

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select * from markalar

select marka_id, marka_isim, (select count (sehir) from calisanlar2 where marka_isim=isyeri ) from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

SELECT marka_isim,calisan_sayisi,(SELECT sum(maas) FROM calisanlar2 WHERE marka_isim=isyeri) as toplam_maas FROM markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE marka_isim=isyeri) as en_yuksek_maas,
(SELECT min(maas) FROM calisanlar2 WHERE marka_isim=isyeri) as en_dusuk_maas
from markalar

--EXISTS CONDITION
CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart
SELECT * FROM nisan
/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
SELECT urun_isim,musteri_isim FROM nisan WHERE exists(SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim)

/* ÖDEV
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
 NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/
