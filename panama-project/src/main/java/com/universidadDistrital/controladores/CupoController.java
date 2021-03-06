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

import com.universidadDistrital.daos.CupoDao;
import com.universidadDistrital.negocio.Cupo;
import com.universidadDistrital.negocio.Usuario;
import com.universidadDistrital.util.ODBManager;

@RestController
public class CupoController {
	
	@Autowired
	private CupoDao cupoDao;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/cupo",method=RequestMethod.POST)
	public ResponseEntity<String> almacenarCupo(@RequestBody Cupo cupo)  {
		try {
			cupoDao.almacenarCupo(cupo);
		} catch (SQLException e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			 //odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Cupo Regristrado",HttpStatus.OK);
    }
	
	@RequestMapping(value="/{fecha}/{tipoBuque}",method=RequestMethod.GET)
	public ResponseEntity<String> consultarCupoDiaBuque(@PathVariable("fecha") String fecha,@PathVariable("tipoBuque") String tipoBuque)  {
		String respuesta = null;
		try {
			respuesta=cupoDao.CuposDiaBuque(fecha,tipoBuque);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<>(respuesta,HttpStatus.OK);
    }

}
