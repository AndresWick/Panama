package com.universidadDistrital.daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.universidadDistrital.negocio.Empleado;
import com.universidadDistrital.util.RHException;
import com.universidadDistrital.util.ODBManager;

/**
 * @author Alba Consuelo Nieto.
 * Esta clase encapsula el acceso a la Base de Datos
 */
public class EmpleadoDAO {
    /*
     * Constructor de la clase
     */
    public EmpleadoDAO(){
  
    }
    /**
     * Incluye una nueva fila en la tabla EMPLOYEES.
     * @throws RHException
     */
    public void incluirEmpleado(Empleado empleado) throws RHException {
    	 /*try {
      
        String strSQL = "INSERT INTO employees (employee_id, first_name, last_name, job_id, email,salary, hire_date) VALUES(?,?,?,?,?,?,?)";
        Connection conexion = ODBManager.getInstance().tomarConexion();
        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
        prepStmt.setInt(1,empleado.getEmployee_id()); 
        prepStmt.setString(2, empleado.getFirst_name()); 
        prepStmt.setString(3, empleado.getLast_name()); 
        prepStmt.setString(4, empleado.getJob_id()); 
        prepStmt.setString(5, empleado.getEmail());   
        prepStmt.setDouble(6, empleado.getSalary());  
        prepStmt.setDate(7, java.sql.Date.valueOf(empleado.getHire_date()));
        prepStmt.executeUpdate();
        prepStmt.close();*/
       // ODBManager.getInstance().commit();
      /*} catch (SQLException e) {
    	  System.out.println(e);
           //throw new RHException( "EmpleadoDAO", "No pudo crear el empleado"+ e.getMessage());
      }  finally {
        // ODBManager.getInstance().liberarConexion();
      }*/
      
    }
    
    public void modificarEmpleado(){
       /** TODO Implementar el método**/
    }
    
    /*public Empleado buscarEmpleado(Integer employee_id){
      Empleado e = new Empleado(); //Instancia el objeto para retornar los datos del empleado
      try{
          String strSQL = "SELECT employee_id, first_name, last_name, job_id, email, hire_date FROM employees WHERE employee_id = ?";
          Connection conexion = ODBManager.getInstance().tomarConexion();
          PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
          prepStmt.setInt(1,employee_id);
      }
      catch(SQLException ex){
        
      }
      return e;
    }*/
    
    public void actualizarSalario(Empleado empleado) {
        /** TODO Implementar el método**/

    }

}


