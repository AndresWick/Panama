package com.universidadDistrital.Bancoproject.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.Bancoproject.negocio.Titular;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@Repository
public class TitularDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarTitular(Titular titular) throws SQLException {
			String strSQL = "INSERT INTO titular (k_id, n_nombre, n_apellido) VALUES(?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	       
	        prepStmt.setString(1,titular.getK_id()); 
	        prepStmt.setString(2,titular.getN_nombre()); 
	        prepStmt.setString(3,titular.getN_apellido());
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}
