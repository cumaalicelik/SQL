--DML --> UPDATE--

select * from personel order by id --> order by ile tekrardan sıralanıyor (update edilen satır en sona yazılır)

-- personel tablosundaid si 1001 olan ogr nin ismini Erol Evren olarak değiştiriniz
UPDATE personel
SET isim = 'Erol Evren' --> where şartı kulanmadan update işlemi yaptığımızda bütün sütunu set değeri ile değiştirir
where id ='1001';

update personel
SET maas = 82000 --> where şartı kulanmadan update işlemi yaptığımızda bütün sütunu set değeri ile değiştirir
where isim ='Erol Evren'

CREATE TABLE hastaneler
(
id char(5) primary key, 
isim char(30),
sehir char(15),
ozel char(1)
); 
insert into hastaneler values('H101', 'Aci Madem Hastanesi', 'Istanbul', 'Y');
insert into hastaneler values('H102', 'HasZeki Hastanesi', 'Istanbul', 'N');
insert into hastaneler values('H103', 'Medikol Hastanesi', 'Izmir', 'Y');
insert into hastaneler values('H104', 'Memoryil Hastanesi', 'Ankara', 'Y');
CREATE TABLE hastalar(
  kimlik_no CHAR(11) PRIMARY Key,
  isim CHAR(50) ,
  teshis  CHAR(20)
  );
  insert INTO hastalar values('12345678901','Ali Can','Gizli Seker');
  insert INTO hastalar values('45678901121','Ayse Yilmaz','Hipertansiyon');
  insert INTO hastalar values('78901123451','Steve Jobs','Pankreatit');
  insert INTO hastalar values('12344321251','Tom Hanks','COVID 19');
   
create table bolumler(
bolum_id char(5),
bolum_adi char(20)
);
insert into bolumler values('DHL','Dahiliye');
insert into bolumler values('KBB','Kulak Burun Bogaz');
insert into bolumler values('NRJ','Noroloji');
insert into bolumler values('GAST','Gastoroloji');
insert into bolumler values('KARD','Kardioloji');
insert into bolumler values('PSK','Psikiyatri');
insert into bolumler values('GOZ','Goz Hastaliklari');
create table hasta_kayitlar(
kimlik_no char(11) Primary key,
hasta_ismi char(20),
hastane_adi char(50),
bolum_adi char(20),
teshis char(20)
);
insert into hasta_kayitlar values('1111','NO NAME','','','');
insert into hasta_kayitlar values('2222','NO NAME','','','');
insert into hasta_kayitlar values('3333','NO NAME','','','');
insert into hasta_kayitlar values('4444','NO NAME','','','');
insert into hasta_kayitlar values('5555','NO NAME','','','');

/*
hasta_kayıtlar tablosundaki ‘3333’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : ‘Salvadore Dali’ ismi ile
hastane_adi: ‘John Hopkins’
bolum_adi: ‘Noroloji’
teshis: ‘Parkinson’
kimlik_no: ‘99991111222’
*/
SELECT * FROM hasta_kayitlar

UPDATE hasta_kayitlar
SET hasta_ismi = 'Salvador Dali',
	hastane_adi = 'John Hopkins',
	bolum_adi = 'Noroloji',
	teshis = 'Parkinson',
	kimlik_no = '99991111222'
WHERE kimlik_no = '3333'

/*
hasta_kayıtlar tablosundaki ‘1111’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki kimlik nosu ‘12345678901’ olan kişinin ismi ile
hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile
*/
UPDATE hasta_kayitlar
SET hasta_ismi=(SELECT isim from hastalar where kimlik_no ='12345678901'),
	hastane_adi =(SELECT isim from hastaneler where id ='H104'),
	bolum_adi =(SELECT bolum_adi from bolumler where bolum_id ='DHL'),
	teshis =(SELECT teshis from hastalar where isim ='Ali Can'),
	kimlik_no =(SELECT kimlik_no from hastalar where isim ='Ali Can')
WHERE kimlik_no ='1111'

--ALIASES kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir

select hasta_ismi as isim from hasta_kayitlar

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');  
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

-- name değeri null olan tüm verileri listeleyiniz
select * from insanlar where name IS nul

-- name değeri null olmayan tüm verileri listeleyiniz
select * from insanlar where name IS NOT null

--insanlar tablosunda name değeri null olan verilerin yerine isim girilmemiş yazdıralım
update insanlar
set name = 'İsim girilmemiş' 
where name is null

-- ORDER BY 
--ascending defaulttur (küçükten büyüğe), descending de büyükten küçüğe sıralar
drop table insanlar

CREATE TABLE insanlar(
ssn char(9),
isim varchar(50),
soyisim varchar(50), 
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar

--insanlar tablosunda adres sütununu alfabetik olarak sıralayınız
select * from insanlar order by adres

select * from insanlar order by soyisim desc

--önce isme göre naturel, sonra soyisme göre terten sırala
select * from insanlar order by isim, soyisim asc
select * from insanlar order by 2 asc, 4 desc -- yukarıdakinin aynısı sütün numarası da verilir

-- isim ve soyisim değerlerini uzunluklarına göre sıralayınız
select * from insanlar order by LENGTH (isim), LENGTH (soyisim);

--isim ve soyisim sütunlarını birleştirme
SELECT CONCAT (isim,' ',soyisim) as isim_soyisim FROM insanlar ORDER BY LENGTH (isim)

--bütün sütunları birleştirme
SELECT CONCAT (isim,'-',soyisim,'-',adres) as isim_soyisim_adres FROM insanlar ORDER BY LENGTH (isim)

create table sirket(
isim varchar(20),    
sehir varchar(20),
maas int    
);
insert into sirket values ('erol','burdur',1000);
insert into sirket values ('erol','antalya',2000);
insert into sirket values ('erol','izmir',1500);
insert into sirket values ('ahmet','bursa',900);
insert into sirket values ('ahmet','izmir',2500);
insert into sirket values ('ahmet','istanbul',1800);
insert into sirket values ('mert','trabzon',1200);
insert into sirket values ('mert','istanbul',1000);
insert into sirket values ('mert','antep',2000);
insert into sirket values ('mert','tokat',3000);
insert into sirket values ('eda','antep',1200);
insert into sirket values ('eda','urfa',1500);
insert into sirket values ('erol','usak',2000);
insert into sirket values ('erol','burdur',900);

select * from sirket

-- GROUP BY - grup yapar
-- şirkette çaışanların isimlerini listeleyin
select isim from sirket
GROUP BY isim

--kim hangi şehirde çalışıyor
select isim,sehir from sirket
group by isim,sehir order by isim

-- GROUP BY KOMUTU AGGREGATE MEHTODLARLA KULLANIMI

-- şirkette çalışanların toplam maaşını listeleyiniz
select isim,sum(maas) as maas_toplamı from sirket group by isim;

-- her bir kişi kaç şehirde çalışıyor
SELECT isim,count(sehir) as calistigi_iller FROM sirket GROUP BY isim;

select isim,max(maas) as max_maas, min(maas) as min_maas, round(avg(maas),2) as ort_maas from sirket group by isim;

--erol kaç ilde çalışıyor
select isim, count(sehir) as calistigi_il from sirket where isim ='erol' group by isim;

--toplam maaşı 7000+ olanlar
select isim, sum(maas) as toplam_maas from sirket group by isim HAVING sum(maas)<7000 order by sum(maas);

--şehirlere göre ort maaslar
select sehir, round(avg(maas),2) as ort_maas from sirket group by sehir order by avg(maas);

--şehirlere göre 2000 altı ort maas
select sehir, round(avg(maas),2) as ort_maas from sirket group by sehir having sum(maas)<2000 order by avg(maas) desc;

