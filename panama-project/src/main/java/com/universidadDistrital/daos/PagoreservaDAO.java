package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.universidadDistrital.negocio.PagoReserva;
import com.universidadDistrital.util.ODBManager;

@Repository
public class PagoreservaDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarPago(PagoReserva pago) throws SQLException {
		String strSQL = "INSERT INTO pagoReserva (k_id,k_idreserva,v_valor,f_fecha,k_idtipopago) VALUES(pagoReserva_seq.NEXTVAL,?,?,sysdate,?)";
        Connection conexion = odbManager.tomarConexion();
        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
        
        prepStmt.setInt(1,pago.getK_idReserva());
        prepStmt.setInt(2,pago.getV_valor());        
        prepStmt.setInt(3,pago.getK_idTipoPago());
        prepStmt.executeUpdate();
        prepStmt.close();
        odbManager.commit();
	}
	
}
