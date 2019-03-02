
*/
SET ServerOutput ON;

/*
    Pruebas a la funcion FU_VALIDAR_CTA
*/
DECLARE
    test1 NUMBER;
    test2 NUMBER;
begin
  test1:=PK_BANCO.FU_VALIDAR_CTA(1,1);
  DBMS_OUTPUT.PUT_LINE(test1);
  test2:=PK_BANCO.FU_VALIDAR_CTA(2,8);
  DBMS_OUTPUT.PUT_LINE(test2);
end;
/