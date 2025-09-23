-- Căutăm data de angajare a unui angajat cu o procedura (folosind parametrii de OUT)
CREATE OR REPLACE PROCEDURE gaseste_data_angajare_v
(p_id_angajat IN angajati_v.id_angajat%TYPE, p_prenume OUT angajati_v.prenume%TYPE,
p_nume OUT angajati_v.nume%TYPE, p_data_angajare OUT angajati_v.data_angajare%TYPE,
p_salariu_baza OUT functii_v.salariu_baza%TYPE)
IS
BEGIN
SELECT a.prenume, a.nume, a.data_angajare, f.salariu_baza
INTO p_prenume, p_nume, p_data_angajare, p_salariu_baza
FROM angajati_v a
JOIN functii_v f ON a.id_functie = f.id_functie
WHERE id_angajat=p_id_angajat;
END;
/

SET SERVEROUTPUT ON
DECLARE
v_prenume angajati_v.prenume%TYPE;
v_nume angajati_v.nume%TYPE;
v_data_angajare angajati_v.data_angajare%TYPE;
v_salariu_baza functii_v.salariu_baza%TYPE;
BEGIN
gaseste_data_angajare_v(11,v_prenume,v_nume,v_data_angajare,v_salariu_baza);
DBMS_OUTPUT.PUT_LINE(v_prenume||' '||v_nume||' a fost angajat(a) pe data de '||v_data_angajare||' cu un salariu initial de '||v_salariu_baza||' lei.');
END;
/

-- Facem o procedura pentru a insera plati in tabela livrari_v pentru usurarea procesului
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE inserare_in_livrari_v
(p_id_livrare number, p_id_comanda livrari_v.id_comanda%TYPE, p_adresa_livrare livrari_v.adresa_livrare%TYPE,
p_status_livrare livrari_v.status_livrare%TYPE, p_data_angajare date default sysdate)
IS
BEGIN
INSERT INTO livrari_v (id_livrare, id_comanda, adresa_livrare, status_livrare, data_livrare)
VALUES (p_id_livrare, p_id_comanda,p_adresa_livrare, p_status_livrare, p_data_angajare);
DBMS_OUTPUT.PUT_LINE('Inserare efectuata!');
END;
/

SET SERVEROUTPUT ON
BEGIN
inserare_in_livrari_v(11,12,'Bulevardul Dorobanti nr. 17','Livrata',SYSDATE);
END;
/
