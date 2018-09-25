INSERT INTO compania (n_compania, k_nit) VALUES ('avianca', 'zzz');
INSERT INTO agente (n_agente, k_identificacion,k_compania) VALUES ('pepe','pepetrep','zzz');
INSERT INTO buque (k_num_serie,q_tonelaje,q_cant_pasajejos,i_tipo_buque,v_ancho,v_alto,v_largo,i_tipo_carga) VALUES (123,600.00,2,'Super',1000,300,200,'Comercial');
INSERT INTO visita (k_buque,k_agente,f_eta,k_visita,n_puerto_salida,n_puerto_llegada,v_tarifa_paso,q_carga_transportada) VALUES (123,'pepetrep','23/05/2018',1,'San Francsico','Perla',200,300);
INSERT INTO visita (k_buque,k_agente,f_eta,k_visita,n_puerto_salida,n_puerto_llegada,v_tarifa_paso,q_carga_transportada) VALUES (123,'pepetrep','23/05/2018',2,'Perla','San Francsico',200,300);
INSERT INTO visita (k_buque,k_agente,f_eta,k_visita,n_puerto_salida,n_puerto_llegada,v_tarifa_paso,q_carga_transportada) VALUES (123,'pepetrep','23/05/2018',3,'San Francsico','Miramar',200,100);	