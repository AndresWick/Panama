package com.universidadDistrital.Bancoproject.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.Bancoproject.negocio.Banco;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@Repository
public class BancoDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarBanco(Banco banco) throws SQLException {
			String strSQL = "INSERT INTO banco (k_id, k_idCuenta, n_nombre) VALUES(?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	       
	        prepStmt.setString(1,banco.getK_id()); 
	        prepStmt.setString(2,banco.getK_idCuenta()); 
	        prepStmt.setString(3,banco.getN_nombre()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}
