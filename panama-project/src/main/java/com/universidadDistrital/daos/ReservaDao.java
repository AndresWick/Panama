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

import com.universidadDistrital.negocio.CuposPorDia;
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
		String strSQL = "begin PR_REGISTRAR_RESERVA(?,?,?,?,?,?,?,?); end;";		
        CallableStatement callstmt = conexion.prepareCall(strSQL);
        callstmt.setDate(1,reserva.getF_eta()); 
        callstmt.setString(2,reserva.getN_puerto_salida());
        callstmt.setString(3,reserva.getN_puerto_llegada());
        callstmt.setDate(4, reserva.getF_salida());
        callstmt.setDate(5, reserva.getF_llegada());
        callstmt.setInt(6,reserva.getNum_serie()); 
        callstmt.setDouble(7, reserva.getV_cargaTransportada());
        callstmt.setInt(8, reserva.getK_idAgente());
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
		    	  reserva.setF_eta(rec.getDate(2));
		    	  reserva.setN_puerto_salida(rec.getString(3));
		    	  reserva.setN_puerto_llegada(rec.getString(4));
		    	  reserva.setNum_serie(rec.getInt(5));
		    	  reserva.setV_cargaTransportada(rec.getDouble(6));
		    	  reserva.setV_costo(rec.getDouble(7));
		    	  reserva.setI_estado(rec.getString(8));
		    	  reserva.setV_cancelacion(rec.getDouble(9));
		    	  reserva.setF_cancelacion(rec.getDate(10));
		    	  reserva.setF_salida(rec.getDate(11));
		    	  reserva.setF_llegada(rec.getDate(12));
		    	  reservas.add(reserva);
		      }
		      st.close();
		}
		return reservas;
	}
	
	public void cancelarReserva(int idReserva) {
		
	}
}
