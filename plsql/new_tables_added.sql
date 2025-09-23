-- New tables added: Plati_v, Livrari_v, Recenzii_v

CREATE TABLE Plati_v (
id_plata NUMBER PRIMARY KEY,
id_comanda NUMBER REFERENCES comenzi_v(id_comanda),
suma NUMBER(10, 2) NOT NULL,
data_plata DATE DEFAULT SYSDATE,
metoda_plata VARCHAR2(50) -- de exemplu: card, numerar
);

INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (1, 3, 150.00, TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'card');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (2, 7, 230.50, TO_DATE('2024-12-03', 'YYYY-MM-DD'), 'numerar');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (3, 2, 99.99, TO_DATE('2024-11-12', 'YYYY-MM-DD'), 'online');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (4, 9, 150.00, TO_DATE('2024-11-16', 'YYYY-MM-DD'), 'card');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (5, 10, 130.50, TO_DATE('2024-11-08', 'YYYY-MM-DD'), 'card');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (6, 13, 90.00, TO_DATE('2024-11-23', 'YYYY-MM-DD'), 'numerar');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (7, 6, 140.00, TO_DATE('2024-12-27', 'YYYY-MM-DD'), 'online');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (8, 15, 120.50, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 'card');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (9, 11, 250.00, TO_DATE('2024-12-13', 'YYYY-MM-DD'), 'numerar');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (10, 8, 220.50, TO_DATE('2024-12-09', 'YYYY-MM-DD'), 'online');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (11, 12, 110.00, TO_DATE('2024-11-18', 'YYYY-MM-DD'), 'online');
INSERT INTO Plati_v (id_plata, id_comanda, suma, data_plata, metoda_plata)
VALUES (12, 14, 100.00, TO_DATE('2024-12-02', 'YYYY-MM-DD'), 'online');

CREATE TABLE Livrari_v (
id_livrare NUMBER PRIMARY KEY,
id_comanda NUMBER REFERENCES comenzi_v(id_comanda),
adresa_livrare VARCHAR2(200) NOT NULL,
status_livrare VARCHAR2(50), -- de exemplu: in curs, livrata, anulata
data_livrare DATE
);

INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (1, 2, 'Str. Lalelelor nr. 10', 'In curs de livrare', TO_DATE('2024-12-04', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (2, 5, 'Str. Trandafirilor nr. 6', 'Livrata', TO_DATE('2024-12-13', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (3, 9, 'Str. Florilor nr. 3', 'Anulata', TO_DATE('2024-11-28', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (4, 11, 'Str. Panselelor nr. 18', 'Livrata', TO_DATE('2024-12-24', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (5, 14, 'Str. Dorobanti nr. 6', 'Livrata', TO_DATE('2024-11-09', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (6, 10, 'Str. Stiintei nr. 12', 'Anulata', TO_DATE('2024-12-19', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (7, 15, 'Str. Berceni nr. 2', 'Livrata', TO_DATE('2024-12-07', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (8, 9, 'Str. Nitescu nr. 7', 'In curs de livrare', TO_DATE('2024-11-28', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (9, 3, 'Str. Brancoveanu nr. 5', 'Livrata', TO_DATE('2024-11-26', 'YYYY-MM-DD'));
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (10, 13, 'Str. Bucegi nr. 9', 'In curs de livrare', TO_DATE('2024-11-29', 'YYYY-MM-DD'));

CREATE TABLE Recenzii_v (
id_recenzie NUMBER PRIMARY KEY,
id_produs NUMBER REFERENCES produse_v(id_produs),
scor NUMBER(2) CHECK (scor BETWEEN 1 AND 10),
data_inregistrare DATE DEFAULT SYSDATE
);

INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (1, 4, 9, TO_DATE('2024-11-03', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (2, 6, 10, TO_DATE('2024-12-02', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (3, 1, 9, TO_DATE('2024-11-07', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (4, 5, 9, TO_DATE('2024-12-09', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (5, 4, 10, TO_DATE('2024-12-22', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (6, 3, 8, TO_DATE('2024-11-13', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (7, 8, 9, TO_DATE('2024-11-14', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (8, 11, 10, TO_DATE('2024-11-23', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (9, 9, 10, TO_DATE('2024-12-27', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (10, 12, 10, TO_DATE('2024-11-11', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (11, 2, 9, TO_DATE('2024-12-18', 'YYYY-MM-DD'));
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (12, 14, 8, TO_DATE('2024-11-02', 'YYYY-MM-