-- Folosim un pachet pentru a face reduceri la produse, verificând daca diferența față de prețul inițial nu este prea drastică înainte
CREATE OR REPLACE PACKAGE promotii_pkg_v IS
g_max_reducere CONSTANT NUMBER := 0.30;
FUNCTION validare_reducere(p_pret_vechi produse.pret_lista%TYPE, p_pret_nou produse.pret_lista%TYPE) RETURN BOOLEAN;
PROCEDURE aplica_reducere(p_id_produs produse.id_produs%TYPE, p_pret_nou produse.pret_lista%TYPE);
END promotii_pkg_v;
/

CREATE OR REPLACE PACKAGE BODY promotii_pkg_v IS
FUNCTION validare_reducere(p_pret_vechi produse.pret_lista%TYPE, p_pret_nou produse.pret_lista%TYPE)
RETURN BOOLEAN IS
BEGIN
IF p_pret_nou<p_pret_vechi*(1-g_max_reducere) THEN
RETURN FALSE;
ELSE
RETURN TRUE;
END IF;
END validare_reducere;
PROCEDURE aplica_reducere(p_id_produs produse.id_produs%TYPE, p_pret_nou produse.pret_lista%TYPE) IS
v_pret_vechi produse.pret_lista%TYPE;
BEGIN
SELECT pret_lista INTO v_pret_vechi FROM produse WHERE id_produs=p_id_produs;
IF validare_reducere(v_pret_vechi,p_pret_nou) THEN
UPDATE produse
SET pret_lista=p_pret_nou
WHERE id_produs=p_id_produs;
ELSE
RAISE_APPLICATION_ERROR(-20210, 'Reducere prea mare!');
END IF;
END aplica_reducere;
END promotii_pkg_v;
/

SET SERVEROUTPUT ON
DECLARE
v_denumire_produs produse.denumire_produs%TYPE;
v_id_produs produse.id_produs%TYPE:=&v_id_produs;
v_pret_nou produse.pret_lista%TYPE:=&p_pret_nou;
BEGIN
SELECT denumire_produs INTO v_denumire_produs FROM produse WHERE id_produs=v_id_produs;
promotii_pkg_v.aplica_reducere(v_id_produs,v_pret_nou);
DBMS_OUTPUT.PUT_LINE('Pretul produsului '||v_denumire_produs||' a fost redus.');
END;
/