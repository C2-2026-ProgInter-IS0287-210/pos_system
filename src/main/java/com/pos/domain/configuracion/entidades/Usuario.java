package main.java.com.pos.domain.configuracion.entidades;

import main.java.com.pos.domain.configuracion.enumerados.Permiso;
public class Usuario{
    private String nombreUsuario;
    private String hashPin ;
    private Rol rol;

    public Usuario(String nombreUsuario,String hashPin, Rol rol){
        this.nombreUsuario=nombreUsuario;
        this.hashPin=hashPin;
        this.rol=rol;

    }

    public boolean autenticar(String hashPin){
        return hashPin;
    }
    boolean prueba;
    public boolean tienePermiso(Permiso permisos){
        return prueba;
    }
     public String getNombreUsuario(){
        return nombreUsuario;
     }
     public Rol getRol(){
        return rol;
     }

}