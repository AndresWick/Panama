SET ServerOutput ON;

CREATE OR REPLACE VIEW V_TITULARES_CUENTAS
AS (
	SELECT (T.N_NOMBRE|| ' ' || T.N_APELLIDO) nombre, T.K_ID identificacion, B.K_ID idBanco,B.N_NOMBRE nombreBanco, C.K_ID cuenta
	FROM cuenta C, titular T, banco B
	WHERE B.K_ID = C.K_IDBANCO AND C.K_IDTITULAR = T.K_ID 
	);

CREATE OR REPLACE PACKAGE BODY PK_BANCOS AS 

    FUNCTION FU_VALIDAR_CTA(pk_cuenta   IN cuenta.k_id%TYPE,
                            pk_banco    IN banco.k_id%TYPE) RETURN INTEGER 
        IS
            l_cuenta cuenta.k_id%TYPE;
        BEGIN
            SELECT cuenta INTO l_cuenta
            FROM V_TITULARES_CUENTAS
            WHERE (cuenta = pk_cuenta AND idBanco = pk_banco);
            return 0;
        exception
            when no_data_found then
                return 1;                  
    END FU_VALIDAR_CTA;

    FUNCTION FU_VALIDAR_TITULAR(pk_cuenta   IN cuenta.k_id%TYPE,
                                pk_banco    IN banco.k_id%TYPE,
                                pk_titular  IN titular.k_id%TYPE,
                                pv_clave    IN cuenta.v_clave%TYPE) RETURN INTEGER 
        IS
            l_clave cuenta.v_clave%TYPE;
            le_ctaNoExistente EXCEPTION;
        BEGIN
            if FU_VALIDAR_CTA(pk_cuenta,pk_banco)=0 then
              SELECT v_clave INTO l_clave
                FROM cuenta
                WHERE (k_id = pk_cuenta AND k_idBanco = pk_banco AND k_idtitular = pk_titular);
                if l_clave=pv_clave then
                  return 0;
                else
                  return 1;
                end if;
            else
                RAISE le_ctaNoExistente;
            end if;
        exception
            when no_data_found then
                return 1;
            when le_ctaNoExistente then
                DBMS_OUTPUT.PUT_LINE('La cuenta no existente.');
                /*RAISE_APPLICATION_ERROR(-20100,'La cuenta no existente.');*/
                return 2;                       
    END FU_VALIDAR_TITULAR;

    PROCEDURE PR_REGISTRAR_MOVIMIENTO(pk_cuenta    IN cuenta.k_id%TYPE,
                                      pk_banco     IN banco.k_id%TYPE,
                                      pk_titular   IN titular.k_id%TYPE,
                                      pv_valor     IN cuenta.v_saldo%TYPE,
                                      pv_clave     IN cuenta.v_clave%TYPE,
                                      pk_concepto  IN concepto.k_concepto%TYPE)
        IS
            le_ctaNoExistente EXCEPTION;
            le_datosErroneos EXCEPTION;
            le_saldoInsuficiente EXCEPTION;
            l_idMovimiento movimiento.k_id%TYPE;
        BEGIN
            if FU_VALIDAR_CTA(pk_cuenta,pk_banco)=0 then
                if FU_VALIDAR_TITULAR(pk_cuenta,pk_banco,pk_titular,pv_clave)=0 then
                    if FU_VALIDAR_SALDO(pk_cuenta,pk_banco,pv_valor)=0 then
                        l_idMovimiento:=MOVIMIENTOS_SEQ.nextval;
                        INSERT INTO movimiento
                        (k_id,v_valor,f_fecha,i_estado,k_idcuenta)
                        VALUES
                        (l_idMovimiento,pv_valor,SYSDATE,PK_BANCOS.gv_exitoso,pk_cuenta);
                        INSERT INTO detallemovimiento
                        (k_detalle,k_concepto,k_movimiento)
                        VALUES
                        (l_idMovimiento,pk_concepto,l_idMovimiento);
                        DBMS_OUTPUT.PUT_LINE('Movimiento registrado.');
                        FU_VALIDAR_SALDO(pk_cuenta,pk_banco,pv_valor);
                    elsif FU_VALIDAR_SALDO(pk_cuenta,pk_banco,pv_valor)=1 then
                        l_idMovimiento:=MOVIMIENTOS_SEQ.nextval;
                        INSERT INTO movimiento
                        (k_id,v_valor,f_fecha,i_estado,k_idcuenta)
                        VALUES
                        (l_idMovimiento,pv_valor,SYSDATE,PK_BANCOS.gv_rechazado,pk_cuenta);
                        INSERT INTO detallemovimiento
                        (k_detalle,k_concepto,k_movimiento)
                        VALUES
                        (l_idMovimiento,pk_concepto,l_idMovimiento);
                        DBMS_OUTPUT.PUT_LINE('Movimiento registrado.');
                        RAISE le_saldoInsuficiente;
                    else
                        RAISE le_ctaNoExistente;
                    end if;
                elsif FU_VALIDAR_TITULAR(pk_cuenta,pk_banco,pk_titular,pv_clave)=1 then
                    RAISE le_datosErroneos;
                else
                    RAISE le_ctaNoExistente;
                end if;
            else
                RAISE le_ctaNoExistente;
            end if;
        exception
            when le_ctaNoExistente then
                DBMS_OUTPUT.PUT_LINE('La cuenta no existente.');
                /*RAISE_APPLICATION_ERROR(-20100,'La cuenta no existente.');*/  
            when le_datosErroneos then
                DBMS_OUTPUT.PUT_LINE('Las credenciales son erroneas.');
                /*RAISE_APPLICATION_ERROR(-20110,'Las credenciales son erroneas.');*/
            when le_saldoInsuficiente then
                DBMS_OUTPUT.PUT_LINE('La cuenta no posee saldo suficiente para el movimiento.');
                /*RAISE_APPLICATION_ERROR(-20210,'La cuenta no posee saldo suficiente para el movimiento.');*/
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error');      
    END PR_REGISTRAR_MOVIMIENTO;
                
    FUNCTION FU_VALIDAR_SALDO(pk_cuenta   IN cuenta.k_id%TYPE,
                               pk_banco    IN banco.k_id%TYPE,
                               pv_valor    IN cuenta.v_saldo%TYPE) RETURN INTEGER
        IS
            l_saldo cuenta.v_saldo%TYPE;
            le_ctaNoExistente EXCEPTION;
        BEGIN
            IF  FU_VALIDAR_CTA(pk_cuenta,pk_banco) = 0 THEN
                SELECT v_saldo INTO l_saldo
                FROM cuenta
                WHERE (k_id = pk_cuenta AND k_idbanco = pk_banco);
                if l_saldo>=pv_valor then
                    return 0;
                else
                    return 1;
                end if;
            ELSE
                RAISE le_ctaNoExistente;
            END IF;
        exception
            when le_ctaNoExistente then
                DBMS_OUTPUT.PUT_LINE('La cuenta no existente.');
                /*RAISE_APPLICATION_ERROR(-20100,'La cuenta no existente.');*/
                return 2;                   
    END FU_VALIDAR_SALDO;

    PROCEDURE PR_GENERAR_FACTURA(pk_cuenta   IN cuenta.k_id%TYPE,
                                 pk_banco     IN banco.k_id%TYPE,
                                 pk_movimiento   IN movimiento.k_id%TYPE,
                                 pk_concepto  IN concepto.k_concepto%TYPE)
        IS
            v_archivo utl_file.file_type;
            l_nombreBanco banco.n_nombre%TYPE;
            l_nombreTitular titular.n_nombre%TYPE;
            l_idTitular titular.k_id%TYPE;
            l_estadoMovimiento movimiento.i_estado%TYPE;
            l_valor cuenta.v_saldo%TYPE;
            l_fecha DATE;
            l_concepto concepto.n_descripcion%TYPE;
            le_ctaNoExistente EXCEPTION;
        BEGIN
            if FU_VALIDAR_CTA(pk_cuenta,pk_banco) = 0 then

                SELECT nombre, identificacion,nombreBanco
                INTO l_nombreTitular, l_idTitular, l_nombreBanco
                FROM V_TITULARES_CUENTAS
                WHERE idBanco = pk_banco AND cuenta = pk_cuenta;

                SELECT i_estado, v_valor, f_fecha
                INTO l_estadoMovimiento, l_valor, l_fecha
                FROM movimiento
                WHERE k_id = pk_movimiento;

                SELECT n_descripcion
                INTO l_concepto
                FROM concepto
                WHERE k_concepto = pk_concepto;

                v_archivo := utl_file.fopen ('DIR_TMP', 'factura'||pk_movimiento||'.txt', 'w');
                utl_file.put_line (v_archivo, '=================================================');
                utl_file.put_line (v_archivo, '========== FACTURA MOVIMIENTO BANARIO ===========');
                utl_file.put_line (v_archivo, '==== FECHA: '||l_fecha||'');
                utl_file.put_line (v_archivo, '==== BANCO: '||l_nombreBanco||'');
                utl_file.put_line (v_archivo, '==== TITULAR: '||l_nombreTitular||'');
                utl_file.put_line (v_archivo, '==== ID TITULAR: '||l_idTitular||'');
                utl_file.put_line (v_archivo, '==== MOVIMIENTO: '||pk_movimiento||'');
                utl_file.put_line (v_archivo, '==== CONCEPTO: '||l_concepto||'');
                utl_file.put_line (v_archivo, '==== ESTADO MOVIMIENTO: '||l_estadoMovimiento||'');
                utl_file.put_line (v_archivo, '==== VALOR: $'||l_valor||'');
                utl_file.put_line (v_archivo, '=================================================');
                utl_file.fclose(v_archivo);       
            else
                RAISE le_ctaNoExistente;
            end if;
            exception
            when le_ctaNoExistente then
                DBMS_OUTPUT.PUT_LINE('La cuenta no existente.');
                /*RAISE_APPLICATION_ERROR(-20100,'La cuenta no existente.');*/       
    END PR_GENERAR_FACTURA;

END PK_BANCOS;
/
show errors