package com.universidadDistrital.Bancoproject.controladores;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.node.ObjectNode;
import com.universidadDistrital.Bancoproject.daos.MovimientoDAO;
import com.universidadDistrital.Bancoproject.negocio.Cuenta;
import com.universidadDistrital.Bancoproject.negocio.Concepto;
import com.universidadDistrital.Bancoproject.negocio.Movimiento;
import com.universidadDistrital.Bancoproject.negocio.Usuario;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@RestController
@CrossOrigin(origins = "*", methods= {RequestMethod.GET,RequestMethod.POST})
public class PagoController {	
	
	@Autowired
	private MovimientoDAO movimientoDAO;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/pago",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> registrarPago(@RequestBody ObjectNode json)  {
		try {
			Usuario cliente = new Usuario();
			cliente.setUser(json.get("user").asText());
			cliente.setPassword(json.get("password").asText());
			odbManager.conectar(cliente);
			
			movimientoDAO = new MovimientoDAO();
			Cuenta cuenta = new Cuenta();
			Movimiento movimiento = new Movimiento();
			Concepto concepto = new Concepto();

			cuenta.setK_id(json.get("pk_cuenta").asText());
			cuenta.setK_idBanco(json.get("pk_banco").asText());
			cuenta.setK_idTitular(json.get("user").asText());
			cuenta.setV_clave(json.get("password").asText());
			concepto.setK_concepto(json.get("pk_concepto").asText());
			movimiento.setV_valor(json.get("pv_valor").asText());
					
			movimientoDAO.registrarMovimiento(cuenta,movimiento,concepto);
			return new ResponseEntity<>("Pago Registrado",HttpStatus.OK);
			
	    }catch(Exception e) {
	    	return new ResponseEntity<>(e.getMessage(),HttpStatus.UNAUTHORIZED);
	    }
		
	}	
		

}
