package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.Cupo;
import com.universidadDistrital.negocio.Visita;
import com.universidadDistrital.util.ODBManager;

@Repository
public class CupoDao {
		@Autowired
		private ODBManager odbManager;
	
	public void almacenarCupo(Cupo cupo) throws SQLException {
			String strSQL = "INSERT INTO cupo (K_cupo, I_cupo_buque , F_cupo, I_tipo_periodo, I_sentido,I_estado) VALUES(?,?,?,?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	        prepStmt.setString(1,cupo.getKcupo()); 
	        prepStmt.setString(2,cupo.getIcupobuque()); 
	        prepStmt.setDate(3, java.sql.Date.valueOf(cupo.getFcupo()));
	        prepStmt.setString(4,cupo.getItipoperiodo()); 
	        prepStmt.setString(5,cupo.getIsentido()); 
	        prepStmt.setString(6,cupo.getIestado()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
	public String CuposDiaBuque(String fecha,String tipoBuque) throws SQLException {
		Connection conexion = odbManager.tomarConexion();
		String respuesta="No hay Cupos";
		System.out.println(fecha+','+tipoBuque);
		System.out.println("cambio");
		 if(conexion != null) {
			 Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("SELECT to_char(C.f_cupo), C.i_cupo_buque, COUNT(C.i_cupo_buque) \"Espacios Disponibles\" FROM cupo C, buque B WHERE  TO_CHAR(C.f_cupo,'yyyy-mm-dd') = '"+fecha+"' AND C.i_estado = 'AV' AND C.i_cupo_buque = B.i_tipo_buque AND B.i_tipo_buque= '"+tipoBuque+"' GROUP BY C.f_cupo, C.i_cupo_buque");
		      while (rec.next()) {
		    	  System.out.println(rec.getString(1)+"\t "+rec.getString(2)+"\t "+rec.getInt(3));
		    	  respuesta= "Fecha: "+rec.getString(1)+"\t TipoBuque: "+rec.getString(2)+"\t Cupos Disponibles: "+rec.getInt(3);
		      }
		      st.close();
		      odbManager.liberarConexion();
		      return respuesta;
			 }
		return null;
	}
	
}
