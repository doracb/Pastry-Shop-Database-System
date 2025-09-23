-- Create sequence for unique client IDs
CREATE SEQUENCE seq_nrclient
START WITH 30 INCREMENT BY 5
MAXVALUE 99 NOCYCLE;

-- Insert client using the sequence
INSERT INTO clienti_v (id_client, prenume, nume, telefon, email, data_nastere, sex, preferinte, puncte_fidelitate)
VALUES (seq_nrclient.NEXTVAL, 'Ion', 'Popescu', '0712345678', 'ion.popescu@gmail.com', TO_DATE('15-NOV-1999', 'DD-MON-YYYY'), 'M', 'null', 30);

-- Check current sequence value
SELECT seq_nrclient.CURRVAL FROM dual;

-- Check inserted client
SELECT * FROM clienti_v;
