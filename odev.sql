--soru --Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri 
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız

SELECT marka_id as ankaradacalisanid,calisan_sayisi FROM markalar
WHERE marka_isim IN (SELECT isyeri FROM calisanlar2 WHERE sehir='Ankara');

select * from markalar--dosyalari cagrmak icin yazik
select * from calisanlar--dosyalari cagrmak icin yazik

