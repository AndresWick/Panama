package com.universidadDistrital.negocio;

import java.sql.Date;

public class InfoPasos {
	int k_num_serie;
	Date f_salida;
	String n_puerto_salida;
	Date f_llegada;
	String n_puerto_llegada;
	String n_esclusa;
	Date f_eta;
	
	public int getK_num_serie() {
		return k_num_serie;
	}
	public void setK_num_serie(int k_num_serie) {
		this.k_num_serie = k_num_serie;
	}
	public Date getF_salida() {
		return f_salida;
	}
	public void setF_salida(Date f_salida) {
		this.f_salida = f_salida;
	}
	public String getN_puerto_salida() {
		return n_puerto_salida;
	}
	public void setN_puerto_salida(String n_puerto_salida) {
		this.n_puerto_salida = n_puerto_salida;
	}
	public Date getF_llegada() {
		return f_llegada;
	}
	public void setF_llegada(Date f_llegada) {
		this.f_llegada = f_llegada;
	}
	public String getN_puerto_llegada() {
		return n_puerto_llegada;
	}
	public void setN_puerto_llegada(String n_puerto_llegada) {
		this.n_puerto_llegada = n_puerto_llegada;
	}
	public String getN_esclusa() {
		return n_esclusa;
	}
	public void setN_esclusa(String n_esclusa) {
		this.n_esclusa = n_esclusa;
	}
	public Date getF_eta() {
		return f_eta;
	}
	public void setF_eta(Date f_eta) {
		this.f_eta = f_eta;
	}	
}
