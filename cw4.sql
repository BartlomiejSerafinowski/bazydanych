--1. CREATE DATABASE firma;

--2. USE firma;

--3. CREATE SCHEMA rozliczenia;
--   CREATE TABLE rozliczenia.pracownicy (id_pracownika INTEGER PRIMARY KEY, imie VARCHAR(15) NOT NULL, nazwisko VARCHAR(30) NOT NULL, adres VARCHAR(50), telefon INTEGER);
--   CREATE TABLE rozliczenia.godziny (id_godziny INTEGER PRIMARY KEY, data DATE NOT NULL, liczba_godzin INTEGER, id_pracownika INTEGER NOT NULL);
--   CREATE TABLE rozliczenia.pensje (id_pensji INTEGER PRIMARY KEY, stanowisko VARCHAR(20) NOT NULL, kwota INTEGER, id_premii INTEGER NOT NULL);
--   CREATE TABLE rozliczenia.premie (id_premii INTEGER PRIMARY KEY, rodzaj VARCHAR(15) NOT NULL, kwota INTEGER);

--d)   ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
--     ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

--4. INSERT INTO rozliczenia.pracownicy VALUES(1, 'jan', 'baran', 'polna 2', 123456789);
--   INSERT INTO rozliczenia.pracownicy VALUES(2, 'adam', 'halna', 'polna 2', 123456789);
--   INSERT INTO rozliczenia.pracownicy VALUES(3, 'henryk', 'dolna', 'szybka 21', 975826572);
--   INSERT INTO rozliczenia.pracownicy VALUES(4, 'janusz', 'górny', 'wolna 22', 90146282);
--   INSERT INTO rozliczenia.pracownicy VALUES(5, 'janina', 'tandem', 'wiejska 63', 092752121);
--   INSERT INTO rozliczenia.pracownicy VALUES(6, 'anna', 'lezore', 'miejska 4', 582910467);
--   INSERT INTO rozliczenia.pracownicy VALUES(7, 'asia', 'centro', 'ceglana 91', 850262728);
--   INSERT INTO rozliczenia.pracownicy VALUES(8, 'jadwiga', 'janowski', 'brukowa 64', 109758538);
--   INSERT INTO rozliczenia.pracownicy VALUES(9, 'alina', 'zobacz', 'podgórska 45', 319050178);
--   INSERT INTO rozliczenia.pracownicy VALUES(10, 'jacek', 'mafijny', 'klubowa 1', 100953151);

--   INSERT INTO rozliczenia.godziny VALUES(1, '2007-12-03', 3, 2);
--   INSERT INTO rozliczenia.godziny VALUES(2, '2010-11-04', 31, 6);
--   INSERT INTO rozliczenia.godziny VALUES(3, '2015-06-11', 33, 5);
--   INSERT INTO rozliczenia.godziny VALUES(4, '2017-03-23', 1, 1);
--   INSERT INTO rozliczenia.godziny VALUES(5, '2003-01-01', 124, 9);
--   INSERT INTO rozliczenia.godziny VALUES(6, '2005-10-29', 5, 10);
--   INSERT INTO rozliczenia.godziny VALUES(7, '2000-07-15', 67, 4);
--   INSERT INTO rozliczenia.godziny VALUES(8, '2011-04-15', 86, 8);
--   INSERT INTO rozliczenia.godziny VALUES(9, '1999-01-19', 12, 7);
--   INSERT INTO rozliczenia.godziny VALUES(10, '2007-11-17', 2, 3);

--   INSERT INTO rozliczenia.pensje VALUES(1, 'dyrektor', 23331, 3);
--   INSERT INTO rozliczenia.pensje VALUES(2, 'zastêpca dyrektora', 3412, 2);
--   INSERT INTO rozliczenia.pensje VALUES(3, 'ksiêgowy', 1555, 4);
--   INSERT INTO rozliczenia.pensje VALUES(4, 'menad¿er', 1952, 1);
--   INSERT INTO rozliczenia.pensje VALUES(5, 'sprzedawca', 5161, 9);
--   INSERT INTO rozliczenia.pensje VALUES(6, 'analityk', 1355, 8);
--   INSERT INTO rozliczenia.pensje VALUES(7, 'fotograf', 2900, 6);
--   INSERT INTO rozliczenia.pensje VALUES(8, 'sekretarka', 2100, 7);
--   INSERT INTO rozliczenia.pensje VALUES(9, 'sprz¹taczka', 990, 5);
--   INSERT INTO rozliczenia.pensje VALUES(10, 'woŸny', 723, 10);

--   INSERT INTO rozliczenia.premie VALUES(1, 'coroczna', 200);
--   INSERT INTO rozliczenia.premie VALUES(2, 'coroczna', 200);
--   INSERT INTO rozliczenia.premie VALUES(3, 'za nadgodziny', 300);
--   INSERT INTO rozliczenia.premie VALUES(4, 'za kawkê', 250);
--   INSERT INTO rozliczenia.premie VALUES(5, 'œwi¹teczna', 100);
--   INSERT INTO rozliczenia.premie VALUES(6, 'za obowi¹zki', 50);
--   INSERT INTO rozliczenia.premie VALUES(7, 'sprzeda¿owa', 210);
--   INSERT INTO rozliczenia.premie VALUES(8, 'papierowa', 220);
--   INSERT INTO rozliczenia.premie VALUES(9, 'tajna', 10);
--   INSERT INTO rozliczenia.premie VALUES(10, 'za d³ug¹ s³u¿bê', 50);

--5. SELECT nazwisko, adres FROM rozliczenia.pracownicy;

--6. SELECT DATEPART(WEEKDAY, data) AS 'dzien tygodnia',
--   DATEPART(MONTH, data) AS  'miesi¹c'
--   FROM rozliczenia.godziny;

--7. ALTER TABLE rozliczenia.pensje 
--   CHANGE COLUMN kwota kwota_brutto;
--   ALTER TABLE rozliczenia.pensje
--   ADD kwota_netto INTEGER 
--   INSERT INTO rozliczenia.pensje(kwota_netto) VALUES (kwota_brutto * 0.81);

--7.v2 SELECT id_pensji, stanowisko, kwota AS kwota_brutto, kwota-(kwota*0.23) AS kwota_netto, id_premii FROM rozliczenia.pensje;