package com.universidadDistrital.controladores;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.PasoDAO;
import com.universidadDistrital.negocio.Paso;

import com.universidadDistrital.util.ODBManager;

@RestController
public class PasoController {
	
	@Autowired
	private PasoDAO pasoDao;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/paso/{k_id}",method=RequestMethod.GET)
	public Paso consultarPaso(@PathVariable("k_id") int k_id) {
		Paso paso = null;
		try {
			paso = pasoDao.consultarPaso(k_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			odbManager.liberarConexion();
		}
		return paso;
	}
	
	@RequestMapping(value="/registroPaso",method=RequestMethod.POST)
	public ResponseEntity<String> registrarPaso(@RequestBody Paso paso)  {
		try {			
			pasoDao.registrarPaso(paso);
		} catch (SQLException e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			 odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Registro de paso exitoso",HttpStatus.OK);
    }

}
