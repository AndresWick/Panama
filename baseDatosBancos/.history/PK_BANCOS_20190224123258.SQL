CREATE OR REPLACE PACKAGE PK_BANCOS AS 

    --Declaraci?n del tipo registro con los datos básicos del titular de una cuenta de banco
    TYPE gtr_titular IS RECORD(
        k_titular           titular.k_id%TYPE,
        n_nombre            titular.n_nombre%TYPE,
        n_apellido          titular.n_apellido%TYPE,
        k_idBanco           banco.k_id%TYPE,
        k_nombreBanco       banco.n_nombre%TYPE,
        k_idCuenta          cuenta.k_id%TYPE,
        k_idMovimiento      movimiento.k_id%TYPE,
        k_idConcepto        concepto.k_concepto%TYPE,
        n_descripcion       concepto.n_descripcion%TYPE
    );
     
    --Variables globales: Estado del movimiento bancario
     gv_rechazado   CONSTANT CHAR(1)  := 'R';
     gv_exitodo      CONSTANT CHAR(1)  := 'E';

    /*---------------------------------------------------------------------
     Funci?n para validar una cuenta de un banco
     Parametros de Entrada: pk_cuenta       Identificador de la cuenta
                            pk_banco        Identificador del banco
     Parametros de Salida:  Ninguno
     Retorna: 0 Si existe, 1 en caso contrario
     -----------------------------------------------------------------------*/
     FUNCTION FU_VALIDAR_CTA(pk_cuenta   IN cuenta.k_id%TYPE,
                             pk_banco    IN banco.k_id%TYPE) RETURN INTEGER;
    /*-------------------------------------------------------------------------------------
     Funci?n para validar las credenciales de una cuenta de un banco con su titular y clave
     Parametros de Entrada: pk_cuenta       Identificador de la cuenta
                            pk_banco        Identificador del banco
                            pk_titular      Identificador del titular de la cuenta
                            pv_clave        Clave de la cuenta
     Parametros de Salida:  Ninguno
     Retorna: 0 Si existe, 1 en caso contrario
     Excepcion: Si la cuenta no existe
     -------------------------------------------------------------------------------------*/
     FUNCTION FU_VALIDAR_TITULAR(pk_cuenta   IN cuenta.k_id%TYPE,
                                 pk_banco    IN banco.k_id%TYPE,
                                 pk_titular  IN titular.k_id%TYPE,
                                 pv_clave    IN cuenta.v_clave%TYPE) RETURN INTEGER;
     /*------------------------------------------------------------------------------------
      Procedimiento para registrar un movimientos bancario
      Parametros de Entrada: pk_cuenta      Identificador de la cuenta
                             pk_banco       Identificador del banco
                             pk_titular     Identificador del titular
                             pv_valor       Valor del movimiento
                             pv_clave       Clave de la cuenta
                             pk_concepto    Identificador del concepto
      Parametros de Salida:  Ninguno
      Excepcion: Si el concepto no existe
      ------------------------------------------------------------------------------------*/
     PROCEDURE PR_REGISTRAR_MOVIMIENTO(pk_cuenta    IN cuenta.k_id%TYPE,
                                       pk_banco     IN banco.k_id%TYPE,
                                       pk_titular   IN titular.k_id%TYPE,
                                       pv_valor     IN cuenta.v_saldo%TYPE,
                                       pv_clave     IN cuenta.v_clave%TYPE,
                                       pk_concepto  IN concepto.k_concepto%TYPE);
     /*-------------------------------------------------------------------------------
     Funci?n para validar si una cuenta posee saldo suficiente para realizar un pago 
     Parametros de Entrada: pk_cuenta   Identificador de la cuenta
                            pk_banco    Identificador del banco
                            pk_valor    Valor que se desea pagar
     Parametros de Salida: ninguno
     Retorna: 0 Si la cuenta posee saldo suficiente para el pago, 1 en caso contrario
     Excepcion: Si la cuenta no existe
    ---------------------------------------------------------------------------------*/                 
     FUNCTION FU_VALIDAR_SALDO(pk_cuenta   IN cuenta.k_id%TYPE,
                               pk_banco    IN banco.k_id%TYPE,
                               pv_valor    IN cuenta.v_saldo%TYPE) RETURN INTEGER;
     /*------------------------------------------------------------------------------------
      Procedimiento para generar una factura de un movimiento bancario
      Parametros de Entrada: pk_cuenta      Identificador de la cuenta
                             pk_banco       Identificador del banco
                             pk_movimiento  Identificador del movimiento
      Parametros de Salida:  Ninguno
      Excepcion: Si la cuenta, el banco o el movimiento no existe
      ------------------------------------------------------------------------------------*/
     PROCEDURE PR_GENERAR_FACTURA(pk_cuenta   IN cuenta.k_id%TYPE,
                                    pk_banco     IN banco.k_id%TYPE,
                                    pk_movimiento   IN movimiento.k_id%TYPE);
END PK_BANCOS;
/
show errors