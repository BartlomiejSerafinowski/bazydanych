/* CREATE DATABASE firma1;
   USE firma1;
1. CREATE SCHEMA ksiegowosc;

   CREATE TABLE ksiegowosc.pracownicy (id_pracownika INTEGER PRIMARY KEY, imie VARCHAR(15) NOT NULL, nazwisko VARCHAR(30) NOT NULL, adres VARCHAR(50), telefon INTEGER);
   CREATE TABLE ksiegowosc.godziny (id_godziny INTEGER PRIMARY KEY, data DATE NOT NULL, liczba_godzin INTEGER, id_pracownika INTEGER NOT NULL);
   CREATE TABLE ksiegowosc.pensje (id_pensji INTEGER PRIMARY KEY, stanowisko VARCHAR(20) NOT NULL, kwota MONEY, id_premii INTEGER );
   CREATE TABLE ksiegowosc.premie (id_premii INTEGER PRIMARY KEY, rodzaj VARCHAR(15) NOT NULL, kwota MONEY);
2. CREATE TABLE ksiegowosc.wynagrodzenie (id_wynagrodzenia INTEGER PRIMARY KEY, data DATE NOT NULL, id_pracownika INTEGER NOT NULL, id_godziny INTEGER NOT NULL, id_pensji INTEGER NOT NULL, id_premii INTEGER NOT NULL);

   ALTER TABLE ksiegowosc.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
   ALTER TABLE ksiegowosc.pensje ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);

3. ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
   ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
   ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);
   ALTER TABLE ksiegowosc.wynagrodzenie ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii); 

4. COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tutaj mamy pracowników';
   COMMENT ON TABLE ksiegowosc.godziny IS 'Tutaj mamy godziny';
   COMMENT ON TABLE ksiegowosc.pensje IS 'Tutaj mamy pensje';
   COMMENT ON TABLE ksiegowosc.premie IS 'Tutaj mamy premie';
   COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tutaj mamy wynagrodzenie'; 

   INSERT INTO ksiegowosc.pracownicy VALUES(1, 'jan', 'baran', 'polna 2', 123456789);
   INSERT INTO ksiegowosc.pracownicy VALUES(2, 'adam', 'halna', 'polna 2', 123456789);
   INSERT INTO ksiegowosc.pracownicy VALUES(3, 'henryk', 'dolna', 'szybka 21', 975826572);
   INSERT INTO ksiegowosc.pracownicy VALUES(4, 'janusz', 'górny', 'wolna 22', 90146282);
   INSERT INTO ksiegowosc.pracownicy VALUES(5, 'janina', 'tandem', 'wiejska 63', 092752121);
   INSERT INTO ksiegowosc.pracownicy VALUES(6, 'anna', 'lezore', 'miejska 4', 582910467);
   INSERT INTO ksiegowosc.pracownicy VALUES(7, 'asia', 'centro', 'ceglana 91', 850262728);
   INSERT INTO ksiegowosc.pracownicy VALUES(8, 'jadwiga', 'janowski', 'brukowa 64', 109758538);
   INSERT INTO ksiegowosc.pracownicy VALUES(9, 'alina', 'zobacz', 'podgórska 45', 319050178);
   INSERT INTO ksiegowosc.pracownicy VALUES(10, 'jacek', 'mafijny', 'klubowa 1', 100953151);

   INSERT INTO ksiegowosc.godziny VALUES(1, '2007-12-03', 3, 2);
   INSERT INTO ksiegowosc.godziny VALUES(2, '2010-11-04', 31, 6);
   INSERT INTO ksiegowosc.godziny VALUES(3, '2015-06-11', 33, 5);
   INSERT INTO ksiegowosc.godziny VALUES(4, '2017-03-23', 1, 1);
   INSERT INTO ksiegowosc.godziny VALUES(5, '2003-01-01', 124, 9);
   INSERT INTO ksiegowosc.godziny VALUES(6, '2005-10-29', 5, 10);
   INSERT INTO ksiegowosc.godziny VALUES(7, '2000-07-15', 67, 4);
   INSERT INTO ksiegowosc.godziny VALUES(8, '2011-04-15', 86, 8);
   INSERT INTO ksiegowosc.godziny VALUES(9, '1999-01-19', 12, 7);
   INSERT INTO ksiegowosc.godziny VALUES(10, '2007-11-17', 2, 3);
   INSERT INTO ksiegowosc.godziny VALUES(11, '2007-11-17', 170, 5);
   INSERT INTO ksiegowosc.godziny VALUES(12, '2007-11-17', 215, 5);

   INSERT INTO ksiegowosc.pensje VALUES(1, 'dyrektor', 23331, 3);
   INSERT INTO ksiegowosc.pensje VALUES(2, 'zastêpca dyrektora', 3412, 2);
   INSERT INTO ksiegowosc.pensje VALUES(3, 'ksiêgowy', 1555, 4);
   INSERT INTO ksiegowosc.pensje VALUES(4, 'menad¿er', 1952, 1);
   INSERT INTO ksiegowosc.pensje VALUES(5, 'sprzedawca', 5161, 9);
   INSERT INTO ksiegowosc.pensje VALUES(6, 'analityk', 1355, 8);
   INSERT INTO ksiegowosc.pensje VALUES(7, 'fotograf', 2900, 6);
   INSERT INTO ksiegowosc.pensje VALUES(8, 'sekretarka', 2100, 7);
   INSERT INTO ksiegowosc.pensje VALUES(9, 'sprz¹taczka', 990, 5);
   INSERT INTO ksiegowosc.pensje VALUES(10, 'woŸny', 723, 10);

   INSERT INTO ksiegowosc.premie VALUES(1, 'coroczna', 200);
   INSERT INTO ksiegowosc.premie VALUES(2, 'coroczna', 200);
   INSERT INTO ksiegowosc.premie VALUES(3, 'za nadgodziny', 300);
   INSERT INTO ksiegowosc.premie VALUES(4, 'za kawkê', 250);
   INSERT INTO ksiegowosc.premie VALUES(5, 'œwi¹teczna', 100);
   INSERT INTO ksiegowosc.premie VALUES(6, 'za obowi¹zki', 50);
   INSERT INTO ksiegowosc.premie VALUES(7, 'sprzeda¿owa', 210);
   INSERT INTO ksiegowosc.premie VALUES(8, 'papierowa', 220);
   INSERT INTO ksiegowosc.premie VALUES(9, 'tajna', 10);
   INSERT INTO ksiegowosc.premie VALUES(10, 'za d³ug¹ s³u¿bê', 50); 

5. INSERT INTO ksiegowosc.wynagrodzenie VALUES(1, '2007-11-18', 1, 1, 1, 1);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(2, '2013-11-19', 6, 5, 1, 3);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(3, '2000-11-17', 8, 1, 8, 10);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(4, '2006-11-17', 7, 9, 2, 4);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(5, '2007-11-11', 3, 4, 5, 9);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(6, '2007-11-16', 1, 7, 10, 5);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(7, '2010-11-15', 7, 2, 1, 3);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(8, '2007-11-14', 6, 3, 4, 2);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(9, '2018-11-17', 8, 4, 2, 3);
   INSERT INTO ksiegowosc.wynagrodzenie VALUES(10, '2020-10-17', 10, 10, 10, 5); 

6. SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

   SELECT pracownicy.id_pracownika, pensje.kwota
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   WHERE pensje.kwota > 1000; 
   
 - SELECT pracownicy.id_pracownika, pensje.kwota, premie.id_premii
   FROM ksiegowosc.premie, ksiegowosc.pracownicy, ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie AS a ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.wynagrodzenie AS b ON wynagrodzenie.id_premii = premie.id_premii
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   WHERE pensje.kwota > 2000
   AND premie.id_premii IS NULL; 

   SELECT id_pracownika, imie 
   FROM ksiegowosc.pracownicy
   WHERE imie LIKE 'j%';

   SELECT id_pracownika, imie 
   FROM ksiegowosc.pracownicy
   WHERE nazwisko LIKE '%n' AND imie LIKE '%a'; 

   SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin-160 AS liczba_nadgodzin
   FROM ksiegowosc.godziny
   INNER JOIN ksiegowosc.pracownicy ON godziny.id_pracownika = pracownicy.id_pracownika
   WHERE godziny.liczba_godzin > 160 ;  

   SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   WHERE pensje.kwota BETWEEN 1499 AND 3001;  

-  SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, premie.id_premii, godziny.liczba_godzin-160 AS liczba_nadgodzin
   FROM ksiegowosc.godziny, premie.id_premii
   INNER JOIN ksiegowosc.pracownicy ON godziny.id_pracownika = pracownicy.id_pracownika
   INNER JOIN ksiegowosc.wynagrodzenia AS p ON wynagrodzenia.id_pracownika = pracownicy.id_pracownika
   INNER JOIN ksiegowosc.wynagrodzenia AS z ON wynagrodzenia.id_premii = premie.id_premii
   WHERE godziny.liczba_godzin > 160 ;   

   SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   ORDER BY pensje.kwota desc; 

 - pensje i premie desc 

   SELECT count(pensje.id_pensji) AS ilosc_os_zatrudnionych, pensje.stanowisko
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   GROUP BY pensje.stanowisko;  

   SELECT AVG(pensje.kwota) AS srednia_placa_dyrektora
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   WHERE pensje.stanowisko = 'dyrektor';
   
	   SELECT MIN(pensje.kwota) AS min_placa_dyrektora
	   FROM ksiegowosc.pensje
	   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	   WHERE pensje.stanowisko = 'dyrektor';

	   SELECT MAX(pensje.kwota) AS max_placa_dyrektora
	   FROM ksiegowosc.pensje
	   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
	   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
	   WHERE pensje.stanowisko = 'dyrektor'; 

   SELECT SUM(pensje.kwota) AS suma_pensji
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika; 

   SELECT SUM(pensje.kwota) AS suma_plac, pensje.stanowisko
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   GROUP BY pensje.stanowisko; 

 - SELECT COUNT(premie.id_premii) AS suma_premii
   FROM ksiegowosc.premie
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_premii = premie.id_premii
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika; 

-  DELETE ksiegowosc.pracownicy
   FROM ksiegowosc.pensje
   INNER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensje.id_pensji
   INNER JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
   WHERE pensje.kwota < 1200;  */




