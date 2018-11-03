package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Cronograma;
import com.universidadDistrital.util.ODBManager;

@Repository
public class CronogramaDao {
		@Autowired
		private ODBManager odbManager;
	
	public void almacenarCronograma(Cronograma cronograma) throws SQLException {
			String strSQL = "INSERT INTO cronograma (k_idPer, k_tipoBuque, f_fecha, q_cupos_max, q_cupos_disp, n_sentido) VALUES(?,?,?,?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	       
	        prepStmt.setString(1,cronograma.getK_idPer()); 
	        prepStmt.setString(2,cronograma.getK_tipoBuque()); 
	        prepStmt.setDate(3, java.sql.Date.valueOf(cronograma.getF_fecha()));
	        prepStmt.setString(4,cronograma.getQ_cupos_max()); 
	        prepStmt.setString(5,cronograma.getQ_cupos_max()); 
	        prepStmt.setString(6,cronograma.getN_sentido()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}
