package com.universidadDistrital.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.negocio.CuposPorDia;
import com.universidadDistrital.negocio.Visita;
import com.universidadDistrital.util.ODBManager;

@Repository
public class VisitaDao {

	@Autowired
	private ODBManager odbManager;
	
	public Visita visitaPorId(int idVisita) throws SQLException {
		Connection conexion = odbManager.tomarConexion();
		 if(conexion != null) {
			 Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("select K_BUQUE,K_AGENTE,TO_CHAR(F_ETA) F_ETA ,N_PUERTO_SALIDA,N_PUERTO_LLEGADA,Q_CARGA_TRANSPORTADA,I_TIPO_BUQUE from visita,buque where K_BUQUE=K_NUM_SERIE AND K_visita="+idVisita);
		     Visita visita = new Visita();
		      while (rec.next()) {
		        System.out.println(rec.getInt(1) + "\t" + rec.getString(2)+ "\t" + rec.getString(3)+ "\t" + rec.getString(4)+ "\t" + rec.getString(5)+ "\t" + rec.getFloat(6)+ "\t" + rec.getString(7));
		        visita.setSerialBuque(rec.getInt(1));
		        visita.setAgente(rec.getString(2));
		        visita.setETA(rec.getString(3));
		        visita.setPuertoSalida( rec.getString(4));
		        visita.setPuertoLLegada(rec.getString(5));
		        visita.setCarga(rec.getFloat(6));
		        visita.setTipoBuque(rec.getString(7));
		      }
		      st.close();
		      odbManager.liberarConexion();
		      return visita;
			 }
		return null;
	}
	
}
