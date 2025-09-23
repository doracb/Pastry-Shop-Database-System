-- IF…THEN…ELSIF…END IF example
ACCEPT p_id_recenzie PROMPT 'Introduceți ID-ul recenziei: '
DECLARE
v_scor recenzii_v.scor%TYPE;
BEGIN
SELECT scor
INTO v_scor
FROM recenzii_v
WHERE id_recenzie = &p_id_recenzie;
IF v_scor >= 8 THEN
DBMS_OUTPUT.PUT_LINE('Recenzie pozitiva (scor=' || v_scor || ')');
ELSIF v_scor >= 5 THEN
DBMS_OUTPUT.PUT_LINE('Recenzie neutra (scor=' || v_scor || ')');
ELSE
DBMS_OUTPUT.PUT_LINE('Recenzie negativa (scor=' || v_scor || ')');
END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Nu exista recenzie cu ID-ul dat.');
END;
/

-- CASE … WHEN … THEN … END CASE example
ACCEPT p_id_produs PROMPT 'Introduceți ID-ul produsului: '
DECLARE
v_categorie produse_v.categorie%TYPE;
v_mesaj VARCHAR2(200);
BEGIN
SELECT categorie
INTO v_categorie
FROM produse_v
WHERE id_produs = &p_id_produs;
v_mesaj := CASE
WHEN v_categorie = 'Torturi' THEN 'Acesta este un tort delicios!'
WHEN v_categorie = 'Prajituri' THEN 'Aceasta este o prajitura aromata!'
ELSE 'Categorie necunoscută: ' || v_categorie
END;
DBMS_OUTPUT.PUT_LINE(v_mesaj);
END;
/

-- LOOP … EXIT WHEN … END LOOP example
DECLARE
i NUMBER:=1;
v_prenume angajati_v.prenume%TYPE;
v_nume angajati_v.nume%TYPE;
BEGIN
LOOP
SELECT prenume, nume
INTO v_prenume, v_nume
FROM angajati_v
WHERE id_angajat=i;
DBMS_OUTPUT.PUT_LINE('Angajatul '||i||': '||v_nume||' '||v_prenume);
i:=i+1;
EXIT WHEN i>7;
END LOOP;
END;
/

-- WHILE … LOOP … END LOOP example
DECLARE
v_max NUMBER;
i NUMBER := 1;
v_nume produse_v.denumire_produs%TYPE;
BEGIN
SELECT COUNT(*) INTO v_max FROM produse_v;
WHILE i <= v_max LOOP
BEGIN
SELECT denumire_produs
INTO v_nume
FROM produse_v
WHERE id_produs = i;
DBMS_OUTPUT.PUT_LINE('Produs ' || i || ': ' || v_nume);
EXCEPTION
WHEN NO_DATA_FOUND THEN
NULL;
END;
i := i + 1;
END LOOP;
END;
/

-- FOR … LOOP … END LOOP example
DECLARE
v_status_livrare livrari_v.status_livrare%TYPE;
BEGIN
FOR i IN 1..3 LOOP
BEGIN
SELECT lower(status_livrare)
INTO v_status_livrare
FROM livrari_v
WHERE id_comanda=i;
DBMS_OUTPUT.PUT_LINE('Comanda cu id-ul '||i||' este '||v_status_livrare);
EXCEPTION
WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Comanda cu id-ul '||i||' nu este inregistrata pentru livrare');
END;
END LOOP;
END;
/
