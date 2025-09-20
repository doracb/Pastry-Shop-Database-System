CREATE TABLE angajati_v (
    id_angajat NUMBER(2),
    prenume VARCHAR2(20),
    nume VARCHAR2(25),
    telefon VARCHAR2(15),
    email VARCHAR2(20),
    data_angajare DATE,
    salariul NUMBER(8,2),
    id_functie NUMBER(2)
);

CREATE TABLE functii_v (
    id_functie NUMBER(2),
    denumire_functie VARCHAR2(30),
    salariu_baza NUMBER(8,2)
);

CREATE TABLE clienti_v (
    id_client NUMBER(2),
    prenume VARCHAR2(20),
    nume VARCHAR2(20),
    telefon VARCHAR2(20),
    email VARCHAR2(30),
    data_nastere DATE,
    sex VARCHAR(1),
    preferinte VARCHAR2(40),
    puncte_fidelitate NUMBER(3)
);

CREATE TABLE comenzi_v (
    id_comanda NUMBER(2),
    data DATE,
    modalitate VARCHAR2(10),
    id_client NUMBER(2),
    id_angajat NUMBER(2)
);

CREATE TABLE produse_v (
    id_produs NUMBER(2),
    denumire_produs VARCHAR2(30),
    descriere VARCHAR2(70),
    categorie VARCHAR2(20),
    personalizabil VARCHAR2(2)
);

CREATE TABLE rand_comenzi_v (
    id_comanda NUMBER(2),
    id_produs NUMBER(2),
    pret NUMBER(8,2),
    cantitate NUMBER(8,2)
);

CREATE TABLE retete_v (
    id_reteta NUMBER(2),
    denumire_reteta VARCHAR2(30),
    descriere VARCHAR2(60),
    timp_preparare NUMBER(3)
);

CREATE TABLE produse_retete_v (
    id_produs NUMBER(2),
    id_reteta NUMBER(2),
    tip_componenta VARCHAR2(20)
);
