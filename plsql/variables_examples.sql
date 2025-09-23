-- Look for a product using a variable for the id
SET SERVEROUTPUT ON
DECLARE
v_denumire_produs produse_v.denumire_produs%TYPE;
v_descriere produse_v.descriere%TYPE;
BEGIN
SELECT denumire_produs,descriere
INTO v_denumire_produs,v_descriere
FROM produse_v
WHERE id_produs = &id_produs; -- la execuție vei fi întrebat de id_produs
DBMS_OUTPUT.PUT_LINE('Produsul ' || v_denumire_produs || ' este un: ' || v_descriere);
END;
/

-- Search for an employee by id and calculate the difference between the current and base salary
ACCEPT p_id_angajat PROMPT 'Introduceți ID-ul angajatului: '
DECLARE
v_salariul angajati_v.salariul%TYPE;
v_salariu_baza functii_v.salariu_baza%TYPE;
v_diferenta NUMBER(10,2);
BEGIN
SELECT a.salariul, f.salariu_baza
INTO v_salariul, v_salariu_baza
FROM angajati_v a
JOIN functii_v f ON a.id_functie = f.id_functie
WHERE a.id_angajat = &p_id_angajat;
v_diferenta := v_salariul - v_salariu_baza;
DBMS_OUTPUT.PUT_LINE('Salariu curent: ' || v_salariul || ' | Salariu bază: ' || v_salariu_baza ||' | Diferența: ' || v_diferenta);
END;
/

-- Calculate employee Lungu's salary at a potential 10% increase
DECLARE
v_procent NUMBER := &p_procente;
v_salariul angajati_v.salariul%TYPE;
v_salariu_marit angajati_v.salariul%TYPE;
BEGIN
SELECT salariul INTO v_salariul
FROM angajati_v
WHERE nume='Lungu';
v_salariu_marit:=v_salariul*(1+v_procent/100);
DBMS_OUTPUT.PUT_LINE('Procentul '||v_procent||' mareste salariul angajatului la '||v_salariu_marit||' lei.');
END;
/