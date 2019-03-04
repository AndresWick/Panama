SET ServerOutput ON;
SET VERIFY OFF;
DROP PROCEDURE PR_REGISTRAR_PASO;
create or replace PROCEDURE PR_REGISTRAR_PASO
	(		
		pk_idReserva IN RESERVA.k_id%TYPE,		
		pf_fecha IN PASO.f_fecha%TYPE,
		pq_pasajeros IN PASO.q_pasajeros%TYPE,		
		pn_esclusa IN PASO.n_esclusa%TYPE
	)
	AS		
		lv_costo PASO.v_costo%TYPE;
	BEGIN		
		lv_costo := FU_PRECIO_PASO(pk_idReserva,pn_esclusa);		
		INSERT INTO PASO (k_id, v_costo, k_idReserva, f_fecha, q_pasajeros, n_esclusa) 
			VALUES 
 				(paso_seq.NEXTVAL, lv_costo, pk_idReserva, pf_fecha, pq_pasajeros, pn_esclusa);
END PR_REGISTRAR_PASO;
/
show errors
