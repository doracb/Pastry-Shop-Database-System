-- =====================================================
-- Basic SQL Queries – single-row functions, group functions, CASE, DECODE, joins, etc.
-- =====================================================

-- 1. Display clients with gender as full word (using DECODE)
SELECT id_client, DECODE(sex, 'M', 'Masculine', 'F', 'Feminine', 'Unknown') AS gender
FROM clienti_v;

-- 2. Assign subscription type to clients based on loyalty points (using CASE)
SELECT id_client, prenume, nume,
CASE
    WHEN puncte_fidelitate >= 150 THEN 'Gold'
    WHEN puncte_fidelitate >= 100 THEN 'Silver'
    WHEN puncte_fidelitate >= 50 THEN 'Bronze'
    ELSE NULL
END AS client_subscription
FROM clienti_v;

-- 3. List clients who have placed at least one order
SELECT id_client, prenume, nume
FROM clienti_v
WHERE id_client IN (SELECT DISTINCT id_client FROM comenzi_v);

-- 4. Find employees with Gmail email addresses
SELECT * FROM angajati_v
WHERE LOWER(email) LIKE '%gmail%';

-- 5. Select clients born in July
SELECT * FROM clienti_v
WHERE data_nastere LIKE '%JUL%';

-- 6. Products with the maximum price
SELECT p.id_produs, p.denumire_produs, rc.pret
FROM produse_v p, rand_comenzi_v rc
WHERE p.id_produs = rc.id_produs 
  AND rc.pret IN (SELECT MAX(pret) FROM rand_comenzi_v);

-- 7. Orders placed online after November 14, 2024
SELECT * FROM comenzi_v
WHERE modalitate = 'online' 
  AND data > TO_DATE('14-NOV-2024', 'DD-MON-YYYY');

-- 8. Average salary per job role, rounded to 2 decimals
SELECT id_functie, ROUND(AVG(salariul),2) AS avg_salary
FROM angajati_v
GROUP BY id_functie;

-- 9. Calculate approximate age of clients in years
SELECT prenume, nume, data_nastere,
TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12) AS age
FROM clienti_v;

-- 10. Total order value for each order, sorted descending
SELECT co.id_comanda, SUM(rc.cantitate*rc.pret) AS total_value
FROM comenzi_v co, rand_comenzi_v rc
WHERE co.id_comanda = rc.id_comanda
GROUP BY co.id_comanda
ORDER BY total_value DESC;

-- 11. Display order dates in YYYY-MM-DD format
SELECT id_comanda, TO_CHAR(data, 'YYYY-MM-DD') AS order_date
FROM comenzi_v;

-- 12. Replace NULL values in client preferences with a default string
SELECT id_client, nume, prenume, NVL(preferinte, 'no preferences') AS preferences
FROM clienti_v;

-- 13. Show length of each product name
SELECT denumire_produs, LENGTH(denumire_produs) AS name_length
FROM produse_v;

-- 14. Extract day, month, and year from client birth dates
SELECT id_client, prenume, nume,
EXTRACT(DAY FROM data_nastere) AS day_of_birth,
EXTRACT(MONTH FROM data_nastere) AS month_of_birth,
EXTRACT(YEAR FROM data_nastere) AS year_of_birth
FROM clienti_v;

-- 15. Count number of orders handled by each employee
SELECT a.nume, a.prenume, COUNT(c.id_comanda) AS order_count
FROM angajati_v a, comenzi_v c
WHERE a.id_angajat = c.id_angajat
GROUP BY a.nume, a.prenume;
