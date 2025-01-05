-- TABLOLARI OLU�TURMA
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

-- TABLOLARA VER� EKLEME

-- �ehirler tablosuna �rnek veriler ekleme
INSERT INTO Sehirler (SehirAdi) VALUES 
('�stanbul'), 
('Ankara'), 
('�zmir'),
('Bursa'),
('Antalya'),
('Adana'),
('Elaz��'),
('Gaziantep'),
('Kayseri'),
('Malatya');


-- �l�eler tablosuna �rnek veriler ekleme
INSERT INTO Ilceler (IlceAdi, SehirID) VALUES 
('Kad�k�y', 1), 
('Be�ikta�', 1),
('�ankaya', 2),
('Yenimahalle', 2),
('Bornova', 3),
('Kar��yaka', 3),
('A��n', 4),
('Osmangazi', 4),
('Muratpa�a', 5),
('Battalgazi', 5);


-- Kategoriler tablosuna �rnek veriler ekleme
INSERT INTO Kategoriler (KategoriAdi) VALUES 
('Restoran'), 
('Kafe'),
('M�ze'),
('Park'),
('AVM'),
('Tiyatro'),
('Sinema'),
('K�t�phane'),
('Spor Salonu'),
('Otel');


-- Mekanlar tablosuna �rnek veriler ekleme
INSERT INTO Mekanlar (MekanAdi, IlceID, KategoriID, Adres, Telefon, Aciklama) VALUES 
('Lezzet Kebap Salonu', 1, 1, 'Atat�rk Caddesi No:12, Merkez', '03124567890', 'Ankara�n�n en iyi kebap lezzetlerini bulabilece�iniz restoran.'),
('Tarihi Han Kafe', 2, 2, '��kr�k��lar Yoku�u No:8, Alt�nda�', '03129876543', 'Osmanl� d�neminden kalma atmosferde T�rk kahvesi keyfi.'),
('Anadolu Medeniyetleri M�zesi', 3, 3, 'G�zc� Sokak No:2, Ulus', '03124678901', 'Binlerce y�ll�k Anadolu tarihine ���k tutan bir m�ze.'),
('G�lba�� Do�a Park�', 4, 4, 'Park Caddesi No:7, G�lba��', '03121112131', 'Do�ayla i� i�e piknik alanlar� ve y�r�y�� yollar�.'),
('Panora Al��veri� Merkezi', 5, 5, 'Eski�ehir Yolu No:65, �ankaya', '03125556677', 'Geni� ma�aza yelpazesi ve restoran se�enekleriyle Ankara�n�n �nde gelen AVM�si.'),
('Devlet Opera ve Balesi', 6, 6, 'Cumhuriyet Caddesi No:4, K�z�lay', '03122233344', 'Unutulmaz opera ve bale g�sterileri.'),
('Kent Sinemas�', 7, 7, 'Kavakl�dere Sokak No:5, �ankaya', '03123334455', 'Ankara�n�n en yeni filmlerini izleyebilece�iniz modern bir sinema.'),
('Milli K�t�phane', 8, 8, 'Bah�elievler Mahallesi No:1, �ankaya', '03124445566', 'T�rkiye�nin en kapsaml� ar�ivine sahip k�t�phanesi.'),
('FitLife Spor Merkezi', 9, 9, 'Sa�l�k Caddesi No:9, Yenimahalle', '03126667788', 'Modern ekipmanlarla donat�lm�� spor salonu.'),
('L�ks Ankara Otel', 10, 10, 'Atakule Sokak No:3, �ankaya', '03127778899', '�ehrin kalbinde, konforlu ve l�ks bir konaklama deneyimi.');

-- Kullan�c�lar tablosuna �rnek veriler ekleme
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


-- Etkinlikler tablosuna �rnek veriler ekleme
INSERT INTO Etkinlikler (EtkinlikAdi, Tarih, IlceID, Adres) VALUES 
('Teoman Konseri', '2023-12-10', 1, 'Ankara Arena, Alt�nda�'),
('Modern Sanat Sergisi', '2023-12-15', 2, 'CerModern, S�hhiye'),
('�air Evlenmesi - Tiyatro Oyunu', '2023-12-20', 3, 'Devlet Tiyatrosu, Ulus'),
('Y�lba�� Film G�sterimi: "Noel Hikayesi"', '2023-12-25', 4, 'Kent Sinemas�, �ankaya'),
('Ankara Kitap Fuar�', '2023-12-30', 5, 'ATO Congresium, S���t�z�'),
('Amat�r Ko�u Etkinli�i', '2024-01-05', 6, 'Gen�lik Park�, Alt�nda�'),
('Teknoloji ve Yapay Zeka Konferans�', '2024-01-10', 7, 'ODT� K�lt�r ve Kongre Merkezi, �ankaya'),
('Ah�ap Oyuncak Yap�m Workshop', '2024-01-15', 8, 'Tasar�m At�lyesi, K�z�lay'),
('Ankara M�zik Festivali', '2024-01-20', 9, 'Kurtulu� Park�, �ankaya'),
('E�itimde Gelecek Vizyonu Konferans�', '2024-01-25', 10, 'TED �niversitesi Konferans Salonu, Kolej');


-- Yorumlar tablosuna �rnek veriler ekleme
INSERT INTO Etkinlikler (EtkinlikAdi, Tarih, IlceID, Adres) VALUES 
('Teoman Konseri', '2023-12-10', 1, 'Ankara Arena, Alt�nda�'),
('Modern Sanat Sergisi', '2023-12-15', 2, 'CerModern, S�hhiye'),
('�air Evlenmesi - Tiyatro Oyunu', '2023-12-20', 3, 'Devlet Tiyatrosu, Ulus'),
('Y�lba�� Film G�sterimi: "Noel Hikayesi"', '2023-12-25', 4, 'Kent Sinemas�, �ankaya'),
('Ankara Kitap Fuar�', '2023-12-30', 5, 'ATO Congresium, S���t�z�'),
('Amat�r Ko�u Etkinli�i', '2024-01-05', 6, 'Gen�lik Park�, Alt�nda�'),
('Teknoloji ve Yapay Zeka Konferans�', '2024-01-10', 7, 'ODT� K�lt�r ve Kongre Merkezi, �ankaya'),
('Ah�ap Oyuncak Yap�m Workshop', '2024-01-15', 8, 'Tasar�m At�lyesi, K�z�lay'),
('Ankara M�zik Festivali', '2024-01-20', 9, 'Kurtulu� Park�, �ankaya'),
('E�itimde Gelecek Vizyonu Konferans�', '2024-01-25', 10, 'TED �niversitesi Konferans Salonu, Kolej');


-- Puanlar tablosuna �rnek veriler ekleme
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

-- Belirli bir il�edeki mekanlar�n listesini getirmek ve kategorilerine g�re gruplama
SELECT I.IlceAdi, M.MekanAdi, K.KategoriAdi
FROM Mekanlar M
JOIN Ilceler I ON M.IlceID = I.ID
JOIN Kategoriler K ON M.KategoriID = K.ID
WHERE I.IlceAdi = '�ankaya'
ORDER BY K.KategoriAdi, M.MekanAdi;


-- Her �ehirde bulunan toplam mekan say�s�n� bulma
SELECT S.SehirAdi, COUNT(M.ID) AS ToplamMekan
FROM Sehirler S
JOIN Ilceler I ON S.ID = I.SehirID
JOIN Mekanlar M ON I.ID = M.IlceID
GROUP BY S.SehirAdi
ORDER BY ToplamMekan DESC;


-- Her mekan i�in verilen ortalama puan� bulma ve puana g�re s�ralama
SELECT M.MekanAdi, AVG(P.Puan) AS OrtalamaPuan
FROM Mekanlar M
JOIN Puanlar P ON M.ID = P.MekanID
GROUP BY M.MekanAdi
ORDER BY OrtalamaPuan DESC;



-- Kategoriye g�re ortalama puan bulma
SELECT KategoriID, AVG(OrtalamaPuan) AS OrtalamaPuan
FROM Mekanlar
GROUP BY KategoriID
ORDER BY OrtalamaPuan DESC;



-- Kullan�c�lar�n yapt��� yorum say�s�n� bulma 
SELECT K.KullaniciAdi, COUNT(Y.ID) AS YorumSayisi
FROM Kullanicilar K
JOIN Yorumlar Y ON K.ID = Y.KullaniciID
GROUP BY K.KullaniciAdi
ORDER BY YorumSayisi DESC;



-- Belli bir tarihten sonra yap�lan yorumlar� bulma
SELECT Y.YorumMetni, Y.Tarih, M.MekanAdi, K.KullaniciAdi
FROM Yorumlar Y
JOIN Mekanlar M ON Y.MekanID = M.ID
JOIN Kullanicilar K ON Y.KullaniciID = K.ID
WHERE Y.Tarih > '2023-12-05'
ORDER BY Y.Tarih DESC;


-- Her kullan�c�n�n yapt��� yorumlar ve verdi�i puanlar�n ortalamas�n� bulma
SELECT K.KullaniciAdi, AVG(P.Puan) AS OrtalamaPuan, COUNT(Y.ID) AS YorumSayisi
FROM Kullanicilar K
LEFT JOIN Yorumlar Y ON K.ID = Y.KullaniciID
LEFT JOIN Puanlar P ON K.ID = P.KullaniciID
GROUP BY K.KullaniciAdi
ORDER BY OrtalamaPuan DESC;



-- STORE PROCEDURES

-- Kullan�c� ve tarih aral��� i�in t�m yorumlar� i�eren bir rapor olu�turma
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

-- Sakl� yordam� �a��rma
EXEC KullaniciRaporu @KullaniciID = 1, @BaslangicTarihi = '2022-01-01', @BitisTarihi = '2023-12-31';


-- Bir mekan�n ortalama puan�n� g�ncelleyen sakl� yordam

-- Mekanlar tablosuna OrtalamaPuan s�tununun eklenmesi
ALTER TABLE Mekanlar
ADD OrtalamaPuan FLOAT;


CREATE PROCEDURE OrtalamaPuanGuncelle
    @MekanID INT
AS
BEGIN
    -- Ortalama puan� hesaplay�p g�ncelle
    UPDATE Mekanlar
    SET OrtalamaPuan = (
        SELECT AVG(Puan)
        FROM Puanlar
        WHERE MekanID = @MekanID
    )
    WHERE ID = @MekanID;
END;

-- Sakl� yordam� �a��rma
EXEC OrtalamaPuanGuncelle @MekanID=2

SELECT * FROM Puanlar WHERE MekanID=2

--Bir mekan i�in yap�lan yeni bir yorumu ekleme ve ard�ndan o mekan�n ortalama puan�n� hesaplay�p g�ncelleme
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

    -- Ortalama Puan� Hesapla ve G�ncelle
    UPDATE Mekanlar
    SET OrtalamaPuan = (
        SELECT AVG(Puan) FROM Puanlar WHERE MekanID = @MekanID
    )
    WHERE ID = @MekanID;
END;


-- Sakl� yordam� �a��rarak yorum ekleyip puan� g�ncelle
EXEC YorumEkleVePuanGuncelle
    @MekanID = 3, 
    @KullaniciID = 1, 
    @YorumMetni = 'Muhte�emdi!!', 
    @Tarih = '2024-12-31', 
    @Puan = 5;


SELECT * FROM Mekanlar M JOIN Ilceler I ON M.IlceID=I.ID 
WHERE M.ID=3


--TR�GGER OLU�TURMA

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


-- Puanlar tablosundaki mevcut bir puan� g�ncelleme
UPDATE Puanlar
SET Puan = 4
WHERE MekanID = 3 AND KullaniciID = 1;

SELECT * FROM Puanlar 


-- Yeni bir kullan�c� eklendi�inde, kullan�c�n�n �ifresini hash'leyen bir tetikleyici.
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

-- Burada �ifrenin hashlenmi� hali verilir 
SELECT KullaniciAdi, Sifre, Eposta
FROM Kullanicilar
WHERE KullaniciAdi = 'Aybars';


--Yorumlar tablosunda bir g�ncelleme i�lemi ger�ekle�ti�inde bu de�i�iklikleri bir log tablosuna kaydetme

-- YorumLog tablosunu olu�turma
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


-- Var olan bir yorumu g�ncelleme
UPDATE Yorumlar
SET YorumMetni = 'G�ncellenmi� yorum.'
WHERE ID = 1;




-- TRANSACT�ON Y�ntemi

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


 
EXEC MekanEkle @MekanAdi = 'Restoran', @IlceID = 1, @KategoriID = 1, @Adres = 'Adres 1', @Telefon = '1234567890', @Aciklama ='Yemekler �ok iyiydi!';


-- Hata durumu (ge�ersiz IlceID)
EXEC MekanEkle @MekanAdi = 'Restoran', @IlceID = 99, @KategoriID = 1, @Adres = 'Adres 2', @Telefon = '0987654321', @Aciklama = 'Kebaplar efsaneydi';

-- Sonu�lar�n kontrol edilmesi(Transaction i�lemine g�re de�i�im olmamas� gerekir!)
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

-- Normal kullan�c� bilgileri g�ncelleme i�lemi
EXEC KullaniciBilgileriGuncelle @KullaniciID = 1, @YeniKullaniciAdi = 'Ya��z', @YeniEposta = 'yagiz@gmail.com';

SELECT * FROM Kullanicilar;


-- Hata durumu (ge�ersiz KullaniciID)
EXEC KullaniciBilgileriGuncelle @KullaniciID = 99, @YeniKullaniciAdi = 'xxxxx', @YeniEposta = 'xxxxx@gmail.com';

-- Transaction i�leminden kaynakl� kay�tlar de�i�memeli!
SELECT * FROM Kullanicilar;