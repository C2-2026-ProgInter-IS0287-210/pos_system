package main.java.com.pos.domain.configuracion.entidades;
import java.util.List;
import main.java.com.pos.domain.configuracion.enumerados.Permiso;
public class Rol{
    private String nombre;
    private List<Permiso>permisos;

    public Rol(String nombre, List<Permiso>permisos){
        this.nombre=nombre;
        this.permisos=permisos;
    }
    public void agregarPermiso(Permiso p){
       
        
    }

 public void removerPermiso(Permiso p){

 }


}