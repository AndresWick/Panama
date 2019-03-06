package com.universidadDistrital.Bancoproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.universidadDistrital.Bancoproject.negocio.Usuario;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@SpringBootApplication
public class BancoProjectApplication {

	public static void main(String[] args) throws Exception {
		SpringApplication.run(BancoProjectApplication.class, args);
		ODBManager odbManager = new ODBManager();
		Usuario usuario = new Usuario();
		usuario.setPassword("banco");
		usuario.setUser("Banco");
		odbManager.conectar(usuario);
	}

}
