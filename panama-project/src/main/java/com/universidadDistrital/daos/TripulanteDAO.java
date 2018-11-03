package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Tripulante;
import com.universidadDistrital.util.ODBManager;

@Repository
public class TripulanteDAO {
		@Autowired
		private ODBManager odbManager;
	
	public void ingresarTripulante(Tripulante tripulante) throws SQLException {
			String strSQL = "INSERT INTO tripulante (k_id, k_idPersona, n_cargo) VALUES(?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	        prepStmt.setInt(1,tripulante.getK_id()); 
	        prepStmt.setInt(2,tripulante.getK_idPersona()); 
	        prepStmt.setString(3, tripulante.getN_cargo());	        
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}