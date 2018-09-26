package com.universidadDistrital;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.event.ContextClosedEvent;

import com.universidadDistrital.controladores.LoginController;
import com.universidadDistrital.util.ODBManager;

@SpringBootApplication
public class PanamaProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(PanamaProjectApplication.class, args);
	}


}
