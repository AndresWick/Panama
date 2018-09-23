package com.universidadDistrital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.universidadDistrital.controladores.LoginController;
import com.universidadDistrital.util.ODBManager;

@SpringBootApplication
public class PanamaProjectApplication {

	public static void main(String[] args) {
		//ODBManager.getInstance();
		SpringApplication.run(PanamaProjectApplication.class, args);
	}
}
