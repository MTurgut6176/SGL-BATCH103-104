--                  JOINS
CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');  
INSERT INTO sirketler VALUES(101, 'Honda');  
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');
CREATE TABLE siparisler  (
siparis_id int,
sirket_id int,  
siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17');  
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');  
INSERT INTO siparisler VALUES(55, 105, '2020-04-21');
--              INNER JOIN
/*
    NOT :
    1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
    2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
    3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
 */
 
/*
    NOT :
    1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
    2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
    3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
    
    1) Left Join’de ilk tablodaki tum record’lar gosterilir.
    2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
    3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
 */
 
 
--  INNER JOIN
/*
    NOT :
    1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
    2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
    3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
*/
-- Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;
--  LEFT JOIN
/*
    NOT :
    1) Left Join’de ilk tablodaki tum record’lar gosterilir.
    2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
    ortak olmayan datalar icin o kisimlar bos kalir
    3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
*/
-- Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;
--  RIGHT JOIN
/*
    NOT :
    1)Right Join’de ikinci tablodaki tum record’lar gosterilir.
    2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
    ancak ortak olmayan datalar icin o kisimlar bos kalir
*/
-- Iki Tabloda sirket_id'si ayni olanlarin sirket_ismi, siparis_id ve
-- siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirketler RIGHT JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;

  --full join--

/*
	NOT :
	1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
	2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/

SELECT sirketler.sirket_isim, siparisler.siparis_id, siparisler.siparis_tarihi
FROM sirketler full JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;

select * from sirketler;
select * from siparisler;

        --selr join --
	--hayali bir tablo olusturup eski tablomuza ekleriz	
		
CREATE TABLE personel1 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);
INSERT INTO personel1 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel1 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel1 VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel1 VALUES(4, 'Fatma Can', 'CEO', 5);

select* from personel1

-- Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
select isim from personel1


SELECT p1.isim AS personel_ismi, p2.isim AS yonetici_ismi
FROM personel1 p1 INNER JOIN personel p2
ON p1.yonetici_id = p2.id;

-- 								LIKE Condition
/*
	LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
	statement ile calisan wildcards’a(özel sembol) izin verir.. Ve bize pattern matching yapma
	imkani verir.
*/

LIKE 'A%';   Like tan sonra tirnak isareti icinde A% demek a ile baslayan ve sonunda
                        -- ne olursa olsun getir demek
/*
1001	"Ali"	62000
1002	"Ayse"	57500
*/

drop table musteriler

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler (id, isim, gelir)VALUES (1001, 'Ali', 62000); 

INSERT INTO musteriler (id, isim, gelir)VALUES (1002, 'Ayse', 57500);
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);

select * from musteriler

select * from musteriler
where isim like 'A%'; --burada like onune i koyarsak ilike yazarsak buyuk kucuk harf fark etmez

--soru 1-Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin

select isim ,gelir from musteriler where isim like '%e'

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin

select isim,gelir from musteriler where isim like '%er%'

-- 2) _=> sadece bir karakteri gosterir.

-- SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler

  select * from musteriler where isim like '_atma'

-- soruIkinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin

 select * from musteriler where isim like '_a%'

-- Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin

select * from musteriler where isim like '__s%'

    -- LIKE Condition
/*
	3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3);
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

select * from kelimeler

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--       QUERY yazin

select * from kelimeler where kelime ~'h[ai]t' --~ isaretinden sonra* koyarsak byk kck harf farketmez

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
--yazdiran QUERY yazin

select * from kelimeler where kelime ~*'h[a-k]t'

SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from kelimeler where kelime ~*'^[as]'  ^ bu isaretler baslarken 

SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from kelimeler where kelime~*'[mf]$'

/*
UPPER – LOWER - INITCAP
Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
kucuk harf yazdirmak icin kullaniriz
 */
 
 -- Kelimeler tablosundaki kelime sutunundaki verileri once hepsi buyuk harf, 
 --sonra kucuk harf ve ilk harfleri buyuk olacak sekilde yazdiralim

select * from kelimeler

select upper(kelime) from kelimeler  --hepsini buyuk harf yapar