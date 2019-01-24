package com.universidadDistrital.controladores;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.InfoPasosDAO;
import com.universidadDistrital.negocio.InfoPasos;
import com.universidadDistrital.util.ODBManager;

@RestController
public class InfoPasosController {
	
	@Autowired
	private InfoPasosDAO infoPasosDAO;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/consultaPaso/{f_eta}",method=RequestMethod.GET)
	public ArrayList<InfoPasos> consultarPasoPorDia(@PathVariable("f_eta") Date f_eta) {
		
		ArrayList<InfoPasos> pasos = new ArrayList<InfoPasos>();
		try {
			pasos = infoPasosDAO.obtenerPasosDelDia(f_eta);			
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
