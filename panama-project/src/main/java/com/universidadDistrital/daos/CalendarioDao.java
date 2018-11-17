package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.CuposPorDia;
import com.universidadDistrital.util.ODBManager;

@Repository
public class CalendarioDao {
	@Autowired
	private ODBManager odbManager;
	
	public List<CuposPorDia> consultarCalendario() throws SQLException{
		 ArrayList<CuposPorDia> cuposDia = new ArrayList<CuposPorDia>();
		 Connection conexion = odbManager.tomarConexion();
		 System.out.println("Consultando calendario");
		 System.out.println(conexion);
		 if(conexion != null) {
		 Statement st = conexion.createStatement();
	     ResultSet rec = st.executeQuery("select to_char(CRONOGRAMA.K_FECHA,'yyyy/mm/dd') \"start\",TIPOBUQUE.N_TIPO||' -> Cupos:'||CRONOGRAMA.Q_CUPOS_DISP||', Sentido:'||CRONOGRAMA.K_SENTIDO||', Periodo:'||CRONOGRAMA.K_IDPER title from CRONOGRAMA, TIPOBUQUE WHERE CRONOGRAMA.K_TIPOBUQUE=TIPOBUQUE.K_ID AND CRONOGRAMA.Q_CUPOS_DISP>0");
	     System.out.println(rec);
	      while (rec.next()) {
	        System.out.println(rec.getString(1) + "\t" + rec.getString(2));
	        CuposPorDia cupo= new CuposPorDia();
	        cupo.setStart(rec.getString(1));
	        cupo.setTitle(rec.getString(2));
	        cuposDia.add(cupo);
	      }
	      st.close();
	      odbManager.liberarConexion();
		 }
		return cuposDia;
	}

}
