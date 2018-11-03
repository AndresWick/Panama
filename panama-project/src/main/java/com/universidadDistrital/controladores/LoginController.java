package com.universidadDistrital.controladores;

import java.sql.Date;
import java.sql.SQLException;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.PasoDAO;
import com.universidadDistrital.daos.UsuarioDAO;
import com.universidadDistrital.negocio.Paso;
import com.universidadDistrital.negocio.Usuario;
	   

import com.universidadDistrital.util.ODBManager;

@RestController
public class LoginController {
	@Autowired
	private ODBManager odbManager;
	@Autowired
	private UsuarioDAO usuarioDAO;
 
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public ResponseEntity<String> login(@RequestBody Usuario usuario) throws Exception {
    	try {
    	odbManager.conectar(usuario);
    	}catch(Exception e) {
    		return new ResponseEntity<>(e.getMessage(),HttpStatus.UNAUTHORIZED);

    	}
    	return new ResponseEntity<>("Conectado a la base de datos",HttpStatus.OK);
    }
    
    @RequestMapping(value="/loadUser",method=RequestMethod.POST)
    public ResponseEntity<String> loadUser() throws Exception {
    	String usuario = null;
		try {
			usuario = usuarioDAO.obtenerUsuario();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    	return new ResponseEntity<>(usuario,HttpStatus.OK);
    }
    
    @RequestMapping(value="/logout",method=RequestMethod.GET)
    public ResponseEntity<String> logout() throws Exception {
    	try {
    	odbManager.cerrarConexion();
    	}catch(Exception e) {
    		return new ResponseEntity<>(e.getMessage(),HttpStatus.CONFLICT);
    	}
    	return new ResponseEntity<>("Conexion cerrada",HttpStatus.OK);
    }
}
