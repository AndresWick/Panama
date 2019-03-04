package com.universidadDistrital.Bancoproject.util;

public class ShutDownHook extends Thread{
	public void run()
    {
		System.out.println("close event");
    }
}
