package com.universidadDistrital.controladores;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.PersonaDAO;
import com.universidadDistrital.negocio.Persona;

import com.universidadDistrital.util.ODBManager;

@RestController
public class PersonaController {
	
	@Autowired
	private PersonaDAO personaDAO;	
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/persona",method=RequestMethod.POST)
	public ResponseEntity<String> ingresarPersona(@RequestBody Persona persona)  {
		try {			
			personaDAO.ingresarPersona(persona);
		} catch (SQLException e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			 odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Persona Registrada",HttpStatus.OK);
    }
}
