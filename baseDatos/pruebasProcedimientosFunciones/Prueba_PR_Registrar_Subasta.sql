DECLARE
  LK_IDPER NUMBER;
  LK_TIPOBUQUE NUMBER;
  LK_FECHA DATE;
  LK_SENTIDO VARCHAR2(5);
  LN_ID_AGENTE VARCHAR2(20);
  LV_OFERTA NUMBER;
BEGIN
  LK_IDPER := 2;
  LK_TIPOBUQUE := 1;
  LK_FECHA := to_date('2019/02/10','yyyy/mm/dd');
  LK_SENTIDO := 'Norte';
  LN_ID_AGENTE := 1;
  LV_OFERTA := '100';

  PR_REGISTRAR_OFERTA_EN_SUBASTA(
    LK_IDPER => LK_IDPER,
    LK_TIPOBUQUE => LK_TIPOBUQUE,
    LK_FECHA => LK_FECHA,
    LK_SENTIDO => LK_SENTIDO,
    LN_ID_AGENTE => LN_ID_AGENTE,
    LV_OFERTA => LV_OFERTA
  );
--rollback; 
END;
