package com.universidadDistrital.controladores;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.TripulacionDAO;
import com.universidadDistrital.negocio.Tripulacion;
import com.universidadDistrital.util.ODBManager;

@RestController
public class TripulacionController {
	
	@Autowired
	private TripulacionDAO tripulacionDAO;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/tripulacion",method=RequestMethod.POST)
	public ResponseEntity<String> anadirATripulacion(@RequestBody Tripulacion tripulacion)  {
		try {
			tripulacionDAO.anadirATripulacion(tripulacion);
		} catch (SQLException e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			 odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Tripulante Agregado a Tripulacion",HttpStatus.OK);
    }


}
