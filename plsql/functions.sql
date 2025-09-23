-- Calculăm valoarea totală a unei comenzi (preț * cantitate pe fiecare linie)
CREATE OR REPLACE FUNCTION total_comanda_v
(p_id_comanda IN rand_comenzi_v.id_comanda%TYPE)
RETURN NUMBER
IS
v_total NUMBER(12,2);
BEGIN
SELECT NVL(SUM(pret * cantitate), 0)
INTO v_total
FROM Rand_comenzi_v
WHERE id_comanda = p_id_comanda;
RETURN v_total;
END;
/

SET SERVEROUTPUT ON
DECLARE
v_id_comanda rand_comenzi_v.id_comanda%TYPE:=&p_id_comanda;
BEGIN
DBMS_OUTPUT.PUT_LINE('Comanda cu id-ul '||v_id_comanda||' a costat '||total_comanda_v(v_id_comanda)||' lei.');
END;
/

-- Calculăm scorul average al unui produs din tabela recenzii_v
CREATE OR REPLACE FUNCTION avg_score_produs_v(p_id_produs IN recenzii_v.id_produs%TYPE)
RETURN NUMBER
IS
v_avg NUMBER(4,2);
BEGIN
SELECT NVL(AVG(scor), 0)
INTO v_avg
FROM Recenzii_v
WHERE id_produs = p_id_produs;
RETURN v_avg;
END;
/

SET SERVEROUTPUT ON
DECLARE
v_id_produs recenzii_v.id_produs%TYPE:=&p_id_produs;
v_nume_produs produse_v.denumire_produs%TYPE;
BEGIN
SELECT denumire_produs
INTO v_nume_produs
FROM produse_v
WHERE id_produs=v_id_produs;
DBMS_OUTPUT.PUT_LINE('Produsul '||lower(v_nume_produs)||' are ca scor mediu: '||avg_score_produs_v(v_id_produs));
END;
/