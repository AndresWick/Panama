package com.universidadDistrital.negocio;

import java.sql.Date;

public class Reserva {
	private int k_id;
	private Date f_eta;
	private String n_puerto_salida;
	private String n_puerto_llegada;
	private Date f_salida;
	private Date f_llegada;
	private int num_serie;
	private double v_cargaTransportada;
	private double v_costo;
	private String i_estado;
	private double v_cancelacion;
	private int k_idAgente;
	private Date f_cancelacion;
	
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
	public String getN_puerto_salida() {
		return n_puerto_salida;
	}
	public void setN_puerto_salida(String n_puerto_salida) {
		this.n_puerto_salida = n_puerto_salida;
	}
	public String getN_puerto_llegada() {
		return n_puerto_llegada;
	}
	public void setN_puerto_llegada(String n_puerto_llegada) {
		this.n_puerto_llegada = n_puerto_llegada;
	}
	public Date getF_salida() {
		return f_salida;
	}
	public void setF_salida(Date f_salida) {
		this.f_salida = f_salida;
	}
	public Date getF_llegada() {
		return f_llegada;
	}
	public void setF_llegada(Date f_llegada) {
		this.f_llegada = f_llegada;
	}
	public int getNum_serie() {
		return num_serie;
	}
	public void setNum_serie(int num_serie) {
		this.num_serie = num_serie;
	}
	public double getV_cargaTransportada() {
		return v_cargaTransportada;
	}
	public void setV_cargaTransportada(double v_cargaTransportada) {
		this.v_cargaTransportada = v_cargaTransportada;
	}
	public double getV_costo() {
		return v_costo;
	}
	public void setV_costo(double v_costo) {
		this.v_costo = v_costo;
	}
	public String getI_estado() {
		return i_estado;
	}
	public void setI_estado(String i_estado) {
		this.i_estado = i_estado;
	}
	public double getV_cancelacion() {
		return v_cancelacion;
	}
	public void setV_cancelacion(double v_cancelacion) {
		this.v_cancelacion = v_cancelacion;
	}
	public int getK_idAgente() {
		return k_idAgente;
	}
	public void setK_idAgente(int k_idAgente) {
		this.k_idAgente = k_idAgente;
	}
	public Date getF_cancelacion() {
		return f_cancelacion;
	}
	public void setF_cancelacion(Date f_cancelacion) {
		this.f_cancelacion = f_cancelacion;
	}
}
