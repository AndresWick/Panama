--------------------------------------------------------
-- Archivo creado  - sábado-febrero-02-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type DATOSTABLE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "DATOSTABLE" as object (
  k_num_serie  number(8),
  f_salida date,
  n_puerto_salida varchar2 (20),
  f_llegada date,
  n_puerto_llegada varchar2 (20),
  n_esclusa varchar2(10),
  f_eta date
);

/
--------------------------------------------------------
--  DDL for Type NESTED_DATOSTABLE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "NESTED_DATOSTABLE" as table of DATOSTABLE;

/
--------------------------------------------------------
--  DDL for Sequence PASO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PASO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RESERVA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RESERVA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SUBASTA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SUBASTA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table AGENTE
--------------------------------------------------------

  CREATE TABLE "AGENTE" 
   (	"K_ID" NUMBER(8,0), 
	"K_NIT" VARCHAR2(25 BYTE), 
	"K_IDPERSONA" NUMBER(8,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table BUQUE
--------------------------------------------------------

  CREATE TABLE "BUQUE" 
   (	"K_NUM_SERIE" NUMBER(8,0), 
	"K_IDCARGA" NUMBER(4,0), 
	"K_IDBUQUE" NUMBER(4,0), 
	"Q_PASAJEROS_MAX" NUMBER(4,0), 
	"V_BEAM" NUMBER(4,2), 
	"V_LOA" NUMBER(4,2), 
	"V_CARGA_MAX" NUMBER(6,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table COMPANIA
--------------------------------------------------------

  CREATE TABLE "COMPANIA" 
   (	"K_NIT" VARCHAR2(25 BYTE), 
	"N_NOMBRE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table CRONOGRAMA
--------------------------------------------------------

  CREATE TABLE "CRONOGRAMA" 
   (	"K_IDPER" NUMBER(3,0), 
	"K_TIPOBUQUE" NUMBER(4,0), 
	"K_FECHA" DATE, 
	"Q_CUPOS_MAX" NUMBER(3,0), 
	"Q_CUPOS_DISP" NUMBER(3,0), 
	"K_SENTIDO" VARCHAR2(5 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table DOCUMENTO
--------------------------------------------------------

  CREATE TABLE "DOCUMENTO" 
   (	"K_ID" NUMBER(3,0), 
	"I_TIPO_DOCUMENTO" VARCHAR2(10 BYTE), 
	"Q_NUMERODOCUMENTO" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table OFERTA
--------------------------------------------------------

  CREATE TABLE "OFERTA" 
   (	"K_OFERTA" NUMBER(5,0), 
	"K_SUBASTA" VARCHAR2(6 BYTE), 
	"V_OFERTA" NUMBER(6,2), 
	"F_OFERTA" DATE, 
	"K_IDAGENTE" NUMBER(8,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table PAGO
--------------------------------------------------------

  CREATE TABLE "PAGO" 
   (	"K_ID" NUMBER(2,0), 
	"K_IDTIPO" NUMBER(8,0), 
	"V_VALOR" NUMBER(6,2), 
	"F_FECHA" DATE, 
	"K_IDTIPOPAGO" NUMBER(3,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table PARAMETROSCANCELACION
--------------------------------------------------------

  CREATE TABLE "PARAMETROSCANCELACION" 
   (	"K_ID" NUMBER(3,0), 
	"Q_DIAS_MIN" NUMBER(2,0), 
	"Q_DIAS_MAX" NUMBER(2,0), 
	"Q_PORCENTAJE" NUMBER(2,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table PARAMETROSPASO
--------------------------------------------------------

  CREATE TABLE "PARAMETROSPASO" 
   (	"K_ID" NUMBER(3,0), 
	"K_TIPOCARGA" NUMBER(4,0), 
	"V_PORCENTAJE" NUMBER(4,2), 
	"V_COSTO" NUMBER(8,2), 
	"N_ESCLUSA" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table PARAMETROSRESERVA
--------------------------------------------------------

  CREATE TABLE "PARAMETROSRESERVA" 
   (	"K_ID" NUMBER(3,0), 
	"Q_BEAN_MIN" NUMBER(5,0), 
	"Q_BEAN_MAX" NUMBER(5,0), 
	"Q_LOA_MIN" NUMBER(5,0), 
	"Q_LOA_MAX" NUMBER(5,0), 
	"V_COSTO" NUMBER(8,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table PASO
--------------------------------------------------------

  CREATE TABLE "PASO" 
   (	"K_ID" NUMBER(4,0), 
	"V_COSTO" NUMBER(8,2), 
	"K_IDRESERVA" NUMBER(8,0), 
	"F_FECHA" DATE, 
	"Q_PASAJEROS" NUMBER(3,0), 
	"N_ESCLUSA" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table PERIODO
--------------------------------------------------------

  CREATE TABLE "PERIODO" 
   (	"K_ID" NUMBER(3,0), 
	"Q_DIAS_MIN" NUMBER(3,0), 
	"Q_DIAS_MAX" NUMBER(3,0), 
	"N_PERIODO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table PERSONA
--------------------------------------------------------

  CREATE TABLE "PERSONA" 
   (	"K_IDENTIFICACION" NUMBER(8,0), 
	"N_NOMBRE" VARCHAR2(30 BYTE), 
	"N_APELLIDO" VARCHAR2(25 BYTE), 
	"F_NACIMIENTO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table RESERVA
--------------------------------------------------------

  CREATE TABLE "RESERVA" 
   (	"K_ID" NUMBER(8,0), 
	"F_ETA" DATE, 
	"N_PUERTO_SALIDA" VARCHAR2(20 BYTE), 
	"N_PUERTO_LLEGADA" VARCHAR2(20 BYTE), 
	"F_SALIDA" DATE, 
	"F_LLEGADA" DATE, 
	"K_NUM_SERIE" NUMBER(8,0), 
	"V_CARGATRANSPORTADA" NUMBER(6,2), 
	"V_COSTO" NUMBER(8,2), 
	"I_ESTADO" VARCHAR2(3 BYTE), 
	"V_CANCELACION" NUMBER(8,2), 
	"K_IDAGENTE" NUMBER(8,0), 
	"F_CANCELACION" DATE, 
	"N_SENTIDO" VARCHAR2(6 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table SUBASTA
--------------------------------------------------------

  CREATE TABLE "SUBASTA" 
   (	"K_SUBASTA" VARCHAR2(6 BYTE), 
	"F_FECHA" DATE, 
	"V_TOPE_MINIMO" NUMBER(8,2), 
	"K_RESERVA" NUMBER(8,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table TIPOBUQUE
--------------------------------------------------------

  CREATE TABLE "TIPOBUQUE" 
   (	"K_ID" NUMBER(4,0), 
	"N_TIPO" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table TIPOCARGA
--------------------------------------------------------

  CREATE TABLE "TIPOCARGA" 
   (	"K_ID" NUMBER(4,0), 
	"N_TIPO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table TIPOPAGO
--------------------------------------------------------

  CREATE TABLE "TIPOPAGO" 
   (	"K_ID" NUMBER(3,0), 
	"N_DESCRIPCION" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table TIPOTARIFA
--------------------------------------------------------

  CREATE TABLE "TIPOTARIFA" 
   (	"I_TIPO" VARCHAR2(10 BYTE), 
	"I_MEDIDA" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table TRIPULACION
--------------------------------------------------------

  CREATE TABLE "TRIPULACION" 
   (	"K_IDPASO" NUMBER(4,0), 
	"K_IDTRIPULANTE" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Table TRIPULANTE
--------------------------------------------------------

  CREATE TABLE "TRIPULANTE" 
   (	"K_ID" NUMBER(5,0), 
	"K_IDPERSONA" NUMBER(8,0), 
	"N_CARGO" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for View INFOPASOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "INFOPASOS" ("K_NUM_SERIE", "F_SALIDA", "N_PUERTO_SALIDA", "F_LLEGADA", "N_PUERTO_LLEGADA", "N_ESCLUSA", "F_ETA") AS 
  (SELECT R.k_num_serie, R.f_salida, R.n_puerto_salida, R.f_llegada, R.n_puerto_llegada, P.n_esclusa, R.f_eta FROM reserva R, paso P WHERE R.k_id = P.k_idReserva)
;
REM INSERTING into AGENTE
SET DEFINE OFF;
Insert into AGENTE (K_ID,K_NIT,K_IDPERSONA) values ('1','12','1');
Insert into AGENTE (K_ID,K_NIT,K_IDPERSONA) values ('111','zzz','123');
REM INSERTING into BUQUE
SET DEFINE OFF;
Insert into BUQUE (K_NUM_SERIE,K_IDCARGA,K_IDBUQUE,Q_PASAJEROS_MAX,V_BEAM,V_LOA,V_CARGA_MAX) values ('123','1','1','20','80','60','300');
Insert into BUQUE (K_NUM_SERIE,K_IDCARGA,K_IDBUQUE,Q_PASAJEROS_MAX,V_BEAM,V_LOA,V_CARGA_MAX) values ('1234','2','2','20','80','60','100');
REM INSERTING into COMPANIA
SET DEFINE OFF;
Insert into COMPANIA (K_NIT,N_NOMBRE) values ('12','UniversidadDistrital');
Insert into COMPANIA (K_NIT,N_NOMBRE) values ('zzz','Avianca');
REM INSERTING into CRONOGRAMA
SET DEFINE OFF;
Insert into CRONOGRAMA (K_IDPER,K_TIPOBUQUE,K_FECHA,Q_CUPOS_MAX,Q_CUPOS_DISP,K_SENTIDO) values ('1','1',to_date('10/12/18','DD/MM/RR'),'5','5','Norte');
Insert into CRONOGRAMA (K_IDPER,K_TIPOBUQUE,K_FECHA,Q_CUPOS_MAX,Q_CUPOS_DISP,K_SENTIDO) values ('1','2',to_date('10/12/18','DD/MM/RR'),'5','5','Norte');
Insert into CRONOGRAMA (K_IDPER,K_TIPOBUQUE,K_FECHA,Q_CUPOS_MAX,Q_CUPOS_DISP,K_SENTIDO) values ('1','1',to_date('15/04/19','DD/MM/RR'),'5','5','Sur');
Insert into CRONOGRAMA (K_IDPER,K_TIPOBUQUE,K_FECHA,Q_CUPOS_MAX,Q_CUPOS_DISP,K_SENTIDO) values ('1','2',to_date('15/04/19','DD/MM/RR'),'5','5','Sur');
Insert into CRONOGRAMA (K_IDPER,K_TIPOBUQUE,K_FECHA,Q_CUPOS_MAX,Q_CUPOS_DISP,K_SENTIDO) values ('1','1',to_date('01/01/19','DD/MM/RR'),'7','7','Sur');
REM INSERTING into DOCUMENTO
SET DEFINE OFF;
REM INSERTING into OFERTA
SET DEFINE OFF;
REM INSERTING into PAGO
SET DEFINE OFF;
REM INSERTING into PARAMETROSCANCELACION
SET DEFINE OFF;
REM INSERTING into PARAMETROSPASO
SET DEFINE OFF;
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('1','1','99','138','Panamax');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('2','1','99','148','Neopanamax');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('3','2','40','640000','Any');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('4','2','80','780000','Any');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('5','3','35','238700','Any');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('6','3','45','128750','Any');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('7','4','60','128710','Panamax');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('8','4','84,2','252000','Neopanamax');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('9','5','50','238892','Neopanamax');
Insert into PARAMETROSPASO (K_ID,K_TIPOCARGA,V_PORCENTAJE,V_COSTO,N_ESCLUSA) values ('10','5','99','335400','Any');
REM INSERTING into PARAMETROSRESERVA
SET DEFINE OFF;
Insert into PARAMETROSRESERVA (K_ID,Q_BEAN_MIN,Q_BEAN_MAX,Q_LOA_MIN,Q_LOA_MAX,V_COSTO) values ('1','0','2000','0','300','2500');
Insert into PARAMETROSRESERVA (K_ID,Q_BEAN_MIN,Q_BEAN_MAX,Q_LOA_MIN,Q_LOA_MAX,V_COSTO) values ('2','0','79','301','2000','5500');
Insert into PARAMETROSRESERVA (K_ID,Q_BEAN_MIN,Q_BEAN_MAX,Q_LOA_MIN,Q_LOA_MAX,V_COSTO) values ('3','80','90','301','2000','10500');
Insert into PARAMETROSRESERVA (K_ID,Q_BEAN_MIN,Q_BEAN_MAX,Q_LOA_MIN,Q_LOA_MAX,V_COSTO) values ('4','91','107','301','2000','18500');
Insert into PARAMETROSRESERVA (K_ID,Q_BEAN_MIN,Q_BEAN_MAX,Q_LOA_MIN,Q_LOA_MAX,V_COSTO) values ('5','91','107','0','899','25000');
Insert into PARAMETROSRESERVA (K_ID,Q_BEAN_MIN,Q_BEAN_MAX,Q_LOA_MIN,Q_LOA_MAX,V_COSTO) values ('6','91','107','900','966','35000');
Insert into PARAMETROSRESERVA (K_ID,Q_BEAN_MIN,Q_BEAN_MAX,Q_LOA_MIN,Q_LOA_MAX,V_COSTO) values ('7','108','2000','0','2000','35000');
Insert into PARAMETROSRESERVA (K_ID,Q_BEAN_MIN,Q_BEAN_MAX,Q_LOA_MIN,Q_LOA_MAX,V_COSTO) values ('8','0','2000','967','2000','35000');
REM INSERTING into PASO
SET DEFINE OFF;
REM INSERTING into PERIODO
SET DEFINE OFF;
Insert into PERIODO (K_ID,Q_DIAS_MIN,Q_DIAS_MAX,N_PERIODO) values ('1','22','365','PRIMER PERIODO');
Insert into PERIODO (K_ID,Q_DIAS_MIN,Q_DIAS_MAX,N_PERIODO) values ('2','4','21','SEGUNDO PERIODO');
Insert into PERIODO (K_ID,Q_DIAS_MIN,Q_DIAS_MAX,N_PERIODO) values ('3','2','3','TERCER PERIODO');
Insert into PERIODO (K_ID,Q_DIAS_MIN,Q_DIAS_MAX,N_PERIODO) values ('4','366','730','PERIODO ESPECIAL');
REM INSERTING into PERSONA
SET DEFINE OFF;
Insert into PERSONA (K_IDENTIFICACION,N_NOMBRE,N_APELLIDO,F_NACIMIENTO) values ('1','Juan','Perez',to_date('15/06/94','DD/MM/RR'));
Insert into PERSONA (K_IDENTIFICACION,N_NOMBRE,N_APELLIDO,F_NACIMIENTO) values ('123','Pepe','Gutierrez',to_date('10/10/18','DD/MM/RR'));
REM INSERTING into RESERVA
SET DEFINE OFF;
REM INSERTING into SUBASTA
SET DEFINE OFF;
REM INSERTING into TIPOBUQUE
SET DEFINE OFF;
Insert into TIPOBUQUE (K_ID,N_TIPO) values ('1','Regular');
Insert into TIPOBUQUE (K_ID,N_TIPO) values ('2','Super');
Insert into TIPOBUQUE (K_ID,N_TIPO) values ('3','Neopanamax');
REM INSERTING into TIPOCARGA
SET DEFINE OFF;
Insert into TIPOCARGA (K_ID,N_TIPO) values ('1','Comercial');
Insert into TIPOCARGA (K_ID,N_TIPO) values ('2','Portacontenedores');
Insert into TIPOCARGA (K_ID,N_TIPO) values ('3','Portavehiculos');
Insert into TIPOCARGA (K_ID,N_TIPO) values ('4','Granelero');
Insert into TIPOCARGA (K_ID,N_TIPO) values ('5','Granelero liquido');
REM INSERTING into TIPOPAGO
SET DEFINE OFF;
REM INSERTING into TIPOTARIFA
SET DEFINE OFF;
REM INSERTING into TRIPULACION
SET DEFINE OFF;
REM INSERTING into TRIPULANTE
SET DEFINE OFF;
REM INSERTING into INFOPASOS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_AGENTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_AGENTE" ON "AGENTE" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_BUQUE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BUQUE" ON "BUQUE" ("K_NUM_SERIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_CARGA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CARGA" ON "TIPOCARGA" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_COMPANIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_COMPANIA" ON "COMPANIA" ("K_NIT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_CRONOGRAMA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_CRONOGRAMA" ON "CRONOGRAMA" ("K_IDPER", "K_TIPOBUQUE", "K_FECHA", "K_SENTIDO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_OFERTA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_OFERTA" ON "OFERTA" ("K_OFERTA", "K_SUBASTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_PAGO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PAGO" ON "PAGO" ("K_ID", "K_IDTIPOPAGO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_PARAMETROSCANCELACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PARAMETROSCANCELACION" ON "PARAMETROSCANCELACION" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_PARAMETROSPASO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PARAMETROSPASO" ON "PARAMETROSPASO" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_PARAMETROSRESERVA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PARAMETROSRESERVA" ON "PARAMETROSRESERVA" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_PASO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PASO" ON "PASO" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_PERSONA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PERSONA" ON "PERSONA" ("K_IDENTIFICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_RESERVA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RESERVA" ON "RESERVA" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_SUBASTA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SUBASTA" ON "SUBASTA" ("K_SUBASTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPOBUQUE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TIPOBUQUE" ON "TIPOBUQUE" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPOCUPO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TIPOCUPO" ON "PERIODO" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPODOCUMENTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TIPODOCUMENTO" ON "DOCUMENTO" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPOPAGO
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TIPOPAGO" ON "TIPOPAGO" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPOTARIFA
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TIPOTARIFA" ON "TIPOTARIFA" ("I_TIPO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_TRIPULACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TRIPULACION" ON "TRIPULACION" ("K_IDPASO", "K_IDTRIPULANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index PK_TRIPULANTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TRIPULANTE" ON "TRIPULANTE" ("K_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index UQ_PERIODO_N_PERIODO
--------------------------------------------------------

  CREATE UNIQUE INDEX "UQ_PERIODO_N_PERIODO" ON "PERIODO" ("N_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Index UQ_TIPODOCUMENTO_Q_NUMERODOCU
--------------------------------------------------------

  CREATE UNIQUE INDEX "UQ_TIPODOCUMENTO_Q_NUMERODOCU" ON "DOCUMENTO" ("Q_NUMERODOCUMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS" ;
--------------------------------------------------------
--  DDL for Procedure PR_REGISTRAR_PASO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PR_REGISTRAR_PASO" 
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
--------------------------------------------------------
--  DDL for Procedure PR_REGISTRAR_RESERVA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PR_REGISTRAR_RESERVA" 
(
 lf_eta IN RESERVA.f_eta%TYPE,
 ln_puerto_salida IN RESERVA.n_puerto_salida%TYPE,
 ln_puerto_llegada IN RESERVA.n_puerto_llegada%TYPE,
 lf_salida IN RESERVA.f_salida%TYPE,
 lf_llegada IN RESERVA.f_llegada%TYPE,
 lk_num_serie IN RESERVA.k_num_serie%TYPE,
 lv_cargaTransportada IN RESERVA.v_cargatransportada%TYPE,
 lk_id_agente IN RESERVA.k_idAgente%TYPE,
 ln_sentido IN reserva.n_sentido%TYPE
)
AS
 lv_beam buque.v_beam%TYPE;
 lv_loa buque.v_loa%TYPE;
 lv_costo_reserva NUMBER;
 lk_periodo periodo.k_id%TYPE;
 lq_numero_cupos_disponibles NUMBER;
 lk_tipo_buque buque.k_idbuque%type;
BEGIN
---- Calcular que periodo aplica -----
lk_periodo := FU_CALCULAR_PERIODO(lf_eta);

IF lk_periodo = 0 THEN
  RAISE_APPLICATION_ERROR (-20200, 'No hay periodo abiertos para la fecha seleccionada '||TO_CHAR(lf_eta,'yyyy/mm/dd'));
END IF;

 ----- obtener los datos del buque ----------------
 SELECT B.k_idbuque INTO lk_tipo_buque FROM BUQUE B WHERE B.k_num_serie = lk_num_serie;
 SELECT B.v_beam INTO lv_beam FROM BUQUE B WHERE B.k_num_serie = lk_num_serie;
 SELECT B.v_loa INTO lv_loa FROM BUQUE B WHERE b.k_num_serie = lk_num_serie;
----  Verificar que hay cupos disponibles para la fecha con el periodo calculado y para el sentido seleccionado -----
 lq_numero_cupos_disponibles := FU_CUPOS_DISPONIBLES(lf_eta,ln_sentido,lk_periodo,lk_tipo_buque);
 IF lq_numero_cupos_disponibles = 0 THEN
    RAISE_APPLICATION_ERROR (-20203, 'No hay Cupos Disponibles');
 END IF;
 dbms_output.put_line('Cupos disponibles '||lq_numero_cupos_disponibles);
 ----- calcular el costo de la reserva --------------
 lv_costo_reserva := FU_PRECIO_RESERVA(lv_beam,lv_loa);
 INSERT INTO RESERVA (k_id, f_eta, n_puerto_salida, n_puerto_llegada,f_salida,f_llegada,k_num_serie,v_cargaTransportada,v_costo,i_estado,k_idAgente,n_sentido) VALUES
 (reserva_seq.NEXTVAL,lf_eta,ln_puerto_salida,ln_puerto_llegada,lf_salida,lf_llegada,lk_num_serie,lv_cargaTransportada,lv_costo_reserva,'Dis',lk_id_agente,ln_sentido);
 ------- Actualizar los cupos disponibles -----------
 UPDATE cronograma c SET c.q_cupos_disp = c.q_cupos_disp-1 WHERE c.k_idper=lk_periodo AND c.k_sentido=ln_sentido AND c.k_idper = lk_periodo AND c.k_tipobuque = lk_tipo_buque;

 EXCEPTION
  WHEN no_data_found THEN
    dbms_output.put_line('Datos no encontrados');
    RAISE_APPLICATION_ERROR (-20201, 'Datos no encontrados para el buque '||lk_num_serie);
END PR_REGISTRAR_RESERVA;

/
--------------------------------------------------------
--  DDL for Function FU_CALCULAR_PERIODO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "FU_CALCULAR_PERIODO" (
lf_fecha_reserva DATE
)
RETURN VARCHAR2 AS
lq_dias_min periodo.q_dias_min%TYPE;
lq_dias_max periodo.q_dias_max%TYPE;
CURSOR c_periodos IS SELECT K_ID ,Q_DIAS_MIN ,Q_DIAS_MAX ,N_PERIODO  FROM periodo;
l_periodo periodo%ROWTYPE;
lq_dias_restantes NUMBER(6,0);
ln_return_periodo periodo.k_id%TYPE;
BEGIN
  lq_dias_restantes := lf_fecha_reserva-sysdate;
  ln_return_periodo :=0;
  dbms_output.put_line(lq_dias_restantes);
  OPEN c_periodos;
  LOOP
    FETCH c_periodos INTO l_periodo;
    EXIT WHEN c_periodos%NOTFOUND;
    IF lq_dias_restantes >= l_periodo.Q_DIAS_MIN AND lq_dias_restantes <= l_periodo.Q_DIAS_MAX THEN
      ln_return_periodo := l_periodo.k_id;
    END IF;
  END LOOP;
  CLOSE c_periodos;
  dbms_output.put_line(ln_return_periodo);
  RETURN ln_return_periodo;
END FU_CALCULAR_PERIODO;

/
--------------------------------------------------------
--  DDL for Function FU_CUPOS_DISPONIBLES
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "FU_CUPOS_DISPONIBLES" (
lk_fecha date,
lk_sentido cronograma.k_sentido%type,
lk_periodo periodo.k_id%type,
lk_tipo_buque cronograma.k_tipobuque%type
) RETURN NUMBER AS
lq_numero_cupos_disponibles NUMBER;
ln_periodo periodo.n_periodo%type;
BEGIN
  SELECT Q_CUPOS_DISP INTO lq_numero_cupos_disponibles FROM CRONOGRAMA C WHERE C.k_FECHA = lk_fecha AND C.k_SENTIDO = lk_sentido AND C.K_IDPER = lk_periodo AND c.k_tipobuque = lk_tipo_buque;
  RETURN lq_numero_cupos_disponibles;
   EXCEPTION
  WHEN no_data_found THEN
    SELECT n_periodo INTO ln_periodo FROM periodo WHERE k_ID =lk_periodo;
    RAISE_APPLICATION_ERROR (-20202, 'No hay cupos disponibles para la fecha: '||lk_fecha||' sentido: '||lk_sentido||' y periodo: '|| ln_periodo );
END FU_CUPOS_DISPONIBLES;

/
--------------------------------------------------------
--  DDL for Function FU_PRECIO_PASO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "FU_PRECIO_PASO" 
    (
        lk_idReserva IN PASO.k_idReserva%TYPE,
        ln_esclusa IN PASO.n_esclusa%TYPE
    )
    RETURN PASO.v_costo%TYPE
    AS
        lk_num_serie BUQUE.k_num_serie%TYPE;
        lk_idCarga TIPOCARGA.k_id%TYPE;
        lv_cargaTransportada RESERVA.v_cargaTransportada%TYPE;
        lv_carga_max BUQUE.v_carga_max%TYPE;
        lv_porcentajeCarga NUMBER(4,2) := 0;
        lv_costo PARAMETROSPASO.v_costo%TYPE;
    BEGIN
        SELECT R.k_num_serie INTO lk_num_serie FROM Reserva R WHERE R.k_id = lk_idReserva;
        SELECT TP.k_id INTO lk_idCarga FROM tipocarga TP, buque B WHERE TP.k_id = B.k_idCarga AND B.k_num_serie = lk_num_serie;
        SELECT R.v_cargaTransportada INTO lv_cargaTransportada FROM Reserva R WHERE R.k_id = lk_idReserva;
        SELECT B.v_carga_max INTO lv_carga_max FROM buque B WHERE B.k_num_serie = lk_num_serie;

        lv_porcentajeCarga := (lv_cargaTransportada * 100) / lv_carga_max;

        IF (lk_idCarga = 2) THEN

            IF (lv_porcentajeCarga > 40) THEN

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.v_porcentaje > 40;

            ELSE

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.v_porcentaje <= 40;

            END IF;

        ELSIF (lk_idCarga = 1) THEN

            IF (ln_esclusa = 'Neopanamax') THEN

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.n_esclusa = 'Neopanamax';

            ELSE

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.n_esclusa = 'Panamax';

            END IF;
            lv_costo := lv_costo * lv_cargaTransportada;

        ELSIF (lk_idCarga = 3) THEN

            IF (lv_porcentajeCarga > 35) THEN

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.v_porcentaje > 35;

            ELSE

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.v_porcentaje <= 35;

            END IF;

        ELSIF (lk_idCarga = 4) THEN

            IF (lv_porcentajeCarga > 60) THEN

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.n_esclusa = 'Neopanamax';

            ELSE

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.n_esclusa = 'Panamax';

            END IF;

        ELSE

            IF (lv_porcentajeCarga < 50) THEN

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.n_esclusa = 'Neopanamax';

            ELSE

                SELECT PP.v_costo INTO lv_costo FROM parametrospaso PP WHERE PP.k_tipocarga = lk_idCarga AND PP.n_esclusa != 'Neopanamax';

            END IF;

        END IF;
        RETURN lv_costo;
END FU_PRECIO_PASO;

/
--------------------------------------------------------
--  DDL for Function FU_PRECIO_RESERVA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "FU_PRECIO_RESERVA" (
BEAN IN NUMBER,
LOA IN NUMBER
)
RETURN VARCHAR2 AS
   PRECIO NUMBER(2) := 0;
   CANT_PARAMETROS NUMBER(3) := 0;
   BEAN_MIN NUMBER(5):=0;
   LOA_MIN NUMBER(5) :=0;
   BEAN_MAX NUMBER(5) :=0;
   LOA_MAX NUMBER(5) :=0;
   COSTO_ NUMBER(8,2) := 0;
BEGIN
  SELECT count(*) INTO CANT_PARAMETROS FROM PARAMETROSRESERVA;

   IF CANT_PARAMETROS>0 THEN
	FOR ID IN 1..CANT_PARAMETROS LOOP

 		SELECT (SELECT Q_BEAN_MIN FROM PARAMETROSRESERVA WHERE K_ID= ID)
  		INTO BEAN_MIN
  		FROM dual;

		SELECT (SELECT Q_BEAN_MAX FROM PARAMETROSRESERVA WHERE K_ID= ID)
  		INTO BEAN_MAX
  		FROM dual;

		SELECT (SELECT Q_LOA_MIN FROM PARAMETROSRESERVA WHERE K_ID= ID)
  		INTO LOA_MIN
  		FROM dual;

		SELECT (SELECT Q_LOA_MAX FROM PARAMETROSRESERVA WHERE K_ID= ID)
  		INTO LOA_MAX
  		FROM dual;

		IF BEAN>=BEAN_MIN AND BEAN<=BEAN_MAX AND LOA>=LOA_MIN AND LOA<=LOA_MAX THEN
			SELECT (SELECT V_COSTO FROM PARAMETROSRESERVA WHERE K_ID= ID)
  			INTO COSTO_
  			FROM dual;
		END IF;

	END LOOP;
   END IF;
   RETURN COSTO_;
END FU_PRECIO_RESERVA;

/
--------------------------------------------------------
--  DDL for Function FU_PROGRAMACION_DIARIA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "FU_PROGRAMACION_DIARIA" (lf_eta date)
	RETURN NESTED_DATOSTABLE
	IS
		tmpVar NESTED_DATOSTABLE;
	BEGIN
		select
		cast( multiset(
		SELECT * FROM infopasos WHERE f_eta = lf_eta
			) as NESTED_DATOSTABLE)
		into tmpVar
		from dual;
RETURN tmpVar;
END;

/
--------------------------------------------------------
--  Constraints for Table AGENTE
--------------------------------------------------------

  ALTER TABLE "AGENTE" ADD CONSTRAINT "CK_K_IDAGEN" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "AGENTE" ADD CONSTRAINT "PK_AGENTE" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "AGENTE" MODIFY ("K_IDPERSONA" NOT NULL ENABLE);
  ALTER TABLE "AGENTE" MODIFY ("K_NIT" NOT NULL ENABLE);
  ALTER TABLE "AGENTE" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BUQUE
--------------------------------------------------------

  ALTER TABLE "BUQUE" ADD CONSTRAINT "CK_K_NUM_SERIEBUQ" CHECK (k_num_serie > 0) ENABLE;
  ALTER TABLE "BUQUE" ADD CONSTRAINT "CK_V_CARGA_MAXBUQ" CHECK (v_carga_max > 0) ENABLE;
  ALTER TABLE "BUQUE" ADD CONSTRAINT "CK_V_LOABUQ" CHECK (v_loa > 0) ENABLE;
  ALTER TABLE "BUQUE" ADD CONSTRAINT "CK_V_BEAMBUQ" CHECK (v_beam > 0) ENABLE;
  ALTER TABLE "BUQUE" ADD CONSTRAINT "CK_Q_PASAJEROS_MAXBUQ" CHECK (q_pasajeros_max > 0) ENABLE;
  ALTER TABLE "BUQUE" ADD CONSTRAINT "PK_BUQUE" PRIMARY KEY ("K_NUM_SERIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "BUQUE" MODIFY ("V_CARGA_MAX" NOT NULL ENABLE);
  ALTER TABLE "BUQUE" MODIFY ("V_LOA" NOT NULL ENABLE);
  ALTER TABLE "BUQUE" MODIFY ("V_BEAM" NOT NULL ENABLE);
  ALTER TABLE "BUQUE" MODIFY ("Q_PASAJEROS_MAX" NOT NULL ENABLE);
  ALTER TABLE "BUQUE" MODIFY ("K_IDBUQUE" NOT NULL ENABLE);
  ALTER TABLE "BUQUE" MODIFY ("K_IDCARGA" NOT NULL ENABLE);
  ALTER TABLE "BUQUE" MODIFY ("K_NUM_SERIE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMPANIA
--------------------------------------------------------

  ALTER TABLE "COMPANIA" ADD CONSTRAINT "PK_COMPANIA" PRIMARY KEY ("K_NIT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "COMPANIA" MODIFY ("N_NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "COMPANIA" MODIFY ("K_NIT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CRONOGRAMA
--------------------------------------------------------

  ALTER TABLE "CRONOGRAMA" ADD CONSTRAINT "CK_K_SENTIDO" CHECK (k_sentido in ('Norte','Sur')) ENABLE;
  ALTER TABLE "CRONOGRAMA" ADD CONSTRAINT "CK_Q_CUPOS_DISP" CHECK (q_cupos_disp >= 0) ENABLE;
  ALTER TABLE "CRONOGRAMA" ADD CONSTRAINT "CK_Q_CUPOS_MAX" CHECK (q_cupos_max >= 0) ENABLE;
  ALTER TABLE "CRONOGRAMA" ADD CONSTRAINT "PK_CRONOGRAMA" PRIMARY KEY ("K_IDPER", "K_TIPOBUQUE", "K_FECHA", "K_SENTIDO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "CRONOGRAMA" MODIFY ("K_SENTIDO" NOT NULL ENABLE);
  ALTER TABLE "CRONOGRAMA" MODIFY ("Q_CUPOS_DISP" NOT NULL ENABLE);
  ALTER TABLE "CRONOGRAMA" MODIFY ("Q_CUPOS_MAX" NOT NULL ENABLE);
  ALTER TABLE "CRONOGRAMA" MODIFY ("K_FECHA" NOT NULL ENABLE);
  ALTER TABLE "CRONOGRAMA" MODIFY ("K_TIPOBUQUE" NOT NULL ENABLE);
  ALTER TABLE "CRONOGRAMA" MODIFY ("K_IDPER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOCUMENTO
--------------------------------------------------------

  ALTER TABLE "DOCUMENTO" ADD CONSTRAINT "UQ_TIPODOCUMENTO_Q_NUMERODOCU" UNIQUE ("Q_NUMERODOCUMENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "DOCUMENTO" ADD CONSTRAINT "PK_TIPODOCUMENTO" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "DOCUMENTO" MODIFY ("Q_NUMERODOCUMENTO" NOT NULL ENABLE);
  ALTER TABLE "DOCUMENTO" MODIFY ("I_TIPO_DOCUMENTO" NOT NULL ENABLE);
  ALTER TABLE "DOCUMENTO" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OFERTA
--------------------------------------------------------

  ALTER TABLE "OFERTA" ADD CONSTRAINT "CK_K_OFERTAOFER" CHECK (k_oferta > 0) ENABLE;
  ALTER TABLE "OFERTA" ADD CONSTRAINT "CK_V_OFERTAOFER" CHECK (v_oferta > 0) ENABLE;
  ALTER TABLE "OFERTA" ADD CONSTRAINT "PK_OFERTA" PRIMARY KEY ("K_OFERTA", "K_SUBASTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "OFERTA" MODIFY ("K_IDAGENTE" NOT NULL ENABLE);
  ALTER TABLE "OFERTA" MODIFY ("F_OFERTA" NOT NULL ENABLE);
  ALTER TABLE "OFERTA" MODIFY ("V_OFERTA" NOT NULL ENABLE);
  ALTER TABLE "OFERTA" MODIFY ("K_SUBASTA" NOT NULL ENABLE);
  ALTER TABLE "OFERTA" MODIFY ("K_OFERTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAGO
--------------------------------------------------------

  ALTER TABLE "PAGO" ADD CONSTRAINT "CK_K_IDPAGO" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "PAGO" ADD CONSTRAINT "CK_V_VALORPAGO" CHECK (v_valor > 0) ENABLE;
  ALTER TABLE "PAGO" ADD CONSTRAINT "PK_PAGO" PRIMARY KEY ("K_ID", "K_IDTIPOPAGO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "PAGO" MODIFY ("K_IDTIPOPAGO" NOT NULL ENABLE);
  ALTER TABLE "PAGO" MODIFY ("F_FECHA" NOT NULL ENABLE);
  ALTER TABLE "PAGO" MODIFY ("V_VALOR" NOT NULL ENABLE);
  ALTER TABLE "PAGO" MODIFY ("K_IDTIPO" NOT NULL ENABLE);
  ALTER TABLE "PAGO" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PARAMETROSCANCELACION
--------------------------------------------------------

  ALTER TABLE "PARAMETROSCANCELACION" ADD CONSTRAINT "CK_K_IDPARCAN" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "PARAMETROSCANCELACION" ADD CONSTRAINT "CK_Q_PORCENTAJEPARCAN" CHECK (q_porcentaje > 0) ENABLE;
  ALTER TABLE "PARAMETROSCANCELACION" ADD CONSTRAINT "CK_Q_DIAS_MAXPARCAN" CHECK (q_dias_max > 0) ENABLE;
  ALTER TABLE "PARAMETROSCANCELACION" ADD CONSTRAINT "CK_Q_DIAS_MINPARCAN" CHECK (q_dias_min > 0) ENABLE;
  ALTER TABLE "PARAMETROSCANCELACION" ADD CONSTRAINT "PK_PARAMETROSCANCELACION" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "PARAMETROSCANCELACION" MODIFY ("Q_PORCENTAJE" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSCANCELACION" MODIFY ("Q_DIAS_MAX" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSCANCELACION" MODIFY ("Q_DIAS_MIN" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSCANCELACION" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PARAMETROSPASO
--------------------------------------------------------

  ALTER TABLE "PARAMETROSPASO" ADD CONSTRAINT "CK_N_ESCLUSAPARPASO" CHECK (n_esclusa in ('Neopanamax','Panamax','Any')) ENABLE;
  ALTER TABLE "PARAMETROSPASO" ADD CONSTRAINT "CK_K_IDPARPAS" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "PARAMETROSPASO" ADD CONSTRAINT "CK_V_COSTOPARPAS" CHECK (v_costo > 0) ENABLE;
  ALTER TABLE "PARAMETROSPASO" ADD CONSTRAINT "CK_V_PORCENTAJEPARPAS" CHECK (v_porcentaje > 0) ENABLE;
  ALTER TABLE "PARAMETROSPASO" ADD CONSTRAINT "PK_PARAMETROSPASO" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "PARAMETROSPASO" MODIFY ("N_ESCLUSA" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSPASO" MODIFY ("V_COSTO" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSPASO" MODIFY ("V_PORCENTAJE" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSPASO" MODIFY ("K_TIPOCARGA" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSPASO" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PARAMETROSRESERVA
--------------------------------------------------------

  ALTER TABLE "PARAMETROSRESERVA" ADD CONSTRAINT "CK_K_IDPARRES" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "PARAMETROSRESERVA" ADD CONSTRAINT "CK_V_COSTOPARRES" CHECK (v_costo > 0) ENABLE;
  ALTER TABLE "PARAMETROSRESERVA" ADD CONSTRAINT "CK_Q_LOA_MAXPARRES" CHECK (q_loa_max > 0) ENABLE;
  ALTER TABLE "PARAMETROSRESERVA" ADD CONSTRAINT "CK_Q_LOA_MINPARRES" CHECK (q_loa_min >= 0) ENABLE;
  ALTER TABLE "PARAMETROSRESERVA" ADD CONSTRAINT "CK_Q_BEAN_MAXPARRES" CHECK (q_bean_max > 0) ENABLE;
  ALTER TABLE "PARAMETROSRESERVA" ADD CONSTRAINT "CK_Q_BEAN_MINPARRES" CHECK (q_bean_min >= 0) ENABLE;
  ALTER TABLE "PARAMETROSRESERVA" ADD CONSTRAINT "PK_PARAMETROSRESERVA" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "PARAMETROSRESERVA" MODIFY ("V_COSTO" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSRESERVA" MODIFY ("Q_LOA_MAX" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSRESERVA" MODIFY ("Q_LOA_MIN" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSRESERVA" MODIFY ("Q_BEAN_MAX" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSRESERVA" MODIFY ("Q_BEAN_MIN" NOT NULL ENABLE);
  ALTER TABLE "PARAMETROSRESERVA" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PASO
--------------------------------------------------------

  ALTER TABLE "PASO" ADD CONSTRAINT "CK_N_ESCLUSA" CHECK (n_esclusa in ('Neopanamax','Panamax','Any')) ENABLE;
  ALTER TABLE "PASO" ADD CONSTRAINT "CK_K_IDPAS" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "PASO" ADD CONSTRAINT "CK_Q_PASAJEROSPAS" CHECK (q_pasajeros > 0) ENABLE;
  ALTER TABLE "PASO" ADD CONSTRAINT "CK_V_COSTOPAS" CHECK (v_costo > 0) ENABLE;
  ALTER TABLE "PASO" ADD CONSTRAINT "PK_PASO" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "PASO" MODIFY ("N_ESCLUSA" NOT NULL ENABLE);
  ALTER TABLE "PASO" MODIFY ("Q_PASAJEROS" NOT NULL ENABLE);
  ALTER TABLE "PASO" MODIFY ("F_FECHA" NOT NULL ENABLE);
  ALTER TABLE "PASO" MODIFY ("K_IDRESERVA" NOT NULL ENABLE);
  ALTER TABLE "PASO" MODIFY ("V_COSTO" NOT NULL ENABLE);
  ALTER TABLE "PASO" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PERIODO
--------------------------------------------------------

  ALTER TABLE "PERIODO" ADD CONSTRAINT "CK_K_IDPER" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "PERIODO" ADD CONSTRAINT "CK_Q_DIAS_MAXPER" CHECK (q_dias_max > 0) ENABLE;
  ALTER TABLE "PERIODO" ADD CONSTRAINT "CK_Q_DIAS_MINPER" CHECK (q_dias_min > 0) ENABLE;
  ALTER TABLE "PERIODO" ADD CONSTRAINT "UQ_PERIODO_N_PERIODO" UNIQUE ("N_PERIODO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "PERIODO" ADD CONSTRAINT "PK_TIPOCUPO" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "PERIODO" MODIFY ("N_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "PERIODO" MODIFY ("Q_DIAS_MAX" NOT NULL ENABLE);
  ALTER TABLE "PERIODO" MODIFY ("Q_DIAS_MIN" NOT NULL ENABLE);
  ALTER TABLE "PERIODO" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PERSONA
--------------------------------------------------------

  ALTER TABLE "PERSONA" ADD CONSTRAINT "CK_K_IDENTIFICACION" CHECK (k_identificacion > 0) ENABLE;
  ALTER TABLE "PERSONA" ADD CONSTRAINT "PK_PERSONA" PRIMARY KEY ("K_IDENTIFICACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "PERSONA" MODIFY ("F_NACIMIENTO" NOT NULL ENABLE);
  ALTER TABLE "PERSONA" MODIFY ("N_APELLIDO" NOT NULL ENABLE);
  ALTER TABLE "PERSONA" MODIFY ("N_NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "PERSONA" MODIFY ("K_IDENTIFICACION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESERVA
--------------------------------------------------------

  ALTER TABLE "RESERVA" ADD CONSTRAINT "CK_N_SENTIDO_RESERVA" CHECK (n_sentido in ('Norte','Sur')) ENABLE;
  ALTER TABLE "RESERVA" ADD CONSTRAINT "CK_K_ID" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "RESERVA" ADD CONSTRAINT "CK_V_CANCELACION" CHECK (v_cancelacion > 0) ENABLE;
  ALTER TABLE "RESERVA" ADD CONSTRAINT "CK_I_ESTADO" CHECK (i_estado in ('Dis','Can')) ENABLE;
  ALTER TABLE "RESERVA" ADD CONSTRAINT "CK_V_COSTO" CHECK (v_costo > 0) ENABLE;
  ALTER TABLE "RESERVA" ADD CONSTRAINT "CK_V_CARGATRANSPORTADA" CHECK (v_cargaTransportada > 0) ENABLE;
  ALTER TABLE "RESERVA" ADD CONSTRAINT "PK_RESERVA" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "RESERVA" MODIFY ("N_SENTIDO" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("K_IDAGENTE" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("I_ESTADO" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("V_COSTO" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("V_CARGATRANSPORTADA" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("K_NUM_SERIE" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("F_LLEGADA" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("F_SALIDA" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("N_PUERTO_LLEGADA" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("N_PUERTO_SALIDA" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("F_ETA" NOT NULL ENABLE);
  ALTER TABLE "RESERVA" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBASTA
--------------------------------------------------------

  ALTER TABLE "SUBASTA" ADD CONSTRAINT "CK_V_TOPE_MINIMO" CHECK (v_tope_minimo > 0) ENABLE;
  ALTER TABLE "SUBASTA" ADD CONSTRAINT "PK_SUBASTA" PRIMARY KEY ("K_SUBASTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "SUBASTA" MODIFY ("K_RESERVA" NOT NULL ENABLE);
  ALTER TABLE "SUBASTA" MODIFY ("V_TOPE_MINIMO" NOT NULL ENABLE);
  ALTER TABLE "SUBASTA" MODIFY ("F_FECHA" NOT NULL ENABLE);
  ALTER TABLE "SUBASTA" MODIFY ("K_SUBASTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TIPOBUQUE
--------------------------------------------------------

  ALTER TABLE "TIPOBUQUE" ADD CONSTRAINT "CK_K_IDTBUQ" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "TIPOBUQUE" ADD CONSTRAINT "CK_N_TIPOTBUQ" CHECK (n_tipo in ('Neopanamax','Super','Regular')) ENABLE;
  ALTER TABLE "TIPOBUQUE" ADD CONSTRAINT "PK_TIPOBUQUE" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "TIPOBUQUE" MODIFY ("N_TIPO" NOT NULL ENABLE);
  ALTER TABLE "TIPOBUQUE" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TIPOCARGA
--------------------------------------------------------

  ALTER TABLE "TIPOCARGA" ADD CONSTRAINT "CK_K_IDTCAR" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "TIPOCARGA" ADD CONSTRAINT "CK_N_TIPOTCAR" CHECK (n_tipo in ('Comercial','Portacontenedores','Portavehiculos','Granelero','Granelero liquido')) ENABLE;
  ALTER TABLE "TIPOCARGA" ADD CONSTRAINT "PK_CARGA" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "TIPOCARGA" MODIFY ("N_TIPO" NOT NULL ENABLE);
  ALTER TABLE "TIPOCARGA" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TIPOPAGO
--------------------------------------------------------

  ALTER TABLE "TIPOPAGO" ADD CONSTRAINT "CK_K_IDTIPPAG" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "TIPOPAGO" ADD CONSTRAINT "PK_TIPOPAGO" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "TIPOPAGO" MODIFY ("N_DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "TIPOPAGO" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TIPOTARIFA
--------------------------------------------------------

  ALTER TABLE "TIPOTARIFA" ADD CONSTRAINT "CK_I_MEDIDA" CHECK (i_medida in ('Beam','Porcentaje','Dias Restantes')) ENABLE;
  ALTER TABLE "TIPOTARIFA" ADD CONSTRAINT "CK_I_TIPO" CHECK (i_tipo in ('Paso','Reserva','Multa')) ENABLE;
  ALTER TABLE "TIPOTARIFA" ADD CONSTRAINT "PK_TIPOTARIFA" PRIMARY KEY ("I_TIPO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "TIPOTARIFA" MODIFY ("I_MEDIDA" NOT NULL ENABLE);
  ALTER TABLE "TIPOTARIFA" MODIFY ("I_TIPO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRIPULACION
--------------------------------------------------------

  ALTER TABLE "TRIPULACION" ADD CONSTRAINT "PK_TRIPULACION" PRIMARY KEY ("K_IDPASO", "K_IDTRIPULANTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "TRIPULACION" MODIFY ("K_IDTRIPULANTE" NOT NULL ENABLE);
  ALTER TABLE "TRIPULACION" MODIFY ("K_IDPASO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRIPULANTE
--------------------------------------------------------

  ALTER TABLE "TRIPULANTE" ADD CONSTRAINT "CK_K_IDTRIP" CHECK (k_id > 0) ENABLE;
  ALTER TABLE "TRIPULANTE" ADD CONSTRAINT "PK_TRIPULANTE" PRIMARY KEY ("K_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "CANALPANDATOS"  ENABLE;
  ALTER TABLE "TRIPULANTE" MODIFY ("N_CARGO" NOT NULL ENABLE);
  ALTER TABLE "TRIPULANTE" MODIFY ("K_IDPERSONA" NOT NULL ENABLE);
  ALTER TABLE "TRIPULANTE" MODIFY ("K_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table AGENTE
--------------------------------------------------------

  ALTER TABLE "AGENTE" ADD CONSTRAINT "FK_AGENTE_COMPANIA" FOREIGN KEY ("K_NIT")
	  REFERENCES "COMPANIA" ("K_NIT") ENABLE;
  ALTER TABLE "AGENTE" ADD CONSTRAINT "FK_AGENTE_PERSONA" FOREIGN KEY ("K_IDPERSONA")
	  REFERENCES "PERSONA" ("K_IDENTIFICACION") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BUQUE
--------------------------------------------------------

  ALTER TABLE "BUQUE" ADD CONSTRAINT "FK_BUQUE_CARGA" FOREIGN KEY ("K_IDCARGA")
	  REFERENCES "TIPOCARGA" ("K_ID") ENABLE;
  ALTER TABLE "BUQUE" ADD CONSTRAINT "FK_BUQUE_TIPOBUQUE" FOREIGN KEY ("K_IDBUQUE")
	  REFERENCES "TIPOBUQUE" ("K_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CRONOGRAMA
--------------------------------------------------------

  ALTER TABLE "CRONOGRAMA" ADD CONSTRAINT "FK_CRONOGRAMA_PERIODO" FOREIGN KEY ("K_IDPER")
	  REFERENCES "PERIODO" ("K_ID") ENABLE;
  ALTER TABLE "CRONOGRAMA" ADD CONSTRAINT "FK_CRONOGRAMA_TIPOBUQUE" FOREIGN KEY ("K_TIPOBUQUE")
	  REFERENCES "TIPOBUQUE" ("K_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OFERTA
--------------------------------------------------------

  ALTER TABLE "OFERTA" ADD CONSTRAINT "FK_OFERTA_AGENTE" FOREIGN KEY ("K_IDAGENTE")
	  REFERENCES "AGENTE" ("K_ID") ENABLE;
  ALTER TABLE "OFERTA" ADD CONSTRAINT "FK_OFERTA_SUBASTA" FOREIGN KEY ("K_SUBASTA")
	  REFERENCES "SUBASTA" ("K_SUBASTA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAGO
--------------------------------------------------------

  ALTER TABLE "PAGO" ADD CONSTRAINT "FK_PAGO_PASO" FOREIGN KEY ("K_IDTIPOPAGO")
	  REFERENCES "PASO" ("K_ID") ENABLE;
  ALTER TABLE "PAGO" ADD CONSTRAINT "FK_PAGO_RESERVA" FOREIGN KEY ("K_IDTIPOPAGO")
	  REFERENCES "RESERVA" ("K_ID") ENABLE;
  ALTER TABLE "PAGO" ADD CONSTRAINT "FK_PAGO_TIPOPAGO" FOREIGN KEY ("K_IDTIPOPAGO")
	  REFERENCES "TIPOPAGO" ("K_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PARAMETROSPASO
--------------------------------------------------------

  ALTER TABLE "PARAMETROSPASO" ADD CONSTRAINT "FK_PARAMETROSPASO_TIPOCARGA" FOREIGN KEY ("K_TIPOCARGA")
	  REFERENCES "TIPOCARGA" ("K_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PASO
--------------------------------------------------------

  ALTER TABLE "PASO" ADD CONSTRAINT "FK_PASO_RESERVA" FOREIGN KEY ("K_IDRESERVA")
	  REFERENCES "RESERVA" ("K_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVA
--------------------------------------------------------

  ALTER TABLE "RESERVA" ADD CONSTRAINT "FK_RESERVA_AGENTE" FOREIGN KEY ("K_IDAGENTE")
	  REFERENCES "AGENTE" ("K_ID") ENABLE;
  ALTER TABLE "RESERVA" ADD CONSTRAINT "FK_RESERVA_BUQUE" FOREIGN KEY ("K_NUM_SERIE")
	  REFERENCES "BUQUE" ("K_NUM_SERIE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUBASTA
--------------------------------------------------------

  ALTER TABLE "SUBASTA" ADD CONSTRAINT "FK_SUBASTA_RESERVA" FOREIGN KEY ("K_RESERVA")
	  REFERENCES "RESERVA" ("K_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRIPULACION
--------------------------------------------------------

  ALTER TABLE "TRIPULACION" ADD CONSTRAINT "FK_TRIPULACION_PASO" FOREIGN KEY ("K_IDPASO")
	  REFERENCES "PASO" ("K_ID") ENABLE;
  ALTER TABLE "TRIPULACION" ADD CONSTRAINT "FK_TRIPULACION_TRIPULANTE" FOREIGN KEY ("K_IDTRIPULANTE")
	  REFERENCES "TRIPULANTE" ("K_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRIPULANTE
--------------------------------------------------------

  ALTER TABLE "TRIPULANTE" ADD CONSTRAINT "FK_TRIPULANTE_PERSONA" FOREIGN KEY ("K_IDPERSONA")
	  REFERENCES "PERSONA" ("K_IDENTIFICACION") ENABLE;
