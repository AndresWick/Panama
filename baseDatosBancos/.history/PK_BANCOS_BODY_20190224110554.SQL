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
            WHERE (cuenta = pk_cuenta AND k_idBanco = pk_banco);
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
            l_clave cuenta.k_id%TYPE;
        BEGIN
            SELECT v_clave INTO l_cuenta
            FROM cuenta
            WHERE (k_id = pk_cuenta AND k_idBanco = pk_banco AND k_idtitular = pk_titular AND v_clave = pv_clave);
            return 0;
        exception
            when no_data_found then
                return 1;                  
        END FU_VALIDAR_CTA;

     PROCEDURE PR_REGISTRAR_MOVIMIENTO(pk_cuenta    IN cuenta.k_id%TYPE,
                                       pk_banco     IN banco.k_id%TYPE,
                                       pk_titular   IN titular.k_id%TYPE,
                                       pv_valor     IN cuenta.v_saldo%TYPE,
                                       pv_clave     IN cuenta.v_clave%TYPE,
                                       pk_concepto  IN concepto.k_concepto%TYPE)
        IS
            ---------
        BEGIN
            ---------                
        END PR_LISTAR_MOVIMIENTOS;
                
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
                RAISE_APPLICATION_ERROR(-20100,'La cuenta no existente.');
                return 2;                   
        END FU_VALIDAR_SALDO;

     PROCEDURE PR_LISTAR_MOVIMIENTOS(pk_cuenta   IN cuenta.k_id%TYPE,
                                     pk_banco     IN banco.k_id%TYPE)
        IS
            ---------
        BEGIN
             ---------                  
        END PR_LISTAR_MOVIMIENTOS;

     PROCEDURE PR_GENERAR_FACTURA(pk_cuenta   IN cuenta.k_id%TYPE,
                                    pk_banco     IN banco.k_id%TYPE,
                                    pk_movimiento   IN movimiento.k_id%TYPE)
        IS
            ---------
        BEGIN
            ---------                
        END PR_GENERAR_FACTURA;

END PK_BANCOS;
/
show errors