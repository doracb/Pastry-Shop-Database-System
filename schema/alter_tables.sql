-- 1) remove the description column from the Retete_v table
ALTER TABLE retete_v
DROP COLUMN descriere;
SELECT * FROM retete_v;

-- 2) add a check constraint for sex in the Clienti_v table
ALTER TABLE clienti_v
ADD CONSTRAINT ck_sex_v CHECK (sex IN ('M', 'F'));

-- 3) disable and then delete the gender constraint in the Clienti_v table
ALTER TABLE clienti_v
DISABLE CONSTRAINT ck_sex_v;
ALTER TABLE clienti_v
DROP CONSTRAINT ck_sex_v;

-- 4) change the data type of the email column in the Employees_v table
ALTER TABLE angajati_v
MODIFY (email VARCHAR2(35));

-- 5) change the data type of the sex column in the Clienti_v table
ALTER TABLE clienti_v
MODIFY (sex VARCHAR2(10));
