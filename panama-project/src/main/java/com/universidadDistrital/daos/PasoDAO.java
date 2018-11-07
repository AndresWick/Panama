package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.util.ODBManager;

import com.universidadDistrital.negocio.Paso;


@Repository
public class PasoDAO {

	@Autowired
	private ODBManager odbManager;
	
	public Paso consultarPaso(int idPaso) throws SQLException {
		Connection conexion = odbManager.tomarConexion();
		 if(conexion != null) {
			 Statement st = conexion.createStatement();
		     ResultSet rs = st.executeQuery("SELECT k_id,v_costo,k_idReserva , f_fecha, q_pasajeros, n_esclusa FROM paso WHERE k_id="+idPaso);
		     Paso paso = new Paso();
		     
		      while (rs.next()) {		    	
		    	
		        paso.setK_id(rs.getInt(1));
		        paso.setV_costo(rs.getFloat(2));
		        paso.setK_reserva(rs.getInt(3));
		        paso.setF_fecha( rs.getDate(4));
		        paso.setQ_pasajeros(rs.getInt(5));
		        paso.setN_esclusa(rs.getString(6));
		      }
		      st.close();
		      odbManager.liberarConexion();
		      return paso;
			 }
		return null;
	}
	
	public void registrarPaso(Paso paso) throws SQLException {
		String strSQL = "INSERT INTO Paso (k_id,v_costo,k_idReserva,f_fecha,q_pasajeros,n_esclusa) VALUES(?,?,?,?,?,?)";
        Connection conexion = odbManager.tomarConexion();
        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
        System.out.println(paso.getK_id()+ "\t" + paso.getV_costo()+ "\t" + paso.getK_reserva()+ "\t" + paso.getF_fecha()+ "\t" + paso.getQ_pasajeros()+ "\t");
        prepStmt.setInt(1,paso.getK_id());
        
        prepStmt.setFloat(2, paso.getV_costo());
        
        prepStmt.setInt(3,paso.getK_reserva());
        
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(paso.getF_fecha()); 
        calendar.add(Calendar.DAY_OF_YEAR, 1);          
        prepStmt.setDate(4, new java.sql.Date (calendar.getTime().getTime()));
        
        prepStmt.setInt(5,paso.getQ_pasajeros()); 
        
        prepStmt.setString(6, paso.getN_esclusa());
        
        prepStmt.executeUpdate();
        prepStmt.close();
        odbManager.commit();
	}
	
}
