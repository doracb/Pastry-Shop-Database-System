-- Assign subscription type to clients based on loyalty points
SELECT id_client, prenume, nume,
CASE
    WHEN puncte_fidelitate >= 150 THEN 'Gold'
    WHEN puncte_fidelitate >= 100 THEN 'Silver'
    WHEN puncte_fidelitate >= 50 THEN 'Bronze'
    ELSE NULL
END AS client_subscription
FROM clienti_v;

-- Calculate approximate age of clients in years
SELECT prenume, nume, data_nastere,
TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12) AS age
FROM clienti_v;

-- Extract day, month, and year from client birth dates
SELECT id_client, prenume, nume,
EXTRACT(DAY FROM data_nastere) AS day_of_birth,
EXTRACT(MONTH FROM data_nastere) AS month_of_birth,
EXTRACT(YEAR FROM data_nastere) AS year_of_birth
FROM clienti_v;

-- Add bonus loyalty points for customers with orders > 300 lei (4 lines updated)
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