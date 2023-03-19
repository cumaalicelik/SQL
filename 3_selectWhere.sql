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
