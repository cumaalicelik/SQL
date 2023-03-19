--DISTINCT , AYNI KELİMELERİ VE KARAKTERLERİ SADECE BİR KERE YAZAR

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (30, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (40, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (50, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (60, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (70, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (80, 'Elif', 'Elma');

SELECT * FROM musteri_urun;

--Müsteri_urun tablosundan müsteri isimlerini tekrarsız(group) listeleyiniz
SELECT DISTINCT(musteri_isim) FROM musteri_urun

--Group By ile çözümü;
SELECT musteri_isim FROM musteri_urun group by musteri_isim -- aynı işlemi yapar

--MEYVE İSİMLERİNİ LİSTELE
select DISTINCT(urun_isim) FROM musteri_urun

-- kaç çeşit meyce vardır?
select count(distinct(urun_isim)) meyve_cesidi FROM musteri_urun

--FETCH NEXT (SAYI) ROW ONLY- OFFSET
--son 3 kaydı listele
--limit ile çözümü
select * from musteri_urun
order by urun_id desc limit 3

--fetch ile çözümü
select * from musteri_urun
order by urun_id desc
fetch next 3 row only

--baştan üçüncü kaydı getir ( 2 tane atla sonraki 1 taneyi getir)
select * from musteri_urun
offset 2 limit 1

-- 4. 5. 6. kaydı getir
select * from musteri_urun
offset 3 limit 3

select * from musteri_urun
offset 3 row fetch next 3 row only

select * from musteri_urun
order by urun_id
offset 3 limit 3

--4. kayıttan 7. kayda kadar olanlar
select * from musteri_urun
offset 3 row 
fetch next 4 row only;

--* ALTER TABLE --> Tablodaki sütun, sütünların data tipleri ve tablonun kendisine müdahale eder
--ADD
ALTER TABLE musteri_urun
ADD kasa_sayisi varchar(5);

select * from musteri_urun

ALTER TABLE musteri_urun
ADD sehir varchar(20) default 'Ankara';

-- urun_id sütununa primary key ekleyelim
ALTER TABLE musteri_urun
ADD primary key (urun_id);

delete from musteri_urun;

--DROP -- constraint yazılmadan pk siilinemez
ALTER TABLE musteri_urun
DROP constraint musteri_urun_pkey;

--sehir sütununu sil
ALTER TABLE musteri_urun
DROP sehir;

--RENAME 
ALTER TABLE musteri_urun
rename urun_isim to meyve

--tablo ismini değiştir
ALTER TABLE musteri_urun
RENAME to meyveler

--tablo ismi değiştiği için yeni ismiyle çağrılmalıdır
select * from meyveler

--TYPE / SET
ALTER TABLE meyveler
alter kasa_sayisi TYPE char(10);

ALTER TABLE meyveler
alter meyve set not null

--DATA TYPE DEGİSTİRME
ALTER TABLE meyveler
alter kasa_sayisi type int using(kasa_sayisi::int)

DROP TABLE ogrenciler2
--Transaction BLOCK
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);


select *from ogrenciler2
delete from ogrenciler2 -- save point olan yer silinse bile çağrılır

rollback to x;

COMMIT;

--Interview
Create table isci(
id char(2),
isim varchar(10),
maas int    
);
insert into isci values ('10','Erol',1000);
insert into isci values ('11','Evren',1500);
insert into isci values ('12','Emre',2000);

create table isci_adres(
id char(2),
sehir varchar(20),
tel varchar(15)    
);
insert into isci_adres values ('10','Burdur','0523125465');
insert into isci_adres values ('11','Ankara','0546532133');
insert into isci_adres values ('12','Bursa','0213213545');

select * from isci
select * from isci_adres

--Personellerin isim ve sehirlerini yazdırınız
select isci.isim,isci_adres.sehir
from isci join isci_adres 
on isci.id = isci_adres.id

--Ankarada çalışan personelin id ve ismini listeleyiniz
select isim, id from isci where id in 
(select id from isci_adres where sehir ='Ankara')


select count(distinct(meyve)) as meyve_cesidi from meyveler

--alter

CREATE TABLE personel3
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel3_pk PRIMARY KEY (id)
);
INSERT INTO personel3 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel3 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel3 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel3 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel3 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel3 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel3 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel3

alter table personel3
add ulke_isim varchar(20) default 'Germany' 

alter table personel3
add age int

alter table personel3
add tel int, add sex varchar(10); 

alter table personel3
drop column tel;

alter table personel3
rename column sirket to company;

alter table personel3
rename column maas to salary

select * from staff

alter table personel3 rename to staff

alter table staff
add job varchar(20) default 'Jobless'

alter table staff
drop column ulke_isim;

alter table staff
rename column sehir to city; 

UPDATE staff
SET sex = 'M' 
WHERE city = 'Istanbul';

UPDATE staff
SET sex = 'F' 
WHERE city = 'Ankara';

update staff
set age = 25

update staff
set age = 36 where company ='Honda'

select isim, salary, city from staff
where age = 36
