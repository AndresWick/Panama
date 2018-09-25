/* INSERT */

	/* --- COMPANIA --- */
	INSERT INTO compania (n_compania, k_nit) VALUES ('avianca', 'zzz');

	/* --- AGENTE --- */
	INSERT INTO agente (n_agente, k_identificacion,k_compania) VALUES ('pepe','pepetrep','zzz');

	/* --- BUQUE --- */
	INSERT INTO buque (k_num_serie,q_tonelaje,q_cant_pasajejos,i_tipo_buque,v_ancho,v_alto,v_largo,i_tipo_carga) VALUES (123,600.00,2,'Super',1000,300,200,'Comercial');

	/* --- VISITA --- */
	INSERT INTO visita (k_buque,k_agente,f_eta,k_visita,n_puerto_salida,n_puerto_llegada,v_tarifa_paso,q_carga_transportada) VALUES (123,'pepetrep','23/05/2018',1,'San Francsico','Perla',200,300);
	INSERT INTO visita (k_buque,k_agente,f_eta,k_visita,n_puerto_salida,n_puerto_llegada,v_tarifa_paso,q_carga_transportada) VALUES (123,'pepetrep','23/05/2018',2,'Perla','San Francsico',200,300);
	INSERT INTO visita (k_buque,k_agente,f_eta,k_visita,n_puerto_salida,n_puerto_llegada,v_tarifa_paso,q_carga_transportada) VALUES (123,'pepetrep','23/05/2018',3,'San Francsico','Miramar',200,100);

	/* --- CUPO --- */
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Regular_00','Regular','25/09/2018',1,'Norte','AV');	

/* SELECT */

	/* --- CUPOS PARA EL DIA DE HOY --- */
	SELECT * FROM cupo WHERE TO_CHAR(f_cupo,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy');

	/* --- CUPOS PARA EL DIA DE MAÑANA --- */
	SELECT * FROM cupo WHERE TO_CHAR(f_cupo,'dd/mm/yyyy') = TO_CHAR(sysdate+1,'dd/mm/yyyy');

	/* --- CUPOS DISPONIBLES PARA UN BARCO EN ESPECIFICO --- */	