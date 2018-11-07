package com.universidadDistrital.controladores;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.ReservaDao;
import com.universidadDistrital.negocio.CuposPorDia;
import com.universidadDistrital.negocio.Reserva;
import com.universidadDistrital.util.ODBManager;

@RestController
public class ReservasController {
	
	@Autowired
	private ReservaDao reservaDao;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/reserva",method=RequestMethod.POST)
    public ResponseEntity<String> registrarReserva(@RequestBody Reserva reserva)  {
		try {
			reservaDao.registrarReserva(reserva);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Reserva Registrada",HttpStatus.OK);
		
    }
	
	@RequestMapping(value="/reserva/{idAgente}",method=RequestMethod.GET)
    public List<Reserva>  buscarReservas(@PathVariable("idAgente") int idAgente) {
		List<Reserva> reservas = null;
		try {
			reservas= reservaDao.buscarReservas(idAgente);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();	
		}finally {
			odbManager.liberarConexion();
		}
		return reservas;
    }
	
	@RequestMapping(value="/reserva/{idReserva}",method=RequestMethod.DELETE)
    public void cancelarReserva(@PathVariable("idReserva") int idReserva) {
	 
    }

}
