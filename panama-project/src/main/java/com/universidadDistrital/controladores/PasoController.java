package com.universidadDistrital.controladores;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.PasoDAO;
import com.universidadDistrital.negocio.Paso;

@RestController
public class PasoController {
	
	@Autowired
	private PasoDAO pasoDao;
	
	@RequestMapping(value="/paso/{id}",method=RequestMethod.GET)
	public Paso consultarPaso(@PathVariable("id") int id) {
		Paso paso = null;
		try {
			paso = pasoDao.consultarPaso(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return paso;
	}

}
