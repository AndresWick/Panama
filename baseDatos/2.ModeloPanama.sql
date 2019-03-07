DROP TABLE Auditoria CASCADE CONSTRAINTS
;
DROP TABLE ResumenPagoReserva CASCADE CONSTRAINTS
;
DROP TABLE ResumenPagoPaso CASCADE CONSTRAINTS
;
DROP TABLE PagoPaso CASCADE CONSTRAINTS
;
DROP TABLE Tripulacion CASCADE CONSTRAINTS
;
DROP TABLE Paso CASCADE CONSTRAINTS
;
DROP TABLE Cronograma CASCADE CONSTRAINTS
;
DROP TABLE ParametrosCancelacion CASCADE CONSTRAINTS
;
DROP TABLE ParametrosPaso CASCADE CONSTRAINTS
;
DROP TABLE TipoPago CASCADE CONSTRAINTS
;
DROP TABLE PagoReserva CASCADE CONSTRAINTS
;
DROP TABLE Subasta CASCADE CONSTRAINTS
;
DROP TABLE Oferta CASCADE CONSTRAINTS
;
DROP TABLE Periodo CASCADE CONSTRAINTS
;
DROP TABLE Persona CASCADE CONSTRAINTS
;
DROP TABLE Tripulante CASCADE CONSTRAINTS
;
DROP TABLE ParametrosReserva CASCADE CONSTRAINTS
;
DROP TABLE Reserva CASCADE CONSTRAINTS
;
DROP TABLE Compania CASCADE CONSTRAINTS
;
DROP TABLE TipoBuque CASCADE CONSTRAINTS
;
DROP TABLE TipoCarga CASCADE CONSTRAINTS
;
DROP TABLE Agente CASCADE CONSTRAINTS
;
DROP TABLE Buque CASCADE CONSTRAINTS
;

CREATE TABLE Auditoria
(
	k_id         NUMBER(7) NOT NULL,
	n_usuario    VARCHAR(30) NOT NULL,
	f_proceso    DATE NOT NULL,
	i_tipo       VARCHAR(10) NOT NULL,
	n_tabla      VARCHAR(20) NOT NULL,
	n_columna    VARCHAR(20) NOT NULL,
	va_anterior  VARCHAR(100),
	va_nuevo     VARCHAR(100)
)
;


CREATE TABLE ResumenPagoReserva
(
	k_reserva          NUMBER(8) NOT NULL,
	v_saldo_pendiente  NUMBER(8,2) NOT NULL,
	f_ultimo_pago      DATE
)
;


CREATE TABLE ResumenPagoPaso
(
	k_paso             NUMBER(8) NOT NULL,
	v_saldo_pendiente  NUMBER(8,2) NOT NULL,
	f_ultimo_pago      DATE
)
;


CREATE TABLE PagoPaso
(
	k_id          NUMBER(2) NOT NULL,
	k_paso        NUMBER(8) NOT NULL,
	v_valor       NUMBER(8,2) NOT NULL,
	f_fecha       DATE NOT NULL,
	k_idTipoPago  NUMBER(3) NOT NULL
)
;


CREATE TABLE Tripulacion
(
	k_idPaso        NUMBER(8) NOT NULL,
	k_idTripulante  NUMBER(5) NOT NULL
)
;


CREATE TABLE Paso
(
	k_id         NUMBER(8) NOT NULL,
	v_costo      NUMBER(8,2) NOT NULL,
	k_idReserva  NUMBER(8) NOT NULL,
	f_fecha      DATE NOT NULL,
	q_pasajeros  NUMBER(3) NOT NULL,
	n_esclusa    VARCHAR(10) NOT NULL
)
;


CREATE TABLE Cronograma
(
	k_idPer       NUMBER(3) NOT NULL,
	k_tipoBuque   NUMBER(4) NOT NULL,
	k_fecha       DATE NOT NULL,
	q_cupos_max   NUMBER(3) NOT NULL,
	q_cupos_disp  NUMBER(3) NOT NULL,
	k_sentido     VARCHAR(5) NOT NULL
)
;


CREATE TABLE ParametrosCancelacion
(
	k_id          NUMBER(3) NOT NULL,
	q_dias_min    NUMBER(2) NOT NULL,
	q_dias_max    NUMBER(2) NOT NULL,
	q_porcentaje  NUMBER(2) NOT NULL
)
;


CREATE TABLE ParametrosPaso
(
	k_id          NUMBER(3) NOT NULL,
	k_tipoCarga   NUMBER(4) NOT NULL,
	v_porcentaje  NUMBER(4,2) NOT NULL,
	v_costo       NUMBER(8,2) NOT NULL,
	n_esclusa     VARCHAR(10) NOT NULL
)
;


CREATE TABLE TipoPago
(
	k_id           NUMBER(3) NOT NULL,
	n_descripcion  VARCHAR(15) NOT NULL
)
;


CREATE TABLE PagoReserva
(
	k_id          NUMBER(2) NOT NULL,
	k_idReserva   NUMBER(8) NOT NULL,
	v_valor       NUMBER(8,2) NOT NULL,
	f_fecha       DATE NOT NULL,
	k_idTipoPago  NUMBER(3) NOT NULL
)
;


CREATE TABLE Subasta
(
	k_subasta      VARCHAR(6) NOT NULL,
	f_fecha        DATE NOT NULL,
	v_tope_minimo  NUMBER(8,2) NOT NULL,
	k_idPer        NUMBER(3) NOT NULL,
	k_tipoBuque    NUMBER(4) NOT NULL,
	k_fecha        DATE NOT NULL,
	k_sentido      VARCHAR(5) NOT NULL
)
;


CREATE TABLE Oferta
(
	k_oferta    NUMBER(5) NOT NULL,
	k_subasta   VARCHAR(6) NOT NULL,
	v_oferta    NUMBER(6,2) NOT NULL,
	f_oferta    DATE NOT NULL,
	k_idAgente  VARCHAR(20) NOT NULL
)
;


CREATE TABLE Periodo
(
	k_id        NUMBER(3) NOT NULL,
	q_dias_min  NUMBER(3) NOT NULL,
	q_dias_max  NUMBER(3) NOT NULL,
	n_periodo   VARCHAR(20) NOT NULL
)
;


CREATE TABLE Persona
(
	k_identificacion  NUMBER(8) NOT NULL,
	n_nombre          VARCHAR(30) NOT NULL,
	n_apellido        VARCHAR(25) NOT NULL,
	f_nacimiento      DATE NOT NULL
)
;


CREATE TABLE Tripulante
(
	k_id         NUMBER(5) NOT NULL,
	k_idPersona  NUMBER(8) NOT NULL,
	n_cargo      VARCHAR(50) NOT NULL
)
;


CREATE TABLE ParametrosReserva
(
	k_id        NUMBER(3) NOT NULL,
	q_bean_min  NUMBER(5) NOT NULL,
	q_bean_max  NUMBER(5) NOT NULL,
	q_loa_min   NUMBER(5) NOT NULL,
	q_loa_max   NUMBER(5) NOT NULL,
	v_costo     NUMBER(8,2) NOT NULL
)
;


CREATE TABLE Reserva
(
	k_id                 NUMBER(8) NOT NULL,
	f_eta                DATE NOT NULL,
	n_puerto_salida      VARCHAR(20),
	n_puerto_llegada     VARCHAR(20),
	f_salida             DATE,
	f_llegada            DATE,
	k_num_serie          NUMBER(8) NOT NULL,
	v_cargaTransportada  NUMBER(6,2) NOT NULL,
	v_costo              NUMBER(8,2) NOT NULL,
	i_estado             VARCHAR(3) NOT NULL,
	v_cancelacion        NUMBER(8,2),
	k_idAgente           VARCHAR(20) NOT NULL,
	f_cancelacion        DATE,
	n_sentido            VARCHAR(6) NOT NULL
)
;


CREATE TABLE Compania
(
	k_nit     VARCHAR(25) NOT NULL,
	n_nombre  VARCHAR(20) NOT NULL
)
;


CREATE TABLE TipoBuque
(
	k_id    NUMBER(4) NOT NULL,
	n_tipo  VARCHAR(10) NOT NULL
)
;


CREATE TABLE TipoCarga
(
	k_id    NUMBER(4) NOT NULL,
	n_tipo  VARCHAR(20) NOT NULL
)
;


CREATE TABLE Agente
(
	k_id         VARCHAR(20) NOT NULL,
	k_nit        VARCHAR(25) NOT NULL,
	k_idPersona  NUMBER(8) NOT NULL
)
;


CREATE TABLE Buque
(
	k_num_serie      NUMBER(8) NOT NULL,
	k_idCarga        NUMBER(4) NOT NULL,
	k_idBuque        NUMBER(4) NOT NULL,
	q_pasajeros_max  NUMBER(4) NOT NULL,
	v_beam           NUMBER(4,2) NOT NULL,
	v_loa            NUMBER(4,2) NOT NULL,
	v_carga_max      NUMBER(6,2) NOT NULL
)
;



ALTER TABLE Auditoria ADD CONSTRAINT PK_Auditoria 
	PRIMARY KEY (k_id)
;

ALTER TABLE ResumenPagoReserva ADD CONSTRAINT PK_ResumenPagoReserva 
	PRIMARY KEY (k_reserva)
;

ALTER TABLE ResumenPagoPaso ADD CONSTRAINT PK_ResumenPagoPaso 
	PRIMARY KEY (k_paso)
;

ALTER TABLE PagoPaso ADD CONSTRAINT PK_PagoPaso 
	PRIMARY KEY (k_id, k_paso)
;

ALTER TABLE Tripulacion ADD CONSTRAINT PK_Tripulacion 
	PRIMARY KEY (k_idPaso, k_idTripulante)
;

ALTER TABLE Paso ADD CONSTRAINT PK_Paso 
	PRIMARY KEY (k_id)
;

ALTER TABLE Cronograma ADD CONSTRAINT PK_Cronograma 
	PRIMARY KEY (k_idPer, k_tipoBuque, k_fecha, k_sentido)
;

ALTER TABLE ParametrosCancelacion ADD CONSTRAINT PK_ParametrosCancelacion 
	PRIMARY KEY (k_id)
;

ALTER TABLE ParametrosPaso ADD CONSTRAINT PK_ParametrosPaso 
	PRIMARY KEY (k_id)
;

ALTER TABLE TipoPago ADD CONSTRAINT PK_TipoPago 
	PRIMARY KEY (k_id)
;

ALTER TABLE PagoReserva ADD CONSTRAINT PK_Pago 
	PRIMARY KEY (k_id, k_idReserva)
;

ALTER TABLE Subasta ADD CONSTRAINT PK_Subasta 
	PRIMARY KEY (k_subasta)
;

ALTER TABLE Oferta ADD CONSTRAINT PK_Oferta 
	PRIMARY KEY (k_oferta, k_subasta)
;

ALTER TABLE Periodo ADD CONSTRAINT PK_TipoCupo 
	PRIMARY KEY (k_id)
;

ALTER TABLE Persona ADD CONSTRAINT PK_Persona 
	PRIMARY KEY (k_identificacion)
;

ALTER TABLE Tripulante ADD CONSTRAINT PK_Tripulante 
	PRIMARY KEY (k_id)
;

ALTER TABLE ParametrosReserva ADD CONSTRAINT PK_ParametrosReserva 
	PRIMARY KEY (k_id)
;

ALTER TABLE Reserva ADD CONSTRAINT PK_Reserva 
	PRIMARY KEY (k_id)
;

ALTER TABLE Compania ADD CONSTRAINT PK_Compania 
	PRIMARY KEY (k_nit)
;

ALTER TABLE TipoBuque ADD CONSTRAINT PK_TipoBuque 
	PRIMARY KEY (k_id)
;

ALTER TABLE TipoCarga ADD CONSTRAINT PK_Carga 
	PRIMARY KEY (k_id)
;

ALTER TABLE Agente ADD CONSTRAINT PK_Agente 
	PRIMARY KEY (k_id)
;

ALTER TABLE Buque ADD CONSTRAINT PK_Buque 
	PRIMARY KEY (k_num_serie)
;


ALTER TABLE Auditoria
ADD CONSTRAINT CK_k_idAud CHECK (k_id > 0)
;

ALTER TABLE ResumenPagoReserva
ADD CONSTRAINT CK_v_saldo_pteR CHECK (v_saldo_pendiente >= 0)
;

ALTER TABLE ResumenPagoPaso
ADD CONSTRAINT CK_v_saldo_pteP CHECK (v_saldo_pendiente >= 0)
;

ALTER TABLE PagoPaso
ADD CONSTRAINT CK_v_valorPagoPaso CHECK (v_valor > 0)
;

ALTER TABLE PagoPaso
ADD CONSTRAINT CK_k_idPagoPaso CHECK (k_id > 0)
;

ALTER TABLE Paso
ADD CONSTRAINT CK_v_costoPas CHECK (v_costo > 0)
;

ALTER TABLE Paso
ADD CONSTRAINT CK_q_pasajerosPas CHECK (q_pasajeros > 0)
;

ALTER TABLE Paso
ADD CONSTRAINT CK_k_idPas CHECK (k_id > 0)
;

ALTER TABLE Paso
ADD CONSTRAINT CK_n_esclusa CHECK (n_esclusa in ('Neopanamax','Panamax','Any'))
;

ALTER TABLE Cronograma
ADD CONSTRAINT CK_q_cupos_max CHECK (q_cupos_max > 0)
;

ALTER TABLE Cronograma
ADD CONSTRAINT CK_q_cupos_disp CHECK (q_cupos_disp >= 0)
;

ALTER TABLE Cronograma
ADD CONSTRAINT CK_k_sentido CHECK (k_sentido in ('Norte','Sur'))
;

ALTER TABLE ParametrosCancelacion
ADD CONSTRAINT CK_q_dias_minParCan CHECK (q_dias_min > 0)
;

ALTER TABLE ParametrosCancelacion
ADD CONSTRAINT CK_q_dias_maxParCan CHECK (q_dias_max > 0)
;

ALTER TABLE ParametrosCancelacion
ADD CONSTRAINT CK_q_porcentajeParCan CHECK (q_porcentaje > 0)
;

ALTER TABLE ParametrosCancelacion
ADD CONSTRAINT CK_k_idParCan CHECK (k_id > 0)
;

ALTER TABLE ParametrosPaso
ADD CONSTRAINT CK_v_porcentajeParPas CHECK (v_porcentaje > 0)
;

ALTER TABLE ParametrosPaso
ADD CONSTRAINT CK_v_costoParPas CHECK (v_costo > 0)
;

ALTER TABLE ParametrosPaso
ADD CONSTRAINT CK_k_idParPas CHECK (k_id > 0)
;

ALTER TABLE ParametrosPaso
ADD CONSTRAINT CK_n_esclusaParPaso CHECK (n_esclusa in ('Neopanamax','Panamax','Any'))
;

ALTER TABLE TipoPago
ADD CONSTRAINT CK_k_idTipPag CHECK (k_id > 0)
;

ALTER TABLE PagoReserva
ADD CONSTRAINT CK_v_valorPago CHECK (v_valor > 0)
;

ALTER TABLE PagoReserva
ADD CONSTRAINT CK_k_idPago CHECK (k_id > 0)
;

ALTER TABLE Subasta
ADD CONSTRAINT CK_v_tope_minimo CHECK (v_tope_minimo > 0)
;

ALTER TABLE Oferta
ADD CONSTRAINT CK_v_ofertaOfer CHECK (v_oferta > 0)
;

ALTER TABLE Oferta
ADD CONSTRAINT CK_k_ofertaOfer CHECK (k_oferta > 0)
;

ALTER TABLE Periodo
	ADD CONSTRAINT UQ_Periodo_n_periodo UNIQUE (n_periodo)
;

ALTER TABLE Periodo
ADD CONSTRAINT CK_q_dias_minPer CHECK (q_dias_min > 0)
;

ALTER TABLE Periodo
ADD CONSTRAINT CK_q_dias_maxPer CHECK (q_dias_max > 0)
;

ALTER TABLE Periodo
ADD CONSTRAINT CK_k_idPer CHECK (k_id > 0)
;

ALTER TABLE Persona
ADD CONSTRAINT CK_k_identificacion CHECK (k_identificacion > 0)
;

ALTER TABLE Tripulante
ADD CONSTRAINT CK_k_idTrip CHECK (k_id > 0)
;

ALTER TABLE ParametrosReserva
ADD CONSTRAINT CK_q_bean_minParRes CHECK (q_bean_min >= 0)
;

ALTER TABLE ParametrosReserva
ADD CONSTRAINT CK_q_bean_maxParRes CHECK (q_bean_max > 0)
;

ALTER TABLE ParametrosReserva
ADD CONSTRAINT CK_q_loa_minParRes CHECK (q_loa_min >= 0)
;

ALTER TABLE ParametrosReserva
ADD CONSTRAINT CK_q_loa_maxParRes CHECK (q_loa_max > 0)
;

ALTER TABLE ParametrosReserva
ADD CONSTRAINT CK_v_costoParRes CHECK (v_costo > 0)
;

ALTER TABLE ParametrosReserva
ADD CONSTRAINT CK_k_idParRes CHECK (k_id > 0)
;

ALTER TABLE Reserva
ADD CONSTRAINT CK_v_cargaTransportada CHECK (v_cargaTransportada > 0)
;

ALTER TABLE Reserva
ADD CONSTRAINT CK_v_costo CHECK (v_costo > 0)
;

ALTER TABLE Reserva
ADD CONSTRAINT CK_i_estado CHECK (i_estado in ('Pen','Pag','Can'))
;

ALTER TABLE Reserva
ADD CONSTRAINT CK_v_cancelacion CHECK (v_cancelacion > 0)
;

ALTER TABLE Reserva
ADD CONSTRAINT CK_k_id CHECK (k_id > 0)
;

ALTER TABLE Reserva
ADD CONSTRAINT CK_n_sentido_reserva CHECK (n_sentido in ('Norte','Sur'))
;

ALTER TABLE TipoBuque
ADD CONSTRAINT CK_n_tipoTBuq CHECK (n_tipo in ('Neopanamax','Super','Regular'))
;

ALTER TABLE TipoBuque
ADD CONSTRAINT CK_k_idTBuq CHECK (k_id > 0)
;

ALTER TABLE TipoCarga
ADD CONSTRAINT CK_n_tipoTCar CHECK (n_tipo in ('Comercial','Portacontenedores','Portavehiculos','Granelero','Granelero liquido'))
;

ALTER TABLE TipoCarga
ADD CONSTRAINT CK_k_idTCar CHECK (k_id > 0)
;

ALTER TABLE Buque
ADD CONSTRAINT CK_q_pasajeros_maxBuq CHECK (q_pasajeros_max > 0)
;

ALTER TABLE Buque
ADD CONSTRAINT CK_v_beamBuq CHECK (v_beam > 0)
;

ALTER TABLE Buque
ADD CONSTRAINT CK_v_loaBuq CHECK (v_loa > 0)
;

ALTER TABLE Buque
ADD CONSTRAINT CK_v_carga_maxBuq CHECK (v_carga_max > 0)
;

ALTER TABLE Buque
ADD CONSTRAINT CK_k_num_serieBuq CHECK (k_num_serie > 0)
;


ALTER TABLE ResumenPagoReserva ADD CONSTRAINT FK_ResumenPagoReserva_Reserva 
	FOREIGN KEY (k_reserva) REFERENCES Reserva (k_id)
;

ALTER TABLE ResumenPagoPaso ADD CONSTRAINT FK_ResumenPagoPaso_Paso 
	FOREIGN KEY (k_paso) REFERENCES Paso (k_id)
;

ALTER TABLE PagoPaso ADD CONSTRAINT FK_PagoPaso_ResumenPagoPaso 
	FOREIGN KEY (k_paso) REFERENCES ResumenPagoPaso (k_paso)
;

ALTER TABLE PagoPaso ADD CONSTRAINT FK_PagoPaso_TipoPago 
	FOREIGN KEY (k_idTipoPago) REFERENCES TipoPago (k_id)
;

ALTER TABLE Tripulacion ADD CONSTRAINT FK_Tripulacion_Paso 
	FOREIGN KEY (k_idPaso) REFERENCES Paso (k_id)
;

ALTER TABLE Tripulacion ADD CONSTRAINT FK_Tripulacion_Tripulante 
	FOREIGN KEY (k_idTripulante) REFERENCES Tripulante (k_id)
;

ALTER TABLE Paso ADD CONSTRAINT FK_Paso_Reserva 
	FOREIGN KEY (k_idReserva) REFERENCES Reserva (k_id)
;

ALTER TABLE Cronograma ADD CONSTRAINT FK_Cronograma_Periodo 
	FOREIGN KEY (k_idPer) REFERENCES Periodo (k_id)
;

ALTER TABLE Cronograma ADD CONSTRAINT FK_Cronograma_TipoBuque 
	FOREIGN KEY (k_tipoBuque) REFERENCES TipoBuque (k_id)
;

ALTER TABLE ParametrosPaso ADD CONSTRAINT FK_ParametrosPaso_TipoCarga 
	FOREIGN KEY (k_tipoCarga) REFERENCES TipoCarga (k_id)
;

ALTER TABLE PagoReserva ADD CONSTRAINT FK_PReserva_ResumenPReserva 
	FOREIGN KEY (k_idReserva) REFERENCES ResumenPagoReserva (k_reserva)
;

ALTER TABLE Subasta ADD CONSTRAINT FK_Subasta_Cronograma 
	FOREIGN KEY (k_idPer, k_tipoBuque, k_fecha, k_sentido) REFERENCES Cronograma (k_idPer, k_tipoBuque, k_fecha, k_sentido)
;

ALTER TABLE Oferta ADD CONSTRAINT FK_Oferta_Agente 
	FOREIGN KEY (k_idAgente) REFERENCES Agente (k_id)
;

ALTER TABLE Oferta ADD CONSTRAINT FK_Oferta_Subasta 
	FOREIGN KEY (k_subasta) REFERENCES Subasta (k_subasta)
;

ALTER TABLE Tripulante ADD CONSTRAINT FK_Tripulante_Persona 
	FOREIGN KEY (k_idPersona) REFERENCES Persona (k_identificacion)
;

ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_Agente 
	FOREIGN KEY (k_idAgente) REFERENCES Agente (k_id)
;

ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_Buque 
	FOREIGN KEY (k_num_serie) REFERENCES Buque (k_num_serie)
;

ALTER TABLE Agente ADD CONSTRAINT FK_Agente_Compania 
	FOREIGN KEY (k_nit) REFERENCES Compania (k_nit)
;

ALTER TABLE Agente ADD CONSTRAINT FK_Agente_Persona 
	FOREIGN KEY (k_idPersona) REFERENCES Persona (k_identificacion)
;

ALTER TABLE Buque ADD CONSTRAINT FK_Buque_Carga 
	FOREIGN KEY (k_idCarga) REFERENCES TipoCarga (k_id)
;

ALTER TABLE Buque ADD CONSTRAINT FK_Buque_TipoBuque 
	FOREIGN KEY (k_idBuque) REFERENCES TipoBuque (k_id)
;
