-- Căutăm comenzile făcute de un client folosind id-ul său
DECLARE
CURSOR c_comenzi (p_id_client CLIENTI_v.id_client%TYPE) IS
SELECT id_comanda, data, modalitate
FROM comenzi_v
WHERE id_client = p_id_client;
v_comenzi_record c_comenzi%ROWTYPE;
v_id_client NUMBER:=&v_id_client;
v_nume clienti_v.nume%TYPE;
BEGIN
SELECT nume INTO v_nume FROM clienti_v WHERE id_client=v_id_client;
OPEN c_comenzi(v_id_client);
DBMS_OUTPUT.PUT_LINE('Comenzile clientului '||v_nume||' sunt:');
LOOP
FETCH c_comenzi INTO v_comenzi_record;
EXIT WHEN c_comenzi%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Comanda '||v_comenzi_record.id_comanda||' | Data: '|| v_comenzi_record.data||' | Modul: '||v_comenzi_record.modalitate);
END LOOP;
CLOSE c_comenzi;
END;
/

-- Modificăm livrările “în curs de livrare” ca fiind deja livrate și numărăm câte sunt folosind SQL%ROWCOUNT
BEGIN
UPDATE livrari_v
SET status_livrare='Livrata'
WHERE status_livrare='In curs de livrare';
DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' randuri modificate');
ROLLBACK;
END;
/

-- Modificăm descrierea produselor personalizabile folosind un cursor explicit
DECLARE
CURSOR c_cursor_produse is
SELECT * FROM produse_v WHERE personalizabil = 'DA';
BEGIN
FOR v_produse_record IN c_cursor_produse LOOP
UPDATE produse_v
SET descriere = descriere || ' (personalizabil!)'
WHERE id_produs = v_produse_record.id_produs;
END LOOP;
END;
/

-- Testăm dacă putem modifica numele unui produs folosind SQL%NOTFOUND
BEGIN
UPDATE produse
SET denumire_produs='Tort mascarpone'
WHERE id_produs=&id_produs;
IF SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('Nu exista produsul cu acest cod!!');
END IF;
ROLLBACK;
END;
/