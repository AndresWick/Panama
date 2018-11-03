package com.universidadDistrital.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.CalendarioDao;
import com.universidadDistrital.negocio.CuposPorDia;

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
	    		System.out.println(e.getMessage());
	    	}
	    	return cuposDia;
	    }

}
