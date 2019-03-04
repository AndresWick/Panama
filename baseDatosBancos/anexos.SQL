CREATE USER BANCO IDENTIFIED BY banco;
GRANT CONNECT, RESOURCE TO BANCO;
GRANT CREATE VIEW TO BANCO;
CONN BANCO/banco;
START C:\Users\Public\Pictures\EsquemaBancos.sql

DROP SEQUENCE MOVIMIENTOS_SEQ;

CREATE SEQUENCE MOVIMIENTOS_SEQ
START WITH     1
INCREMENT BY   1
NOCACHE
NOCYCLE;


/* listar tablas */
SELECT table_name,owner FROM all_tables WHERE owner='BANCO';

/* Para leer o escribir archivos es necesario crear un objeto directory desde SQL: */
create directory dir_tmp as 'C:\Users\ANDRES\Documents\PL-SQL BANCOS\temp';
grant read, write on directory dir_tmp to BANCO;

/* Permisos de UTL_FILE a BANCO*/
conn / as sysdba
Connected.
SQL> grant execute on UTL_FILE TO BANCO;