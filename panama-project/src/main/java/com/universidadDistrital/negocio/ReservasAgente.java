package com.universidadDistrital.negocio;

import java.sql.Date;

public class ReservasAgente {
	int k_id;
	Date f_eta;
	int k_num_serie;
	float v_costo;
	float v_abono;
	float v_deuda;
	String k_idAgente;
	
	public int getK_id() {
		return k_id;
	}
	public void setK_id(int k_id) {
		this.k_id = k_id;
	}
	public Date getF_eta() {
		return f_eta;
	}
	public void setF_eta(Date f_eta) {
		this.f_eta = f_eta;
	}
	public int getK_num_serie() {
		return k_num_serie;
	}
	public void setK_num_serie(int k_num_serie) {
		this.k_num_serie = k_num_serie;
	}
	public float getV_costo() {
		return v_costo;
	}
	public void setV_costo(float v_costo) {
		this.v_costo = v_costo;
	}
	public float getV_abono() {
		return v_abono;
	}
	public void setV_abono(float v_abono) {
		this.v_abono = v_abono;
	}
	public float getV_deuda() {
		return v_deuda;
	}
	public void setV_deuda(float v_deuda) {
		this.v_deuda = v_deuda;
	}
	public String getK_idAgente() {
		return k_idAgente;
	}
	public void setK_idAgente(String k_idAgente) {
		this.k_idAgente = k_idAgente;
	}
	
}
