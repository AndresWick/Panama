SET ServerOutput ON;

CREATE OR REPLACE TRIGGER TG_ACTUALIZAR_SALDO_CTA
	AFTER INSERT ON MOVIMIENTO
	FOR EACH ROW
DECLARE
	L_ESTADO CHAR(1);
	L_SALDO NUMBER(8,2);
    L_NUEVOSALDO NUMBER(8,2);
BEGIN
     L_ESTADO:=(:new.i_estado);
        SELECT v_saldo INTO L_SALDO
        FROM cuenta
        WHERE (k_id = :new.k_idCuenta);
		if L_ESTADO='E' then
            L_NUEVOSALDO:=(L_SALDO-(:new.v_valor));
            UPDATE CUENTA
		    SET V_SALDO = L_NUEVOSALDO
		    WHERE k_id = :new.k_idCuenta;
          
        end if;
		
END TG_ACTUALIZAR_SALDO_CTA;
/
show errors

/*ALTER TRIGGER TG_ACTUALIZAR_SALDO_CTA DISABLE;*/