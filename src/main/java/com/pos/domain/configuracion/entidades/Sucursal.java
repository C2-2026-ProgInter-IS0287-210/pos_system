package main.java.com.pos.domain.configuracion.entidades;

public class Sucursal {
    private String nombre;
    private String direccion;
    private String telefono;
    private String codigo;
    private String horario;

    public Sucursal(String nombre, String direccion, String telefono, String codigo, String horario) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.codigo = codigo;
        this.horario = horario;
    }

    // Getters
    public String getNombre() { return nombre; }
    public String getDireccion() { return direccion; }
    public String getTelefono() { return telefono; }
    public String getCodigo() { return codigo; }
    public String getHorario() { return horario; }
}