package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.PagoPaso;

import com.universidadDistrital.util.ODBManager;

@Repository
public class PagopasoDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarPago(PagoPaso pago) throws SQLException {
			String strSQL = "INSERT INTO pagopaso (k_id,k_paso,v_valor,f_fecha,k_idtipopago) VALUES(pagoPaso_seq.NEXTVAL,?,?,sysdate,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	        
	        prepStmt.setInt(1,pago.getk_paso());
	        prepStmt.setInt(2,pago.getV_valor());	        
	        prepStmt.setInt(3,pago.getK_idTipoPago());
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
}
