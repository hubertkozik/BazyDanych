CREATE TABLE pracownicy (
	id_pracownika SERIAL PRIMARY KEY,
	imie VARCHAR(40) NOT NULL,
	nazwisko VARCHAR(60) NOT NULL,
	adres VARCHAR(100) NOT NULL,
	telefon VARCHAR(9) NOT NULL
);

CREATE TABLE godziny (
	id_godziny SERIAL PRIMARY KEY,
	data DATE,
	liczba_godzin int NOT NULL,
	id_pracownika SERIAL NOT NULL
);

CREATE TABLE pensje (
	id_pensji SERIAL PRIMARY KEY,
	stanowisko varchar(50),
	kwota int NOT NULL,
	id_premii SERIAL NOT NULL
);

CREATE TABLE premie (
	id_premii SERIAL PRIMARY KEY,
	rodzaj varchar(50),
	kwota int NOT NULL
);

ALTER TABLE godziny 
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);

ALTER TABLE pensje 
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);

INSERT INTO pracownicy (imie, nazwisko, adres, telefon)
VALUES ( 'Hubert', 'Kozik', 'Wielgus 27', '456978123'),
( 'Wiktoria', 'Bilska', 'Gorlice ul. Moja 20a', '665544123'),
( 'Adam', 'Kalinowski', 'Skalbmierz 53a', '123456789'),
( 'Jan', 'Kowalski', 'Kraków ul. Aleja Pokoju 34', '789456123'),
( 'Antoni', 'Nowak', 'Wielgus 36', '654987312'),
( 'Bartłomiej', 'Kusek', 'Kraków ul. Zdunów 18c', '654781239'),
( 'Bartosz', 'Majdan', 'Przemyśl ul. Piękna 3', '123654753'),
( 'Aneta', 'Juszczyk', 'Czarnocin 68', '951156789'),
( 'Olga', 'Markiewicz', 'Katowice ul. Na spodku 52a/13', '753159654'),
( 'Tacjana', 'Nowak', 'Koryto 13', '789357951');

INSERT INTO godziny (data, liczba_godzin, id_pracownika)
VALUES ( '2020-03-30', 10, (SELECT id_pracownika FROM pracownicy WHERE imie='Aneta' AND nazwisko='Juszczyk')),
( '2020-03-30', 8, (SELECT id_pracownika FROM pracownicy WHERE imie='Wiktoria' AND nazwisko='Bilska')),
( '2020-03-30', 9, (SELECT id_pracownika FROM pracownicy WHERE imie='Adam' AND nazwisko='Kalinowski')),
( '2020-03-30', 6, (SELECT id_pracownika FROM pracownicy WHERE imie='Jan' AND nazwisko='Kowalski')),
( '2020-03-30', 8, (SELECT id_pracownika FROM pracownicy WHERE imie='Antoni' AND nazwisko='Nowak')),
( '2020-03-29', 6, (SELECT id_pracownika FROM pracownicy WHERE imie='Wiktoria' AND nazwisko='Bilska')),
( '2020-03-28', 10, (SELECT id_pracownika FROM pracownicy WHERE imie='Antoni' AND nazwisko='Nowak')),
( '2020-03-28', 12, (SELECT id_pracownika FROM pracownicy WHERE imie='Olga' AND nazwisko='Markiewicz')),
( '2020-03-27', 5, (SELECT id_pracownika FROM pracownicy WHERE imie='Aneta' AND nazwisko='Juszczyk')),
( '2020-03-26', 7, (SELECT id_pracownika FROM pracownicy WHERE imie='Jan' AND nazwisko='Kowalski'));

INSERT INTO premie (rodzaj, kwota)
VALUES ( 'za dobre sprawowanie', 300),
( 'na dzieci', 500),
( 'extra', 100),
( 'za paliwo', 50),
( 'duza premia', 1000),
( 'mala premia', 200),
( 'srednia premia', 500),
( 'turbo premia', 2500),
( 'tylko dla prezesa', 10000),
( 'bonusik', 150);

INSERT INTO pensje (stanowisko, kwota, id_premii)
VALUES ( 'prezes', 15000, (SELECT id_premii FROM premie WHERE rodzaj='tylko dla prezesa')),
( 'sprzataczka', 2500, (SELECT id_premii FROM premie WHERE rodzaj='na dzieci')),
( 'kierowca', 2500, (SELECT id_premii FROM premie WHERE rodzaj='za paliwo')),
( 'sekretarka', 2500, (SELECT id_premii FROM premie WHERE rodzaj='turbo premia')),
( 'wozny', 2500, (SELECT id_premii FROM premie WHERE rodzaj='bonusik')),
( 'zastepca prezesa', 2500, (SELECT id_premii FROM premie WHERE rodzaj='duza premia')),
( 'portier', 2500, (SELECT id_premii FROM premie WHERE rodzaj='extra')),
( 'wycinacz na plazmie', 2500, (SELECT id_premii FROM premie WHERE rodzaj='srednia premia')),
( 'ochroniarz', 2500, (SELECT id_premii FROM premie WHERE rodzaj='extra')),
( 'budowlaniec', 2500, (SELECT id_premii FROM premie WHERE rodzaj='na dzieci'));