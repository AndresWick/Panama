package com.universidadDistrital.controladores;

import java.sql.Date;
import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.daos.EmpleadoDAO;
import com.universidadDistrital.negocio.Empleado;
import com.universidadDistrital.util.RHException;
import com.universidadDistrital.util.ODBManager;

@RestController
public class GreetingController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();
    EmpleadoDAO empDao = new EmpleadoDAO();
    

    @RequestMapping("/greeting")
    public Greeting greeting(@RequestParam(value="name", defaultValue="World") String name) {
    	try {
    		Empleado empleado = new Empleado();
    		empleado.setEmployee_id(2000);
    		empleado.setFirst_name("Anthony");
    		empleado.setHire_date(new Date(1, 2, 3).toString());
    		empleado.setEmail("tony_jason@hotmail.com");
    		empleado.setJob_id("AC_ACCOUNT");
    		empleado.setLast_name("vargas");
    		empleado.setSalary(1000.400);
			empDao.incluirEmpleado(empleado);
			ODBManager.getInstance().commit();
		} catch (RHException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return new Greeting(counter.incrementAndGet(),
                            String.format(template, name));
    }
}
