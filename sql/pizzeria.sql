CREATE TABLE klienci (
  ID_klienta SERIAL PRIMARY KEY NOT NULL,
  imie varchar NOT NULL,
  nazwisko varchar NOT NULL, 
  ulica varchar NOT NULL,
  nr_domu varchar NOT NULL,
  kod_pocztowy varchar NOT NULL,
  miejscowosc varchar NOT NULL
);



CREATE TABLE konta (
  ID_konta SERIAL PRIMARY KEY NOT NULL,
  ID_klienta INTEGER NOT NULL,
  login varchar NOT NULL,
  haslo varchar NOT NULL
);


CREATE TABLE produkty (
  ID_produktu SERIAL PRIMARY KEY NOT NULL,
  nazwa varchar NOT NULL,
  kategoria varchar NOT NULL
);


CREATE TABLE dane_produktow (
  ID_produktu INTEGER NOT NULL,
  cena INTEGER NOT NULL
);

  

CREATE TABLE kelnerzy (
  ID_kelnera SERIAL PRIMARY KEY NOT NULL,
  imie varchar NOT NULL,
  nazwisko varchar NOT NULL,
  telefon INTEGER NOT NULL
);

  
  
  
CREATE TABLE dane_kelnerow (
  ID_kelnera SERIAL PRIMARY KEY NOT NULL,
  pesel BIGINT NOT NULL,
  ulica varchar NOT NULL,
  nr_domu varchar NOT NULL,
  kod_pocztowy varchar NOT NULL,
  miejscowosc varchar NOT NULL,
  pensja INTEGER NOT NULL
);


  
CREATE TABLE dostawcy (
  ID_dostawcy SERIAL PRIMARY KEY NOT NULL,
  imie varchar NOT NULL,
  nazwisko varchar NOT NULL,
  telefon INTEGER NOT NULL
);


CREATE TABLE dane_dostawcow (
  ID_dostawcy SERIAL PRIMARY KEY NOT NULL,
  pesel BIGINT NOT NULL,
  ulica varchar NOT NULL,
  nr_domu varchar NOT NULL,
  kod_pocztowy varchar NOT NULL,
  miejscowosc varchar NOT NULL,
  pensja INTEGER NOT NULL
);



CREATE TABLE zamowienia (
  ID_zamowienia SERIAL PRIMARY KEY NOT NULL,
  ID_konta INTEGER NOT NULL,
  ID_kelnera INTEGER NOT NULL,
  ID_dostawcy INTEGER NOT NULL,
  opis varchar,
  data date NOT NULL default current_date
);


CREATE TABLE zamowienia_produkty (
  ID_zamowienia_produkty SERIAL PRIMARY KEY NOT NULL,
  ID_zamowienia INTEGER NOT NULL,
  ID_produktu INTEGER NOT NULL
);

INSERT INTO klienci (ID_klienta, imie, nazwisko, ulica, nr_domu, kod_pocztowy, miejscowosc)
VALUES
 (DEFAULT, 'Janusz', 'Kot', 'Miejska', '24', '24-025', 'Lublin'),
 (DEFAULT, 'Marcin', 'Flaga', 'Piłsudkiego', '24', '54-035', 'Rzeszów'),
 (DEFAULT, 'Adrian', 'Jezierski', '3-maja', '24', '24-045', 'Warszawa'),
 (DEFAULT, 'Rafał', 'Bąk', 'Matejki', '24', '44-035', 'Lublin'),
 (DEFAULT, 'Rafał', 'Kloc', 'Matejki', '24', '24-055', 'Wrocław'),
 (DEFAULT, 'Janusz', 'Szczęch', 'Miejska', '24', '14-035', 'Wrocław'),
 (DEFAULT, 'Janusz', 'Rak', 'Miejska', '24', '24-035', 'Wrocław'),
 (DEFAULT, 'Marcin', 'Kot', 'Piłsudkiego', '24', '64-025', 'Rzeszów'),
 (DEFAULT, 'Janusz', 'Kot', 'Matejki', '24', '24-035', 'Warszawa'),
 (DEFAULT, 'Adrian', 'Opat', '3-maja', '24', '24-035', 'Warszawa'),
 (DEFAULT, 'Rafał', 'Kot', 'Miejska', '24', '34-015', 'Lublin'),
 (DEFAULT, 'Rafał', 'Kot', '3-maja', '24', '24-035', 'Wrocław'),
 (DEFAULT, 'Marcin', 'Kot', 'Matejki', '24', '24-035', 'Lublin'),
 (DEFAULT, 'Rafał', 'Jedenasty', 'Piłsudkiego', '24', '24-035', 'Lublin'),
 (DEFAULT, 'Rafał', 'Kot', 'Miejska', '24', '54-035', 'Wrocław'),
 (DEFAULT, 'Marcin', 'Kot', '3-maja', '24', '27-035', 'Lublin'),
 (DEFAULT, 'Adrian', 'Kot', 'Miejska', '24', '24-035', 'Lublin'),
 (DEFAULT, 'Rafał', 'Kot', 'Piłsudkiego', '24', '45-065', 'Warszawa'),
 (DEFAULT, 'Marcin', 'Ostatni', 'Miejska', '24', '34-035', 'Wrocław'),
 (DEFAULT, 'Janusz', 'Kot', '3-maja', '24', '24-045', 'Lublin'),
 (DEFAULT, 'Adrian', 'Testowy', 'Miejska', '24', '24-035', 'Wrocław'),
 (DEFAULT, 'Marcin', 'Kot', 'Piłsudkiego', '24', '24-075', 'Lublin'),
 (DEFAULT, 'Rafał', 'Rekordowy', '3-maja', '24', '44-039', 'Warszawa'),
 (DEFAULT, 'Rafał', 'Kot', 'Matejki', '24', '34-035', 'Wrocław'),
 (DEFAULT, 'Janusz', 'Kot', 'Miejska', '24', '44-039', 'Lublin'),
 (DEFAULT, 'Marcin', 'Kot', 'Piłsudkiego', '24', '24-035', 'Lublin'),
 (DEFAULT, 'Janusz', 'Pierwszy', 'Miejska', '24', '54-005', 'Lublin'),
 (DEFAULT, 'Adrian', 'Kot', '3-maja', '24', '24-035', 'Warszawa'),
 (DEFAULT, 'Rafał', 'Bazowy', 'Matejki', '24', '14-035', 'Lublin'),
 (DEFAULT, 'Janusz', 'Kot', 'Piłsudkiego', '24', '04-085', 'Warszawa'),
 (DEFAULT, 'Janusz', 'Kot', 'Matejki', '24', '24-003', 'Lublin'),
 (DEFAULT, 'Rafał', 'Nazwisko', '3-maja', '24', '04-000', 'Warszawa'),
 (DEFAULT, 'Janusz', 'Kot', '3-maja', '24', '04-035', 'Rzeszów'),
 (DEFAULT, 'Rafał', 'Kot', 'Miejska', '24', '20-035', 'Lublin'),
 (DEFAULT, 'Mariusz', 'Pies', 'Piłsudskiego', '11', '30-235', 'Rzeszów');
 
 
INSERT INTO konta (ID_konta, ID_klienta, login, haslo)
VALUES
 (DEFAULT, '1', 'login11', 'kot123'),
 (DEFAULT, '2', 'login12', 'kot123'),
 (DEFAULT, '3', 'login13', 'kot123'),
 (DEFAULT, '4', 'login14', 'kot123'),
 (DEFAULT, '5', 'login15', 'kot123'),
 (DEFAULT, '6', 'login16', 'kot123'),
 (DEFAULT, '7', 'login17', 'kot123'),
 (DEFAULT, '8', 'login18', 'kot123'),
 (DEFAULT, '9', 'login19', 'kot123'),
 (DEFAULT, '10', 'login23', 'kot123'),
 (DEFAULT, '11', 'logi', 'kot123'),
 (DEFAULT, '12', 'lon11', 'kot123'),
 (DEFAULT, '13', 'lon11', 'kot123'),
 (DEFAULT, '14', 'loin11', 'kot123'),
 (DEFAULT, '15', 'lin11', 'kot123'),
 (DEFAULT, '16', 'logi1122', 'kot123'),
 (DEFAULT, '17', 'login1441', 'kot123'),
 (DEFAULT, '18', 'logn1154', 'kot123'),
 (DEFAULT, '19', 'login1132', 'kot123'),
 (DEFAULT, '20', 'logn1111', 'kot123'),
 (DEFAULT, '21', 'login1123', 'kot123'),
 (DEFAULT, '22', 'logn1134', 'kot123'),
 (DEFAULT, '23', 'login1153', 'kot123'),
 (DEFAULT, '24', 'login151', 'kot123'),
 (DEFAULT, '25', 'lgin1451', 'kot123'),
 (DEFAULT, '26', 'logn161', 'kot123'),
 (DEFAULT, '27', 'login116', 'kot123'),
 (DEFAULT, '28', 'login1109', 'kot123'),
 (DEFAULT, '29', 'login1125', 'kot123'),
 (DEFAULT, '30', 'login1135', 'kot123'),
 (DEFAULT, '31', 'login1165', 'kot123'),
 (DEFAULT, '32', 'login1175', 'kot123'),
 (DEFAULT, '33', 'login1178', 'kot123'),
 (DEFAULT, '34', 'login1134', 'kot123'),
 (DEFAULT, '35', 'login2244', 'pies123');


INSERT INTO produkty (ID_produktu, nazwa, kategoria)
VALUES
 (DEFAULT, 'Margherita', 'Jedzenie'),
 (DEFAULT, 'Umberto', 'Jedzenie'),
 (DEFAULT, 'Romana', 'Jedzenie'),
 (DEFAULT, 'Hawajska', 'Jedzenie'),
 (DEFAULT, 'Czekoladowa', 'Jedzenie'),
 (DEFAULT, 'Meksykańska', 'Jedzenie'),
 (DEFAULT, 'Vesuvio', 'Jedzenie'),
 (DEFAULT, 'Primavera', 'Jedzenie'),
 (DEFAULT, 'Vegetariana', 'Jedzenie'),
 (DEFAULT, 'Diablo', 'Jedzenie'),
 (DEFAULT, 'Feta', 'Jedzenie'),
 (DEFAULT, 'Neapolitana', 'Jedzenie'),
 (DEFAULT, 'Carbonara', 'Jedzenie'),
 (DEFAULT, 'Frytki', 'Jedzenie'),
 (DEFAULT, 'Kebab', 'Jedzenie'),
 (DEFAULT, 'Zapiekanka', 'Jedzenie'),
 (DEFAULT, 'Hamburger', 'Jedzenie'),
 (DEFAULT, 'Tortilla', 'Jedzenie'),
 (DEFAULT, 'Cola', 'Napoje'),
 (DEFAULT, 'Sprite', 'Napoje'),
 (DEFAULT, 'Mirinda', 'Napoje'),
 (DEFAULT, 'Woda', 'Napoje'),
 (DEFAULT, 'Piwo', 'Napoje'),
 (DEFAULT, 'RedBull', 'Napoje'),
 (DEFAULT, 'Sok', 'Napoje');
 
 

INSERT INTO dane_produktow (ID_produktu, cena)
VALUES
 ('1', '20'),
 ('2', '25'),
 ('3', '24'),
 ('4', '23'),
 ('5', '26'),
 ('6', '23'),
 ('7', '25'),
 ('8', '22'),
 ('9', '28'),
 ('10', '30'),
 ('11', '26'),
 ('12', '27'),
 ('13', '24'),
 ('14', '6'),
 ('15', '8'),
 ('16', '8'),
 ('17', '12'),
 ('18', '10'),
 ('19', '5'),
 ('20', '4'),
 ('21', '4'),
 ('22', '3'),
 ('23', '3'),
 ('24', '8'),
 ('25', '6');


INSERT INTO kelnerzy (ID_kelnera, imie, nazwisko, telefon)
VALUES
 (DEFAULT, 'Maciej', 'Pisarz', '748345128'),
 (DEFAULT, 'Marcin', 'Biurko', '987564987'),
 (DEFAULT, 'Agata', 'Majka', '746534311'),
 (DEFAULT, 'Beata', 'Szydełko', '987872871'),
 (DEFAULT, 'Adrian', 'Chwalka', '556834518'),
 (DEFAULT, 'Kamil', 'Kowal', '968564987');
 
 
INSERT INTO dane_kelnerow (ID_kelnera, pesel, ulica, nr_domu, kod_pocztowy, miejscowosc, pensja)
VALUES
 ('1', '19876529854', '3-maja', '12', '24-000', 'Warszawa', '2200'),
 ('2', '76289574830', 'Niepodleglosci', '1', '54-221', 'Wrocław', '2300'),
 ('3', '68643429854', 'Ostatnia', '17', '24-075', 'Rzeszów', '2400'),
 ('4', '87389994830', 'Bursztynowa', '22', '66-221', 'Lublin', '2300'),
 ('5', '12365743854', 'Pisowska', '42', '28-030', 'Wrocław', '2200'),
 ('6', '79543254830', 'Palmowa', '197', '52-227', 'Rzeszów', '2350');
 

INSERT INTO dostawcy (ID_dostawcy, imie, nazwisko, telefon)
VALUES
 (DEFAULT, 'Agata', 'Tlen', '175656845'),
 (DEFAULT, 'Patryk', 'Osa', '234005494'),
 (DEFAULT, 'Adrian', 'Szlachta', '126432245'),
 (DEFAULT, 'Patryk', 'Majda', '264326694'),
 (DEFAULT, 'Robert', 'Ułomny', '126432245');
 
 
INSERT INTO dane_dostawcow (ID_dostawcy, pesel, ulica, nr_domu, kod_pocztowy, miejscowosc, pensja)
VALUES
 ('1', '85472658473', '5-maja', '16', '24-600', 'Gdańsk', '2500'),
 ('2', '29557445501', 'Takasobie', '5', '24-541', 'Rzeszów', '2800'),
 ('3', '89633553173', '3-maja', '66', '24-665', 'Lublin', '2500'),
 ('4', '29866573901', 'Niepodległości', '75', '24-521', 'Wrocław', '2800'),
 ('5', '85408643673', 'Komiczna', '89', '24-64', 'Rzeszów', '2500');
 
 
INSERT INTO zamowienia (ID_zamowienia, ID_konta, ID_kelnera, ID_dostawcy, opis, data)
VALUES
 (DEFAULT, '1', '2', '1', 'zamowienie1', '2018-02-04'),
 (DEFAULT, '2', '2', '1', 'carbonara i margherita', '2018-02-05'),
 (DEFAULT, '2', '2', '2', 'margherita', '2018-02-06'),
 (DEFAULT, '3', '5', '2', 'carbonara', '2018-02-04'),
 (DEFAULT, '3', '6', '2', 'carbonara i margherita', '2018-02-06'),
 (DEFAULT, '4', '6', '3', 'margherita', '2018-03-04'),
 (DEFAULT, '5', '6', '3', 'carbonara', '2018-03-04'),
 (DEFAULT, '6', '5', '3', 'carbonara i margherita', '2018-03-04'),
 (DEFAULT, '8', '4', '4', 'margherita', '2018-03-04'),
 (DEFAULT, '3', '4', '5', 'carbonara', '2018-03-04'),
 (DEFAULT, '2', '3', '5', 'carbonara i margherita', '2018-03-04'),
 (DEFAULT, '2', '2', '5', 'margherita', '2018-03-04'),
 (DEFAULT, '7', '3', '4', 'carbonara', '2018-02-04'),
 (DEFAULT, '16', '1', '3', 'carbonara i margherita', '2018-04-04'),
 (DEFAULT, '20', '1', '3', 'margherita', '2018-05-04'),
 (DEFAULT, '32', '2', '2', 'carbonara', '2018-05-04'),
 (DEFAULT, '5', '4', '1', 'carbonara i margherita', '2018-05-04'),
 (DEFAULT, '2', '5', '2', 'margherita', '2018-06-04'),
 (DEFAULT, '25', '6', '4', 'carbonara', '2018-06-04'),
 (DEFAULT, '5', '6', '5', 'carbonara i margherita', '2018-06-04'),
 (DEFAULT, '9', '6', '2', 'margherita', '2018-06-04'),
 (DEFAULT, '10', '5', '1', 'carbonara', '2018-06-04'),
 (DEFAULT, '21', '3', '5', 'carbonara i margherita', '2018-07-04'),
 (DEFAULT, '26', '4', '2', 'margherita', '2018-07-04'),
 (DEFAULT, '18', '5', '4', 'carbonara', '2018-07-04'),
 (DEFAULT, '23', '2', '5', 'carbonara i margherita', '2018-07-04'),
 (DEFAULT, '25', '1', '2', 'margherita', '2018-08-04'),
 (DEFAULT, '12', '2', '3', 'carbonara', '2018-08-04'),
 (DEFAULT, '27', '2', '2', 'carbonara i margherita', '2018-09-04'),
 (DEFAULT, '2', '3', '2', 'margherita', '2018-09-04'),
 (DEFAULT, '1', '3', '5', 'carbonara', '2018-09-04'),
 (DEFAULT, '5', '5', '5', 'carbonara i margherita', '2018-12-04'),
 (DEFAULT, '3', '6', '2', 'margherita', '2018-12-04'),
 (DEFAULT, '4', '5', '3', 'carbonara', '2019-02-04'),
 (DEFAULT, '6', '5', '3', 'carbonara i margherita', '2019-02-10'),
 (DEFAULT, '35', '2', '4', 'margherita', '2019-03-05'),
 (DEFAULT, '34', '1', '5', 'carbonara', '2019-04-14'),
 (DEFAULT, '33', '4', '5', 'carbonara i margherita', '2019-05-04'),
 (DEFAULT, '32', '5', '4', 'margherita', '2019-05-04'),
 (DEFAULT, '6', '6', '5', 'carbonara', '2019-05-04'),
 (DEFAULT, '22', '6', '3', 'carbonara i margherita', '2019-05-04'),
 (DEFAULT, '18', '3', '4', 'margherita', '2019-06-04'),
 (DEFAULT, '15', '5', '2', 'carbonara', '2019-06-04'),
 (DEFAULT, '12', '2', '1', 'carbonara i margherita', '2019-06-04'),
 (DEFAULT, '16', '1', '2', 'margherita', '2019-06-04'),
 (DEFAULT, '18', '6', '4', 'carbonara', '2019-06-04'),
 (DEFAULT, '19', '5', '5', 'carbonara i margherita', '2019-06-04'),
 (DEFAULT, '23', '1', '4', 'margherita', '2019-06-04'),
 (DEFAULT, '1', '3', '3', 'carbonara', '2019-07-04'),
 (DEFAULT, '2', '2', '3', 'carbonara i margherita', '2019-08-04'),
 (DEFAULT, '3', '2', '3', 'margherita', '2019-07-04'),
 (DEFAULT, '5', '1', '5', 'carbonara', '2020-01-04'),
 (DEFAULT, '1', '1', '5', 'carbonara i margherita', '2020-01-04'),
 (DEFAULT, '27', '4', '4', 'margherita', '2020-02-04'),
 (DEFAULT, '7', '5', '4', 'carbonara', '2020-02-04'),
 (DEFAULT, '5', '6', '4', 'carbonara i margherita', '2020-02-04'),
 (DEFAULT, '3', '2', '5', 'margherita', '2020-02-04'),
 (DEFAULT, '3', '2', '5', 'carbonara', '2020-03-04'),
 (DEFAULT, '11', '3', '3', 'carbonara i margherita', '2020-04-04'),
 (DEFAULT, '10', '4', '4', 'margherita', '2020-04-04'),
 (DEFAULT, '20', '5', '2', 'carbonara', '2020-04-04'),
 (DEFAULT, '20', '3', '2', 'carbonara i margherita', '2020-04-04'),
 (DEFAULT, '26', '2', '5', 'margherita', '2020-05-04'),
 (DEFAULT, '29', '4', '5', 'carbonara', '2020-05-04'),
 (DEFAULT, '19', '6', '3', 'carbonara i margherita', '2020-05-04'),
 (DEFAULT, '29', '6', '2', 'margherita', '2020-04-04'),
 (DEFAULT, '27', '5', '1', 'carbonara', '2020-05-04'),
 (DEFAULT, '26', '5', '1', 'carbonara i margherita', '2019-05-04'),
 (DEFAULT, '10', '2', '2', 'margherita', '2020-03-04'),
 (DEFAULT, '12', '3', '1', 'carbonara', '2020-02-04'),
 (DEFAULT, '23', '5', '1', 'carbonara i margherita', '2020-06-04'),
 (DEFAULT, '17', '2', '2', 'margherita', '2020-06-05'),
 (DEFAULT, '28', '5', '4', 'brak', '2018-7-19'),
(DEFAULT, '8', '2', '1', 'brak', '2018-8-26'),
(DEFAULT, '24', '3', '2', 'brak', '2018-4-9'),
(DEFAULT, '31', '1', '4', 'brak', '2018-5-23'),
(DEFAULT, '7', '1', '1', 'brak', '2018-1-29'),
(DEFAULT, '24', '4', '3', 'brak', '2018-10-5'),
(DEFAULT, '26', '5', '4', 'brak', '2018-9-14'),
(DEFAULT, '5', '3', '4', 'brak', '2018-2-2'),
(DEFAULT, '2', '5', '2', 'brak', '2018-2-16'),
(DEFAULT, '26', '2', '3', 'brak', '2018-5-11'),
(DEFAULT, '13', '2', '4', 'brak', '2018-7-30'),
(DEFAULT, '32', '5', '4', 'brak', '2018-8-12'),
(DEFAULT, '3', '4', '2', 'brak', '2018-2-2'),
(DEFAULT, '23', '5', '4', 'brak', '2018-3-14'),
(DEFAULT, '2', '4', '2', 'brak', '2018-7-24'),
(DEFAULT, '15', '2', '2', 'brak', '2018-4-16'),
(DEFAULT, '34', '4', '2', 'brak', '2018-4-4'),
(DEFAULT, '7', '1', '2', 'brak', '2018-7-27'),
(DEFAULT, '12', '1', '4', 'brak', '2018-6-1'),
(DEFAULT, '21', '4', '1', 'brak', '2018-2-17'),
(DEFAULT, '17', '4', '4', 'brak', '2018-8-27'),
(DEFAULT, '6', '4', '3', 'brak', '2018-8-15'),
(DEFAULT, '4', '4', '3', 'brak', '2018-4-14'),
(DEFAULT, '21', '3', '2', 'brak', '2018-11-3'),
(DEFAULT, '28', '5', '2', 'brak', '2018-10-15'),
(DEFAULT, '26', '1', '3', 'brak', '2018-11-16'),
(DEFAULT, '3', '3', '1', 'brak', '2018-3-23'),
(DEFAULT, '32', '4', '3', 'brak', '2018-5-7'),
(DEFAULT, '21', '4', '3', 'brak', '2018-9-3'),
(DEFAULT, '1', '5', '4', 'brak', '2018-1-17'),
(DEFAULT, '13', '5', '2', 'brak', '2018-5-27'),
(DEFAULT, '18', '1', '3', 'brak', '2018-3-15'),
(DEFAULT, '12', '2', '3', 'brak', '2018-4-3'),
(DEFAULT, '20', '4', '1', 'brak', '2018-7-25'),
(DEFAULT, '20', '1', '4', 'brak', '2018-1-1'),
(DEFAULT, '14', '1', '1', 'brak', '2018-9-17'),
(DEFAULT, '13', '1', '4', 'brak', '2018-9-19'),
(DEFAULT, '23', '4', '2', 'brak', '2018-5-18'),
(DEFAULT, '21', '5', '4', 'brak', '2018-4-9'),
(DEFAULT, '30', '3', '4', 'brak', '2018-2-7'),
(DEFAULT, '3', '4', '4', 'brak', '2018-8-26'),
(DEFAULT, '30', '4', '4', 'brak', '2018-2-26'),
(DEFAULT, '2', '4', '3', 'brak', '2018-4-5'),
(DEFAULT, '16', '3', '4', 'brak', '2018-1-11'),
(DEFAULT, '7', '3', '2', 'brak', '2018-3-29'),
(DEFAULT, '32', '1', '1', 'brak', '2018-4-9'),
(DEFAULT, '10', '3', '3', 'brak', '2018-6-7'),
(DEFAULT, '18', '5', '4', 'brak', '2018-4-6'),
(DEFAULT, '29', '1', '3', 'brak', '2018-11-3'),
(DEFAULT, '33', '1', '3', 'brak', '2018-8-1'),
(DEFAULT, '1', '3', '3', 'brak', '2018-2-12'),
(DEFAULT, '25', '3', '4', 'brak', '2018-9-29'),
(DEFAULT, '28', '4', '4', 'brak', '2018-2-24'),
(DEFAULT, '22', '1', '3', 'brak', '2018-9-12'),
(DEFAULT, '19', '4', '2', 'brak', '2018-6-4'),
(DEFAULT, '25', '3', '3', 'brak', '2018-7-20'),
(DEFAULT, '28', '2', '2', 'brak', '2018-9-23'),
(DEFAULT, '31', '1', '2', 'brak', '2018-6-19'),
(DEFAULT, '13', '3', '4', 'brak', '2018-9-10'),
(DEFAULT, '21', '4', '4', 'brak', '2018-1-5'),
(DEFAULT, '16', '5', '3', 'brak', '2018-9-28'),
(DEFAULT, '21', '1', '4', 'brak', '2018-2-19'),
(DEFAULT, '26', '2', '4', 'brak', '2018-11-23'),
(DEFAULT, '13', '2', '2', 'brak', '2018-4-6'),
(DEFAULT, '5', '5', '1', 'brak', '2018-9-4'),
(DEFAULT, '12', '2', '4', 'brak', '2018-7-18'),
(DEFAULT, '8', '4', '2', 'brak', '2018-10-16'),
(DEFAULT, '1', '4', '4', 'brak', '2018-2-28'),
(DEFAULT, '7', '2', '2', 'brak', '2018-5-21'),
(DEFAULT, '11', '1', '3', 'brak', '2018-1-28'),
(DEFAULT, '31', '3', '2', 'brak', '2018-10-15'),
(DEFAULT, '26', '3', '3', 'brak', '2018-8-22'),
(DEFAULT, '22', '1', '2', 'brak', '2018-2-12'),
(DEFAULT, '19', '2', '4', 'brak', '2018-10-20'),
(DEFAULT, '7', '3', '4', 'brak', '2018-8-19'),
(DEFAULT, '22', '3', '2', 'brak', '2018-9-6'),
(DEFAULT, '16', '3', '1', 'brak', '2018-5-22'),
(DEFAULT, '19', '1', '1', 'brak', '2018-6-3'),
(DEFAULT, '13', '5', '4', 'brak', '2018-2-6'),
(DEFAULT, '31', '3', '3', 'brak', '2018-11-2'),
(DEFAULT, '7', '3', '4', 'brak', '2018-7-25'),
(DEFAULT, '2', '1', '3', 'brak', '2018-9-26'),
(DEFAULT, '12', '3', '1', 'brak', '2018-1-15'),
(DEFAULT, '31', '1', '1', 'brak', '2018-3-27'),
(DEFAULT, '33', '5', '4', 'brak', '2018-3-4'),
(DEFAULT, '9', '4', '3', 'brak', '2018-8-16'),
(DEFAULT, '33', '4', '1', 'brak', '2018-10-20'),
(DEFAULT, '16', '1', '2', 'brak', '2018-3-10'),
(DEFAULT, '4', '5', '3', 'brak', '2018-8-4'),
(DEFAULT, '8', '2', '3', 'brak', '2018-10-4'),
(DEFAULT, '18', '3', '4', 'brak', '2018-9-6'),
(DEFAULT, '32', '3', '2', 'brak', '2018-9-29'),
(DEFAULT, '15', '5', '3', 'brak', '2018-6-19'),
(DEFAULT, '2', '3', '1', 'brak', '2018-4-15'),
(DEFAULT, '23', '3', '1', 'brak', '2018-4-3'),
(DEFAULT, '11', '2', '1', 'brak', '2018-11-25'),
(DEFAULT, '14', '2', '4', 'brak', '2018-3-22'),
(DEFAULT, '8', '5', '4', 'brak', '2018-5-4'),
(DEFAULT, '9', '3', '4', 'brak', '2018-8-6'),
(DEFAULT, '9', '4', '4', 'brak', '2018-10-23'),
(DEFAULT, '21', '4', '2', 'brak', '2019-1-21'),
(DEFAULT, '28', '2', '3', 'brak', '2019-11-7'),
(DEFAULT, '14', '5', '4', 'brak', '2019-7-12'),
(DEFAULT, '12', '1', '2', 'brak', '2019-5-2'),
(DEFAULT, '31', '2', '4', 'brak', '2019-2-19'),
(DEFAULT, '30', '2', '3', 'brak', '2019-3-30'),
(DEFAULT, '27', '3', '3', 'brak', '2019-3-1'),
(DEFAULT, '4', '2', '3', 'brak', '2019-8-5'),
(DEFAULT, '12', '4', '2', 'brak', '2019-8-8'),
(DEFAULT, '16', '5', '1', 'brak', '2019-1-26'),
(DEFAULT, '20', '5', '3', 'brak', '2019-11-27'),
(DEFAULT, '19', '3', '2', 'brak', '2019-2-5'),
(DEFAULT, '30', '1', '3', 'brak', '2019-3-25'),
(DEFAULT, '10', '3', '1', 'brak', '2019-10-16'),
(DEFAULT, '20', '2', '4', 'brak', '2019-1-22'),
(DEFAULT, '29', '3', '3', 'brak', '2019-4-3'),
(DEFAULT, '2', '2', '1', 'brak', '2019-9-30'),
(DEFAULT, '34', '4', '4', 'brak', '2019-2-16'),
(DEFAULT, '18', '3', '2', 'brak', '2019-11-20'),
(DEFAULT, '12', '1', '4', 'brak', '2019-4-10'),
(DEFAULT, '32', '5', '1', 'brak', '2019-1-6'),
(DEFAULT, '18', '3', '2', 'brak', '2019-7-9'),
(DEFAULT, '27', '4', '1', 'brak', '2019-7-22'),
(DEFAULT, '22', '2', '1', 'brak', '2019-7-1'),
(DEFAULT, '15', '5', '3', 'brak', '2019-10-15'),
(DEFAULT, '33', '3', '3', 'brak', '2019-11-28'),
(DEFAULT, '32', '5', '2', 'brak', '2019-7-24'),
(DEFAULT, '15', '4', '4', 'brak', '2019-6-12'),
(DEFAULT, '21', '5', '3', 'brak', '2019-9-13'),
(DEFAULT, '20', '3', '4', 'brak', '2019-1-16'),
(DEFAULT, '28', '3', '4', 'brak', '2019-9-16'),
(DEFAULT, '5', '3', '1', 'brak', '2019-8-16'),
(DEFAULT, '16', '2', '2', 'brak', '2019-1-18'),
(DEFAULT, '13', '2', '2', 'brak', '2019-10-22'),
(DEFAULT, '25', '5', '4', 'brak', '2019-1-17'),
(DEFAULT, '26', '4', '4', 'brak', '2019-2-4'),
(DEFAULT, '4', '1', '4', 'brak', '2019-2-18'),
(DEFAULT, '33', '4', '2', 'brak', '2019-1-8'),
(DEFAULT, '1', '2', '3', 'brak', '2019-8-23'),
(DEFAULT, '8', '5', '3', 'brak', '2019-6-1'),
(DEFAULT, '34', '3', '2', 'brak', '2019-3-25'),
(DEFAULT, '5', '2', '3', 'brak', '2019-10-20'),
(DEFAULT, '5', '2', '4', 'brak', '2019-7-3'),
(DEFAULT, '4', '3', '3', 'brak', '2019-8-26'),
(DEFAULT, '28', '5', '1', 'brak', '2019-10-12'),
(DEFAULT, '3', '3', '1', 'brak', '2019-7-29'),
(DEFAULT, '1', '3', '2', 'brak', '2019-8-17'),
(DEFAULT, '5', '2', '1', 'brak', '2019-8-16'),
(DEFAULT, '30', '5', '1', 'brak', '2019-3-10'),
(DEFAULT, '13', '5', '1', 'brak', '2019-3-4'),
(DEFAULT, '7', '4', '1', 'brak', '2019-11-23'),
(DEFAULT, '23', '2', '1', 'brak', '2019-11-26'),
(DEFAULT, '7', '4', '4', 'brak', '2019-9-22'),
(DEFAULT, '29', '3', '4', 'brak', '2019-8-10'),
(DEFAULT, '29', '5', '3', 'brak', '2019-11-13'),
(DEFAULT, '2', '4', '2', 'brak', '2019-11-22'),
(DEFAULT, '34', '3', '1', 'brak', '2019-11-4'),
(DEFAULT, '1', '4', '4', 'brak', '2019-10-3'),
(DEFAULT, '16', '5', '4', 'brak', '2019-2-25'),
(DEFAULT, '16', '1', '2', 'brak', '2019-7-7'),
(DEFAULT, '6', '4', '3', 'brak', '2019-9-4'),
(DEFAULT, '31', '1', '4', 'brak', '2019-1-29'),
(DEFAULT, '8', '1', '1', 'brak', '2019-8-18'),
(DEFAULT, '20', '1', '4', 'brak', '2019-5-12'),
(DEFAULT, '34', '4', '1', 'brak', '2019-1-20'),
(DEFAULT, '9', '2', '3', 'brak', '2019-11-30'),
(DEFAULT, '34', '4', '4', 'brak', '2019-4-18'),
(DEFAULT, '5', '1', '1', 'brak', '2019-2-19'),
(DEFAULT, '30', '4', '2', 'brak', '2019-4-30'),
(DEFAULT, '15', '3', '2', 'brak', '2019-8-15'),
(DEFAULT, '14', '3', '3', 'brak', '2019-11-24'),
(DEFAULT, '34', '4', '1', 'brak', '2019-9-1'),
(DEFAULT, '29', '3', '1', 'brak', '2019-8-26'),
(DEFAULT, '10', '2', '1', 'brak', '2019-11-9'),
(DEFAULT, '9', '4', '4', 'brak', '2019-8-25'),
(DEFAULT, '16', '4', '4', 'brak', '2019-9-30'),
(DEFAULT, '6', '4', '2', 'brak', '2019-8-7'),
(DEFAULT, '14', '2', '1', 'brak', '2019-8-19'),
(DEFAULT, '18', '4', '1', 'brak', '2019-8-3'),
(DEFAULT, '8', '5', '4', 'brak', '2019-2-22'),
(DEFAULT, '7', '4', '1', 'brak', '2019-1-1'),
(DEFAULT, '19', '2', '3', 'brak', '2019-10-24'),
(DEFAULT, '11', '2', '3', 'brak', '2019-4-11'),
(DEFAULT, '34', '5', '3', 'brak', '2019-9-8'),
(DEFAULT, '19', '3', '1', 'brak', '2019-7-8'),
(DEFAULT, '23', '5', '3', 'brak', '2019-7-9'),
(DEFAULT, '25', '4', '3', 'brak', '2019-4-3'),
(DEFAULT, '17', '5', '1', 'brak', '2019-8-3'),
(DEFAULT, '13', '2', '3', 'brak', '2019-8-17'),
(DEFAULT, '8', '1', '4', 'brak', '2019-6-10'),
(DEFAULT, '18', '4', '1', 'brak', '2019-11-3'),
(DEFAULT, '12', '5', '4', 'brak', '2019-11-22'),
(DEFAULT, '13', '5', '2', 'brak', '2019-9-22'),
(DEFAULT, '3', '4', '1', 'brak', '2019-6-7'),
(DEFAULT, '24', '4', '3', 'brak', '2019-8-3'),
(DEFAULT, '28', '5', '2', 'brak', '2019-3-24'),
(DEFAULT, '5', '4', '2', 'brak', '2019-5-30'),
(DEFAULT, '27', '3', '2', 'brak', '2019-2-23'),
(DEFAULT, '27', '1', '3', 'brak', '2019-9-21'),
(DEFAULT, '21', '3', '4', 'brak', '2019-11-6');
 
 
 
 
INSERT INTO zamowienia_produkty (ID_zamowienia_produkty, ID_zamowienia, ID_produktu)
VALUES
 (DEFAULT, '1', '2'),
 (DEFAULT, '2', '2'),
 (DEFAULT, '2', '3'),
 (DEFAULT, '3', '4'),
 (DEFAULT, '3', '5'),
 (DEFAULT, '3', '6'),
 (DEFAULT, '4', '2'),
 (DEFAULT, '5', '3'),
 (DEFAULT, '6', '5'),
 (DEFAULT, '7', '2'),
 (DEFAULT, '8', '11'),
 (DEFAULT, '9', '12'),
 (DEFAULT, '10', '24'),
 (DEFAULT, '10', '25'),
 (DEFAULT, '11', '15'),
 (DEFAULT, '12', '25'),
 (DEFAULT, '12', '23'),
 (DEFAULT, '13', '24'),
 (DEFAULT, '14', '1'),
 (DEFAULT, '15', '3'),
 (DEFAULT, '16', '5'),
 (DEFAULT, '16', '4'),
 (DEFAULT, '17', '6'),
 (DEFAULT, '18', '7'),
 (DEFAULT, '19', '8'),
 (DEFAULT, '19', '9'),
 (DEFAULT, '19', '10'),
 (DEFAULT, '20', '21'),
 (DEFAULT, '21', '25'),
 (DEFAULT, '22', '14'),
 (DEFAULT, '23', '23'),
 (DEFAULT, '24', '13'),
 (DEFAULT, '25', '1'),
 (DEFAULT, '26', '2'),
 (DEFAULT, '26', '2'),
 (DEFAULT, '27', '1'),
 (DEFAULT, '27', '2'),
 (DEFAULT, '27', '5'),
 (DEFAULT, '27', '3'),
 (DEFAULT, '27', '2'),
 (DEFAULT, '27', '6'),
 (DEFAULT, '28', '17'),
 (DEFAULT, '29', '16'),
 (DEFAULT, '30', '18'),
 (DEFAULT, '31', '19'),
 (DEFAULT, '32', '20'),
 (DEFAULT, '33', '20'),
 (DEFAULT, '34', '10'),
 (DEFAULT, '35', '22'),
 (DEFAULT, '36', '23'),
 (DEFAULT, '37', '24'),
 (DEFAULT, '38', '25'),
 (DEFAULT, '39', '26'),
 (DEFAULT, '40', '17'),
 (DEFAULT, '41', '28'),
 (DEFAULT, '42', '23'),
 (DEFAULT, '43', '23'),
 (DEFAULT, '44', '24'),
 (DEFAULT, '45', '12'),
 (DEFAULT, '46', '5'),
 (DEFAULT, '47', '6'),
 (DEFAULT, '48', '7'),
 (DEFAULT, '49', '3'),
 (DEFAULT, '50', '2'),
 (DEFAULT, '52', '7'),
 (DEFAULT, '51', '8'),
 (DEFAULT, '53', '9'),
 (DEFAULT, '54', '3'),
 (DEFAULT, '55', '10'),
 (DEFAULT, '56', '20'),
 (DEFAULT, '57', '20'),
 (DEFAULT, '58', '10'),
 (DEFAULT, '59', '16'),
 (DEFAULT, '60', '17'),
 (DEFAULT, '61', '5'),
 (DEFAULT, '62', '12'),
 (DEFAULT, '63', '13'),
 (DEFAULT, '64', '4'),
 (DEFAULT, '65', '5'),
 (DEFAULT, '66', '6'),
 (DEFAULT, '67', '7'),
 (DEFAULT, '68', '8'),
 (DEFAULT, '69', '9'),
 (DEFAULT, '70', '10'),
 (DEFAULT, '71', '20'),
 (DEFAULT, '72', '22'),
 (DEFAULT, '55', '21'),
 (DEFAULT, '65', '23'),
 (DEFAULT, '34', '24'),
 (DEFAULT, '23', '25'),
 (DEFAULT, '54', '17'),
 (DEFAULT, '64', '17'),
 (DEFAULT, '71', '18'),
 (DEFAULT, '23', '19'),
 (DEFAULT, '54', '21'),
 (DEFAULT, '73', '20'),
 (DEFAULT, '56', '10'),
 (DEFAULT, '71', '11'),
 (DEFAULT, '64', '11'),
 (DEFAULT, '34', '23'),
 (DEFAULT, '54', '24'),
 (DEFAULT, '23', '22'),
 (DEFAULT, '54', '12'),
 (DEFAULT, '65', '5'),
 (DEFAULT, '34', '6'),
 (DEFAULT, '23', '7'),
 (DEFAULT, '11', '8'),
 (DEFAULT, '1', '9'),
 (DEFAULT, '2', '9'),
 (DEFAULT, '23', '9'),
 (DEFAULT, '46', '10'),
 (DEFAULT, '34', '21'),
 (DEFAULT, '21', '22'),
 (DEFAULT, '23', '13'),
 (DEFAULT, '31', '24'),
 (DEFAULT, '55', '22'),
 (DEFAULT, '56', '11'),
 (DEFAULT, '57', '20'),
 (DEFAULT, '58', '20'),
 (DEFAULT, '34', '25'),
 (DEFAULT, '54', '23'),
 (DEFAULT, '32', '16'),
 (DEFAULT, '33', '17'),
 (DEFAULT, '44', '23'),
 (DEFAULT, '55', '18'),
 (DEFAULT, '66', '19'),
 (DEFAULT, '71', '22'),
 (DEFAULT, '23', '23'),
 (DEFAULT, '12', '1'),
 (DEFAULT, '13', '2'),
 (DEFAULT, '14', '3'),
 (DEFAULT, '15', '1'),
 (DEFAULT, '139', '4'),
(DEFAULT, '248', '23'),
(DEFAULT, '128', '19'),
(DEFAULT, '156', '2'),
(DEFAULT, '99', '3'),
(DEFAULT, '128', '18'),
(DEFAULT, '136', '23'),
(DEFAULT, '221', '15'),
(DEFAULT, '228', '1'),
(DEFAULT, '74', '2'),
(DEFAULT, '84', '8'),
(DEFAULT, '206', '13'),
(DEFAULT, '106', '1'),
(DEFAULT, '138', '10'),
(DEFAULT, '254', '5'),
(DEFAULT, '85', '21'),
(DEFAULT, '186', '15'),
(DEFAULT, '122', '22'),
(DEFAULT, '188', '24'),
(DEFAULT, '151', '15'),
(DEFAULT, '262', '1'),
(DEFAULT, '264', '14'),
(DEFAULT, '112', '20'),
(DEFAULT, '247', '15'),
(DEFAULT, '176', '16'),
(DEFAULT, '252', '10'),
(DEFAULT, '170', '23'),
(DEFAULT, '74', '20'),
(DEFAULT, '261', '21'),
(DEFAULT, '103', '5'),
(DEFAULT, '89', '7'),
(DEFAULT, '107', '21'),
(DEFAULT, '108', '14'),
(DEFAULT, '82', '19'),
(DEFAULT, '217', '23'),
(DEFAULT, '209', '12'),
(DEFAULT, '107', '8'),
(DEFAULT, '204', '12'),
(DEFAULT, '237', '16'),
(DEFAULT, '110', '5'),
(DEFAULT, '214', '20'),
(DEFAULT, '142', '9'),
(DEFAULT, '112', '18'),
(DEFAULT, '201', '21'),
(DEFAULT, '161', '11'),
(DEFAULT, '167', '12'),
(DEFAULT, '192', '2'),
(DEFAULT, '246', '4'),
(DEFAULT, '247', '20'),
(DEFAULT, '222', '10'),
(DEFAULT, '218', '3'),
(DEFAULT, '79', '5'),
(DEFAULT, '106', '3'),
(DEFAULT, '152', '17'),
(DEFAULT, '221', '7'),
(DEFAULT, '236', '3'),
(DEFAULT, '146', '1'),
(DEFAULT, '255', '4'),
(DEFAULT, '189', '21'),
(DEFAULT, '221', '12'),
(DEFAULT, '175', '8'),
(DEFAULT, '255', '4'),
(DEFAULT, '162', '2'),
(DEFAULT, '157', '15'),
(DEFAULT, '238', '21'),
(DEFAULT, '219', '6'),
(DEFAULT, '191', '1'),
(DEFAULT, '245', '15'),
(DEFAULT, '100', '22'),
(DEFAULT, '237', '9'),
(DEFAULT, '244', '5'),
(DEFAULT, '208', '23'),
(DEFAULT, '182', '12'),
(DEFAULT, '173', '14'),
(DEFAULT, '215', '12'),
(DEFAULT, '144', '5'),
(DEFAULT, '209', '24'),
(DEFAULT, '89', '24'),
(DEFAULT, '212', '19'),
(DEFAULT, '262', '17'),
(DEFAULT, '192', '22'),
(DEFAULT, '166', '20'),
(DEFAULT, '178', '22'),
(DEFAULT, '141', '20'),
(DEFAULT, '250', '6'),
(DEFAULT, '76', '23'),
(DEFAULT, '219', '22'),
(DEFAULT, '159', '11'),
(DEFAULT, '216', '24'),
(DEFAULT, '209', '12'),
(DEFAULT, '79', '2'),
(DEFAULT, '77', '12'),
(DEFAULT, '264', '21'),
(DEFAULT, '219', '13'),
(DEFAULT, '95', '9'),
(DEFAULT, '135', '6'),
(DEFAULT, '181', '19'),
(DEFAULT, '207', '7'),
(DEFAULT, '220', '20'),
(DEFAULT, '88', '18'),
(DEFAULT, '164', '15'),
(DEFAULT, '193', '16'),
(DEFAULT, '76', '22'),
(DEFAULT, '227', '13'),
(DEFAULT, '209', '1'),
(DEFAULT, '108', '10'),
(DEFAULT, '253', '5'),
(DEFAULT, '118', '5'),
(DEFAULT, '269', '5'),
(DEFAULT, '218', '23'),
(DEFAULT, '114', '16'),
(DEFAULT, '151', '18'),
(DEFAULT, '258', '15'),
(DEFAULT, '240', '20'),
(DEFAULT, '160', '24'),
(DEFAULT, '79', '20'),
(DEFAULT, '133', '19'),
(DEFAULT, '100', '24'),
(DEFAULT, '220', '1'),
(DEFAULT, '170', '1'),
(DEFAULT, '187', '20'),
(DEFAULT, '74', '20'),
(DEFAULT, '212', '16'),
(DEFAULT, '146', '13'),
(DEFAULT, '234', '20'),
(DEFAULT, '95', '10'),
(DEFAULT, '148', '4'),
(DEFAULT, '185', '17'),
(DEFAULT, '167', '22'),
(DEFAULT, '179', '23'),
(DEFAULT, '168', '22'),
(DEFAULT, '88', '22'),
(DEFAULT, '144', '1'),
(DEFAULT, '200', '2'),
(DEFAULT, '257', '3'),
(DEFAULT, '248', '17'),
(DEFAULT, '179', '13'),
(DEFAULT, '203', '13'),
(DEFAULT, '188', '22'),
(DEFAULT, '191', '23'),
(DEFAULT, '257', '21'),
(DEFAULT, '89', '9'),
(DEFAULT, '166', '8'),
(DEFAULT, '211', '7'),
(DEFAULT, '201', '12'),
(DEFAULT, '98', '19'),
(DEFAULT, '84', '10'),
(DEFAULT, '227', '13'),
(DEFAULT, '195', '2'),
(DEFAULT, '158', '19'),
(DEFAULT, '244', '7'),
(DEFAULT, '258', '18'),
(DEFAULT, '135', '7'),
(DEFAULT, '74', '9'),
(DEFAULT, '234', '13'),
(DEFAULT, '87', '6'),
(DEFAULT, '264', '20'),
(DEFAULT, '80', '24'),
(DEFAULT, '167', '18'),
(DEFAULT, '91', '17'),
(DEFAULT, '142', '22'),
(DEFAULT, '147', '21'),
(DEFAULT, '113', '8'),
(DEFAULT, '227', '19'),
(DEFAULT, '196', '12'),
(DEFAULT, '118', '15'),
(DEFAULT, '207', '3'),
(DEFAULT, '225', '1'),
(DEFAULT, '190', '6'),
(DEFAULT, '106', '14'),
(DEFAULT, '261', '7'),
(DEFAULT, '105', '24'),
(DEFAULT, '204', '22'),
(DEFAULT, '176', '13'),
(DEFAULT, '204', '12'),
(DEFAULT, '96', '17'),
(DEFAULT, '151', '24'),
(DEFAULT, '147', '9'),
(DEFAULT, '130', '20'),
(DEFAULT, '158', '14'),
(DEFAULT, '161', '19'),
(DEFAULT, '145', '17'),
(DEFAULT, '213', '17'),
(DEFAULT, '73', '1'),
(DEFAULT, '132', '22'),
(DEFAULT, '95', '22'),
(DEFAULT, '150', '17'),
(DEFAULT, '91', '9'),
(DEFAULT, '162', '6'),
(DEFAULT, '133', '18'),
(DEFAULT, '225', '19'),
(DEFAULT, '236', '21'),
(DEFAULT, '140', '5'),
(DEFAULT, '143', '2'),
(DEFAULT, '122', '1'),
(DEFAULT, '84', '16'),
(DEFAULT, '198', '9'),
(DEFAULT, '158', '6'),
(DEFAULT, '103', '6'),
(DEFAULT, '118', '22');
 
  