/*
YORUM İÇİN
*/
--DataBase Oluşturma
--pdAdminde kodlarımızı yazarken büyük küçük harf hassasiyeti yoktur
Create database deneme;

--DDL(Data Definition Lang.) -> Create 

Create table ogrenciler2(
ogr_no varchar(10),
isim varchar(10),
tel varchar(15),
email varchar(25),    
kayit_tarihi date    
);

--Oluşturduğumuz tablodan yeni bir tablo oluşturma

CREATE TABLE ogr_bilgi

AS SELECT isim,tel FROM ogrenciler1;

--DML -> Data Manupulation Lang. -> INSERT(Tabloya veri ekleme komutu)
--Tüm sütunlara veri ekleme

INSERT INTO ogrenciler1 VALUES ('1234','Erol','0532154624','erol@gmail.com','06-03-2023');

--Bazı sütunlara veri ekleme, Parçalı veri ekleme

INSERT INTO ogrenciler1 (isim,tel,email) values ('Evren','046498765','evren@gmail.com');

CREATE TABLE tedarikciler(
tedarikci_id char(4),
tedarikci_ismi varchar(25),
tedarikci_adres varchar(50),
ulasım_tarihi date
);

CREATE TABLE tedarikci_ziyaret
AS SELECT tedarikci_ismi, ulasım_tarihi FROM tedarikciler;

--DQL -> Data Query Lang. -> SELECT

--Tabladaki tüm sütun bilgilerini getirmek için kullanılır;
SELECT * FROM ogrenciler1;

--Tablodaki istediğimiz bir veya birden fazla sütunu getirmek içi;
SELECT isim,tel FROM ogrenciler1;

-- CONSTRAINT (KISITLAMA)
-- UNIQUE
create table ogrenciler3(
ogr_no varchar(10),
isim varchar(10) unique,
tel varchar(15) not null,
email varchar(25),    
kayit_tarihi date   
);

SELECT * FROM ogrenciler3

INSERT INTO ogrenciler3 (isim,tel,email) values ('Evren','046498765','evren@gmail.com');
INSERT INTO ogrenciler3 (isim,tel,email) values ('EvrenEvren','046498765','evren@gmail.com');


create table ogrenciler4(
ogr_no varchar(10),
isim varchar(10) unique,
tel varchar(15) not null,
email varchar(25),    
kayit_tarihi date   
);

SELECT * FROM ogrenciler4

INSERT INTO ogrenciler4 VALUES ('1234','Erol','0532154624','erol@gmail.com','06-03-2023');
INSERT INTO ogrenciler4 (isim,email) VALUES ('Evren', 'evren@gmail.com');
							

create table ogrenciler6(
ogr_no varchar(10),
isim varchar(10) unique,
tel varchar(15) not null,
email varchar(25) not null,    
kayit_tarihi date,
UNIQUE(tel),
UNIQUE(email)
);
							
							
SELECT * FROM ogrenciler6
INSERT INTO ogrenciler6 VALUES ('1234','Erol','0532154624','erol@gmail.com','06-03-2023');
INSERT INTO ogrenciler6 VALUES ('1234','ErolMert','0532154625','erol02@gmail.com','06-03-2023');


CREATE TABLE personel
(
id char(10),
isim varchar(50) NOT NULL,  
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,  
maas int
);

select * from personel

INSERT INTO personel (id, soyisim) values ('12345', 'Evren');
/*
--ERROR:  null value in column "isim" of relation "personel" violates not-null constraint
Bu Insert islemini kabul etmez ve yukardaki gibi hata verir. Çünkü isim sütununa NOT NULL kısıtlaması
tablo oluştururken atanmıştır, dolayısıyla isim sütunu boş geçilemez.
*/

--Primary Key  - 1. yol
CREATE TABLE personel
(
id char(10) primary key,
isim varchar(50) NOT NULL,  
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,  
maas int,
CONSTRAINT pk  PRIMARY KEY (id)
);
-------------------------------------------
--Primary Key  - 2. yol
CREATE TABLE personel
(
id char(10),
isim varchar(50) NOT NULL,  
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,  
maas int,
CONSTRAINT pk  PRIMARY KEY (id)
);

select * from personel

-------------------------------------------
--Primary Key  - 3. yol
CREATE TABLE personel
(
id char(10),
isim varchar(50) NOT NULL,  
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,  
maas int,
PRIMARY KEY (id)
);


/*Practice 4:
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,  “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

create table tedarikciler( --- Parent Table
tedarikci_id varchar(10) primary key,
tedarikci_ismi varchar(30),
iletisim_isim varchar(50)
) 

CREATE TABLE urunler( --- Child Table
tedarikci_id varchar(10),
urun_id varchar(10),
foreign key (tedarikci_id) references tedarikciler(tedarikci_id)
)


