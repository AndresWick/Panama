package com.universidadDistrital.controladores;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.PagopasoDAO;
import com.universidadDistrital.negocio.PagoPaso;
import com.universidadDistrital.util.ODBManager;

@RestController
public class PagoPasoController {
	
	@Autowired
	private PagopasoDAO pagopasoDAO;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/pagoPaso",method=RequestMethod.POST)
	public ResponseEntity<String> registrarPago(@RequestBody PagoPaso pagoPaso)  {
		try {
			pagopasoDAO.registrarPago(pagoPaso);
		} catch (SQLException e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			 odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Pago registrado",HttpStatus.OK);
    }


}
