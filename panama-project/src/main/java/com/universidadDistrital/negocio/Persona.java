package com.universidadDistrital.negocio;

import java.sql.Date;

public class Persona {
	int k_identificacion;
	String n_nombre;
	String n_apellido;
	Date f_nacimiento;
	public int getK_identificacion() {
		return k_identificacion;
	}
	public void setK_identificacion(int k_identificacion) {
		this.k_identificacion = k_identificacion;
	}
	public String getN_nombre() {
		return n_nombre;
	}
	public void setN_nombre(String n_nombre) {
		this.n_nombre = n_nombre;
	}
	public String getN_apellido() {
		return n_apellido;
	}
	public void setN_apellido(String n_apellido) {
		this.n_apellido = n_apellido;
	}
	public Date getF_nacimiento() {
		return f_nacimiento;
	}
	
	
	public void setF_nacimiento(Date f_nacimiento) {
		this.f_nacimiento = f_nacimiento;
	}
	
	
}
