package main. java. com. pos. domain. clientes.entidades;
public class Cliente {
   
    private String id;
    private String nombre;
    private String email;
    private String telefono;
    private String direccion;
    private String notas;

    
    private CuentaFidelidad cuentaFidelidad;
    private CuentaCredito cuentaCredito;
    private TarjetaRegalo tarjetaRegalo;

   
    public Cliente(String id, String nombre, String email, String telefono, String direccion, String notas) {
        this.id = id;
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
        this.direccion = direccion;
        this.notas = notas;
    }


    public void actualizarDatos(String nombre, String email, String telefono, String direccion, String notas) {
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
        this.direccion = direccion;
        this.notas = notas;
        System.out.println("Datos del cliente " + this.id + " actualizados con éxito.");
    }


    public String getId() { return id; }
    public String getNombre() { return nombre; }
    
    public CuentaFidelidad getCuentaFidelidad() { return cuentaFidelidad; }
    public void setCuentaFidelidad(CuentaFidelidad cuentaFidelidad) { this.cuentaFidelidad = cuentaFidelidad; }

    public CuentaCredito getCuentaCredito() { return cuentaCredito; }
    public void setCuentaCredito(CuentaCredito cuentaCredito) { this.cuentaCredito = cuentaCredito; }

    public TarjetaRegalo getTarjetaRegalo() { return tarjetaRegalo; }
    public void setTarjetaRegalo(TarjetaRegalo tarjetaRegalo) { this.tarjetaRegalo = tarjetaRegalo; }
}