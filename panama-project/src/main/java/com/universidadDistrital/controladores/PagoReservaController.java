package com.universidadDistrital.controladores;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.PagoreservaDAO;

import com.universidadDistrital.negocio.PagoReserva;

import com.universidadDistrital.util.ODBManager;

@RestController
public class PagoReservaController {
	
	@Autowired
	private PagoreservaDAO pagoreservaDAO;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/pagoReserva",method=RequestMethod.POST)
	public ResponseEntity<String> registrarPago(@RequestBody PagoReserva pagoReserva)  {
		try {
			pagoreservaDAO.registrarPago(pagoReserva);
		} catch (SQLException e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			 odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Pago registrado",HttpStatus.OK);
    }


}
