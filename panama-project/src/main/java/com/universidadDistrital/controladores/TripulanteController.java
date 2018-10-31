package com.universidadDistrital.controladores;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.TripulanteDAO;
import com.universidadDistrital.negocio.Tripulante;

import com.universidadDistrital.util.ODBManager;

@RestController
public class TripulanteController {
	
	@Autowired
	private TripulanteDAO tripulanteDAO;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/tripulante",method=RequestMethod.POST)
	public ResponseEntity<String> almacenarCupo(@RequestBody Tripulante tripulante)  {
		try {
			tripulanteDAO.ingresarTripulante(tripulante);
		} catch (SQLException e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			 odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Tripulante Regristrado",HttpStatus.OK);
    }

}