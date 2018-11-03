package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Cupo;
import com.universidadDistrital.negocio.CuposPorDia;
import com.universidadDistrital.util.ODBManager;

@Repository
public class UsuarioDAO {
	@Autowired
	private ODBManager odbManager;
	
	public String obtenerUsuario() throws SQLException{		 
		 Connection conexion = odbManager.tomarConexion();		 
		 if(conexion != null) {
			 Statement st = conexion.createStatement();
			 ResultSet rec = st.executeQuery("SELECT user FROM DUAL");
			 rec.next();
			 String user = rec.getString(1);
			 st.close();
		     odbManager.liberarConexion();
		     return user;
	      }
		 else {
			 return null;
		 }
		
	}
	
}
