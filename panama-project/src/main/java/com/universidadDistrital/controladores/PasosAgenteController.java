package com.universidadDistrital.controladores;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.PasosAgenteDAO;
import com.universidadDistrital.negocio.PasosAgente;

import com.universidadDistrital.util.ODBManager;

@RestController
public class PasosAgenteController {
	
	@Autowired
	private PasosAgenteDAO pasosAgenteDao;
	@Autowired
	private ODBManager odbManager;
		
	@RequestMapping(value="/pasos/{k_idAgente}",method=RequestMethod.GET)
	public ArrayList<PasosAgente> obtenerPasos(@PathVariable("k_idAgente") String k_idAgente) {
		
		ArrayList<PasosAgente> pasos = new ArrayList<PasosAgente>();
		try {
			pasos = pasosAgenteDao.pasosAgente(k_idAgente);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			odbManager.liberarConexion();
		}		
		return pasos;
	}

}
