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
		 Statement st = conexion.createStatement();
	     ResultSet rec = st.executeQuery("select F_CUPO \"start\",I_CUPO_BUQUE||'-'||cantidad titulo from calendar");
	     System.out.println(rec);
	      while (rec.next()) {
	        System.out.println(rec.getString(1) + "\t" + rec.getString(2));
	        CuposPorDia cupo= new CuposPorDia();
	        cupo.setStart(rec.getString(1));
	        cupo.setTitulo(rec.getString(2));
	        cuposDia.add(cupo);
	      }
	      st.close();
		return cuposDia;
	}

}
