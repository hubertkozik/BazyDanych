CREATE SCHEMA dentynsta;

CREATE TABLE dentynsta.Pracownicy(
	IDPracownika VARCHAR(6) NOT NULL PRIMARY KEY,
	ImiePracownika VARCHAR(30) NOT NULL,
	NazwiskoPracownika VARCHAR(60) NOT NULL
);

CREATE TABLE dentynsta.Pacjenci(
	IDPacjenta VARCHAR(6) NOT NULL PRIMARY KEY,
	ImiePacjenta VARCHAR(30) NOT NULL,
	NazwiskoPacjenta VARCHAR(60) NOT NULL
);

CREATE TABLE dentynsta.TypyZabiegow(
	IDZabiegu VARCHAR(4) NOT NULL PRIMARY KEY,
	NazwaZabiegu VARCHAR(40)
);

CREATE TABLE dentynsta.Wizyty(
	IDWizyty SERIAL PRIMARY KEY,
	DataWizyty DATE NOT NULL,
	IDPacjenta VARCHAR(6),
	IDZabiegu VARCHAR(4),
	IDPracownika VARCHAR(6),
	FOREIGN KEY (IDPacjenta) REFERENCES dentynsta.Pacjenci(IDPacjenta),
	FOREIGN KEY (IDZabiegu) REFERENCES dentynsta.TypyZabiegow(IDZabiegu),
	FOREIGN KEY (IDPracownika) REFERENCES dentynsta.Pracownicy(IDPracownika)
);

INSERT INTO dentynsta.Pracownicy VALUES
('S1011','Maria','Nowak'),
('S1024','Jan','Kowalski'),
('S1034','Marek','Potocki'),
('S1045','Anna','Jabłońska');

INSERT INTO dentynsta.Pacjenci VALUES
('P100','Anna','Jeleń'),
('P105','Jarosław','Nicpoń'),
('P108','Joanna','Nosek'),
('P120','Jan','Kałuża'),
('P123','Olga','Nowacka'),
('P130','Jerzy','Lis');

INSERT INTO dentynsta.TypyZabiegow VALUES
('Z496','Lakowanie'),
('Z500','Borowanie'),
('Z503','Usuwanie kamienia');

INSERT INTO dentynsta.Wizyty VALUES
(DEFAULT, '2020-03-12 10:00','P100','Z500','S1011'),
(DEFAULT, '2020-03-12 13:00','P105','Z496','S1011'),
(DEFAULT, '2020-03-12 15:00','P123','Z503','S1034'),
(DEFAULT, '2020-03-14 10:00','P108','Z500','S1011'),
(DEFAULT, '2020-03-16 17:00','P108','Z503','S1024'),
(DEFAULT, '2020-03-18 09:00','P120','Z500','S1045'),
(DEFAULT, '2020-03-20 08:00','P130','Z496','S1034');
