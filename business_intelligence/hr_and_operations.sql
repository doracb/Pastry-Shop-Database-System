-- Calculate the average salary per job role, rounded to 2 decimals
SELECT id_functie, ROUND(AVG(salariul),2) AS avg_salary
FROM angajati_v
GROUP BY id_functie;

-- Increase the salary of pastry chefs by 10%
UPDATE angajati_v
SET salariul = salariul * 1.1
WHERE id_functie IN (1,2);

-- Raise the basic salary for pastry chefs and pastry chef assistants (+100 lei)
UPDATE functii_v
SET salariu_baza = salariu_baza + 100
WHERE denumire_functie LIKE '%Cofetar%';

-- Count number of orders handled by each employee
SELECT a.nume, a.prenume, COUNT(c.id_comanda) AS order_count
FROM angajati_v a 
JOIN comenzi_v c
ON a.id_angajat = c.id_angajat
GROUP BY a.nume, a.prenume;