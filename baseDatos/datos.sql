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
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Regular_01','Regular','25/09/2018',1,'Norte','AV');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Regular_02','Regular','25/09/2018',1,'Norte','AV');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Regular_03','Regular','25/09/2018',2,'Sur','BK');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Regular_04','Regular','25/09/2018',3,'Sur','BK');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Regular_05','Regular','25/09/2018',2,'Norte','AV');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('26_Regular_01','Regular','26/09/2018',2,'Sur','AV');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('26_Regular_02','Regular','26/09/2018',3,'Sur','BK');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Super_00','Super','25/09/2018',1,'Norte','AV');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Super_01','Super','25/09/2018',1,'Norte','AV');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Super_02','Super','25/09/2018',1,'Norte','BK');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Super_03','Super','25/09/2018',2,'Sur','BK');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('25_Super_04','Super','25/09/2018',3,'Sur','BK');
	INSERT INTO cupo (k_cupo,i_cupo_buque,f_cupo,i_tipo_periodo,i_sentido,i_estado) VALUES ('26_Super_05','Super','26/09/2018',2,'Sur','BK');

	/* --- RESERVA --- */
	INSERT INTO reserva (k_reserva, i_estado, i_tipo_reserva, f_reserva, f_arribo, k_visita, k_cupo, v_tarifa_reserva) VALUES (111,'Pendiente','Solicitud','25/09/2018','26/09/2018',1,'25_Regular_00',200.00);	
	INSERT INTO reserva (k_reserva, i_estado, i_tipo_reserva, f_reserva, f_arribo, k_visita, k_cupo, v_tarifa_reserva) VALUES (112,'Activa','Solicitud','24/09/2018','25/09/2018',2,'25_Super_03',100.00);

/* SELECT */

	/* --- CUPOS PARA EL DIA DE HOY --- */
	SELECT * FROM cupo WHERE TO_CHAR(f_cupo,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy');

	/* --- CUPOS QUE VAN A PASAR EL DIA DE HOY AGRUPADOS --- */
	SELECT f_cupo, i_cupo_buque, COUNT(i_cupo_buque) cantidad  FROM cupo WHERE TO_CHAR(f_cupo,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy') AND i_estado='BK' GROUP BY f_cupo, i_cupo_buque;	

	/* --- CUPOS PARA EL DIA DE MAÑANA --- */
	SELECT * FROM cupo WHERE TO_CHAR(f_cupo,'dd/mm/yyyy') = TO_CHAR(sysdate+1,'dd/mm/yyyy');

	/* --- CUPOS QUE VAN A PASAR EL DIA DE MAÑANA AGRUPADOS --- */
	SELECT f_cupo, i_cupo_buque, COUNT(i_cupo_buque) cantidad  FROM cupo WHERE TO_CHAR(f_cupo,'dd/mm/yyyy') = TO_CHAR(sysdate+1,'dd/mm/yyyy') AND i_estado='BK' GROUP BY f_cupo, i_cupo_buque;	

	/* --- CUPOS DISPONIBLES PARA UN BARCO EN ESPECIFICO --- */
	/* - Requiere codigo de visita, fecha para buscar - */
	SELECT C.f_cupo, C.i_cupo_buque, COUNT(C.i_cupo_buque) "Espacios Disponibles" FROM cupo C, visita V, buque B WHERE V.k_visita = 1 AND TO_CHAR(C.f_cupo,'dd/mm/yyyy') = '25/09/2018' AND C.i_estado = 'AV' AND C.i_cupo_buque = B.i_tipo_buque AND B.k_num_serie = V.k_buque GROUP BY C.f_cupo, C.i_cupo_buque;

	/* --- DATOS DE LA VISITA POR ID --- */
	/* - Requiere codigo de visita - */
	SELECT * FROM visita WHERE k_visita=1;

	/* --- BARCOS QUE VAN A TRANSITAR EL DIA DE HOY --- */
	SELECT V.n_puerto_llegada, V.n_puerto_salida FROM visita V, reserva R WHERE TO_CHAR(R.f_arribo,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy') AND R.k_visita = V.k_visita;