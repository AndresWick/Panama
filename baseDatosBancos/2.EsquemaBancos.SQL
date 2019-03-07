DROP TABLE detallemovimiento CASCADE CONSTRAINTS
;
DROP TABLE concepto CASCADE CONSTRAINTS
;
DROP TABLE banco CASCADE CONSTRAINTS
;
DROP TABLE titular CASCADE CONSTRAINTS
;
DROP TABLE movimiento CASCADE CONSTRAINTS
;
DROP TABLE cuenta CASCADE CONSTRAINTS
;

CREATE TABLE detallemovimiento
(
	k_detalle     NUMBER(3) NOT NULL,
	k_concepto    NUMBER(3) NOT NULL,
	k_movimiento  NUMBER(5) NOT NULL
)
;


CREATE TABLE concepto
(
	k_concepto     NUMBER(3) NOT NULL,
	n_descripcion  VARCHAR(50) NOT NULL
)
;


CREATE TABLE banco
(
	k_id      NUMBER(3) NOT NULL,
	n_nombre  VARCHAR(30) NOT NULL
)
;


CREATE TABLE titular
(
	k_id        VARCHAR(20) NOT NULL,
	n_nombre    VARCHAR(30) NOT NULL,
	n_apellido  VARCHAR(30) NOT NULL
)
;


CREATE TABLE movimiento
(
	k_id        NUMBER(5) NOT NULL,
	v_valor     NUMBER(8,2) NOT NULL,
	f_fecha     DATE NOT NULL,
	i_estado    CHAR(1) NOT NULL,
	k_idCuenta  NUMBER(8) NOT NULL
)
;


CREATE TABLE cuenta
(
	k_id         NUMBER(8) NOT NULL,
	k_idTitular  VARCHAR(20) NOT NULL,
	v_saldo      NUMBER(8,2) NOT NULL,
	v_clave      NUMBER(4) NOT NULL,
	k_idBanco    NUMBER(3) NOT NULL
)
;



ALTER TABLE detallemovimiento ADD CONSTRAINT PK_detalleconcepto 
	PRIMARY KEY (k_detalle)
;

ALTER TABLE concepto ADD CONSTRAINT PK_concepto 
	PRIMARY KEY (k_concepto)
;

ALTER TABLE banco ADD CONSTRAINT PK_banco 
	PRIMARY KEY (k_id)
;

ALTER TABLE titular ADD CONSTRAINT PK_titular 
	PRIMARY KEY (k_id)
;

ALTER TABLE movimiento ADD CONSTRAINT PK_movimiento 
	PRIMARY KEY (k_id)
;

ALTER TABLE cuenta ADD CONSTRAINT PK_cuenta 
	PRIMARY KEY (k_id)
;


ALTER TABLE banco
ADD CONSTRAINT CK_k_idMin CHECK (k_id>0)
;

ALTER TABLE movimiento
ADD CONSTRAINT CK_i_estado CHECK (i_estado in ('E','R'))
;


ALTER TABLE detallemovimiento ADD CONSTRAINT FK_detmov_movimiento 
	FOREIGN KEY (k_movimiento) REFERENCES movimiento (k_id)
;

ALTER TABLE movimiento ADD CONSTRAINT FK_movimiento_cuenta 
	FOREIGN KEY (k_idCuenta) REFERENCES cuenta (k_id)
;

ALTER TABLE cuenta ADD CONSTRAINT FK_cuenta_banco 
	FOREIGN KEY (k_idBanco) REFERENCES banco (k_id)
;

ALTER TABLE cuenta ADD CONSTRAINT FK_cuenta_titular 
	FOREIGN KEY (k_idTitular) REFERENCES titular (k_id)
;
