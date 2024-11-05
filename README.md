# Turistik Yerler Bilgi Sistemi Projesi

Bu proje, turistik mekanların bilgilerini etkin bir şekilde yönetmek ve tanıtmak amacıyla geliştirildi. Sistemin kullanıcı dostu olması, hem yerel hem de yabancı turistlerin bilgilere rahatça erişimini mümkün kılarak turizm deneyimini zenginleştirecektir. Ayrıca, turistlerin ihtiyaçlarına hızlı ve etkili çözümler sunarak, turizm sektöründe daha dinamik bir bilgi akışı sağlayacaktır.

## Ekip Üyeleri

- İbrahim KORKMAZ
- Gülsüm SAYIN
- Rojhat BAKİ

## Proje Gereksinimleri

### Kullanıcı Gereksinimleri

- Şehir ve ilçe bazında arama yapabilme
- Mekanları kategoriye göre filtreleme
- Mekanlara yorum yapma ve puan verme
- Favori mekanlarını kaydetme

### Yönetici Gereksinimleri

- Şehir, ilçe, önemli nokta, kategori ve kullanıcı bilgilerini ekleme, düzenleme ve silme
- Etkinlik bilgilerini ekleyip düzenleme
- Kullanıcı geri bildirimlerini izleyip analiz etme

## Varlıklar ve Özellikleri

1. **Şehirler**
   - `ID` (Primary Key)
   - `Şehir Adı` (Unique, NOT NULL)

2. **İlçeler**
   - `ID` (Primary Key)
   - `İlçe Adı` (Unique, NOT NULL)
   - `Şehir ID` (Foreign Key, NOT NULL)

3. **Mekanlar**
   - `ID` (Primary Key)
   - `Nokta Adı` (NOT NULL)
   - `İlçe ID` (Foreign Key, NOT NULL)
   - `Kategori ID` (Foreign Key, NOT NULL)
   - `Adres` (NOT NULL)
   - `Telefon`
   - `Açıklama`

4. **Kategoriler**
   - `ID` (Primary Key)
   - `Kategori Adı` (Unique, NOT NULL)

5. **Kullanıcılar**
   - `ID` (Primary Key)
   - `Kullanıcı Adı` (Unique, NOT NULL)
   - `Şifre` (NOT NULL)
   - `E-posta` (Unique, NOT NULL)

6. **Yorumlar**
   - `ID` (Primary Key)
   - `Önemli Nokta ID` (Foreign Key, NOT NULL)
   - `Kullanıcı ID` (Foreign Key, NOT NULL)
   - `Yorum Metni` (NOT NULL)
   - `Tarih` (NOT NULL)

7. **Etkinlikler**
   - `ID` (Primary Key)
   - `Etkinlik Adı` (NOT NULL)
   - `Tarih` (NOT NULL)
   - `İlçe ID` (Foreign Key, NOT NULL)
   - `Adres`

8. **Puanlar**
   - `ID` (Primary Key)
   - `Önemli Nokta ID` (Foreign Key, NOT NULL)
   - `Kullanıcı ID` (Foreign Key, NOT NULL)
   - `Puan` (1-5, NOT NULL)

## İlişkiler

### 1:N İlişkiler

- Bir şehir, birçok ilçeye sahip olabilir.
- Bir ilçe, birçok mekana sahip olabilir.
- Bir kullanıcı, birçok yorum yapabilir.
- Bir kullanıcı, birçok puan verebilir.

### N:M İlişkiler

- Mekanlar ve kategoriler arasında N:M ilişkisi olabilir. Bir önemli nokta birden fazla kategoriye ait olabilir.


## E-R Diyagramı

![image](https://github.com/user-attachments/assets/ae49389f-cca1-4ad7-afa4-0013969775f5)



