-- INSERT command
BEGIN
INSERT INTO clienti_v (id_client, prenume, nume, telefon, email,
data_nastere, sex, preferinte, puncte_fidelitate)
VALUES (16, 'Marian', 'Pop', '0745570906', 'pop.marian@gmail.com', '20-NOV-1999', 'M', null, 30);
END;
/

BEGIN
INSERT INTO recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (13, 7, 10, TO_DATE('2024-11-19', 'YYYY-MM-DD'));
END;
/

BEGIN
INSERT INTO Livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (11, 4, 'Str. Mihai Eminescu nr. 3', 'Livrata', TO_DATE('2024-12-06', 'YYYY-MM-DD'));
END;
/

-- UPDATE command
SET SERVEROUTPUT ON
DECLARE
v_pret number:=20;
BEGIN
update rand_comenzi_v
set pret=pret++v_pret;
END;
/

BEGIN
update produse_v
set personalizabil='DA'
where initcap(categorie)='Torturi';
dbms_output.put_line('Am facut toate torturile personalizabile.');
END;
/

BEGIN
update livrari_v
set status_livrare='Livrata'
where id_livrare=8;
dbms_output.put_line('Am modificat livrarea cu id-ul 8 ca livrata.');
END;

-- DELETE command
BEGIN
delete from recenzii_v where scor<9;
rollback;
dbms_output.put_line('Stergem recenziile cu un scor mai mic de 9, apoi anulam modificarea.');
END;
/

BEGIN
delete from livrari_v where initcap(status_livrare)='Anulata';
dbms_output.put_line('Stergem livrarile anulate.');
END;
