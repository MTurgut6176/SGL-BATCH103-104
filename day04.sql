--ALIASES

CREATE TABLE calisanlar11  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar11 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar11 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar11 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar11;

select calisan_id as id from calisanlar;--calisanlar tablosunda sadece calisan_id getiriir

--eger iki sutunnun verilerini birlestirmek istersek concet sembolu olan(||) kullaniriz

SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar
--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar


--	IS NULL CONDITION
-- Arama yapilan field’da NULL degeri almis kayitlari getirir

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

select * from insanlar;

--name stununda null olan degerleri cagiralim

select name from insanlar where name is null; --sadece null satirini gorururz
select name from insanlar where name is not null --null olmayanlari getirir

--insanlar tablosunda null deger almis verileri no name olarak degistiriniz

update insanlar
set name ='No Name'
where name is null;
select * from insanlar;

-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/

drop table if exists insanlar
CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar1 order by adres; --alfabetik sira yapar adres sutununa gore 

select * from insanlar1 order by soyisim ;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar1 WHERE isim='Mine' ORDER BY ssn  --ssn sutununa gore olanlari verir

/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/




--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--soru Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar1 where soyisim='Bulut'order by 4

--soru Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar1 order by ssn desc --ssn olanlan sutunu siralar fakat desc ifadesini de yazarsak tersten siralama yapar

-- soru Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

select * from insanlar1 order by isim asc,soyisim desc;

-- soru İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız

select isim,soyisim from insanlar1 order by length(soyisim); --sonun desc eklesek tersten siralar

-- soru-Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
-- once sutunlari birlestirmeliyz

SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH(isim||soyisim) --1.yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim) --2.yol
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim) --3.yol
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim)) --4.yol

-- 									GROUP BY CLAUSE
-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
-- komutuyla birlikte kullanılır,ayni sutunda ayni ifadeleri bir kere yazar

CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

--isme gore alinan toplam urunleri

SELECT  SUM (urun_miktar) from manav --bu toplam urun sayisini verir 31
select isim,sum(urun_miktar)as aldigi_toplam_urun from manav
Group by  isim
order by aldigi_toplam_urun  desc;

-- Urun ismine gore urunu alan toplam kisi sayisi

select urun_adi,count(isim) from manav 
group by urun_adi;
