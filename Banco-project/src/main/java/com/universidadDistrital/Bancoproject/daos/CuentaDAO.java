package com.universidadDistrital.Bancoproject.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.Bancoproject.negocio.Cuenta;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@Repository
public class CuentaDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarCuenta(Cuenta cuenta) throws SQLException {
			String strSQL = "INSERT INTO cuenta (k_id, k_idTitular, v_saldo, k_idMovimiento) VALUES(?,?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	       
	        prepStmt.setString(1,cuenta.getK_id()); 
	        prepStmt.setString(2,cuenta.getK_idTitular()); 
	        prepStmt.setString(3, cuenta.getV_saldo());
	        prepStmt.setString(4,cuenta.getK_idMovimiento()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}
