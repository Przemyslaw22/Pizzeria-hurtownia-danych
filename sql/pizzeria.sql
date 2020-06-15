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
  