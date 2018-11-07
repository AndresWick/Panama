SET ServerOutput ON;
SET VERIFY OFF;
DROP PROCEDURE PR_REGISTRAR_PASO;
create or replace PROCEDURE PR_REGISTRAR_PASO
	(		
		lk_idReserva IN RESERVA.k_id%TYPE,		
		lf_fecha IN PASO.f_fecha%TYPE,
		lq_pasajeros IN PASO.q_pasajeros%TYPE,		
		ln_esclusa IN PASO.n_esclusa%TYPE
	)
	AS		
		lv_costo PASO.v_costo%TYPE;
	BEGIN		
		lv_costo := FU_PRECIO_PASO(lk_idReserva,ln_esclusa);		
		INSERT INTO PASO (k_id, v_costo, k_idReserva, f_fecha, q_pasajeros, n_esclusa) 
			VALUES 
 				(paso_seq.NEXTVAL, lv_costo, lk_idReserva, lf_fecha, lq_pasajeros, ln_esclusa);
END PR_REGISTRAR_PASO;
/
show errors