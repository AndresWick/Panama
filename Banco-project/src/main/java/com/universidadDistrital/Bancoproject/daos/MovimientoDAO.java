package com.universidadDistrital.Bancoproject.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.Bancoproject.negocio.Concepto;
import com.universidadDistrital.Bancoproject.negocio.Cuenta;
import com.universidadDistrital.Bancoproject.negocio.Movimiento;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@Repository
public class MovimientoDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarMovimiento(Cuenta cuenta, Movimiento movimiento, Concepto concepto) throws SQLException {
			String strSQL = "EXECUTE PK_BANCOS.PR_REGISTRAR_MOVIMIENTO(?,?,?,?,?,?);";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	        
	        prepStmt.setString(1,cuenta.getK_id()); 
	        prepStmt.setString(2,cuenta.getK_idBanco()); 
	        prepStmt.setString(3,cuenta.getK_idTitular()); 
	        prepStmt.setString(4, movimiento.getV_valor());
	        prepStmt.setString(5,cuenta.getV_clave()); 
	        prepStmt.setString(6,concepto.getK_concepto()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}
