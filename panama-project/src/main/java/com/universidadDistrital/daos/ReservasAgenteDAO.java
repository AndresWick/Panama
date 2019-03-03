package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.ReservasAgente;
import com.universidadDistrital.util.ODBManager;

@Repository
public class ReservasAgenteDAO {
	@Autowired
	private ODBManager odbManager;
	
	public ArrayList<ReservasAgente> reservasAgente(String agente) throws SQLException {
		ArrayList<ReservasAgente> reservas = new ArrayList<ReservasAgente>();
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {			
			Statement st = conexion.createStatement();			
		    ResultSet rec = st.executeQuery("SELECT * FROM reservasAgente WHERE k_idAgente = '"+agente+"'");
		    
		    while (rec.next()) {		    	
		    	ReservasAgente reserva = new ReservasAgente();
		    	reserva.setK_id(rec.getInt(1));		    	
		    	reserva.setF_eta(rec.getDate(2));		    	
		    	reserva.setK_num_serie(rec.getInt(3));		    	
		    	reserva.setV_costo(rec.getFloat(4));		    	
		    	reserva.setV_abono(rec.getFloat(5));		    	
		    	reserva.setV_deuda(rec.getFloat(6));		    	
		    	reserva.setK_idAgente(rec.getString(7));		    	
		    	reservas.add(reserva);
		      }
		      st.close();
		}  	   
		return reservas;
	}
	
	
}