package com.universidadDistrital.controladores;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.ReservasAgenteDAO;
import com.universidadDistrital.negocio.ReservasAgente;

import com.universidadDistrital.util.ODBManager;

@RestController
public class ReservasAgenteController {
	
	@Autowired
	private ReservasAgenteDAO reservasAgenteDao;
	@Autowired
	private ODBManager odbManager;
		
	@RequestMapping(value="/reservas/{k_idAgente}",method=RequestMethod.GET)
	public ArrayList<ReservasAgente> obtenerReservas(@PathVariable("k_idAgente") String k_idAgente) {
		
		ArrayList<ReservasAgente> reservas = new ArrayList<ReservasAgente>();
		try {
			reservas = reservasAgenteDao.reservasAgente(k_idAgente);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			odbManager.liberarConexion();
		}		
		return reservas;
		
	}

}
