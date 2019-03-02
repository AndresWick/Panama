/*CREATE USER BANCO IDENTIFIED BY banco;
GRANT CONNECT, RESOURCE TO BANCO;
GRANT CREATE VIEW TO BANCO;
CONN BANCO/banco;
START C:\Users\Public\Pictures\EsquemaBancos.sql


SELECT table_name,owner FROM all_tables WHERE owner='BANCO';

*/
SET ServerOutput ON;

/*
    Pruebas a la funcion FU_VALIDAR_CTA
*/
DECLARE
    test1 NUMBER;
    test2 NUMBER;
begin
  test1:=PK_BANCOS.FU_VALIDAR_CTA(1,1);
  DBMS_OUTPUT.PUT_LINE(test1);
  test2:=PK_BANCOS.FU_VALIDAR_CTA(2,2);
  DBMS_OUTPUT.PUT_LINE(test2);
end;
/