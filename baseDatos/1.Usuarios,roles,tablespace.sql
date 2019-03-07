-- DENTRO DE SYSTEM --

CREATE TABLESPACE canalPanDatos DATAFILE 'C:\temporal\canalPanDatos.DBF' SIZE 1024M EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;
CREATE TEMPORARY TABLESPACE canalPanTemp TEMPFILE 'C:\temporal\canalPanTemp.DBF' SIZE 300M;

CREATE TABLESPACE PepAgDatos DATAFILE 'C:\temporal\PepAgDatos.DBF' SIZE 500M EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;
CREATE TEMPORARY TABLESPACE PepAgDatosTemp TEMPFILE 'C:\temporal\PepAgDatosTemp.DBF' SIZE 200M;

CREATE TABLESPACE CamAgDatos DATAFILE 'C:\temporal\CamAgDatos.DBF' SIZE 500M EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;
CREATE TEMPORARY TABLESPACE CamAgDatosTemp TEMPFILE 'C:\temporal\CamAgDatosTemp.DBF' SIZE 200M;

CREATE USER CanalDePanama IDENTIFIED BY panamaUD DEFAULT TABLESPACE canalPanDatos TEMPORARY TABLESPACE canalPanTemp;

GRANT dba, connect, resource TO CanalDePanama;

--- PUBLIC SYNONYMS ---
CREATE PUBLIC SYNONYM BUQUE FOR canalDePanama.Buque;
CREATE PUBLIC SYNONYM Cronograma FOR canalDePanama.Cronograma;
CREATE PUBLIC SYNONYM Periodo FOR canalDePanama.Periodo;
CREATE PUBLIC SYNONYM TipoBuque FOR canalDePanama.TipoBuque;
CREATE PUBLIC SYNONYM Reserva FOR canalDePanama.Reserva;
CREATE PUBLIC SYNONYM PR_REGISTRAR_RESERVA FOR canalDePanama.PR_REGISTRAR_RESERVA;
CREATE PUBLIC SYNONYM subasta FOR canalDePanama.subasta;


-- ROL AGENTE --
CREATE ROLE Agente;

--- Usuarios del sistema con rol Agente ---
CREATE USER ANTHONY IDENTIFIED BY anthony;
CREATE USER PepeAgente IDENTIFIED BY pepe111 DEFAULT TABLESPACE PepAgDatos TEMPORARY TABLESPACE PepAgDatosTemp;
CREATE USER CamiloAgente IDENTIFIED BY camilo111 DEFAULT TABLESPACE CamAgDatos TEMPORARY TABLESPACE CamAgDatosTemp;

GRANT dba TO CanalDePanama;
GRANT connect TO CanalDePanama;
GRANT resource TO CanalDePanama;

/* DENTRO DE CANAL DE PANAMA */
CREATE ROLE Agente;
CREATE ROLE GerentePersonal; -- Se encarga de lo pertinente a los agentes del canal de panama --
CREATE ROLE Organizador;	 -- Se encarga de la gestion del canal de panama --
CREATE ROLE Auditor;		 -- Se encargar de verificar las cuentas de dinero del canal de panama --
CREATE ROLE GerenteTecnico;

GRANT connect TO Agente;
GRANT create session TO Agente;
GRANT create session TO GerentePersonal;
GRANT create session TO Organizador;
GRANT create session TO Auditor;
GRANT create session TO GerenteTecnico;

GRANT create view TO Auditor;
GRANT create view TO GerentePersonal;
GRANT CREATE view TO Organizador;
GRANT create view TO GerenteTecnico;

GRANT drop view TO Auditor;
GRANT drop view TO GerentePersonal;
GRANT drop view TO GerenteTecnico;

GRANT CREATE ROLE TO GerenteTecnico;
GRANT CREATE ROLE TO GerentePersonal;

GRANT CREATE USER TO GerenteTecnico;
GRANT CREATE USER TO GerentePersonal;

GRANT ALTER USER TO GerenteTecnico;

GRANT DROP ANY ROLE TO GerenteTecnico;

GRANT DROP USER TO GerenteTecnico;

GRANT ANY PRIVILEGE TO GerenteTecnico;

GRANT ANY ROLE TO GerenteTecnico; 

GRANT SELECT ON Agente TO Agente;
---Permisos del Role Agente ---
GRANT SELECT ON canalDePanama.Buque TO Agente;
GRANT SELECT ON canalDePanama.subasta TO Agente;
GRANT SELECT ON canalDePanama.Cronograma TO Agente;
GRANT SELECT ON canalDePanama.Periodo TO Agente;
GRANT SELECT ON canalDePanama.TipoBuque TO Agente;
GRANT SELECT ON canalDePanama.cronograma TO Agente;
GRANT SELECT ON canalDePanama.Reserva TO Agente;
GRANT INSERT ON canalDePanama.Reserva TO Agente;
GRANT EXECUTE ON canalDePanama.fu_calcular_periodo TO Agente;
GRANT EXECUTE ON canalDePanama.fu_cupos_disponibles TO Agente;
GRANT EXECUTE ON canalDePanama.fu_precio_paso TO Agente;
GRANT EXECUTE ON canalDePanama.pr_registrar_paso TO Agente;
GRANT EXECUTE ON canalDePanama.pr_registrar_reserva TO Agente;
GRANT SELECT ON canalDePanama.Agente TO Agente;
GRANT SELECT ON paso TO  Agente;
GRANT SELECT ON pasosAgente TO Agente;
GRANT SELECT ON abonosPaso TO  Agente;
GRANT SELECT ON reservasagente TO Agente;
GRANT SELECT ON abonosReserva TO  Agente;
GRANT SELECT ON buque TO Agente;
GRANT SELECT ON tipocarga TO Agente;
GRANT SELECT ON tipobuque TO Agente;
GRANT SELECT ON reserva TO Agente;
GRANT SELECT ON resumenPagoReserva TO Agente;
GRANT SELECT ON pagoReserva TO Agente;
GRANT SELECT ON tipopago TO Agente;
GRANT SELECT ON pagoPaso TO Agente;
GRANT SELECT ON resumenPagoPaso TO Agente;
GRANT SELECT ON tripulacion TO Agente;
GRANT SELECT ON tripulante TO Agente;
GRANT SELECT ON persona TO Agente;
GRANT SELECT ON compania TO Agente;
GRANT SELECT ON parametrosPaso TO Agente;
GRANT SELECT ON parametrosReserva TO Agente;
GRANT SELECT ON parametrosCancelacion TO Agente;
GRANT SELECT ON oferta TO Agente;
GRANT SELECT ON subasta TO Agente;
GRANT SELECT ON cronograma TO Agente;
GRANT SELECT ON periodo TO Agente;
GRANT INSERT ON buque TO Agente;
GRANT INSERT ON reserva TO Agente;
GRANT INSERT ON tripulacion TO Agente;
GRANT INSERT ON tripulante TO Agente;
GRANT INSERT ON oferta TO Agente;
GRANT SELECT ON canaldepanama.reserva_seq TO agente;
GRANT SELECT ON canaldepanama.oferta_seq TO agente;


GRANT SELECT ON Agente TO GerentePersonal;
GRANT SELECT ON compania TO GerentePersonal;
GRANT SELECT ON cronograma TO Organizador;
GRANT SELECT ON periodo TO Organizador;
GRANT SELECT ON tipobuque TO Organizador;
GRANT SELECT ON tipobuque TO Organizador;
GRANT SELECT ON tipocarga TO Organizador;
GRANT SELECT ON parametrosCancelacion TO Organizador;
GRANT SELECT ON parametrosReserva TO Organizador;
GRANT SELECT ON parametrosPaso TO Organizador;
GRANT SELECT ON tipopago TO Organizador;
GRANT SELECT ON subasta TO Auditor;
GRANT SELECT ON resumenPagoPaso TO Auditor;
GRANT SELECT ON resumenPagoReserva TO Auditor;
GRANT SELECT ON pagoReserva TO Auditor;
GRANT SELECT ON pagoPaso TO Auditor;
GRANT SELECT ON tipopago TO Auditor;
GRANT SELECT ON buque TO GerenteTecnico;
GRANT SELECT ON cronograma TO GerenteTecnico;
GRANT SELECT ON oferta TO GerenteTecnico;
GRANT SELECT ON subasta TO GerenteTecnico;
GRANT SELECT ON pagoPaso TO GerenteTecnico;
GRANT SELECT ON pagoReserva TO GerenteTecnico;
GRANT SELECT ON parametrosCancelacion TO GerenteTecnico;
GRANT SELECT ON parametrosPaso TO GerenteTecnico;
GRANT SELECT ON parametrosReserva TO GerenteTecnico;
GRANT SELECT ON paso TO GerenteTecnico;
GRANT SELECT ON periodo TO GerenteTecnico;
GRANT SELECT ON persona TO GerenteTecnico;
GRANT SELECT ON reserva TO GerenteTecnico;
GRANT SELECT ON subasta TO GerenteTecnico;
GRANT SELECT ON tipobuque TO GerenteTecnico;
GRANT SELECT ON tipocarga TO GerenteTecnico;
GRANT SELECT ON tipopago TO GerenteTecnico;
GRANT SELECT ON tripulacion TO GerenteTecnico;
GRANT SELECT ON tripulante TO GerenteTecnico;

GRANT INSERT ON Agente TO GerentePersonal;
GRANT INSERT ON compania TO GerentePersonal;
GRANT INSERT ON cronograma TO Organizador;
GRANT INSERT ON periodo TO Organizador;
GRANT INSERT ON tipobuque TO Organizador;
GRANT INSERT ON tipocarga TO Organizador;
GRANT INSERT ON parametrosCancelacion TO Organizador;
GRANT INSERT ON parametrosReserva TO Organizador;
GRANT INSERT ON parametrosPaso TO Organizador;
GRANT INSERT ON tipopago TO Organizador;
GRANT INSERT ON buque TO GerenteTecnico;
GRANT INSERT ON cronograma TO GerenteTecnico;
GRANT INSERT ON oferta TO GerenteTecnico;
GRANT INSERT ON subasta TO GerenteTecnico;
GRANT INSERT ON pagoPaso TO GerenteTecnico;
GRANT INSERT ON pagoReserva TO GerenteTecnico;
GRANT INSERT ON parametrosCancelacion TO GerenteTecnico;
GRANT INSERT ON parametrosPaso TO GerenteTecnico;
GRANT INSERT ON parametrosReserva TO GerenteTecnico;
GRANT INSERT ON paso TO GerenteTecnico;
GRANT INSERT ON periodo TO GerenteTecnico;
GRANT INSERT ON persona TO GerenteTecnico;
GRANT INSERT ON reserva TO GerenteTecnico;
GRANT INSERT ON subasta TO GerenteTecnico;
GRANT INSERT ON tipobuque TO GerenteTecnico;
GRANT INSERT ON tipocarga TO GerenteTecnico;
GRANT INSERT ON tipopago TO GerenteTecnico;
GRANT INSERT ON tripulacion TO GerenteTecnico;
GRANT INSERT ON tripulante TO GerenteTecnico;


GRANT UPDATE ON buque TO Agente;
GRANT UPDATE ON tripulacion TO Agente;
GRANT UPDATE ON tripulante TO Agente;
GRANT UPDATE ON Agente TO GerentePersonal;
GRANT UPDATE ON compania TO GerentePersonal;
GRANT UPDATE ON cronograma TO Organizador;
GRANT UPDATE ON periodo TO Organizador;
GRANT UPDATE ON tipobuque TO Organizador;
GRANT UPDATE ON tipocarga TO Organizador;
GRANT UPDATE ON parametrosCancelacion TO Organizador;
GRANT UPDATE ON parametrosReserva TO Organizador;
GRANT UPDATE ON parametrosPaso TO Organizador;
GRANT UPDATE ON tipopago TO Organizador;
GRANT UPDATE ON buque TO GerenteTecnico;
GRANT UPDATE ON cronograma TO GerenteTecnico;
GRANT UPDATE ON oferta TO GerenteTecnico;
GRANT UPDATE ON subasta TO GerenteTecnico;
GRANT UPDATE ON pagoPaso TO GerenteTecnico;
GRANT UPDATE ON pagoReserva TO GerenteTecnico;
GRANT UPDATE ON parametrosCancelacion TO GerenteTecnico;
GRANT UPDATE ON parametrosPaso TO GerenteTecnico;
GRANT UPDATE ON parametrosReserva TO GerenteTecnico;
GRANT UPDATE ON paso TO GerenteTecnico;
GRANT UPDATE ON periodo TO GerenteTecnico;
GRANT UPDATE ON persona TO GerenteTecnico;
GRANT UPDATE ON reserva TO GerenteTecnico;
GRANT UPDATE ON subasta TO GerenteTecnico;
GRANT UPDATE ON tipobuque TO GerenteTecnico;
GRANT UPDATE ON tipocarga TO GerenteTecnico;
GRANT UPDATE ON tipopago TO GerenteTecnico;
GRANT UPDATE ON tripulacion TO GerenteTecnico;
GRANT UPDATE ON tripulante TO GerenteTecnico;


GRANT DELETE ON Agente TO GerentePersonal;
GRANT DELETE ON compania TO GerentePersonal;
GRANT DELETE ON cronograma TO Organizador;
GRANT DELETE ON periodo TO Organizador;
GRANT DELETE ON tipobuque TO Organizador;
GRANT DELETE ON tipocarga TO Organizador;
GRANT DELETE ON parametrosCancelacion TO Organizador;
GRANT DELETE ON parametrosReserva TO Organizador;
GRANT DELETE ON parametrosPaso TO Organizador;
GRANT DELETE ON tipopago TO Organizador;
GRANT DELETE ON buque TO GerenteTecnico;
GRANT DELETE ON cronograma TO GerenteTecnico;
GRANT DELETE ON oferta TO GerenteTecnico;
GRANT DELETE ON parametrosCancelacion TO GerenteTecnico;
GRANT DELETE ON parametrosPaso TO GerenteTecnico;
GRANT DELETE ON parametrosReserva TO GerenteTecnico;
GRANT DELETE ON paso TO GerenteTecnico;
GRANT DELETE ON periodo TO GerenteTecnico;
GRANT DELETE ON persona TO GerenteTecnico;
GRANT DELETE ON reserva TO GerenteTecnico;
GRANT DELETE ON subasta TO GerenteTecnico;
GRANT DELETE ON tipobuque TO GerenteTecnico;
GRANT DELETE ON tipocarga TO GerenteTecnico;
GRANT DELETE ON tipopago TO GerenteTecnico;
GRANT DELETE ON tripulacion TO GerenteTecnico;
GRANT DELETE ON tripulante TO GerenteTecnico;

GRANT EXECUTE ON pk_gestionPaso TO Agente;
GRANT EXECUTE ON pk_gestionPaso TO Organizador;
GRANT EXECUTE ON pk_gestionPaso TO GerenteTecnico;


GRANT Agente TO PepeAgente;
GRANT Agente TO CamiloAgente;
GRANT AGENTE TO ANTHONY;
