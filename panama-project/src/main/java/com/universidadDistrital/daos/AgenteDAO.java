package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Agente;
import com.universidadDistrital.util.ODBManager;

@Repository
public class AgenteDAO {
	@Autowired
	private ODBManager odbManager;
	
	public int consultarId(String user) throws SQLException {
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");			
		}else {		
			 Statement st = conexion.createStatement();	
			 
		     ResultSet rs = st.executeQuery("SELECT * FROM agente WHERE n_user='"+user+"'");
		     Agente agente = new Agente();
		     while (rs.next()) {		    	 
		    	  agente.setK_id(rs.getInt(1));		    	  	    	  		    	 
		     }
		     st.close();
		     return agente.getK_id();
		    	  
		    	 
		}
		
	}
}
