package com.universidadDistrital.daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
		String strSQL = "begin PR_REGISTRAR_RESERVA(?,?,?,?,?,?,?,?,?); end;";		
        CallableStatement callstmt = conexion.prepareCall(strSQL);
        callstmt.setDate(1,java.sql.Date.valueOf(reserva.getF_eta())); 
        callstmt.setString(2,reserva.getN_puerto_salida());
        callstmt.setString(3,reserva.getN_puerto_llegada());
        callstmt.setDate(4, java.sql.Date.valueOf(reserva.getF_salida()));
        callstmt.setDate(5, java.sql.Date.valueOf(reserva.getF_llegada()));
        callstmt.setInt(6,reserva.getNum_serie()); 
        callstmt.setDouble(7, reserva.getV_cargaTransportada());
        callstmt.setInt(8, reserva.getK_idAgente());
        callstmt.setString(9, reserva.getN_sentido());
        callstmt.execute();
        odbManager.commit();
		}
	}
	
	public List<Reserva> buscarReservas(int idAgente) throws SQLException {
		ArrayList<Reserva> reservas = new ArrayList<Reserva>();
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("SELECT k_ID,F_ETA,n_puerto_salida,n_puerto_llegada,k_num_serie,"
		     		+ "v_cargatransportada,v_costo,i_estado,v_cancelacion,f_cancelacion,f_salida,f_llegada"
		     		+ " FROM RESERVA WHERE k_idagente = '"+idAgente+"'");
		      while (rec.next()) {
		    	  Reserva reserva = new Reserva();
		    	  reserva.setK_id(rec.getInt(1));
		    	 // reserva.setF_eta(rec.getS(2));
		    	  reserva.setN_puerto_salida(rec.getString(3));
		    	  reserva.setN_puerto_llegada(rec.getString(4));
		    	  reserva.setNum_serie(rec.getInt(5));
		    	  reserva.setV_cargaTransportada(rec.getDouble(6));
		    	  reserva.setV_costo(rec.getDouble(7));
		    	  reserva.setI_estado(rec.getString(8));
		    	  reserva.setV_cancelacion(rec.getDouble(9));
		    	  reserva.setF_cancelacion(rec.getDate(10));
		    	 // reserva.setF_salida(rec.getDate(11));
		    	  //reserva.setF_llegada(rec.getDate(12));
		    	  reservas.add(reserva);
		      }
		      st.close();
		}
		return reservas;
	}
	
	public void cancelarReserva(int idReserva) {
		
	}
	
	public Reserva consultarReserva(int idReserva) throws SQLException {
		Connection conexion = odbManager.tomarConexion();
		 if(conexion != null) {
			 Statement st = conexion.createStatement();
		     ResultSet rs = st.executeQuery("SELECT k_id,f_eta,n_puerto_salida , n_puerto_llegada, f_salida, f_llegada, "
		     									+ " k_num_serie, v_cargaTransportada, v_costo, i_estado, v_cancelacion, "
		     									+ " k_idAgente, f_cancelacion, n_sentido "
		     									+ " FROM reserva WHERE k_id="+idReserva);
		     Reserva reserva = new Reserva();
		     
		      while (rs.next()) {
		    	  reserva.setK_id(rs.getInt(1));
		    	  reserva.setF_eta((rs.getDate(2)).toString());
		    	  reserva.setN_puerto_salida(rs.getString(3));
		    	  reserva.setN_puerto_llegada(rs.getString(4));
		    	  reserva.setF_salida(rs.getDate(5).toString());
		    	  reserva.setF_llegada(rs.getDate(6).toString());
		    	  reserva.setNum_serie(rs.getInt(7));
		    	  reserva.setV_cargaTransportada(rs.getFloat(8));
		    	  reserva.setV_costo(rs.getFloat(9));
		    	  reserva.setI_estado(rs.getString(10));
		    	  reserva.setV_cancelacion(rs.getFloat(11));
		    	  reserva.setK_idAgente(rs.getInt(12));
		    	  reserva.setF_cancelacion(rs.getDate(13));
		    	  reserva.setN_sentido(rs.getString(14));
		      }
		      st.close();
		      odbManager.liberarConexion();
		      return reserva;
			 }
		return null;
	}
}
