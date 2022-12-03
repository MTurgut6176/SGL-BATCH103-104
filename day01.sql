--DATEBASE OLUSTURMA
Create database evren;

Create datebase evren;

--DDL-DATA DEFINITION BASE .

--CREATE TABLO OLUSTURMA

CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
	soyisim varchar(25),--varchar max 50 karakter alir
	not_ort real, --real dooble gibi ondalikli sayilarda
	kayit_tarih date	
);

--VAR OLAN TABLODAN YENI BIR TABLO OLUSTUEMA
create table ogrenci_notlari
as --Benze tablodaki basliklarla ve data tipleriyle yeni tablo olusturmak icin (as) gibi anlaminda
select isim,soyisim,not_ort FROM ogrenciler2; --select komutuyla olusturulur

--DML -DATA MANIPULATION LANG.
--INSERT (database veri ekleme)

insert into ogrenciler2 values ('1234567','Said','IHAN',85.5,NOW());

--bir tabloya parcali veri ekleme

insert into ogrenciler2 (isim,soyisim) values('erol','evren');

--DQL -DATA QUERY LANG.
--SELECT

select*from ogrenciler2;

