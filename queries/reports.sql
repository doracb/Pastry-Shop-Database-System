-- =====================================================
-- Advanced SQL Queries – UNION, INTERSECT, MINUS, subqueries
-- =====================================================

-- 1. Products that are customizable OR belong to category 'cakes' (UNION)
SELECT id_produs, denumire_produs, personalizabil 
FROM produse_v 
WHERE personalizabil = 'DA'
UNION
SELECT id_produs, denumire_produs, personalizabil 
FROM produse_v 
WHERE categorie = 'prajituri';

-- 2. Calculate discount based on product quantity (CASE)
SELECT co.id_comanda, rc.cantitate, cl.id_client, cl.nume,
CASE
    WHEN rc.cantitate >= 2 THEN 0.2 * rc.pret
    WHEN rc.cantitate >= 1 THEN 0.1 * rc.pret
    ELSE 0
END AS discount
FROM clienti_v cl, rand_comenzi_v rc, comenzi_v co
WHERE rc.id_comanda = co.id_comanda 
  AND co.id_client = cl.id_client;

-- 3. Recipes that are 'blat' and require <= 50 minutes (MINUS)
SELECT r.id_reteta, r.denumire_reteta, pr.tip_componenta, r.timp_preparare
FROM retete_v r, produse_retete_v pr
WHERE pr.tip_componenta = 'blat'
MINUS
SELECT r.id_reteta, r.denumire_reteta, pr.tip_componenta, r.timp_preparare
FROM retete_v r, produse_retete_v pr
WHERE r.timp_preparare > 50;

-- 4. Products ordered at least twice AND with total value > 400 lei (INTERSECT)
SELECT p.denumire_produs, SUM(rc.cantitate * rc.pret) AS total_value, COUNT(rc.id_comanda) AS order_count
FROM produse_v p, rand_comenzi_v rc
WHERE p.id_produs = rc.id_produs
GROUP BY p.denumire_produs
HAVING COUNT(rc.id_comanda) >= 2
INTERSECT
SELECT p.denumire_produs, SUM(rc.cantitate * rc.pret), COUNT(rc.id_comanda)
FROM produse_v p, rand_comenzi_v rc
WHERE p.id_produs = rc.id_produs
GROUP BY p.denumire_produs
HAVING SUM(rc.cantitate * rc.pret) >= 400;

-- 5. Total preparation time for each product
SELECT pr.id_produs, p.denumire_produs, SUM(r.timp_preparare) AS total_duration
FROM retete_v r, produse_retete_v pr, produse_v p
WHERE r.id_reteta = pr.id_reteta 
  AND pr.id_produs = p.id_produs
GROUP BY pr.id_produs, p.denumire_produs
ORDER BY total_duration DESC;

-- 6. Orders greater than those of client with id_client=2 (subquery + ANY)
SELECT id_comanda, data, id_client, id_angajat
FROM comenzi_v
WHERE id_comanda IN (
    SELECT id_comanda 
    FROM rand_comenzi_v
    GROUP BY id_comanda
    HAVING SUM(pret * cantitate) > ANY (
        SELECT SUM(pret * cantitate)
        FROM rand_comenzi_v
        WHERE id_comanda IN (SELECT id_comanda FROM comenzi_v WHERE id_client = 2)
        GROUP BY id_comanda
    )
);

-- 7. Display clients and their orders, including clients with no orders (outer join)
SELECT cl.id_client, cl.prenume, cl.nume, co.id_comanda
FROM clienti_v cl, comenzi_v co
WHERE cl.id_client = co.id_client(+);

