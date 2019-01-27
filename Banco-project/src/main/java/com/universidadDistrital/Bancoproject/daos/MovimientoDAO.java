package com.universidadDistrital.Bancoproject.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.Bancoproject.negocio.Movimiento;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@Repository
public class MovimientoDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarMovimiento(Movimiento movimiento) throws SQLException {
			String strSQL = "INSERT INTO movimiento (k_id, n_descripcion, v_valor, f_fecha, i_estado) VALUES(?,?,?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	       
	        prepStmt.setString(1,movimiento.getK_id()); 
	        prepStmt.setString(2,movimiento.getN_descripcion()); 
	        prepStmt.setString(3,movimiento.getV_valor()); 
	        prepStmt.setDate(4, java.sql.Date.valueOf(movimiento.getF_fecha()));
	        prepStmt.setString(5,movimiento.getI_estado()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}
