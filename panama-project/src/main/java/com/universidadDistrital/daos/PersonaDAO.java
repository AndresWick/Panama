package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Persona;
import com.universidadDistrital.util.ODBManager;

@Repository
public class PersonaDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void ingresarPersona(Persona persona) throws SQLException {	
		String strSQL = "INSERT INTO persona (k_identificacion, n_nombre, n_apellido, f_nacimiento) VALUES (?,?,?,?)";		
        Connection conexion = odbManager.tomarConexion();
        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
        prepStmt.setInt(1,persona.getK_identificacion()); 
        prepStmt.setString(2,persona.getN_nombre()); 
        prepStmt.setString(3,persona.getN_apellido());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(persona.getF_nacimiento()); 
        calendar.add(Calendar.DAY_OF_YEAR, 1);          
        prepStmt.setDate(4, new java.sql.Date (calendar.getTime().getTime()));        
        prepStmt.executeUpdate();
        prepStmt.close();
        odbManager.commit();
	}	
		
}
