-- View: Orders placed in December
CREATE OR REPLACE VIEW comenzi_decembrie AS
SELECT * 
FROM comenzi_v
WHERE EXTRACT(MONTH FROM data) = 12;

-- Test the view
SELECT * FROM comenzi_decembrie;
