--LIKE CONDITION
--ismi v ile başlayan personeli listele
select * from personel1 where isim ilike 'v%' --ilike büyük küçük harf ayrımını ortadan kaldırır

--sonu n ile biten personelin tüm bilgilerini listele
select * from personel1 where isim like '%n'

--isminin içinde l olan personelin tüm bilgilerini listele
select * from personel1 where isim like '%l%'

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);
CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5);  
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1011, 'EROL', 4);
INSERT INTO kelimeler VALUES (1009, 'EVREN', 5);
INSERT INTO kelimeler VALUES (1010, 'ADEM', 4);

select * from kelimeler

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran
--QUERY yazin
select * from kelimeler where kelime ~ 'h[ai]t';
select * from kelimeler where kelime ~~ 'ha_'; -- ~~ like anlamına gelir

--UPPER-LOWER-INITCAP

SELECT UPPER(kelime) as kelime FROM kelimeler;

SELECT LOWER(kelime) FROM kelimeler;

SELECT LOWER(kelime) FROM kelimeler WHERE kelime ~ '[AE]';

--ilk harflerini büyük yazdır (INITCAP kullanılır)
select INITCAP(kelime) as kelime from kelimeler;

--Kelimeler sütunundaki Erol ismini küçük harflerle değiştirin
select lower(kelime) from kelimeler where kelime ='EROL';

update kelimeler
set kelime =lower(kelime);

select * from kelimeler;