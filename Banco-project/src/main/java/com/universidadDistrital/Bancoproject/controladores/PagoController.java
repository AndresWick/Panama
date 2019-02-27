package com.universidadDistrital.Bancoproject.controladores;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.Bancoproject.daos.MovimientoDAO;
import com.universidadDistrital.Bancoproject.negocio.Cuenta;
import com.universidadDistrital.Bancoproject.negocio.Concepto;
import com.universidadDistrital.Bancoproject.negocio.Movimiento;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@RestController
public class PagoController {
	
	@Autowired
	private MovimientoDAO movimientoDAO;
	@Autowired
	private ODBManager odbManager;
	
	@SuppressWarnings("finally")
	@RequestMapping(value="/pago",method=RequestMethod.POST)
    public ResponseEntity<String> registrarPago(@PathVariable("pk_cuenta") String pk_cuenta, @PathVariable("pk_banco") String pk_banco, @PathVariable("pk_titular") String pk_titular, @PathVariable("pv_valor") String pv_valor, @PathVariable("pv_clave") String pv_clave, @PathVariable("pk_concepto") String pk_concepto)  {
		try {

			movimientoDAO = new MovimientoDAO();
			Cuenta cuenta = new Cuenta();
			Movimiento movimiento = new Movimiento();
			Concepto concepto = new Concepto();

			cuenta.setK_id(pk_cuenta);
			cuenta.setK_idBanco(pk_banco);
			cuenta.setK_idTitular(pk_titular);
			cuenta.setV_clave(pv_clave);
			concepto.setK_concepto(pk_concepto);
			movimiento.setV_valor(pv_valor);
					
			movimientoDAO.registrarMovimiento(cuenta,movimiento,concepto);
			return new ResponseEntity<>("Movimiento Registrado.",HttpStatus.OK);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			odbManager.liberarConexion();
			return new ResponseEntity<>("Movimiento Registrado",HttpStatus.OK);
		}
    }

}
