DROP TABLE agente CASCADE CONSTRAINTS
;
DROP TABLE buque CASCADE CONSTRAINTS
;
DROP TABLE compania CASCADE CONSTRAINTS
;
DROP TABLE cupo CASCADE CONSTRAINTS
;
DROP TABLE oferta CASCADE CONSTRAINTS
;
DROP TABLE reserva CASCADE CONSTRAINTS
;
DROP TABLE subasta CASCADE CONSTRAINTS
;
DROP TABLE visita CASCADE CONSTRAINTS
;

CREATE TABLE agente
(
	n_agente          VARCHAR2(50) NOT NULL,
	k_identificacion  VARCHAR2(50) NOT NULL,
	k_compania        VARCHAR2(50) NOT NULL
)
;


CREATE TABLE buque
(
	k_num_serie       NUMBER(8) NOT NULL,
	q_tonelaje        NUMBER(8,2) NOT NULL,
	q_cant_pasajejos  NUMBER(8) NOT NULL,
	i_tipo_buque      VARCHAR2(10) NOT NULL,
	v_ancho           FLOAT NOT NULL,
	v_alto            FLOAT NOT NULL,
	v_largo           FLOAT NOT NULL,
	i_tipo_carga      VARCHAR2(10) NOT NULL
)
;


CREATE TABLE compania
(
	n_compania  VARCHAR2(50) NOT NULL,
	k_nit       VARCHAR2(50) NOT NULL
)
;


CREATE TABLE cupo
(
	k_cupo          VARCHAR2(50) NOT NULL,
	i_cupo_buque    VARCHAR2(10) NOT NULL,
	f_cupo          DATE NOT NULL,
	i_tipo_periodo  VARCHAR2(10) NOT NULL,
	i_sentido       VARCHAR2(10) NOT NULL,
	i_estado        VARCHAR2(10) NOT NULL
)
;


CREATE TABLE oferta
(
	k_oferta   VARCHAR2(50) NOT NULL,
	v_oferta   FLOAT NOT NULL,
	f_oferta   DATE NOT NULL,
	k_agente   VARCHAR2(50) NOT NULL,
	k_subasta  VARCHAR2(50) NOT NULL,
	k_visita   NUMBER(10) NOT NULL
)
;


CREATE TABLE reserva
(
	k_reserva         NUMBER(10) NOT NULL,
	i_estado          VARCHAR2(10) NOT NULL,
	i_tipo_reserva    VARCHAR2(10) NOT NULL,
	f_reserva         DATE NOT NULL,
	f_arribo          DATE NOT NULL,
	k_visita          NUMBER(10) NOT NULL,
	k_cupo            VARCHAR2(50) NOT NULL,
	v_tarifa_reserva  NUMBER(8,2) NOT NULL
)
;


CREATE TABLE subasta
(
	k_subasta      VARCHAR2(50) NOT NULL,
	k_cupo         VARCHAR2(50),
	v_tope_minimo  FLOAT NOT NULL,
	f_final        DATE NOT NULL
)
;


CREATE TABLE visita
(
	k_cod_acp             VARCHAR2(50) NOT NULL,
	k_buque               NUMBER(8) NOT NULL,
	k_agente              VARCHAR2(50) NOT NULL,
	f_eta                 DATE NOT NULL,
	k_visita              NUMBER(10) NOT NULL,
	n_puerto_salida       VARCHAR2(50) NOT NULL,
	n_puerto_llegada      VARCHAR2(50) NOT NULL,
	v_tarifa_paso         NUMBER(8,2),
	q_carga_transportada  NUMBER(8,2) NOT NULL
)
;



ALTER TABLE agente ADD CONSTRAINT PK_agente 
	PRIMARY KEY (k_identificacion)
;

ALTER TABLE buque ADD CONSTRAINT PK_buque 
	PRIMARY KEY (k_num_serie)
;

ALTER TABLE compania ADD CONSTRAINT PK_compania 
	PRIMARY KEY (k_nit)
;

ALTER TABLE cupo ADD CONSTRAINT PK_cupo 
	PRIMARY KEY (k_cupo, f_cupo)
;

ALTER TABLE oferta ADD CONSTRAINT PK_oferta 
	PRIMARY KEY (k_oferta)
;

ALTER TABLE reserva ADD CONSTRAINT PK_reserva 
	PRIMARY KEY (v_tarifa_reserva)
;

ALTER TABLE subasta ADD CONSTRAINT PK_Subasta 
	PRIMARY KEY (k_subasta)
;

ALTER TABLE visita ADD CONSTRAINT PK_visita 
	PRIMARY KEY (k_visita)
;


ALTER TABLE buque
ADD CONSTRAINT C_tipo_buque CHECK (i_tipo_buque in ('Neopanamax','Super','Regular'))
;

ALTER TABLE buque
ADD CONSTRAINT C_tipo_carga CHECK (id_tipo_carga in ('Comercial','Carga Peligrosa','Barcaza','Contenedores'))
;

ALTER TABLE buque
ADD CONSTRAINT C_carga CHECK (q_tonelaje > 0)
;

ALTER TABLE cupo
ADD CONSTRAINT C_cupo_buque CHECK (i_cupo_buque in ('Neopanamax','Super','Regular'))
;

ALTER TABLE cupo
ADD CONSTRAINT C_tipo_periodo CHECK (i_tipo_periodo in ('1','2','3','Especial'))
;

ALTER TABLE cupo
ADD CONSTRAINT C_sentido CHECK (i_sentido in ('Norte','Sur'))
;

ALTER TABLE reserva
ADD CONSTRAINT C_estado CHECK (i_estado in ('Activa','Cancelada','Pendiente'))
;

ALTER TABLE reserva
ADD CONSTRAINT C_tipo_reserva CHECK (i_tipo_reserva in ('Solicitud','Justo a tiempo','Mismo dia'))
;

ALTER TABLE reserva
ADD CONSTRAINT C_tipo_periodo CHECK (i_tipo_periodo in ('1','2','3','Especial'))
;

ALTER TABLE visita
ADD CONSTRAINT C_carga_transportada CHECK (v_carga_transpotada > 0)
;


ALTER TABLE agente ADD CONSTRAINT FK_agente_compania 
	FOREIGN KEY (k_compania) REFERENCES compania (k_nit)
;

ALTER TABLE oferta ADD CONSTRAINT FK_oferta_agente 
	FOREIGN KEY (k_agente) REFERENCES agente (k_identificacion)
;

ALTER TABLE oferta ADD CONSTRAINT FK_oferta_subasta 
	FOREIGN KEY (k_subasta) REFERENCES subasta (k_subasta)
;

ALTER TABLE oferta ADD CONSTRAINT FK_oferta_visita 
	FOREIGN KEY (k_visita) REFERENCES visita (k_visita)
;

ALTER TABLE reserva ADD CONSTRAINT FK_reserva_cupo 
	FOREIGN KEY (k_cupo) REFERENCES cupo (k_cupo, f_cupo)
;

ALTER TABLE reserva ADD CONSTRAINT FK_reserva_visita 
	FOREIGN KEY (k_visita) REFERENCES visita (k_visita)
;

ALTER TABLE subasta ADD CONSTRAINT FK_subasta_cupo 
	FOREIGN KEY (k_cupo) REFERENCES cupo (k_cupo, f_cupo)
;

ALTER TABLE visita ADD CONSTRAINT FK_visita_agente 
	FOREIGN KEY (k_agente) REFERENCES agente (k_identificacion)
;

ALTER TABLE visita ADD CONSTRAINT FK_visita_buque 
	FOREIGN KEY (k_buque) REFERENCES buque (k_num_serie)
;
