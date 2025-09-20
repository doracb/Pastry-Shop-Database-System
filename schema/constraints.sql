-- Primary Keys
ALTER TABLE angajati_v
    ADD CONSTRAINT pkey_angajati_v PRIMARY KEY (id_angajat);

ALTER TABLE functii_v
    ADD CONSTRAINT pkey_functii_v PRIMARY KEY (id_functie);

ALTER TABLE clienti_v
    ADD CONSTRAINT pkey_clienti_v PRIMARY KEY (id_client);

ALTER TABLE comenzi_v
    ADD CONSTRAINT pkey_comenzi_v PRIMARY KEY (id_comanda);

ALTER TABLE produse_v
    ADD CONSTRAINT pkey_produse_v PRIMARY KEY (id_produs);

ALTER TABLE retete_v
    ADD CONSTRAINT pkey_retete_v PRIMARY KEY (id_reteta);

-- Foreign Keys
ALTER TABLE angajati_v
    ADD CONSTRAINT fkey_angajati_v FOREIGN KEY (id_functie)
    REFERENCES functii_v (id_functie);

ALTER TABLE comenzi_v
    ADD CONSTRAINT fkey_id_angajat_comenzi_v FOREIGN KEY (id_angajat)
    REFERENCES angajati_v (id_angajat);

ALTER TABLE comenzi_v
    ADD CONSTRAINT fkey_id_client_comenzi_v FOREIGN KEY (id_client)
    REFERENCES clienti_v (id_client);

ALTER TABLE rand_comenzi_v
    ADD CONSTRAINT fkey_id_comanda_rc_v FOREIGN KEY (id_comanda)
    REFERENCES comenzi_v (id_comanda);

ALTER TABLE rand_comenzi_v
    ADD CONSTRAINT fkey_id_produs_rc_v FOREIGN KEY (id_produs)
    REFERENCES produse_v (id_produs);

ALTER TABLE produse_retete_v
    ADD CONSTRAINT fkey_id_produs_prod_retete_v FOREIGN KEY (id_produs)
    REFERENCES produse_v (id_produs);

ALTER TABLE produse_retete_v
    ADD CONSTRAINT fkey_id_reteta_prod_retete_v FOREIGN KEY (id_reteta)
    REFERENCES retete_v (id_reteta);
