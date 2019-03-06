/* CREACIÓN DE BANCOS*/
INSERT INTO banco (k_id,n_nombre)
	VALUES (1,'BBVA');
	
INSERT INTO banco (k_id,n_nombre)
	VALUES (2,'Davivienda');
	
INSERT INTO banco (k_id,n_nombre)
	VALUES (3,'Banco Popular');

/* CREACIÓN DE TITULARES*/
INSERT INTO titular (k_id,n_nombre,n_apellido)
	VALUES ('PEPEAGENTE','Pepe','Gutierrez');

INSERT INTO titular (k_id,n_nombre,n_apellido)
	VALUES ('CAMILOAGENTE','Camilo','Lopez');

/* CREACIÓN DE CUENTAS*/
INSERT INTO cuenta (k_id,k_idtitular,v_saldo,v_clave,k_idbanco)
	VALUES (12345,'PEPEAGENTE',100000.00,1234,1);	

INSERT INTO cuenta (k_id,k_idtitular,v_saldo,v_clave,k_idbanco)
	VALUES (11111,'CAMILOAGENTE',0.0,1111,1);

/* CREACIÓN DE CONCEPTOS*/
INSERT INTO concepto (k_concepto,n_descripcion)
	VALUES (1,'PAGO RESERVA');	

INSERT INTO concepto (k_concepto,n_descripcion)
	VALUES (2,'PAGO PASO');	
	

	