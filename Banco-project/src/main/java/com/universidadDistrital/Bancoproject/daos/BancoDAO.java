package com.universidadDistrital.Bancoproject.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.Bancoproject.negocio.Banco;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@Repository
public class BancoDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarBanco(Banco banco) throws SQLException {
			String strSQL = "INSERT INTO banco (k_id, k_idCuenta, n_nombre) VALUES(?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	       
	        prepStmt.setString(1,banco.getK_id()); 
	        prepStmt.setString(2,banco.getK_idCuenta()); 
	        prepStmt.setString(3,banco.getN_nombre()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
	public ArrayList<Banco> listarBancos() throws SQLException{
		 ArrayList<Banco> bancos = new ArrayList<Banco>();
		 Connection conexion = odbManager.tomarConexion();
		 System.out.println("Listando bancos");
		 System.out.println(conexion);
		 if(conexion != null) {
		 Statement st = conexion.createStatement();
	     ResultSet rec = st.executeQuery("select k_id, k_idCuenta, n_nombre from banco");
	     System.out.println(rec);
	      while (rec.next()) {
	        Banco banco = new Banco();
	        banco.setK_id(rec.getString(1));
	        banco.setK_idCuenta(rec.getString(2));
	        banco.setN_nombre(rec.getString(3));
	        bancos.add(banco);
	      }
	      st.close();
	      odbManager.liberarConexion();
		 }
		return bancos;
	}
	
	public boolean validarBancoPorNombre(String nombreBanco) throws SQLException {
		boolean bandera = false;
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("select * from banco"
		     		+ " WHERE n_nombre = '"+nombreBanco+"'");
		      while (rec.next()) {
		    	  bandera = true;
		      }
		      st.close();
		}
		return bandera;
	}
	
	public boolean validarBancoPorNombreYCuenta(String nombreBanco, String idCuenta) throws SQLException {
		boolean bandera = false;
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("select * from banco"
		     		+ " WHERE n_nombre = '"+nombreBanco+"' and k_idCuenta= '"+idCuenta+"'");
		      while (rec.next()) {
		    	  bandera = true;
		      }
		      st.close();
		}
		return bandera;
	}
	
}
