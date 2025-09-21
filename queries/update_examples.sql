-- 1) increase the salary of pastry chefs by 10%
UPDATE angajati_v
SET salariul = salariul * 1.1
WHERE id_functie IN (1,2);

-- 2) change the price of the fruit cake from 110 to 120 (2 rows updated)
UPDATE rand_comenzi_v
SET pret = 120
WHERE id_produs = (
    SELECT id_produs 
    FROM produse_v 
    WHERE denumire_produs = 'Tort cu fructe'
);
COMMIT;

-- 3) add bonus loyalty points for customers with orders > 300 lei (4 lines updated)
UPDATE clienti_v
SET puncte_fidelitate = puncte_fidelitate + 50
WHERE id_client IN (
    SELECT id_client 
    FROM comenzi_v 
    WHERE id_comanda IN (
        SELECT id_comanda 
        FROM rand_comenzi_v 
        GROUP BY id_comanda 
        HAVING SUM(pret * cantitate) > 300
    )
);

-- 4) raise the basic salary for pastry chefs and pastry chef assistants (+100 lei)
UPDATE functii_v
SET salariu_baza = salariu_baza + 100
WHERE denumire_functie LIKE '%Cofetar%';

-- 5) delete employees with Yahoo email and then cancel the transaction
DELETE FROM angajati_v
WHERE id_functie != 6 
  AND email LIKE '%yahoo%';

SELECT * FROM angajati_v;
ROLLBACK;
