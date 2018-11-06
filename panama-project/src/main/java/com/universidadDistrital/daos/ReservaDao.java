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
		if(conexion == null) {
			throw new SQLException("No logeado");
		}
		else {
		String strSQL = "INSERT INTO RESERVA (k_id, f_eta, n_puerto_salida, n_puerto_llegada,f_salida,f_llegada,"
				+ "k_num_serie,v_cargaTransportada,v_costo,i_estado,k_idAgente)"
				+ " VALUES (reserva_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";		
        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
        //prepStmt.setInt(1,1); 
        prepStmt.setDate(1,reserva.getF_eta()); 
        prepStmt.setString(2,reserva.getN_puerto_salida());
        prepStmt.setString(3,reserva.getN_puerto_llegada());
        prepStmt.setDate(4, reserva.getF_salida());
        prepStmt.setDate(5, reserva.getF_llegada());
        prepStmt.setInt(6,reserva.getNum_serie()); 
        prepStmt.setDouble(7, reserva.getV_cargaTransportada());
        prepStmt.setDouble(8, 200000);
        prepStmt.setString(9, "Dis");
        prepStmt.setInt(10, reserva.getK_idAgente());
        prepStmt.executeUpdate();
        prepStmt.close();
        odbManager.commit();
		}
	}
	
	public void buscarReservas(int idAgente) {
		
	}
	
	public void cancelarReserva(int idReserva) {
		
	}
}
