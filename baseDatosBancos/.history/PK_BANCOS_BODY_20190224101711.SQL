CREATE OR REPLACE VIEW V_TITULARES_CUENTAS
AS (
	SELECT (T.N_NOMBRE|| ' ' || T.N_APELLIDO) nombre, T.K_ID identificacion, B.K_ID idBanco,B.N_NOMBRE nombreBanco, C.K_ID cuenta
	FROM cuenta C, titular T, banco B
	WHERE B.K_ID = C.K_IDBANCO AND C.K_IDTITULAR = T.K_ID 
	);

CREATE OR REPLACE PACKAGE BODY PK_BANCOS AS 

    FUNCTION FU_VALIDAR_CTA(pk_cuenta   IN cuenta.k_id%TYPE,
                            pk_banco    IN banco.k_id%TYPE,
                            pk_titular  IN titular.k_id%TYPE) RETURN INTEGER 
        IS
            l_cuenta cuenta.k_id%TYPE;
        BEGIN
            SELECT cuenta INTO l_cuenta
            FROM V_TITULARES_CUENTAS
            WHERE (cuenta = pk_cuenta AND idBanco = pk_banco AND identificacion = pk_titular);
            return 0;
        exception
            when no_data_found then
                return 1;                  
        END FU_VALIDAR_CTA;

    FUNCTION FU_VALIDAR_TITULAR(pk_cuenta   IN cuenta.k_id%TYPE,
                                pk_banco    IN banco.k_id%TYPE,
                                pk_titular  IN titular.k_id%TYPE,
                                pk_cuenta   IN cuenta.k_id%TYPE) RETURN INTEGER 
        IS
            l_cuenta cuenta.k_id%TYPE;
        BEGIN
            SELECT cuenta INTO l_cuenta
            FROM V_TITULARES_CUENTAS
            WHERE (cuenta = pk_cuenta AND idBanco = pk_banco AND identificacion = pk_titular);
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
        BEGIN
            SELECT v_saldo INTO l_saldo
            FROM cuenta
            WHERE (k_id = pk_cuenta AND k_idbanco = pk_banco);
            IF  PK_ADMHOR_AGUIRRE.FU_BUSCAR_APTO(pk_apartamento,pk_conjunto) = 0 THEN
              
            ELSE
                RAISE le_AptoNoExistente;
            END IF;
            return 0;
        exception
            when no_data_found then
                return 1;                   
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