CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(
	id_pracownika SERIAL PRIMARY KEY, 
	imie VARCHAR(30) NOT NULL, 
	nazwisko VARCHAR(50) NOT NULL, 
	adres VARCHAR(100) NOT NULL, 
	telefon VARCHAR(10) NOT NULL
);

CREATE TABLE ksiegowosc.godziny(
	id_godziny SERIAL PRIMARY KEY, 
	data DATE NOT NULL, 
	liczba_godzin INT NOT NULL,
	id_pracownika SERIAL NOT NULL,
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika)
);

CREATE TABLE ksiegowosc.pensja(
	id_pensji SERIAL PRIMARY KEY, 
	stanowisko VARCHAR(30) NOT NULL, 
	kwota INT NOT NULL
);

CREATE TABLE ksiegowosc.premia(
	id_premii SERIAL PRIMARY KEY, 
	rodzaj VARCHAR(50) NOT NULL, 
	kwota INT NOT NULL
);

CREATE TABLE ksiegowosc.wynagrodzenie(
	id_wynagrodzenia SERIAL PRIMARY KEY, 
	data DATE, 
	id_pracownika SERIAL, 
	id_godziny SERIAL, 
	id_pensji SERIAL, 
	id_premii SERIAL,
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika),
	FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
	FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji),
	FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii)
); 

INSERT INTO ksiegowosc.pracownicy VALUES
(DEFAULT, 'Hubert', 'Kozik', 'Wielgus 27', '456978123'),
(DEFAULT, 'Wiktoria', 'Bilska', 'Gorlice ul. Moja 20a', '665544123'),
(DEFAULT, 'Adam', 'Kalinowski', 'Skalbmierz 53a', '123456789'),
(DEFAULT, 'Jan', 'Kowalski', 'Kraków ul. Aleja Pokoju 34', '789456123'),
(DEFAULT, 'Antoni', 'Nowak', 'Wielgus 36', '654987312'),
(DEFAULT, 'Bartłomiej', 'Kusek', 'Kraków ul. Zdunów 18c', '654781239'),
(DEFAULT, 'Bartosz', 'Majdan', 'Przemyśl ul. Piękna 3', '123654753'),
(DEFAULT, 'Aneta', 'Juszczyk', 'Czarnocin 68', '951156789'),
(DEFAULT, 'Olga', 'Markiewicz', 'Katowice ul. Na spodku 52a/13', '753159654'),
(DEFAULT, 'Tacjana', 'Nowak', 'Koryto 13', '789357951');

INSERT INTO ksiegowosc.godziny VALUES 
(DEFAULT, '2020-03-20', 177, 1),
(DEFAULT, '2020-04-13', 159, 2),
(DEFAULT, '2020-01-05', 167, 3),
(DEFAULT, '2020-03-06', 201, 4),
(DEFAULT, '2020-04-05', 168, 5),
(DEFAULT, '2020-04-17', 169, 6),
(DEFAULT, '2020-01-15', 173, 7),
(DEFAULT, '2020-02-16', 178, 8),
(DEFAULT, '2020-03-28', 158, 9),
(DEFAULT, '2020-03-05', 178, 10);

INSERT INTO ksiegowosc.premia VALUES
(DEFAULT, 'za dobre sprawowanie', 300),
(DEFAULT, 'na dzieci', 500),
(DEFAULT, 'extra', 100),
(DEFAULT, 'za paliwo', 50),
(DEFAULT, 'duza premia', 1000),
(DEFAULT, 'mala premia', 200),
(DEFAULT, 'srednia premia', 500),
(DEFAULT, 'turbo premia', 2500),
(DEFAULT, 'tylko dla prezesa', 10000),
(DEFAULT, 'bonusik', 150);

INSERT INTO ksiegowosc.pensja VALUES
(DEFAULT, 'prezes', 15000),
(DEFAULT, 'sprzataczka', 2500),
(DEFAULT, 'kierowca', 2500),
(DEFAULT, 'sekretarka', 2500),
(DEFAULT, 'wozny', 2500),
(DEFAULT, 'zastepca prezesa', 2500),
(DEFAULT, 'portier', 2500),
(DEFAULT, 'wycinacz na plazmie', 2500),
(DEFAULT, 'ochroniarz', 2500),
(DEFAULT, 'budowlaniec', 2500);
 
INSERT INTO ksiegowosc.wynagrodzenie VALUES
(DEFAULT, '2020-05-03', 6, 6, 3, 7),
(DEFAULT, '2020-05-04', 2, 2, 10, 1),
(DEFAULT, '2020-05-03', 9, 9, 2, 2),
(DEFAULT, '2020-05-05', 3, 3, 8, 6),
(DEFAULT, '2020-05-04', 8, 8, 5, 2),
(DEFAULT, '2020-05-04', 5, 5, 7, 1),
(DEFAULT, '2020-05-03', 4, 4, 6, 5),
(DEFAULT, '2020-05-02', 7, 7, 4, 4),
(DEFAULT, '2020-05-02', 1, 1, 9, 8),
(DEFAULT, '2020-05-06', 10, 10, 1, 10);

--A
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;
--B
SELECT id_pracownika, kwota FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE pensja.id_pensji=wynagrodzenie.id_pensji AND kwota > 1000  
--C
SELECT imie, nazwisko FROM ksiegowosc.pracownicy WHERE pensja.id_pensji=wynagrodzenie.id_pensji AND kwota>2000 AND id_premii IS NULL
--D
SELECT imie, nazwisko FROM ksiegowosc.pracownicy WHERE pracownicy.imie LIKE 'J%'
--E
SELECT imie, nazwisko FROM ksiegowosc.pracownicy WHERE pracownicy.nazwisko LIKE 'N%' AND pracownicy.nazwisko LIKE '%a'
--F
SELECT imie, nazwisko, liczba_godzin-160 AS nadgodziny FROM ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.godziny WHERE wynagrodzenie.id_pracownika=pracownicy.id_pracownika AND wynagrodzenie.id_godziny=godziny.id_godziny AND liczba_godzin-160>0
--G
SELECT imie, nazwisko FROM ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.pensja WHERE wynagrodzenie.id_pracownika=pracownicy.id_pracownika AND wynagrodzenie.id_pensji=pensja.id_pensji AND pensja.kwota BETWEEN 1500 AND 3000
--H
SELECT imie, nazwisko FROM ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.godziny WHERE wynagrodzenie.id_pracownika=pracownicy.id_pracownika AND wynagrodzenie.id_godziny=godziny.id_godziny AND liczba_godzin-160>0 AND id_premii IS NULL
--I
SELECT * FROM ksiegowosc.pensja, ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy WHERE wynagrodzenie.id_pensji=pensja.id_pensji ORDER BY pensja.kwota ASC
--J
SELECT * FROM ksiegowosc.pensja, ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.premia WHERE wynagrodzenie.id_pensji=pensja.id_pensji ORDER BY pensja.kwota DESC, premia.kwota DESC
--K
SELECT COUNT(pracownicy.id_pracownika) FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja WHERE wynagrodzenie.id_pracownika=pracownicy.id_pracownika AND wynagrodzenie.id_pensji = pensja.id_pensji GROUP BY pensja.stanowisko
--L
SELECT stanowisko,ROUND(AVG(kwota)) AS srednia_płaca, MIN(kwota) AS płaca_min, MAX(kwota) AS płaca_max FROM ksiegowosc.pensja GROUP BY stanowisko HAVING stanowisko LIKE 'prezes';
--M
SELECT SUM(kwota) FROM ksiegowosc.pensja
--N
SELECT SUM(kwota), stanowisko FROM ksiegowosc.pensja GROUP BY stanowisko
--O
SELECT COUNT(premia.id_premii), stanowisko FROM ksiegowosc.pensja, ksiegowosc.wynagrodzenie, ksiegowosc.premia WHERE wynagrodzenie.id_premii = premia.id_premii AND wynagrodzenie.id_pensji = pensja.id_pensji GROUP BY pensja.stanowisko
--P
DELETE FROM ksiegowosc.wynagrodzenie USING ksiegowosc.pensja WHERE pensja.kwota <1200 AND wynagrodzenie.id_pensji = pensja.id_pensji
