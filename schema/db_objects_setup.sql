-- Create sequence for unique client IDs
CREATE SEQUENCE seq_nrclient
START WITH 30 INCREMENT BY 5
MAXVALUE 99 NOCYCLE;

-- Optimize lookups on the clients table
CREATE INDEX idx_email_clienti ON clienti_v(email);

-- Create synonym for simplified query syntax on recipe components
CREATE SYNONYM pr FOR produse_retete_v;

-- View: Pre-aggregated reporting for December orders
CREATE OR REPLACE VIEW comenzi_decembrie AS
SELECT * 
FROM comenzi_v
WHERE EXTRACT(MONTH FROM data) = 12;