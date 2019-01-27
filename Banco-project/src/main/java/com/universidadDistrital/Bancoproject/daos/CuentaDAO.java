package com.universidadDistrital.Bancoproject.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.universidadDistrital.Bancoproject.negocio.Cuenta;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@Repository
public class CuentaDAO {
	@Autowired
	private ODBManager odbManager;
	
	public void registrarCuenta(Cuenta cuenta) throws SQLException {
			String strSQL = "INSERT INTO cuenta (k_id, k_idTitular, v_saldo, k_idMovimiento) VALUES(?,?,?,?)";
	        Connection conexion = odbManager.tomarConexion();
	        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
	       
	        prepStmt.setString(1,cuenta.getK_id()); 
	        prepStmt.setString(2,cuenta.getK_idTitular()); 
	        prepStmt.setString(3, cuenta.getV_saldo());
	        prepStmt.setString(4,cuenta.getK_idMovimiento()); 
	        prepStmt.executeUpdate();
	        prepStmt.close();
	        odbManager.commit();
	}
	
	public ArrayList<Cuenta> listarCuentas() throws SQLException{
		 ArrayList<Cuenta> cuentas = new ArrayList<Cuenta>();
		 Connection conexion = odbManager.tomarConexion();
		 System.out.println("Listando bancos");
		 System.out.println(conexion);
		 if(conexion != null) {
		 Statement st = conexion.createStatement();
	     ResultSet rec = st.executeQuery("select k_id, k_idTitular, n_nombre, v_saldo, k_idMovimiento from cuenta");
	     System.out.println(rec);
	      while (rec.next()) {
	        Cuenta cuenta = new Cuenta();
	        cuenta.setK_id(rec.getString(1));
	        cuenta.setK_idTitular(rec.getString(2));
	        cuenta.setV_saldo(rec.getString(3));
	        cuenta.setK_idMovimiento(rec.getString(4));
	        cuentas.add(cuenta);
	      }
	      st.close();
	      odbManager.liberarConexion();
		 }
		return cuentas;
	}
	
	public boolean validarCuentaPorId(String idCuenta) throws SQLException {
		boolean bandera = false;
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("select * from cuenta"
		     		+ " WHERE k_id = '"+idCuenta+"'");
		      while (rec.next()) {
		    	  bandera = true;
		      }
		      st.close();
		}
		return bandera;
	}
	
	public boolean validarCuentaPorTitular(String iTitular) throws SQLException {
		boolean bandera = false;
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("select * from cuenta"
		     		+ " WHERE k_idTitular = '"+iTitular+"'");
		      while (rec.next()) {
		    	  bandera = true;
		      }
		      st.close();
		}
		return bandera;
	}
	
	public boolean validarCuentaPorClave(String claveCuenta) throws SQLException {
		boolean bandera = false;
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("select * from cuenta"
		     		+ " WHERE v_clave = '"+claveCuenta+"'");
		      while (rec.next()) {
		    	  bandera = true;
		      }
		      st.close();
		}
		return bandera;
	}
	
	public void modificarSaldo(String idCuenta, String nuevoSaldo) throws SQLException {
		Connection conexion = odbManager.tomarConexion();
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("update cuenta set v_saldo='"+nuevoSaldo+"'"
		     		+ " WHERE k_id = '"+idCuenta+"'");
		      st.close();
		}
	}
	
	public float retornarSaldo(String idCuenta) throws SQLException {
		Connection conexion = odbManager.tomarConexion();
		float saldo = 0;
		if(conexion == null) {
			throw new SQLException("No logeado");
		}else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("select v_saldo from cuenta"
		     		+ " WHERE k_id = '"+idCuenta+"'");
		     while (rec.next()) {
		    	 saldo= Float.parseFloat(rec.getString(1));
		      }
		      st.close();
		}
		return saldo;
	}
	
}
