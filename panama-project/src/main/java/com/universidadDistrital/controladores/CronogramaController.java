package com.universidadDistrital.controladores;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.CronogramaDao;
import com.universidadDistrital.negocio.Cronograma;
import com.universidadDistrital.util.ODBManager;

@RestController
public class CronogramaController {
	
	@Autowired
	private CronogramaDao cronogramaDao;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/cronograma",method=RequestMethod.POST)
	public ResponseEntity<String> almacenarCronograma(@RequestBody Cronograma cronograma)  {
		try {
			cronogramaDao.almacenarCronograma(cronograma);
		} catch (SQLException e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			 odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Cronograma Regristrado",HttpStatus.OK);
    }

}
