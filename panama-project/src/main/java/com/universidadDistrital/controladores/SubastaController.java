package com.universidadDistrital.controladores;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.ReservaDao;
import com.universidadDistrital.daos.SubastaDAO;
import com.universidadDistrital.negocio.Oferta;
import com.universidadDistrital.negocio.Reserva;
import com.universidadDistrital.negocio.Subasta;
import com.universidadDistrital.util.ODBManager;

@RestController
public class SubastaController {

	@Autowired
	private SubastaDAO subastaDao;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/subasta",method=RequestMethod.GET)
    public List<Subasta>  buscarSubastas() {
		List<Subasta> subastas = null;
		try {
			subastas= subastaDao.buscarSubastas();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();	
		}finally {
			odbManager.liberarConexion();
		}
		return subastas;
    }
	
	@RequestMapping(value="/subasta",method=RequestMethod.POST)
    public ResponseEntity<String> registrarReserva(@RequestBody Oferta oferta)  {
		try {
			subastaDao.registrarOferta(oferta);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Oferta Registrada",HttpStatus.OK);
		
    }
	
}
