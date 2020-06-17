USE master
GO
IF DB_ID('Szafy') IS NULL
CREATE DATABASE Szafy
GO
USE Szafy
GO

-- Usuwanie tabel
IF OBJECT_ID('Zamowienia', 'U') IS NOT NULL
DROP TABLE Zamowienia
IF OBJECT_ID('ListyMaterialowe', 'U') IS NOT NULL
DROP TABLE ListyMaterialowe
IF OBJECT_ID('Klienci', 'U') IS NOT NULL
DROP TABLE Klienci
IF OBJECT_ID('Produkty', 'U') IS NOT NULL
DROP TABLE Produkty
IF OBJECT_ID('Komponenty', 'U') IS NOT NULL
DROP TABLE Komponenty
IF OBJECT_ID('Dostawcy', 'U') IS NOT NULL
DROP TABLE Dostawcy
GO

-- Tworzenie tabel
CREATE TABLE Dostawcy
(
	ID INT CONSTRAINT PK_Dostawca PRIMARY KEY,
	Nazwa VARCHAR(250) NOT NULL,
	Adres VARCHAR(250) NOT NULL
)
CREATE TABLE Komponenty
(
	Kod VARCHAR(50) CONSTRAINT PK_Komponent PRIMARY KEY,
	Typ VARCHAR(100) NOT NULL,
	Cena FLOAT NOT NULL,
	Producent VARCHAR(250) NOT NULL,
	IDDostawcy INT CONSTRAINT FK_Dostawca REFERENCES Dostawcy(ID)
)
CREATE TABLE Produkty
(
	Kod VARCHAR(50) CONSTRAINT PK_Produkt PRIMARY KEY,
	Cena FLOAT NOT NULL
)
CREATE TABLE Klienci
(
	ID INT CONSTRAINT PK_Klient PRIMARY KEY,
	Nazwa VARCHAR(250) NOT NULL,
	Adres VARCHAR(250) NOT NULL
)
CREATE TABLE ListyMaterialowe
(
	KodProduktu VARCHAR(50) CONSTRAINT FK_LM_Produkt REFERENCES Produkty(Kod),
	KodKomponentu VARCHAR(50) CONSTRAINT FK_Komponent REFERENCES Komponenty(Kod),
	IloscKomponentow INT NOT NULL
)
CREATE TABLE Zamowienia
(
	ID INT CONSTRAINT PK_Zamowienie PRIMARY KEY,
	IDKlienta INT CONSTRAINT FK_Klient REFERENCES Klienci(ID),
	KodProduktu VARCHAR(50) CONSTRAINT FK_Z_Produkt REFERENCES Produkty(Kod),
	Ilosc INT NOT NULL,
	Data DATE NOT NULL,
)
GO

-- Wpisywanie danych

INSERT INTO Produkty (Kod, Cena) VALUES ('SC2032F OP2', 13000)
INSERT INTO Produkty (Kod, Cena) VALUES ('SC TRIPLE OP2', 100000)
INSERT INTO Produkty (Kod, Cena) VALUES ('SC 3232 OP1', 8000)
INSERT INTO Produkty (Kod, Cena) VALUES ('SNOW', 6500)

INSERT INTO Dostawcy (ID, Nazwa, Adres) VALUES (100, 'DHL', 'Legnica, Rzeczpospolitej 116')
INSERT INTO Dostawcy (ID, Nazwa, Adres) VALUES (110, 'DPD', 'Kalisz, Wroc³awska 152')
INSERT INTO Dostawcy (ID, Nazwa, Adres) VALUES (120, 'Schenker', 'Zielona Góra, Logistyczna 4')
INSERT INTO Dostawcy (ID, Nazwa, Adres) VALUES (130, 'UPS', 'D³ugo³êka, Polna 29')
INSERT INTO Dostawcy (ID, Nazwa, Adres) VALUES (140, 'FedEx', 'Kalisz, Wojska Polskiego 13')

INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('LC1D09E7', 70, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('CAD32E7', 90, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('CAD50E7', 106, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('CAD32BD', 330, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('CAD50BD', 350, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('LC1D150P7', 830, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('LC1D150D7', 1920, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('LC1D150S7', 1360, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('LC1K0601E7', 90, 'Stycznik', 'Schneider', 100)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('TWDLCDE40DRF', 3220, 'Sterownik', 'Schneider', 110)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('TWDLCAA16DRF', 1150, 'Sterownik', 'Schneider', 110)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('TWDLCAE40DRF', 3620, 'Sterownik', 'Schneider', 110)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('SR2B121B', 475, 'Sterownik', 'Schneider', 110)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('1PC4A', 20, 'Wy³¹cznik nadpr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('1PB20A', 14, 'Wy³¹cznik nadpr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('3PC16A', 80, 'Wy³¹cznik nadpr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('3PC25A', 90, 'Wy³¹cznik nadpr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('2PC6A', 40, 'Wy³¹cznik nadpr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('1P63A', 26, 'Wy³¹cznik nadpr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('IC60N16A', 30, 'Wy³¹cznik nadpr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('Altivar 61 250kW', 72000, 'Falownik', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('4PD40A', 90, 'Wy³¹cznik ró¿nicowopr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('4PD25A', 75, 'Wy³¹cznik ró¿nicowopr¹dowy', 'Schneider', 120)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('AS 1/16', 110, 'Transformator', 'Elektrotechnik', 130)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('AS 1/17', 150, 'Transformator', 'Elektrotechnik', 130)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('AS 1/18', 240, 'Transformator', 'Elektrotechnik', 130)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('AS 3/33', 450, 'Transformator', 'Elektrotechnik', 130)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('ZDU2,5/4N', 6, 'Listwa', 'Weidmuller', 140)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('WPE16', 29, 'Listwa', 'Weidmuller', 140)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('EW35', 2, 'Listwa', 'Weidmuller', 140)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('ZDK4-2', 9, 'Listwa', 'Weidmuller', 140)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('WDU16', 5, 'Listwa', 'Weidmuller', 140)
INSERT INTO Komponenty (Kod, Cena, Typ, Producent, IDDostawcy) VALUES ('WDU16BL', 13, 'Listwa', 'Weidmuller', 140)

INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'CAD32E7', 5)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'CAD32BD', 10)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'LC1D150D7', 2)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'TWDLCAA16DRF', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', '1PC4A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', '1PB20A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'AS 1/16', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'ZDU2,5/4N', 25)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'WPE16', 3)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'EW35', 2)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'ZDK4-2', 12)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'WDU16', 3)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC2032F OP2', 'WDU16BL', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'CAD50BD', 10)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'LC1D150P7', 3)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'LC1D150S7', 5)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'TWDLCAE40DRF', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', '1P63A', 3)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'IC60N16A', 3)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'Altivar 61 250kW', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', '4PD40A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'AS 3/33', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'WPE16', 10)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'EW35', 8)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'WDU16', 9)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC TRIPLE OP2', 'WDU16BL', 3)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', 'LC1D09E7', 5)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', 'CAD50E7', 2)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', 'LC1K0601E7', 4)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', 'TWDLCDE40DRF', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', '3PC16A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', '3PC25A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', '2PC6A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', '4PD25A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', 'AS 1/18', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', 'ZDU2,5/4N', 20)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', 'EW35', 4)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SC 3232 OP1', 'ZDK4-2', 40)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'SR2B121B', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'AS 1/17', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'ZDU2,5/4N', 50)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'WPE16', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'EW35', 4)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'ZDK4-2', 36)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'WDU16', 3)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'WDU16BL', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'LC1D09E7', 6)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'CAD32E7', 5)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'CAD50E7', 6)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', 'CAD32BD', 3)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', '1PB20A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', '3PC16A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', '1P63A', 1)
INSERT INTO ListyMaterialowe (KodProduktu, KodKomponentu, IloscKomponentow) VALUES ('SNOW', '4PD40A', 1)

INSERT INTO Klienci (ID, Nazwa, Adres) VALUES (200, 'Scanclimber', 'Gniezno, Surowieckiego 9')
INSERT INTO Klienci (ID, Nazwa, Adres) VALUES (210, 'Snowmax', '¯ywiec, Batorego 16/7')

INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (1, 'SC2032F OP2', 200, 10, '20161120')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (2, 'SC2032F OP2', 200, 5, '20161122')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (3, 'SC 3232 OP1', 200, 5, '20161129')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (4, 'SC 3232 OP1', 200, 5, '20161210')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (5, 'SNOW', 210, 10, '20161217')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (6, 'SNOW', 210, 15, '20161220')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (7, 'SC 3232 OP1', 200, 10, '20170110')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (8, 'SC 3232 OP1', 200, 4, '20170114')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (9, 'SC2032F OP2', 200, 2, '20170120')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (10, 'SC2032F OP2', 200, 2, '20170206')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (11, 'SC 3232 OP1', 200, 5, '20170210')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (12, 'SC 3232 OP1', 200, 10, '20170214')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (13, 'SC TRIPLE OP2', 200, 3, '20170225')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (14, 'SNOW', 210, 15, '20170315')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (15, 'SNOW', 210, 20, '20170320')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (16, 'SC TRIPLE OP2', 200, 3, '20170324')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (17, 'SC TRIPLE OP2', 200, 3, '20170329')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (18, 'SC2032F OP2', 200, 5, '20170409')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (19, 'SC2032F OP2', 200, 6, '20170415')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (20, 'SC 3232 OP1', 200, 8, '20170425')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (21, 'SC 3232 OP1', 200, 3, '20170510')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (22, 'SC TRIPLE OP2', 200, 5, '20170517')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (23, 'SNOW', 210, 25, '20170520')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (24, 'SNOW', 210, 25, '20170610')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (25, 'SC TRIPLE OP2', 200, 3, '20170616')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (26, 'SC TRIPLE OP2', 200, 2, '20170624')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (27, 'SC2032F OP2', 200, 5, '20170709')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (28, 'SC2032F OP2', 200, 7, '20170713')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (29, 'SC 3232 OP1', 200, 10, '20170720')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (30, 'SC 3232 OP1', 200, 7, '20170814')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (31, 'SNOW', 210, 15, '20170825')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (32, 'SNOW', 210, 18, '20170913')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (33, 'SC2032F OP2', 200, 5, '20170920')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (34, 'SC2032F OP2', 200, 4, '20171009')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (35, 'SNOW', 210, 10, '20171020')
INSERT INTO Zamowienia (ID, KodProduktu, IDKlienta, Ilosc, Data) VALUES (36, 'SNOW', 210, 18, '20171102')

GO

-- Tworzenie raportów
IF OBJECT_ID('LacznaSprzedazProduktow', 'V') IS NOT NULL
DROP VIEW LacznaSprzedazProduktow
GO
CREATE VIEW LacznaSprzedazProduktow AS (
	SELECT P.Kod, MAX(P.Cena) AS CenaJednostkowa, SUM(Z.Ilosc) AS Sprzedano FROM Produkty P
	JOIN Zamowienia Z ON P.Kod = Z.KodProduktu
	GROUP BY P.Kod
)
GO
IF OBJECT_ID('ZuzycieKomponentow', 'V') IS NOT NULL
DROP VIEW ZuzycieKomponentow
GO
CREATE VIEW ZuzycieKomponentow AS (
	SELECT K.Kod, SUM(Z.Ilosc) * MAX(LM.IloscKomponentow) AS Zuzycie, SUM(Z.Ilosc) * MAX(LM.IloscKomponentow) * MAX(K.Cena) AS Koszt FROM Komponenty K
	JOIN ListyMaterialowe LM ON K.Kod = LM.KodKomponentu
	JOIN Zamowienia Z ON Z.KodProduktu = LM.KodProduktu
	GROUP BY K.Kod
)
GO
IF OBJECT_ID('KosztKomponentowWSzafie', 'V') IS NOT NULL
DROP VIEW KosztKomponentowWSzafie
GO
CREATE VIEW KosztKomponentowWSzafie AS (
	SELECT P.Kod, MAX(P.Cena) AS CenaProduktu, SUM(LM.IloscKomponentow * K.Cena) AS CenaKomponentow FROM Produkty P
	JOIN ListyMaterialowe LM ON P.Kod = LM.KodProduktu
	JOIN Komponenty K ON LM.KodKomponentu = K.Kod
	GROUP BY P.Kod
)
GO
IF OBJECT_ID('PrzegladZamowien', 'P') IS NOT NULL
DROP PROCEDURE PrzegladZamowien
GO
CREATE PROCEDURE PrzegladZamowien (@DataOd DATE) AS (
	SELECT * FROM Zamowienia
	WHERE Data >= @DataOd
)
GO
IF OBJECT_ID('ZapotrzebowanieKomponentow', 'P') IS NOT NULL
DROP PROCEDURE ZapotrzebowanieKomponentow
GO
CREATE PROCEDURE ZapotrzebowanieKomponentow (@kodProduktu VARCHAR(50), @iloscDoWykonania INT) AS (
	SELECT P.Kod, LM.KodKomponentu, LM.IloscKomponentow * @iloscDoWykonania AS £¹cznaIloœæ, K.Cena * LM.IloscKomponentow * @iloscDoWykonania AS £¹cznaCena FROM Produkty P
	JOIN ListyMaterialowe LM ON P.Kod = LM.KodProduktu
	JOIN Komponenty K ON LM.KodKomponentu = K.Kod
	WHERE P.Kod = @kodProduktu
)
GO


-- Wyœwetlenie raportów

SELECT * FROM LacznaSprzedazProduktow

SELECT * FROM ZuzycieKomponentow

SELECT * FROM KosztKomponentowWSzafie

EXEC PrzegladZamowien '2017-09-20'

EXEC ZapotrzebowanieKomponentow 'SC2032F OP2', 10