package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Cupo;
import com.universidadDistrital.util.ODBManager;

@Repository
public class CupoDao {
		@Autowired
		private ODBManager odbManager;
	
	public void almacenarCupo(Cupo cupo) throws SQLException {
			String strSQL = "INSERT INTO cupo (K_cupo, I_cupo_buque , F_cupo, I_tipo_periodo, I_sentido,I_estado) VALUES(?,?,?,?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        System.out.println(conexion);
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	        prepStmt.setString(1,cupo.getKcupo()); 
	        prepStmt.setString(2,cupo.getIcupobuque()); 
	        prepStmt.setDate(3, java.sql.Date.valueOf(cupo.getFcupo()));
	        prepStmt.setString(4,cupo.getItipoperiodo()); 
	        prepStmt.setString(5,cupo.getIsentido()); 
	        prepStmt.setString(6,cupo.getIestado()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}
