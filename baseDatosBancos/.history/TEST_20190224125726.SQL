SET ServerOutput ON;

/*
    Pruebas a la funcion FU_VALIDAR_CTA
*/
DECLARE
    test1 NUMBER;
    test2 NUMBER;
begin
  DBMS_OUTPUT.PUT_LINE('PRUEBAS  FU_VALIDAR_CTA() -->');
  test1:=PK_BANCOS.FU_VALIDAR_CTA(1,1);
  DBMS_OUTPUT.PUT_LINE(test1);
  test2:=PK_BANCOS.FU_VALIDAR_CTA(2,2);
  DBMS_OUTPUT.PUT_LINE(test2);
end;
/

/*
    Pruebas a la funcion FU_VALIDAR_CTA
*/
DECLARE
    pk_cuenta NUMBER:=1;
    pk_banco NUMBER:=1;
    pk_titular NUMBER:=1;
    pv_clave NUMBER:=1111;
    test1 NUMBER;
    test2 NUMBER;
begin
  DBMS_OUTPUT.PUT_LINE('PRUEBAS  FU_VALIDAR_TITULAR() -->');
  test1:=PK_BANCOS.FU_VALIDAR_TITULAR(pk_cuenta,pk_banco,pk_titular,pv_clave);
  DBMS_OUTPUT.PUT_LINE(test1);
  test2:=PK_BANCOS.FU_VALIDAR_TITULAR(pk_cuenta,pk_banco,pk_titular,pv_clave);
  DBMS_OUTPUT.PUT_LINE(test2);
end;
/