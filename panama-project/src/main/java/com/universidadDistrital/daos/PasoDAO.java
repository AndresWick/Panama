package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.util.ODBManager;

import com.universidadDistrital.negocio.Paso;

@Repository
public class PasoDAO {

	@Autowired
	private ODBManager odbManager;
	
	public Paso consultarPaso(int idReserva) throws SQLException {
		Connection conexion = odbManager.tomarConexion();
		 if(conexion != null) {
			 Statement st = conexion.createStatement();
		     ResultSet rs = st.executeQuery("SELECT k_id,v_costo,k_idReserva , f_fecha, q_pasajeros FROM paso WHERE k_idReserva="+idReserva);
		     Paso paso = new Paso();
		     
		      while (rs.next()) {		    	
		    	System.out.println(rs.getInt(1) + "\t" + rs.getFloat(2)+ "\t" + rs.getInt(3)+ "\t" + rs.getDate(4)+ "\t" + rs.getInt(5)+ "\t");
		        paso.setId(rs.getInt(1));
		        paso.setCosto(rs.getFloat(2));
		        paso.setReserva(rs.getInt(3));
		        paso.setFecha( rs.getDate(4));
		        paso.setPasajeros(rs.getInt(5));		        
		      }
		      st.close();
		      odbManager.liberarConexion();
		      return paso;
			 }
		return null;
	}
	
}
