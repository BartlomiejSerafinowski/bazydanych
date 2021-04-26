/*Æw 6a =============================================================================================================== */

	   /*
	   CREATE TABLE ksiegowosc.zamowienia (
	   id_produktu int NOT NULL PRIMARY KEY,
	   nazwa_produktu varchar(30) UNIQUE,
	   id_klienta int NOT NULL UNIQUE,
	   nazwa_klienta varchar(40) NOT NULL UNIQUE,
	   data_zamowienia date,
	   cena_produktu money,
	   ilosc int,
	   suma_netto money,
	   suma_brutto money
	   );

	   
	   id_produktu -> nazwa_produktu, cena_produktu, VAT
	   id_klienta -> nazwa_klienta
	   data_zamowienia -> id_klienta, id_produktu
	   nazwa_produktu -> ilosc, suma_brutto, suma_netto
	   suma_brutto -> suma_netto, VAT, data_zamowienia
	   

	   ALTER TABLE ksiegowosc.zamowienia 
	   ADD vat AS
		   CASE 
			WHEN (nazwa_produktu = 'ksiazki') THEN 0.05
			WHEN (nazwa_produktu = 'bulki') THEN 0.08
			WHEN (nazwa_produktu = 'rurki') THEN 0.07
			WHEN (nazwa_produktu = 'papier') THEN 0.03
			ELSE 0.1
		   END

	   update ksiegowosc.zamowienia
	   set suma_brutto = suma_netto + vat;

	   CREATE TABLE ksiegowosc.pomieszczenia (
	   id_pomieszczenia int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	   numer_pomieszczenia int NOT NULL,
	   id_budynku int UNIQUE NOT NULL,
	   powierzchnia int NOT NULL,
	   liczba_okien int,
	   liczba_drzwi int,
	   ulica varchar(30),
	   miasto varchar(30) NOT NULL,
	   kod_pocztowy varchar(30) UNIQUE NOT NULL,
	   );

	   /*
	   id_pomieszczenia -> numer_pomieszczenia, id_budynku
	   numer_pomieszczenia -> id_budynku
	   id_budynku -> powierzchnia, liczba_okien, liczba_drzwi, ulica
	   ulica -> miasto, kod_pocztowy
	   miasto -> kod_pocztowy
	   */
	   

		/*  Æw 6b  */

	a)  ALTER TABLE ksiegowosc.pracownicy
		ALTER COLUMN telefon varchar(15);

		SELECT CONCAT(imie,' ', nazwisko,' ', '(+48)'+telefon)
		FROM ksiegowosc.pracownicy;
		

-		UPDATE ksiegowosc.pracownicy
		SET telefon = SUBSTRING(telefon, 1, 8) + '-' +
			      SUBSTRING(telefon, 9, 3) + '-' +
			      SUBSTRING(telefon, 12, 4);

		SELECT UPPER(nazwisko)
		FROM ksiegowosc.pracownicy
		WHERE LEN(nazwisko) = (SELECT MAX(LEN(nazwisko)) FROM ksiegowosc.pracownicy);
	

		SELECT HASHBYTES('MD5', nazwisko) AS nazwisko
		FROM ksiegowosc.pracownicy;
		

		SELECT imie, nazwisko, ksiegowosc.pensje.kwota AS pensja, ksiegowosc.premie.kwota AS premia
		FROM ksiegowosc.pracownicy
		LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
		LEFT JOIN ksiegowosc.pensje ON pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
		LEFT JOIN ksiegowosc.premie ON premie.id_premii = ksiegowosc.wynagrodzenie.id_premii;
		

		SELECT 
		CONCAT(
			'Pracownik ',
			imie,' ',
			nazwisko,', ', 
			'w dniu ',
			godziny.data,
			' otrzyma³ pensjê ca³kowit¹ na kwotê ',
			pensje.kwota+premie.kwota+(godziny.liczba_godzin*40),
			' z³, gdzie wynagrodzenie zasadznicze wynosi³o: ',
			pensje.kwota, 
			', premia: ',
			premie.kwota, 
			', nadgodziny: ',
			godziny.liczba_godzin*40
			)
		FROM ksiegowosc.pracownicy
		JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
		JOIN ksiegowosc.pensje ON pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
		JOIN ksiegowosc.premie ON premie.id_premii = ksiegowosc.wynagrodzenie.id_premii
		JOIN ksiegowosc.godziny ON godziny.id_godziny = ksiegowosc.wynagrodzenie.id_godziny
		WHERE ksiegowosc.godziny.liczba_godzin > 160;

		*/