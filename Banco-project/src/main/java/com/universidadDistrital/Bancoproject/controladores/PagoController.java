package com.universidadDistrital.Bancoproject.controladores;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.universidadDistrital.Bancoproject.daos.TitularDAO;
import com.universidadDistrital.Bancoproject.daos.CuentaDAO;
import com.universidadDistrital.Bancoproject.daos.BancoDAO;
import com.universidadDistrital.Bancoproject.daos.MovimientoDAO;
import com.universidadDistrital.Bancoproject.negocio.Titular;
import com.universidadDistrital.Bancoproject.negocio.Cuenta;
import com.universidadDistrital.Bancoproject.negocio.Banco;
import com.universidadDistrital.Bancoproject.negocio.Movimiento;
import com.universidadDistrital.Bancoproject.util.ODBManager;

@RestController
public class PagoController {
	
	@Autowired
	private TitularDAO titularDAO;
	@Autowired
	private CuentaDAO cuentaDAO;
	@Autowired
	private BancoDAO bancoDAO;
	@Autowired
	private MovimientoDAO movimientoDAO;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/pago",method=RequestMethod.POST)
    public ResponseEntity<String> registrarPago(@PathVariable("idAgente") String idTitular, @PathVariable("descripcion") String descripcion, @PathVariable("valor") String valor, @PathVariable("fecha") String fecha, @PathVariable("cuenta") String cuenta, @PathVariable("banco") String banco, @PathVariable("clave") String clave)  {
		try {

			bancoDAO = new BancoDAO();
			cuentaDAO = new CuentaDAO();
			titularDAO = new TitularDAO();
			movimientoDAO = new MovimientoDAO();
			Movimiento movimiento = new Movimiento();
			
			if(bancoDAO.validarBancoPorNombreYCuenta(banco,cuenta)&&cuentaDAO.validarCuentaPorTitular(idTitular)&&cuentaDAO.validarCuentaPorClave(clave)) {
				if(cuentaDAO.retornarSaldo(cuenta)>=Float.parseFloat(valor)) {
					float nuevoSaldo = cuentaDAO.retornarSaldo(cuenta)-Float.parseFloat(valor);
					cuentaDAO.modificarSaldo(cuenta, Float.toString(nuevoSaldo));
					movimiento.setF_fecha(fecha);
					movimiento.setI_estado("Exitoso");
					//movimiento.setK_id(k_id);
					movimiento.setN_descripcion(descripcion);
					movimiento.setV_valor(valor);
					movimientoDAO.registrarMovimiento(movimiento);
				}else {
					movimiento.setF_fecha(fecha);
					movimiento.setI_estado("Rechazado");
					//movimiento.setK_id(k_id);
					movimiento.setN_descripcion(descripcion);
					movimiento.setV_valor(valor);
					movimientoDAO.registrarMovimiento(movimiento);
					return new ResponseEntity<>("Pago Rechazado, la cuenta NO posee saldo suficiente para la transacción.",HttpStatus.BAD_REQUEST);
				}
			}else {
				return new ResponseEntity<>("Pago Rechazado, por favor verifique los datos ingresados.",HttpStatus.BAD_REQUEST);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}finally {
			odbManager.liberarConexion();
		}
		return new ResponseEntity<>("Pago Exitoso",HttpStatus.OK);
    }

}
