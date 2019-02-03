CREATE TABLESPACE canalPanDatos DATAFILE 'C:\temporal\canalPanDatos.DBF' SIZE 1024M EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;
CREATE TEMPORARY TABLESPACE canalPanTemp TEMPFILE 'C:\temporal\canalPanTemp.DBF' SIZE 300M;

CREATE USER CanalDePanama IDENTIFIED BY panamaUD DEFAULT TABLESPACE canalPanDatos TEMPORARY TABLESPACE canalPanTemp;
GRANT dba, connect, resource TO CanalDePanama;

--- PUBLIC SYNONYMS ---
CREATE PUBLIC SYNONYM BUQUE FOR canalDePanama.Buque;
CREATE PUBLIC SYNONYM Cronograma FOR canalDePanama.Cronograma;
CREATE PUBLIC SYNONYM Periodo FOR canalDePanama.Periodo;
CREATE PUBLIC SYNONYM TipoBuque FOR canalDePanama.TipoBuque;
CREATE PUBLIC SYNONYM Reserva FOR canalDePanama.Reserva;

-- ROL AGENTE --
CREATE ROLE Agente;
---Permisos del Role Agente ---
GRANT CONNECT TO Agente;
GRANT SELECT ON canalDePanama.Buque TO Agente;
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

--- Usuarios del sistema con rol Agente ---
CREATE USER ANTHONY IDENTIFIED BY anthony;
GRANT AGENTE TO ANTHONY;



