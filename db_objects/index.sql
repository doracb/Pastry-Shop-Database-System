-- Create index on clients email
CREATE INDEX idx_email_clienti ON clienti_v(email);

-- Test index usage
SELECT * FROM clienti_v WHERE email LIKE '%gmail%';

-- Drop index
DROP INDEX idx_email_clienti;
