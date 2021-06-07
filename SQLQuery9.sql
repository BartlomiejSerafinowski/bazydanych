Create Database test;
USE test;

CREATE TABLE GeoEon 
(
	id_eon INTEGER PRIMARY KEY NOT NULL,
	nazwa_eon VARCHAR(15)
);
CREATE TABLE GeoEra 
(
	id_era INTEGER PRIMARY KEY NOT NULL,
	id_eon INTEGER FOREIGN KEY REFERENCES GeoEon(id_eon),
	nazwa_era VARCHAR(15)
);
CREATE TABLE GeoOkres 
(
	id_okres INTEGER PRIMARY KEY NOT NULL,
	id_era INTEGER FOREIGN KEY REFERENCES GeoEra(id_era),
	nazwa_okres VARCHAR(15)
);
CREATE TABLE GeoEpoka
(
	id_epoka INTEGER PRIMARY KEY NOT NULL,
	id_okres INTEGER FOREIGN KEY REFERENCES GeoOkres(id_okres),
	nazwa_epoka VARCHAR(15)
);
CREATE TABLE GeoPietro 
(
	id_pietro INTEGER PRIMARY KEY NOT NULL,
	id_epoka INTEGER FOREIGN KEY REFERENCES GeoEon(id_eon),
	nazwa_pietro VARCHAR(15)
);

CREATE TABLE GeoTabela AS
(
	SELECT * FROM GeoPietro JOIN GeoEpoka 
	JOIN GeoOkres JOIN GeoEra JOIN GeoEon
);

INSERT INTO GeoEon VALUES( '0' , 'Fanerozoik');
INSERT INTO GeoEra VALUES( '0' , '0', 'Paleozoik');
INSERT INTO GeoEra VALUES( '1' , '0', 'Mezozoik');
INSERT INTO GeoEra VALUES( '2' , '0', 'Kenozoik');
INSERT INTO GeoOkres VALUES( '0' , '0', 'Kambr');
INSERT INTO GeoOkres VALUES( '1' , '0', 'Ordowik');
INSERT INTO GeoOkres VALUES( '2' , '0', 'Sylur');
INSERT INTO GeoOkres VALUES( '3' , '0', 'Dewon');
INSERT INTO GeoOkres VALUES( '4' , '0', 'Karbon');
INSERT INTO GeoOkres VALUES( '5' , '0', 'Perm');
INSERT INTO GeoOkres VALUES( '6' , '1', 'Trias');
INSERT INTO GeoOkres VALUES( '7' , '1', 'Jura');
INSERT INTO GeoOkres VALUES( '8' , '1', 'Kreda');
INSERT INTO GeoOkres VALUES( '9' , '2', 'Paleogen');
INSERT INTO GeoOkres VALUES( '10' , '2', 'Neogen');
INSERT INTO GeoOkres VALUES( '11' , '2', 'Czwartorzed');
INSERT INTO GeoEpoka VALUES( '0' , '0', 'Oddzia³1');
INSERT INTO GeoEpoka VALUES( '1' , '0', 'Oddzia³2');
INSERT INTO GeoEpoka VALUES( '2' , '0', 'Oddzia³3');
INSERT INTO GeoEpoka VALUES( '3' , '0', 'Furong');
INSERT INTO GeoEpoka VALUES( '4' , '1', 'Dolny');
INSERT INTO GeoEpoka VALUES( '5' , '1', 'Œrodkowy');
INSERT INTO GeoEpoka VALUES( '6' , '1', 'Gorny');
INSERT INTO GeoEpoka VALUES( '7' , '2', 'Landower');
INSERT INTO GeoEpoka VALUES( '8' , '2', 'Wenlok');
INSERT INTO GeoEpoka VALUES( '9' , '2', 'Ludlow');
INSERT INTO GeoEpoka VALUES( '10' , '3', 'Dolny');
INSERT INTO GeoEpoka VALUES( '11' , '3', 'Œrodkowy');
INSERT INTO GeoEpoka VALUES( '12' , '3', 'Gorny');
INSERT INTO GeoEpoka VALUES( '13' , '4', 'Misisisip');
INSERT INTO GeoEpoka VALUES( '14' , '4', 'Pensylwan');
INSERT INTO GeoEpoka VALUES( '15' , '5', 'Cisural');
INSERT INTO GeoEpoka VALUES( '16' , '5', 'Gwadelup');
INSERT INTO GeoEpoka VALUES( '17' , '5', 'Loping');
INSERT INTO GeoEpoka VALUES( '18' , '6', 'Dolny');
INSERT INTO GeoEpoka VALUES( '19' , '6', 'Œrodkowy');
INSERT INTO GeoEpoka VALUES( '20' , '6', 'Gorny');
INSERT INTO GeoEpoka VALUES( '21' , '7', 'Dolny');
INSERT INTO GeoEpoka VALUES( '22' , '7', 'Œrodkowy');
INSERT INTO GeoEpoka VALUES( '23' , '7', 'Gorny');
INSERT INTO GeoEpoka VALUES( '24' , '8', 'Dolny');
INSERT INTO GeoEpoka VALUES( '25' , '8', 'Gorny');
INSERT INTO GeoEpoka VALUES( '26' , '9', 'Paleocen');
INSERT INTO GeoEpoka VALUES( '27' , '9', 'Eocen');
INSERT INTO GeoEpoka VALUES( '28' , '9', 'Oligocen');
INSERT INTO GeoEpoka VALUES( '29' , '10', 'Miocen');
INSERT INTO GeoEpoka VALUES( '30' , '10', 'Pliocen');
INSERT INTO GeoEpoka VALUES( '31' , '11', 'Plejstocen');
INSERT INTO GeoEpoka VALUES( '32' , '11', 'Holocen');
INSERT INTO GeoPietro VALUES( '0' , '0', 'Pietro1');
INSERT INTO GeoPietro VALUES( '1' , '0', 'Pietro2');
INSERT INTO GeoPietro VALUES( '2' , '1', 'Pietro3');
INSERT INTO GeoPietro VALUES( '3' , '1', 'Pietro4');
INSERT INTO GeoPietro VALUES( '4' , '2', 'Pietro5');
INSERT INTO GeoPietro VALUES( '5' , '2', 'Drum');
INSERT INTO GeoPietro VALUES( '6' , '2', 'Pietro7');
INSERT INTO GeoPietro VALUES( '7' , '3', 'Pietro8');
INSERT INTO GeoPietro VALUES( '8' , '3', 'Pietro9');
INSERT INTO GeoPietro VALUES( '9' , '3', 'Pietro10');
INSERT INTO GeoPietro VALUES( '10' , '4', 'Tremadok');
INSERT INTO GeoPietro VALUES( '11' , '4', 'Floj');
INSERT INTO GeoPietro VALUES( '12' , '5', 'Pietro3');
INSERT INTO GeoPietro VALUES( '13' , '5', 'Darriwil');
INSERT INTO GeoPietro VALUES( '14' , '6', 'Sandb');
INSERT INTO GeoPietro VALUES( '15' , '6', 'Kat');
INSERT INTO GeoPietro VALUES( '16' , '6', 'Hirnant');
INSERT INTO GeoPietro VALUES( '17' , '4', 'Tremadok');
INSERT INTO GeoPietro VALUES( '18' , '4', 'Floj');
INSERT INTO GeoPietro VALUES( '19' , '5', 'Pietro3');
INSERT INTO GeoPietro VALUES( '20' , '5', 'Darriwil');
INSERT INTO GeoPietro VALUES( '21' , '6', 'Sandb');
INSERT INTO GeoPietro VALUES( '22' , '6', 'Kat');
INSERT INTO GeoPietro VALUES( '23' , '6', 'Hirnant');
INSERT INTO GeoPietro VALUES( '24' , '7', 'Rhuddan');
INSERT INTO GeoPietro VALUES( '25' , '7', 'Aeron');
INSERT INTO GeoPietro VALUES( '26' , '7', 'Telych');
INSERT INTO GeoPietro VALUES( '27' , '8', 'Sheinwood');
INSERT INTO GeoPietro VALUES( '28' , '8', 'Homer');
INSERT INTO GeoPietro VALUES( '29' , '9', 'Gorst');
INSERT INTO GeoPietro VALUES( '30' , '9', 'Ludford');
INSERT INTO GeoPietro VALUES( '31' , '10', 'Lochkow');
INSERT INTO GeoPietro VALUES( '32' , '10', 'Prag');
INSERT INTO GeoPietro VALUES( '33' , '10', 'Ems');
INSERT INTO GeoPietro VALUES( '34' , '11', 'Eifel');
INSERT INTO GeoPietro VALUES( '35' , '11', '¯ywet');
INSERT INTO GeoPietro VALUES( '36' , '12', 'Fran');
INSERT INTO GeoPietro VALUES( '37' , '12', 'Famen');
INSERT INTO GeoPietro VALUES( '38' , '13', 'Turnej');
INSERT INTO GeoPietro VALUES( '39' , '13', 'Wizen');
INSERT INTO GeoPietro VALUES( '40' , '13', 'Serpuchow');
INSERT INTO GeoPietro VALUES( '41' , '14', 'Baszkir');
INSERT INTO GeoPietro VALUES( '42' , '14', 'Moskow');
INSERT INTO GeoPietro VALUES( '43' , '14', 'Kasimow');
INSERT INTO GeoPietro VALUES( '44' , '14', 'G¿el');
INSERT INTO GeoPietro VALUES( '45' , '15', 'Assel');
INSERT INTO GeoPietro VALUES( '46' , '15', 'Sakmar');
INSERT INTO GeoPietro VALUES( '47' , '15', 'Artynsk');
INSERT INTO GeoPietro VALUES( '48' , '15', 'Kungur');
INSERT INTO GeoPietro VALUES( '49' , '16', 'Road');
INSERT INTO GeoPietro VALUES( '50' , '16', 'Word');
INSERT INTO GeoPietro VALUES( '51' , '16', 'Capitan');
INSERT INTO GeoPietro VALUES( '52' , '17', 'Wucziaping');
INSERT INTO GeoPietro VALUES( '53' , '17', 'Czansing');


CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro 
	NATURAL JOIN GeoEpoka 
	NATURAL JOIN GeoOkres 
	NATURAL JOIN GeoEra 
	NATURAL JOIN GeoEon 
);

CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL 
JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon );


CREATE TABLE DZIESIEC
(
	cyfra int primary key,
	bit INT
);

INSERT INTO DZIESIEC VALUES(0, 0);
INSERT INTO DZIESIEC VALUES(1, 1);
INSERT INTO DZIESIEC VALUES(2, 10);
INSERT INTO DZIESIEC VALUES(3, 11);
INSERT INTO DZIESIEC VALUES(4, 100);
INSERT INTO DZIESIEC VALUES(5, 101);
INSERT INTO DZIESIEC VALUES(6, 110);
INSERT INTO DZIESIEC VALUES(7, 111);
INSERT INTO DZIESIEC VALUES(8, 1000);
INSERT INTO DZIESIEC VALUES(9, 1001);

CREATE TABLE Milion(liczba int,cyfra int, bit int);

INSERT INTO  Milion SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 10000*a6.cyfra AS liczba ,
a1.cyfra AS cyfra,
a1.bit AS bit 
FROM Dziesiec a1,
	 Dziesiec a2,
	 Dziesiec a3,
	 Dziesiec a4,
	 Dziesiec a5,
	 Dziesiec a6 ;

CREATE INDEX modmil ON Milion USING BTREE (mod(Milion.liczba, 105));
CREATE INDEX ON GeoTabela (id_pietro);
CREATE INDEX epoka ON GeoEpoka USING BTREE (id_epoka, nazwa_epoka);
CREATE INDEX okres ON GeoOkres USING BTREE (id_okres, nazwa_okres);
CREATE INDEX era ON GeoEra USING BTREE (id_era, nazwa_era);
CREATE INDEX eon ON GeoEon USING BTREE (id_eon, nazwa_eon);

DROP INDEX mil;
DROP INDEX epoka;
DROP INDEX okres;
DROP INDEX era;
DROP INDEX eon;
DROP INDEX modmil;
DROP INDEX geotab;

-- Z1
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela 
ON (%(Milion.liczba,105)=(GeoTabela.id_pietro));
CREATE INDEX mil ON Milion USING BTREE (liczba);
CREATE INDEX  geotab ON GeoTabela (id_pietro);
-- Z2
SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro 
ON %(Milion.liczba,68)=GeoPietro.id_pietro
NATURAL JOIN GeoEpoka 
NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;
-- Z3
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)= 
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,68)=(id_pietro));
-- Z4
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,68)=
(SELECT GeoPietro.id_pietro FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL JOIN 
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;