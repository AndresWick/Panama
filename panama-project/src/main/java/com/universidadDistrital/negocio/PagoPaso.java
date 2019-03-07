package com.universidadDistrital.negocio;

import java.sql.Date;

public class PagoPaso {
	int k_id;
	int k_paso;
	int v_valor;
	Date f_fecha;
	int k_idTipoPago;
	public int getK_id() {
		return k_id;
	}
	public void setK_id(int k_id) {
		this.k_id = k_id;
	}
	public int getk_paso() {
		return k_paso;
	}
	public void setk_paso(int k_paso) {
		this.k_paso = k_paso;
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
