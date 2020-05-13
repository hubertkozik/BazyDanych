CREATE SCHEMA sklep;

CREATE TABLE sklep.Miejscowosci(
	IDKoduPocztowego SERIAL PRIMARY KEY,
	KodPocztowy VARCHAR(6) NOT NULL,
	NazwaMiejscowosci VARCHAR(40)
);

CREATE TABLE sklep.Dostawcy(
	IDDostawcy SERIAL PRIMARY KEY,
	NazwaDostawcy VARCHAR(40) NOT NULL,
	Ulica VARCHAR(40),
	NumerBudynku VARCHAR(8),
	IDKoduPocztowego SERIAL NOT NULL,
	FOREIGN KEY (IDKoduPocztowego) REFERENCES sklep.Miejscowosci(IDKoduPocztowego)
);
	
CREATE TABLE sklep.Produkty(
	IDProduktu SERIAL PRIMARY KEY,
	NazwaProduktu VARCHAR(50) NOT NULL,
	CenaNetto MONEY,
	CenaBrutto MONEY
);

CREATE TABLE sklep.Zamowienia(
	IDZamowienia SERIAL PRIMARY KEY,
	IDProduktu SERIAL NOT NULL,
	IDDostawcy SERIAL NOT NULL,
	FOREIGN KEY (IDDostawcy) REFERENCES sklep.Dostawcy(IDDostawcy),
	FOREIGN KEY (IDProduktu) REFERENCES sklep.Produkty(IDProduktu)
);

INSERT INTO sklep.Miejscowosci VALUES
(DEFAULT, '31-435','Kraków'),
(DEFAULT, '31-342','Kraków'),
(DEFAULT, '04-242','Lublin'),
(DEFAULT, '30-243','Tarnów'),
(DEFAULT, '35-434','Nowy Targ');

INSERT INTO sklep.Dostawcy VALUES
(DEFAULT, 'Makarony Polskie','Turystyczna','40',1),
(DEFAULT, 'Polskie przetwory','Wojska Polskiego','44a',2),
(DEFAULT, 'Lubelski Makaron','Piłsudskiego','332a',3),
(DEFAULT, 'Przetwory pomidorowe','Rolnicza','22/4',4),
(DEFAULT, 'Małopolskie smaki','Mickiewicza','223/77',5);

INSERT INTO sklep.Produkty VALUES
(DEFAULT, 'Makaron Nitki','130','150'),
(DEFAULT, 'Keczup pikantny','200','220'),
(DEFAULT, 'Sos pomidorowy','89','110');

INSERT INTO sklep.Zamowienia VALUES
(DEFAULT,1,1),
(DEFAULT,1,2),
(DEFAULT,2,3),
(DEFAULT,2,4),
(DEFAULT,3,3),
(DEFAULT,3,5);
