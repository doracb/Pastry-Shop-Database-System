-- CREATE command
SET SERVEROUTPUT ON
DECLARE
v_id_manager angajati_v.id_manager%TYPE;
BEGIN
select id_manager into v_id_manager from angajati_v where prenume='Carina';
execute immediate 'create table angajati_sup_v
as select * from angajati_v where id_manager='||v_id_manager;
dbms_output.put_line('Am creat o tabela care contine doar angajatii care o au ca manager pe Carina.');
END;
/

-- ALTER command
BEGIN
execute immediate 'alter table angajati_sup_v add bonus NUMBER(10,2)';
dbms_output.put_line('Am adaugat o coloana de bonusuri pentru angajati.');
END;
/

-- DELETE command
BEGIN
execute immediate 'drop table angajati_sup_v';
dbms_output.put_line('Am sters tabela angajati_sup_v');
END;
/