-- Folosim o tabelă trig_log_modificari_angajati care să logheze modificările aduse angajaților cu ajutorul unui trigger
create table trg_log_modificari_angajati(tip CHAR(1), utilizator VARCHAR2(50), data DATE DEFAULT SYSDATE);
describe log_modificari_angajati;
create or replace trigger trg_modif_angajati_v
before insert or update or delete on angajati_v
declare
v_tip log_modificari_angajati.tip%TYPE;
begin
case
when inserting then v_tip:='I';
when updating then v_tip:='U';
else v_tip:='D';
end case;
insert into trg_log_modificari_angajati(tip, utilizator, data) values (v_tip, user, sysdate);
end;
/
-- Facem niște modificări în tabela angajati_v pentru a testa:
insert into angajati_v (id_angajat,prenume,nume,telefon,email,data_angajare,salariul,id_functie,id_manager)
values (18,'George','Washington','0782317533','gwash@gmail.com',to_date('30-JUL-2020','DD-MON-YYYY'),5000,8,10);
update angajati_v
set salariul=salariul+200
where id_angajat=18;
delete from angajati_v
where id_angajat=18;

-- Folosim un trigger pentru a atenționa dacă scorul introdus nu este valid (adică e <1 sau >10)
create or replace trigger trg_validare_recenzie_v
before insert or update on recenzii_v
for each row
begin
if :NEW.scor < 1 OR :NEW.scor > 10 then
RAISE_APPLICATION_ERROR(-20001, 'Atentie, scorul recenziei trebuie sa fie intre 1 si 10!');
end if;
end;
/
Acum testarea cu o încercare de inserare în recenzii_v:
INSERT INTO Recenzii_v (id_recenzie, id_produs, scor, data_inregistrare)
VALUES (17, 3, 11, TO_DATE('2024-12-01', 'YYYY-MM-DD'));