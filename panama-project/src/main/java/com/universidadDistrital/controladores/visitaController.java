package com.universidadDistrital.controladores;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.VisitaDao;
import com.universidadDistrital.negocio.Visita;

@RestController
public class visitaController {
	
	@Autowired
	private VisitaDao visitaDao;
	
	@RequestMapping(value="/visita/{id}",method=RequestMethod.GET)
	public Visita consultarVisita(@PathVariable("id") int id) {
		Visita visita = null;
		try {
			visita = visitaDao.visitaPorId(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return visita;
	}

}
