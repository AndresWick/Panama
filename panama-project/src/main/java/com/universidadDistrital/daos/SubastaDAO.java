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

import com.universidadDistrital.negocio.CuposPorDia;
import com.universidadDistrital.negocio.Oferta;
import com.universidadDistrital.negocio.Subasta;
import com.universidadDistrital.util.ODBManager;

@Repository
public class SubastaDAO {
	
	@Autowired
	private ODBManager odbManager;
	
	public List<Subasta> buscarSubastas() throws SQLException{
		 ArrayList<Subasta> subastas = new ArrayList<Subasta>();
		 Connection conexion = odbManager.tomarConexion();
		 System.out.println("Consultar subastas");
		 System.out.println(conexion);
		 if(conexion != null) {
		 Statement st = conexion.createStatement();
	     ResultSet rec = st.executeQuery("select k_subasta,to_char(f_fecha,'dd/mm/yyyy'),v_tope_minimo,k_idPer,k_tipoBuque,to_char(k_fecha,'dd/mm/yyyy'),k_sentido  FROM canaldepanama.subasta");
	     System.out.println(rec);
	      while (rec.next()) {
	        Subasta subasta= new Subasta();
	        subasta.setK_subasta(rec.getString(1));
	        subasta.setV_tope_minima(rec.getFloat(3));
	        subasta.setK_idPer(rec.getInt(4));
	        subasta.setK_tipoBuque(rec.getInt(5));
	        subasta.setF_fecha(rec.getString(2));
	        subasta.setK_sentido(rec.getString(6));
	        subastas.add(subasta);
	        
	      }
	      st.close();
	      odbManager.liberarConexion();
		 }
		return subastas;
	}
	
	public void registrarOferta(Oferta oferta)  throws SQLException{
		String strSQL = "INSERT INTO Oferta (k_oferta, k_subasta, v_oferta,f_oferta,k_idAgente) VALUES(canaldepanama.OFERTA_SEQ.NEXTVAL,?,?,sysdate,lower(user))";
        Connection conexion = odbManager.tomarConexion();
        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
        prepStmt.setInt(1,oferta.getK_subasta()); 
        prepStmt.setFloat(2,oferta.getV_oferta());         
        prepStmt.executeUpdate();
        prepStmt.close();
        odbManager.commit();
	}

}
