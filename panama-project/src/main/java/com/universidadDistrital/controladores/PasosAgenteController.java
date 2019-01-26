package com.universidadDistrital.controladores;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.PasosAgenteDAO;
import com.universidadDistrital.negocio.PasosAgente;
import com.universidadDistrital.negocio.Paso;

import com.universidadDistrital.util.ODBManager;

@RestController
public class PasosAgenteController {
	
	@Autowired
	private PasosAgenteDAO pasosAgenteDao;
	@Autowired
	private ODBManager odbManager;
		
	@RequestMapping(value="/pasos/{k_idAgente}",method=RequestMethod.GET)
	public ArrayList<PasosAgente> obtenerPasos(@PathVariable("k_idAgente") int k_idAgente) {
		
		ArrayList<PasosAgente> pasos = new ArrayList<PasosAgente>();
		try {
			pasos = pasosAgenteDao.PasosAgente(k_idAgente);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			odbManager.liberarConexion();
		}
		System.out.println(pasos);
		return pasos;
	}

}
