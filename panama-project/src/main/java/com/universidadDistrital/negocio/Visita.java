package com.universidadDistrital.negocio;

public class Visita {

	private int serialBuque;
	private String Agente;
	private String ETA;
	private String puertoSalida;
	private String puertoLLegada;
	private float carga;
	
	public int getSerialBuque() {
		return serialBuque;
	}
	public void setSerialBuque(int serialBuque) {
		this.serialBuque = serialBuque;
	}
	public String getAgente() {
		return Agente;
	}
	public void setAgente(String agente) {
		Agente = agente;
	}
	public String getETA() {
		return ETA;
	}
	public void setETA(String eTA) {
		ETA = eTA;
	}
	public String getPuertoSalida() {
		return puertoSalida;
	}
	public void setPuertoSalida(String puertoSalida) {
		this.puertoSalida = puertoSalida;
	}
	public String getPuertoLLegada() {
		return puertoLLegada;
	}
	public void setPuertoLLegada(String puertoLLegada) {
		this.puertoLLegada = puertoLLegada;
	}
	public float getCarga() {
		return carga;
	}
	public void setCarga(float carga) {
		this.carga = carga;
	}
	
	
}
