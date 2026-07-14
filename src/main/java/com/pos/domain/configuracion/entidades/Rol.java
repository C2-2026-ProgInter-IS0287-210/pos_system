import java.util.List;
public class Rol{
    private String nombre;
    private List<Permiso>permisos;

    public Rol(String nombre, List<Permiso>permisos){
        this.nombre=nombre;
        this.permisos=permisos;
    }
    public boolean tienePermiso(Permiso permisos){
        return permisos.contains(permisos);
    }

    public String getNombre(){
        return nombre;
    }


}