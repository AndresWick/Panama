package com.universidadDistrital.Bancoproject.daos;

import java.sql.CallableStatement;
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
			Connection conexion = odbManager.tomarConexion();
			if(conexion == null) {
				throw new SQLException("No logeado");
			}
			else {
				String strSQL = "begin BANCO.PK_BANCOS.PR_REGISTRAR_MOVIMIENTO(?,?,?,?,?,?); end;";
				CallableStatement callstmt = conexion.prepareCall(strSQL);
		        		             
		        callstmt.setInt(1,Integer.parseInt(cuenta.getK_id()));
		        
		        callstmt.setInt(2,Integer.parseInt(cuenta.getK_idBanco()));
		        
		        callstmt.setString(3,cuenta.getK_idTitular());
		       
		        callstmt.setString(4,movimiento.getV_valor());
		        
		        callstmt.setInt(5,Integer.parseInt(cuenta.getV_clave())); 
		      
		        callstmt.setInt(6,Integer.parseInt(concepto.getK_concepto())); 
		        
		        callstmt.execute();	        
		        odbManager.commit();
		        	
			}
	}
	
}
