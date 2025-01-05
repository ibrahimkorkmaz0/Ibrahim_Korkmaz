# Şehir Rehberi Projesi

Bu proje, turistik mekanlar hakkında bilgi sağlamak ve bu mekanları etkili bir şekilde tanıtmak amacıyla tasarlandı. Kullanıcılar, ilgi alanlarına göre önerilen mekanlar sayesinde, gezilecek yerler hakkında detaylı bilgilere ulaşabilir. Ayrıca, sistemde yer alan etkinlikler bölümü, kullanıcıların ziyaret edecekleri bölgelerde düzenlenen etkinlikleri görmelerine olanak tanır. Bu sayede, kullanıcılar seyahatlerini bu etkinliklere göre planlayarak daha keyifli bir deneyim yaşayabilir.

Projenin amacı, hem turizm işletmelerinin tanıtımını desteklemek hem de turistlerin seyahatlerini kolaylaştırarak daha bilinçli, planlı ve verimli bir şekilde geçirmelerine yardımcı olmaktır. 

## Ekip Üyeleri

- İbrahim KORKMAZ
- Gülsüm SAYIN
- Rojhat BAKİ

## Proje Gereksinimleri

### Kullanıcı Gereksinimleri

•	Şehir ve ilçe bazında arama yapabilme

•	Mekanları kategoriye göre filtreleme

•	Mekanlara yorum yapma ve puan verme

•	Favori mekanlarını kaydetme

•	Etkinlikleri takip edebilme

•	Kullanıcı profili oluşturma ve yönetme

### Yönetici Gereksinimleri

•	Şehir, ilçe, önemli nokta, kategori ve kullanıcı bilgilerini ekleme, düzenleme ve silme

•	Etkinlik bilgilerini ekleyip düzenleme

•	Kullanıcı geri bildirimlerini izleyip analiz etme

•	Sistem performansını izleme ve optimize etme

•	Raporlama ve analiz araçları

•	Güvenlik ve veri bütünlüğünü sağlama


## Varlıklar ve Özellikleri

1. ***Şehirler (Cities)***
   
-  ID (Primary Key)

-  ŞehirAdi (City Name)

2. ***İlçeler (Districts)***
   
 - 	ID (Primary Key)

 - 	İlçeAdi (District Name)

 - 	ŞehirID (Foreign Key)

3. ***Kategoriler (Categories)***
   
 - 	ID (Primary Key)

 - 	KategoriAdi (Category Name)

4. ***Kullanıcılar (Users)***
   
 - 	ID (Primary Key)

 - 	KullanıcıAdi (User Name)

 - 	Şifre (Password)

 - 	Eposta (Email)

5. ***Mekanlar (Places)***
    
 - 	ID (Primary Key)

 - 	MekanAdi (Place Name)

 - 	İlçeID (Foreign Key)

 - 	KategoriID (Foreign Key)

 - 	Adres (Address)

 -    Telefon (Phone)

 - 	Açıklama (Description)

6. ***Yorumlar (Comments)***
    
 - 	ID (Primary Key)

 - 	MekanID (Foreign Key)

 - 	KullanıcıID (Foreign Key)

 - 	YorumMetni (Comment Text)

 - 	Tarih (Date)

7. ***Etkinlikler (Events)***
    
 - 	ID (Primary Key)

 - 	EtkinlikAdi (Event Name)

-  	Tarih (Date)

-  	İlçeID (Foreign Key)

-  	Adres (Address)

8. ***Puanlar (Ratings)***
    
-  	ID (Primary Key)

-  	MekanID (Foreign Key)

-  	KullanıcıID (Foreign Key)

-  	Puan (Rating)


## İlişkiler

### 1:N İlişkiler

- Bir şehir, birçok ilçeye sahip olabilir.
- Bir ilçe, birçok mekana sahip olabilir.
- Bir kullanıcı, birçok yorum yapabilir.
- Bir kullanıcı, birçok puan verebilir.

### N:M İlişkiler

- Mekanlar ve kategoriler arasında N:M ilişkisi olabilir. Bir önemli nokta birden fazla kategoriye ait olabilir.


## E-R Diyagramı


![Ekran görüntüsü 2025-01-04 124950](https://github.com/user-attachments/assets/86170a2c-1c0b-4738-873b-204b81851d5f)


