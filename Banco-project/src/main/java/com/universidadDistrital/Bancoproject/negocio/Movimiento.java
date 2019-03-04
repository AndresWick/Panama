package com.universidadDistrital.Bancoproject.negocio;

public class Movimiento {

	private String k_id;
	private String k_idCuenta;
    private String v_valor;
	private String f_fecha;
	private String i_estado;
	
	public String getK_id() {
		return k_id;
	}
	public void setK_id(String k_id) {
		this.k_id = k_id;
	}
	public String getK_idCuenta() {
		return k_idCuenta;
	}
	public void setK_idCuenta(String k_idCuenta) {
		this.k_idCuenta = k_idCuenta;
	}
	public String getV_valor() {
		return v_valor;
	}
	public void setV_valor(String v_valor) {
		this.v_valor = v_valor;
	}
    public String getF_fecha() {
		return f_fecha;
	}
	public void setF_fecha(String f_fecha) {
		this.f_fecha = f_fecha;
	}
	public String getI_estado() {
		return i_estado;
	}
	public void setI_estado(String i_estado) {
		this.i_estado = i_estado;
	}
	
}
