package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.PasosAgente;
import com.universidadDistrital.util.ODBManager;

@Repository
public class PasosAgenteDAO {
	@Autowired
	private ODBManager odbManager;
	
	public ArrayList<PasosAgente> PasosAgente(int agente) throws SQLException {
		ArrayList<PasosAgente> pasos = new ArrayList<PasosAgente>();
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {			
			Statement st = conexion.createStatement();			
		    ResultSet rec = st.executeQuery("SELECT * FROM pasosAgente WHERE k_idAgente = '"+agente+"'");
		    while (rec.next()) {
		    	  PasosAgente paso = new PasosAgente();
		    	  paso.setF_fecha(rec.getDate(1));		    	 
		    	  paso.setK_num_serie(rec.getInt(2));
		    	  paso.setN_sentido(rec.getString(3));
		    	  paso.setV_costo(rec.getFloat(4));
		    	  paso.setK_id(rec.getInt(6));
		    	  pasos.add(paso);
		      }
		      st.close();
		}  	   
		return pasos;
	}
	
	
}

