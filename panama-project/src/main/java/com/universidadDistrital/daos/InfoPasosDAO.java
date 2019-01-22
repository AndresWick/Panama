package com.universidadDistrital.daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.InfoPasos;
import com.universidadDistrital.util.ODBManager;

@Repository
public class InfoPasosDAO {
	@Autowired
	private ODBManager odbManager;
	
	public ArrayList<InfoPasos> obtenerPasosDelDia(Date eta) throws SQLException {
		ArrayList<InfoPasos> pasos = new ArrayList<InfoPasos>();
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {			
			Statement st = conexion.createStatement();
			String fecha = eta.toString();
		    ResultSet rec = st.executeQuery("SELECT * FROM table(fu_programacion_diaria(TO_DATE('"+fecha+"','yyyy-mm-dd')))");
		    while (rec.next()) {
		    	  InfoPasos paso = new InfoPasos();
		    	  paso.setK_num_serie(rec.getInt(1));		    	 
		    	  paso.setF_salida(rec.getDate(2));
		    	  paso.setN_puerto_salida(rec.getString(3));
		    	  paso.setF_llegada(rec.getDate(4));
		    	  paso.setN_puerto_llegada(rec.getString(5));
		    	  paso.setN_esclusa(rec.getString(6));
		    	  paso.setF_eta(rec.getDate(7));
		    	  pasos.add(paso);
		      }
		      st.close();
		}  	   
		return pasos;
	}
	
	
}
