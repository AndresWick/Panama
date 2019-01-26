package com.universidadDistrital.controladores;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.AgenteDAO;
import com.universidadDistrital.negocio.PasosAgente;
import com.universidadDistrital.util.ODBManager;

@RestController
public class AgenteController {
	@Autowired
	private AgenteDAO agenteDAO;
	@Autowired
	private ODBManager odbManager;
		
	@RequestMapping(value="/agente/{n_user}",method=RequestMethod.GET)
	public int obtenerId (@PathVariable("n_user") String n_user) {		
		int id=0;
		try {
			id = agenteDAO.consultarId(n_user);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			odbManager.liberarConexion();
		}		
		return id;
	}
}
