-- TABLOLARI OLUÞTURMA
CREATE TABLE Sehirler (
    ID INT PRIMARY KEY IDENTITY(1,1),
    SehirAdi VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Ilceler (
    ID INT PRIMARY KEY IDENTITY(1,1),
    IlceAdi VARCHAR(255) UNIQUE NOT NULL,
    SehirID INT NOT NULL,
    FOREIGN KEY (SehirID) REFERENCES Sehirler(ID)
);

CREATE TABLE Kategoriler (
    ID INT PRIMARY KEY IDENTITY(1,1),
    KategoriAdi VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Kullanicilar (
    ID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciAdi VARCHAR(255) UNIQUE NOT NULL,
    Sifre VARCHAR(255) NOT NULL,
    Eposta VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Mekanlar (
    ID INT PRIMARY KEY IDENTITY(1,1),
    MekanAdi VARCHAR(255) NOT NULL,
    IlceID INT NOT NULL,
    KategoriID INT NOT NULL,
    Adres TEXT NOT NULL,
    Telefon VARCHAR(20),
    Aciklama VARCHAR(MAX),
    FOREIGN KEY (IlceID) REFERENCES Ilceler(ID),
    FOREIGN KEY (KategoriID) REFERENCES Kategoriler(ID)
);

CREATE TABLE Yorumlar (
    ID INT PRIMARY KEY IDENTITY(1,1),
    MekanID INT NOT NULL,
    KullaniciID INT NOT NULL,
    YorumMetni VARCHAR(MAX) NOT NULL,
    Tarih DATE NOT NULL,
    FOREIGN KEY (MekanID) REFERENCES Mekanlar(ID),
    FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(ID)
);

CREATE TABLE Etkinlikler (
    ID INT PRIMARY KEY IDENTITY(1,1),
    EtkinlikAdi VARCHAR(255) NOT NULL,
    Tarih DATE NOT NULL,
    IlceID INT NOT NULL,
    Adres VARCHAR(MAX),
    FOREIGN KEY (IlceID) REFERENCES Ilceler(ID)
);

CREATE TABLE Puanlar (
    ID INT PRIMARY KEY IDENTITY(1,1),
    MekanID INT NOT NULL,
    KullaniciID INT NOT NULL,
    Puan INT NOT NULL CHECK (Puan >= 1 AND Puan <= 5),
    FOREIGN KEY (MekanID) REFERENCES Mekanlar(ID),
    FOREIGN KEY (KullaniciID) REFERENCES Kullanicilar(ID)
);

-- TABLOLARA VERÝ EKLEME

-- Þehirler tablosuna örnek veriler ekleme
INSERT INTO Sehirler (SehirAdi) VALUES 
('Ýstanbul'), 
('Ankara'), 
('Ýzmir'),
('Bursa'),
('Antalya'),
('Adana'),
('Elazýð'),
('Gaziantep'),
('Kayseri'),
('Malatya');


-- Ýlçeler tablosuna örnek veriler ekleme
INSERT INTO Ilceler (IlceAdi, SehirID) VALUES 
('Kadýköy', 1), 
('Beþiktaþ', 1),
('Çankaya', 2),
('Yenimahalle', 2),
('Bornova', 3),
('Karþýyaka', 3),
('Aðýn', 4),
('Osmangazi', 4),
('Muratpaþa', 5),
('Battalgazi', 5);


-- Kategoriler tablosuna örnek veriler ekleme
INSERT INTO Kategoriler (KategoriAdi) VALUES 
('Restoran'), 
('Kafe'),
('Müze'),
('Park'),
('AVM'),
('Tiyatro'),
('Sinema'),
('Kütüphane'),
('Spor Salonu'),
('Otel');


-- Mekanlar tablosuna örnek veriler ekleme
INSERT INTO Mekanlar (MekanAdi, IlceID, KategoriID, Adres, Telefon, Aciklama) VALUES 
('Lezzet Kebap Salonu', 1, 1, 'Atatürk Caddesi No:12, Merkez', '03124567890', 'Ankara’nýn en iyi kebap lezzetlerini bulabileceðiniz restoran.'),
('Tarihi Han Kafe', 2, 2, 'Çýkrýkçýlar Yokuþu No:8, Altýndað', '03129876543', 'Osmanlý döneminden kalma atmosferde Türk kahvesi keyfi.'),
('Anadolu Medeniyetleri Müzesi', 3, 3, 'Gözcü Sokak No:2, Ulus', '03124678901', 'Binlerce yýllýk Anadolu tarihine ýþýk tutan bir müze.'),
('Gölbaþý Doða Parký', 4, 4, 'Park Caddesi No:7, Gölbaþý', '03121112131', 'Doðayla iç içe piknik alanlarý ve yürüyüþ yollarý.'),
('Panora Alýþveriþ Merkezi', 5, 5, 'Eskiþehir Yolu No:65, Çankaya', '03125556677', 'Geniþ maðaza yelpazesi ve restoran seçenekleriyle Ankara’nýn önde gelen AVM’si.'),
('Devlet Opera ve Balesi', 6, 6, 'Cumhuriyet Caddesi No:4, Kýzýlay', '03122233344', 'Unutulmaz opera ve bale gösterileri.'),
('Kent Sinemasý', 7, 7, 'Kavaklýdere Sokak No:5, Çankaya', '03123334455', 'Ankara’nýn en yeni filmlerini izleyebileceðiniz modern bir sinema.'),
('Milli Kütüphane', 8, 8, 'Bahçelievler Mahallesi No:1, Çankaya', '03124445566', 'Türkiye’nin en kapsamlý arþivine sahip kütüphanesi.'),
('FitLife Spor Merkezi', 9, 9, 'Saðlýk Caddesi No:9, Yenimahalle', '03126667788', 'Modern ekipmanlarla donatýlmýþ spor salonu.'),
('Lüks Ankara Otel', 10, 10, 'Atakule Sokak No:3, Çankaya', '03127778899', 'Þehrin kalbinde, konforlu ve lüks bir konaklama deneyimi.');

-- Kullanýcýlar tablosuna örnek veriler ekleme
INSERT INTO Kullanicilar (KullaniciAdi, Sifre, Eposta) VALUES 
('ahmet123', 'Ahmet@2025', 'ahmet123@gmail.com'),
('zeynep45', 'Zeynep_456!', 'zeynep45@yahoo.com'),
('mehmet89', 'Mehmet_89$', 'mehmet89@hotmail.com'),
('ayse.kaya', 'Ayse*1234', 'ayse.kaya@gmail.com'),
('emre54', 'Emre@54', 'emre54@outlook.com'),
('fatma.99', 'Fatma_99!', 'fatma.99@hotmail.com'),
('ali.korkmaz', 'Ali_2023', 'ali.korkmaz@gmail.com'),
('elifnur33', 'Elif@Nur33!', 'elifnur33@yahoo.com'),
('mustafa67', 'Mustafa_67$', 'mustafa67@gmail.com'),
('sevda88', 'Sevda.88*', 'sevda88@outlook.com');


-- Etkinlikler tablosuna örnek veriler ekleme
INSERT INTO Etkinlikler (EtkinlikAdi, Tarih, IlceID, Adres) VALUES 
('Teoman Konseri', '2023-12-10', 1, 'Ankara Arena, Altýndað'),
('Modern Sanat Sergisi', '2023-12-15', 2, 'CerModern, Sýhhiye'),
('Þair Evlenmesi - Tiyatro Oyunu', '2023-12-20', 3, 'Devlet Tiyatrosu, Ulus'),
('Yýlbaþý Film Gösterimi: "Noel Hikayesi"', '2023-12-25', 4, 'Kent Sinemasý, Çankaya'),
('Ankara Kitap Fuarý', '2023-12-30', 5, 'ATO Congresium, Söðütözü'),
('Amatör Koþu Etkinliði', '2024-01-05', 6, 'Gençlik Parký, Altýndað'),
('Teknoloji ve Yapay Zeka Konferansý', '2024-01-10', 7, 'ODTÜ Kültür ve Kongre Merkezi, Çankaya'),
('Ahþap Oyuncak Yapým Workshop', '2024-01-15', 8, 'Tasarým Atölyesi, Kýzýlay'),
('Ankara Müzik Festivali', '2024-01-20', 9, 'Kurtuluþ Parký, Çankaya'),
('Eðitimde Gelecek Vizyonu Konferansý', '2024-01-25', 10, 'TED Üniversitesi Konferans Salonu, Kolej');


-- Yorumlar tablosuna örnek veriler ekleme
INSERT INTO Etkinlikler (EtkinlikAdi, Tarih, IlceID, Adres) VALUES 
('Teoman Konseri', '2023-12-10', 1, 'Ankara Arena, Altýndað'),
('Modern Sanat Sergisi', '2023-12-15', 2, 'CerModern, Sýhhiye'),
('Þair Evlenmesi - Tiyatro Oyunu', '2023-12-20', 3, 'Devlet Tiyatrosu, Ulus'),
('Yýlbaþý Film Gösterimi: "Noel Hikayesi"', '2023-12-25', 4, 'Kent Sinemasý, Çankaya'),
('Ankara Kitap Fuarý', '2023-12-30', 5, 'ATO Congresium, Söðütözü'),
('Amatör Koþu Etkinliði', '2024-01-05', 6, 'Gençlik Parký, Altýndað'),
('Teknoloji ve Yapay Zeka Konferansý', '2024-01-10', 7, 'ODTÜ Kültür ve Kongre Merkezi, Çankaya'),
('Ahþap Oyuncak Yapým Workshop', '2024-01-15', 8, 'Tasarým Atölyesi, Kýzýlay'),
('Ankara Müzik Festivali', '2024-01-20', 9, 'Kurtuluþ Parký, Çankaya'),
('Eðitimde Gelecek Vizyonu Konferansý', '2024-01-25', 10, 'TED Üniversitesi Konferans Salonu, Kolej');


-- Puanlar tablosuna örnek veriler ekleme
INSERT INTO Puanlar (MekanID, KullaniciID, Puan) VALUES 
(1, 1, 5),
(2, 2, 4),
(3, 3, 5),
(4, 4, 4),
(5, 5, 3),
(6, 6, 5),
(7, 7, 4),
(8, 8, 5),
(9, 9, 4),
(10, 10, 5);


-- SORGULAMA KOMUTLARI

-- Belirli bir ilçedeki mekanlarýn listesini getirmek ve kategorilerine göre gruplama
SELECT I.IlceAdi, M.MekanAdi, K.KategoriAdi
FROM Mekanlar M
JOIN Ilceler I ON M.IlceID = I.ID
JOIN Kategoriler K ON M.KategoriID = K.ID
WHERE I.IlceAdi = 'Çankaya'
ORDER BY K.KategoriAdi, M.MekanAdi;


-- Her þehirde bulunan toplam mekan sayýsýný bulma
SELECT S.SehirAdi, COUNT(M.ID) AS ToplamMekan
FROM Sehirler S
JOIN Ilceler I ON S.ID = I.SehirID
JOIN Mekanlar M ON I.ID = M.IlceID
GROUP BY S.SehirAdi
ORDER BY ToplamMekan DESC;


-- Her mekan için verilen ortalama puaný bulma ve puana göre sýralama
SELECT M.MekanAdi, AVG(P.Puan) AS OrtalamaPuan
FROM Mekanlar M
JOIN Puanlar P ON M.ID = P.MekanID
GROUP BY M.MekanAdi
ORDER BY OrtalamaPuan DESC;



-- Kategoriye göre ortalama puan bulma
SELECT KategoriID, AVG(OrtalamaPuan) AS OrtalamaPuan
FROM Mekanlar
GROUP BY KategoriID
ORDER BY OrtalamaPuan DESC;



-- Kullanýcýlarýn yaptýðý yorum sayýsýný bulma 
SELECT K.KullaniciAdi, COUNT(Y.ID) AS YorumSayisi
FROM Kullanicilar K
JOIN Yorumlar Y ON K.ID = Y.KullaniciID
GROUP BY K.KullaniciAdi
ORDER BY YorumSayisi DESC;



-- Belli bir tarihten sonra yapýlan yorumlarý bulma
SELECT Y.YorumMetni, Y.Tarih, M.MekanAdi, K.KullaniciAdi
FROM Yorumlar Y
JOIN Mekanlar M ON Y.MekanID = M.ID
JOIN Kullanicilar K ON Y.KullaniciID = K.ID
WHERE Y.Tarih > '2023-12-05'
ORDER BY Y.Tarih DESC;


-- Her kullanýcýnýn yaptýðý yorumlar ve verdiði puanlarýn ortalamasýný bulma
SELECT K.KullaniciAdi, AVG(P.Puan) AS OrtalamaPuan, COUNT(Y.ID) AS YorumSayisi
FROM Kullanicilar K
LEFT JOIN Yorumlar Y ON K.ID = Y.KullaniciID
LEFT JOIN Puanlar P ON K.ID = P.KullaniciID
GROUP BY K.KullaniciAdi
ORDER BY OrtalamaPuan DESC;



-- STORE PROCEDURES

-- Kullanýcý ve tarih aralýðý için tüm yorumlarý içeren bir rapor oluþturma
CREATE PROCEDURE KullaniciRaporu
    @KullaniciID INT,
    @BaslangicTarihi DATE,
    @BitisTarihi DATE
AS
BEGIN
    SELECT 
        K.KullaniciAdi,
        M.MekanAdi,
        Y.YorumMetni,
        Y.Tarih AS YorumTarihi
    FROM 
        Kullanicilar K
    LEFT JOIN 
        Yorumlar Y ON K.ID = Y.KullaniciID
    LEFT JOIN 
        Mekanlar M ON Y.MekanID = M.ID
    WHERE 
        K.ID = @KullaniciID
        AND Y.Tarih BETWEEN @BaslangicTarihi AND @BitisTarihi
    ORDER BY 
        Y.Tarih DESC;
END;

-- Saklý yordamý çaðýrma
EXEC KullaniciRaporu @KullaniciID = 1, @BaslangicTarihi = '2022-01-01', @BitisTarihi = '2023-12-31';


-- Bir mekanýn ortalama puanýný güncelleyen saklý yordam

-- Mekanlar tablosuna OrtalamaPuan sütununun eklenmesi
ALTER TABLE Mekanlar
ADD OrtalamaPuan FLOAT;


CREATE PROCEDURE OrtalamaPuanGuncelle
    @MekanID INT
AS
BEGIN
    -- Ortalama puaný hesaplayýp güncelle
    UPDATE Mekanlar
    SET OrtalamaPuan = (
        SELECT AVG(Puan)
        FROM Puanlar
        WHERE MekanID = @MekanID
    )
    WHERE ID = @MekanID;
END;

-- Saklý yordamý çaðýrma
EXEC OrtalamaPuanGuncelle @MekanID=2

SELECT * FROM Puanlar WHERE MekanID=2

--Bir mekan için yapýlan yeni bir yorumu ekleme ve ardýndan o mekanýn ortalama puanýný hesaplayýp güncelleme
CREATE PROCEDURE YorumEkleVePuanGuncelle
    @MekanID INT,
    @KullaniciID INT,
    @YorumMetni TEXT,
    @Tarih DATE,
    @Puan INT
AS
BEGIN
    -- Yorum Ekle
    INSERT INTO Yorumlar (MekanID, KullaniciID, YorumMetni, Tarih)
    VALUES (@MekanID, @KullaniciID, @YorumMetni, @Tarih);

    -- Puan Ekle
    INSERT INTO Puanlar (MekanID, KullaniciID, Puan)
    VALUES (@MekanID, @KullaniciID, @Puan);

    -- Ortalama Puaný Hesapla ve Güncelle
    UPDATE Mekanlar
    SET OrtalamaPuan = (
        SELECT AVG(Puan) FROM Puanlar WHERE MekanID = @MekanID
    )
    WHERE ID = @MekanID;
END;


-- Saklý yordamý çaðýrarak yorum ekleyip puaný güncelle
EXEC YorumEkleVePuanGuncelle
    @MekanID = 3, 
    @KullaniciID = 1, 
    @YorumMetni = 'Muhteþemdi!!', 
    @Tarih = '2024-12-31', 
    @Puan = 5;


SELECT * FROM Mekanlar M JOIN Ilceler I ON M.IlceID=I.ID 
WHERE M.ID=3


--TRÝGGER OLUÞTURMA

CREATE TRIGGER OrtPuanGuncelle
ON Puanlar
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @MekanID INT;
    SELECT @MekanID = inserted.MekanID FROM inserted;

    UPDATE Mekanlar
    SET OrtalamaPuan = (
        SELECT AVG(Puan) FROM Puanlar WHERE MekanID = @MekanID
    )
    WHERE ID = @MekanID;
END;


-- Puanlar tablosundaki mevcut bir puaný güncelleme
UPDATE Puanlar
SET Puan = 4
WHERE MekanID = 3 AND KullaniciID = 1;

SELECT * FROM Puanlar 


-- Yeni bir kullanýcý eklendiðinde, kullanýcýnýn þifresini hash'leyen bir tetikleyici.
CREATE TRIGGER HashSifreOlustur
ON Kullanicilar
AFTER INSERT
AS
BEGIN
    UPDATE Kullanicilar
    SET Sifre = HASHBYTES('SHA2_256', Sifre)
    WHERE ID IN (SELECT ID FROM inserted);
END;

-- Tabloya yeni veriler ekleme
INSERT INTO Kullanicilar (KullaniciAdi, Sifre, Eposta)
VALUES ('Aybars', '235711', 'aybrs@gmail.com');

-- Burada þifrenin hashlenmiþ hali verilir 
SELECT KullaniciAdi, Sifre, Eposta
FROM Kullanicilar
WHERE KullaniciAdi = 'Aybars';


--Yorumlar tablosunda bir güncelleme iþlemi gerçekleþtiðinde bu deðiþiklikleri bir log tablosuna kaydetme

-- YorumLog tablosunu oluþturma
CREATE TABLE YorumLog (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    YorumID INT,
    EskiYorum VARCHAR(MAX),
    YeniYorum VARCHAR(MAX),
    DegisiklikTarihi DATETIME
);


CREATE TRIGGER YorumGuncelleLog
ON Yorumlar
AFTER UPDATE
AS
BEGIN
    INSERT INTO YorumLog (YorumID, EskiYorum, YeniYorum, DegisiklikTarihi)
    SELECT 
        deleted.ID, 
        deleted.YorumMetni, 
        inserted.YorumMetni, 
        GETDATE()
    FROM deleted
    JOIN inserted ON deleted.ID = inserted.ID;
END;


-- Var olan bir yorumu güncelleme
UPDATE Yorumlar
SET YorumMetni = 'Güncellenmiþ yorum.'
WHERE ID = 1;




-- TRANSACTÝON Yöntemi

CREATE PROCEDURE MekanEkle
    @MekanAdi VARCHAR(255),
    @IlceID INT,
    @KategoriID INT,
    @Adres TEXT,
    @Telefon VARCHAR(20),
    @Aciklama VARCHAR(MAX)
AS
BEGIN
    
    BEGIN TRANSACTION;

    BEGIN TRY
        
        INSERT INTO Mekanlar (MekanAdi, IlceID, KategoriID, Adres, Telefon, Aciklama)
        VALUES (@MekanAdi, @IlceID, @KategoriID, @Adres, @Telefon, @Aciklama);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        
        ROLLBACK TRANSACTION;
  
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;


 
EXEC MekanEkle @MekanAdi = 'Restoran', @IlceID = 1, @KategoriID = 1, @Adres = 'Adres 1', @Telefon = '1234567890', @Aciklama ='Yemekler çok iyiydi!';


-- Hata durumu (geçersiz IlceID)
EXEC MekanEkle @MekanAdi = 'Restoran', @IlceID = 99, @KategoriID = 1, @Adres = 'Adres 2', @Telefon = '0987654321', @Aciklama = 'Kebaplar efsaneydi';

-- Sonuçlarýn kontrol edilmesi(Transaction iþlemine göre deðiþim olmamasý gerekir!)
SELECT * FROM Mekanlar;
SELECT * FROM Ilceler;





CREATE PROCEDURE KullaniciBilgileriGuncelle
    @KullaniciID INT,
    @YeniKullaniciAdi VARCHAR(255),
    @YeniEposta VARCHAR(255)
AS
BEGIN
    
    BEGIN TRANSACTION;

    BEGIN TRY
        UPDATE Kullanicilar
        SET KullaniciAdi = @YeniKullaniciAdi, Eposta = @YeniEposta
        WHERE ID = @KullaniciID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        
        ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;



INSERT INTO Kullanicilar (KullaniciAdi, Sifre, Eposta) VALUES ('Aybars', '246810', 'aybrs@gmail.com');

-- Normal kullanýcý bilgileri güncelleme iþlemi
EXEC KullaniciBilgileriGuncelle @KullaniciID = 1, @YeniKullaniciAdi = 'Yaðýz', @YeniEposta = 'yagiz@gmail.com';

SELECT * FROM Kullanicilar;


-- Hata durumu (geçersiz KullaniciID)
EXEC KullaniciBilgileriGuncelle @KullaniciID = 99, @YeniKullaniciAdi = 'xxxxx', @YeniEposta = 'xxxxx@gmail.com';

-- Transaction iþleminden kaynaklý kayýtlar deðiþmemeli!
SELECT * FROM Kullanicilar;