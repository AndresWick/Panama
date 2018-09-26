package com.universidadDistrital.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.CalendarioDao;
import com.universidadDistrital.negocio.CuposPorDia;
import com.universidadDistrital.negocio.Usuario;
import com.universidadDistrital.util.ODBManager;

@RestController
public class CalendarioController {
	
	@Autowired
	private CalendarioDao calendarioDao;
	
	 @RequestMapping(value="/calendario",method=RequestMethod.GET)
	    public List<CuposPorDia> calendario() throws Exception {
		 List<CuposPorDia> cuposDia = null;
	    	try {
	    		 cuposDia=calendarioDao.consultarCalendario();
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return cuposDia;
	    }

}
