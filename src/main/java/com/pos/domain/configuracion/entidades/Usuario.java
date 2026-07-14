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
    public boolean tienePermiso(Permiso permisos){
        return Rol.tienePermiso(permisos);
    }
     public String getNombre(){
        return nombre;
     }
     public Rol getRol(){
        return rol;
     }

}