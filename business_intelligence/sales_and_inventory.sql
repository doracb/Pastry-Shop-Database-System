-- Products with the maximum price
SELECT p.id_produs, p.denumire_produs, rc.pret
FROM produse_v p
JOIN rand_comenzi_v rc
ON p.id_produs = rc.id_produs 
WHERE rc.pret IN (SELECT MAX(pret) FROM rand_comenzi_v);

-- Total order value for each order, sorted descending
SELECT co.id_comanda, SUM(rc.cantitate*rc.pret) AS total_value
FROM comenzi_v co
JOIN rand_comenzi_v rc
ON co.id_comanda = rc.id_comanda
GROUP BY co.id_comanda
ORDER BY total_value DESC;

-- Total preparation time for each product
SELECT pr.id_produs, p.denumire_produs, SUM(r.timp_preparare) AS total_duration
FROM retete_v r 
JOIN produse_retete_v pr
ON r.id_reteta = pr.id_reteta 
JOIN produse_v p
ON pr.id_produs = p.id_produs
GROUP BY pr.id_produs, p.denumire_produs
ORDER BY total_duration DESC;

-- Products ordered at least twice AND with total value > 400 lei (INTERSECT)
SELECT p.denumire_produs, SUM(rc.cantitate * rc.pret) AS total_value, COUNT(rc.id_comanda) AS order_count
FROM produse_v p
JOIN rand_comenzi_v rc
ON p.id_produs = rc.id_produs
GROUP BY p.denumire_produs
HAVING COUNT(rc.id_comanda) >= 2
INTERSECT
SELECT p.denumire_produs, SUM(rc.cantitate * rc.pret), COUNT(rc.id_comanda)
FROM produse_v p, rand_comenzi_v rc
WHERE p.id_produs = rc.id_produs
GROUP BY p.denumire_produs
HAVING SUM(rc.cantitate * rc.pret) >= 400;