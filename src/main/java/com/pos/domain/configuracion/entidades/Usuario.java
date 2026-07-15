package main.java.com.pos.domain.configuracion.entidades;

import main.java.com.pos.domain.configuracion.enumerados.Permiso;
public class Usuario{
    private String nombre;
    private String pin ;
    private Rol rol;

    public Usuario(String nombre,String pin, Rol rol){
        this.nombre=nombre;
        this.pin=pin;
        this.rol=rol;

    }

    public boolean autenticar(String pinIngresado){
        return this.pin.equals(pinIngresado);
    }
    boolean prueba;
    public boolean tienePermiso(Permiso permisos){
        return prueba;
    }
     public String getNombre(){
        return nombre;
     }
     public Rol getRol(){
        return rol;
     }

}