-- Afișăm datele de contact ale unui angajat
ACCEPT p_prenume PROMPT 'Introduceți prenumele angajatului: '
SET SERVEROUTPUT ON
DECLARE
v_telefon angajati_v.telefon%TYPE;
v_email angajati_v.email%TYPE;
BEGIN
SELECT telefon, email
INTO v_telefon, v_email
FROM angajati_v
WHERE prenume='&p_prenume';
DBMS_OUTPUT.PUT_LINE('Date de contact angajat: ');
DBMS_OUTPUT.PUT_LINE(' Telefon: ' || v_telefon);
DBMS_OUTPUT.PUT_LINE(' Email: ' || v_email);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Nu exista niciun angajat cu acest nume.');
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('Exista mai multi angajati cu acest nume.');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('A aparut o eroare neasteptata.');
END;
/
Când interogarea e corectă, se afișează:
Altfel, se tratează excepția:

-- Definim o excepție pentru ORA-02292 (FK violation) pentru atunci când se încearcă ștergerea unui client din baza de date
ACCEPT p_id_client PROMPT 'Introduceti ID-ul clientului de sters: '
DECLARE
ex_fk_violation EXCEPTION;
PRAGMA EXCEPTION_INIT(ex_fk_violation, -2292);
BEGIN
DELETE FROM clienti_v
WHERE id_client=&p_id_client;
IF SQL%ROWCOUNT = 0 THEN
DBMS_OUTPUT.PUT_LINE('Nu a fost găsit niciun client cu acest id.');
ELSE
DBMS_OUTPUT.PUT_LINE('Sters cu succes!');
END IF;
EXCEPTION
WHEN ex_fk_violation THEN
DBMS_OUTPUT.PUT_LINE('Nu se poate sterge! Exista obiecte dependente (comenzi, plati etc.) pentru clientul cu id = ' || &p_id_client);
/

-- Tratăm cazul în care se încearca inserarea în tabela produse, dar id-ul introdus este null, cu o excepție definită de utilizator
DECLARE
ex_null EXCEPTION;
PRAGMA EXCEPTION_INIT(ex_null, -1400);
BEGIN
INSERT INTO produse_v (id_produs, denumire_produs, descriere, categorie, personalizabil)
VALUES (NULL, 'Tiramisu', 'descriere', 'Torturi', 'NU');
DBMS_OUTPUT.PUT_LINE('Produs inserat cu succes!');
EXCEPTION
WHEN ex_null THEN
DBMS_OUTPUT.PUT_LINE('EROARE!!! Coloana id_produs nu poate fi NULL!');
END;
/