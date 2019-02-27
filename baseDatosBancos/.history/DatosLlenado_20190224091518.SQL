/* CREACIÓN DE BANCOS*/
INSERT INTO banco (k_id,n_nombre)
	VALUES (1,'BBVA');
	
INSERT INTO banco (k_id,n_nombre)
	VALUES (2,'JP Morgan Chase');
	
INSERT INTO banco (k_id,n_nombre)
	VALUES (3,'Bank of America');

INSERT INTO banco (k_id,n_nombre)
	VALUES (4,'Bank of China');
	
INSERT INTO banco (k_id,n_nombre)
	VALUES (5,'Bank Of Montreal');
/* CREACIÓN DE TITULARES*/
INSERT INTO titular (k_id,n_nombre,n_apellido)
	VALUES (1,'Arturo','Perez');

INSERT INTO titular (k_id,n_nombre,n_apellido)
	VALUES (2,'Miguel','Ramirez');

INSERT INTO titular (k_id,n_nombre,n_apellido)
	VALUES (3,'Andrés','Hernandez');

INSERT INTO titular (k_id,n_nombre,n_apellido)
	VALUES (4,'Pedro','Calle');

INSERT INTO titular (k_id,n_nombre,n_apellido)
	VALUES (5,'Santiago','Perea');
/* CREACIÓN DE CUENTAS*/
INSERT INTO titular (k_id,k_idtitular,v_saldo,v_clave,k_idbanco)
	VALUES (1,'Arturo','Perez');	

	

	