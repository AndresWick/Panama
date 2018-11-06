package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Reserva;
import com.universidadDistrital.util.ODBManager;

@Repository
public class ReservaDao {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarReserva(Reserva reserva) throws SQLException{
		Connection conexion = odbManager.tomarConexion();
		String strSQL = "INSERT INTO RESERVA (k_id, f_eta, n_puerto_salida, n_puerto_llegada,f_salida,f_llegada,"
				+ "k_num_serie,v_cargaTransportada,v_costo,i_estado,k_idAgente)"
				+ " VALUES (?,?,?,?,?,?,?,?,?,?,?)";		
        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
        prepStmt.setInt(1,1); 
        prepStmt.setDate(2,reserva.getF_eta()); 
        prepStmt.setString(3,reserva.getN_puerto_salida());
        prepStmt.setString(4,reserva.getN_puerto_llegada());
        prepStmt.setDate(5, reserva.getF_salida());
        prepStmt.setDate(6, reserva.getF_llegada());
        prepStmt.setInt(7,reserva.getNum_serie()); 
        prepStmt.setDouble(8, reserva.getV_cargaTransportada());
        prepStmt.setDouble(9, 200000);
        prepStmt.setString(10, "Dis");
        prepStmt.setInt(11, reserva.getK_idAgente());
        prepStmt.executeUpdate();
        prepStmt.close();
        odbManager.commit();
	}
	
	public void buscarReservas(int idAgente) {
		
	}
	
	public void cancelarReserva(int idReserva) {
		
	}
}
