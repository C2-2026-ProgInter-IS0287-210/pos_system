package main.java.com.pos.application.inventario.dtos;

public class ProductoDTO {

    private String sku;
    private String codigoBarras;
    private String nombre;
    private double precio;
    private double costo;
    private boolean restringeEdad;
    private boolean ventaAGranel;

    public ProductoDTO(String sku, String codigoBarras, String nombre, double precio, double costo,
                        boolean restringeEdad, boolean ventaAGranel) {
        this.sku = sku;
        this.codigoBarras = codigoBarras;
        this.nombre = nombre;
        this.precio = precio;
        this.costo = costo;
        this.restringeEdad = restringeEdad;
        this.ventaAGranel = ventaAGranel;
    }

    public String getSku() {
        return sku;
    }

    public String getCodigoBarras() {
        return codigoBarras;
    }

    public String getNombre() {
        return nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public double getCosto() {
        return costo;
    }

    public boolean isRestringeEdad() {
        return restringeEdad;
    }

    public boolean isVentaAGranel() {
        return ventaAGranel;
    }
}