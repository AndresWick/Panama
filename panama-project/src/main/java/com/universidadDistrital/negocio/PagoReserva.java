package com.universidadDistrital.negocio;

import java.sql.Date;

public class PagoReserva {
	int k_id;
	int k_idReserva;
	int v_valor;
	Date f_fecha;
	int k_idTipoPago;
	public int getK_id() {
		return k_id;
	}
	public void setK_id(int k_id) {
		this.k_id = k_id;
	}
	public int getK_idReserva() {
		return k_idReserva;
	}
	public void setK_idReserva(int k_idReserva) {
		this.k_idReserva = k_idReserva;
	}
	public int getV_valor() {
		return v_valor;
	}
	public void setV_valor(int v_valor) {
		this.v_valor = v_valor;
	}
	public Date getF_fecha() {
		return f_fecha;
	}
	public void setF_fecha(Date f_fecha) {
		this.f_fecha = f_fecha;
	}
	public int getK_idTipoPago() {
		return k_idTipoPago;
	}
	public void setK_idTipoPago(int k_idTipoPago) {
		this.k_idTipoPago = k_idTipoPago;
	}
	
	
}
