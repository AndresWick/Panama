package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Tripulacion;
import com.universidadDistrital.util.ODBManager;

@Repository
public class TripulacionDAO {
		@Autowired
		private ODBManager odbManager;
	
	public void anadirATripulacion(Tripulacion tripulacion) throws SQLException {
			String strSQL = "INSERT INTO Tripulacion (k_idPaso,k_idTripulante) VALUES(?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	        prepStmt.setInt(1,tripulacion.getK_paso()); 
	        prepStmt.setInt(2,tripulacion.getK_tripulante()); 	       
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}