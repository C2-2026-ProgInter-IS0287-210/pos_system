package main.java.com.pos.domain.inventario.entidades;
import java.util.ArrayList;
import java.util.List;

class Producto {

    private String sku;
    private String codigoBarras;
    private String nombre;
    private Money precio;
    private Money costo;
    private boolean restringeEdad;
    private boolean ventaAGranel;
    private Categoria categoria;
    private List<Lote> lotes = new ArrayList<>();

    public Producto(String sku, String codigoBarras, String nombre,
                     Money precio, Money costo,
                     boolean restringeEdad, boolean ventaAGranel,
                     Categoria categoria) {
        this.sku = sku;
        this.codigoBarras = codigoBarras;
        this.nombre = nombre;
        this.precio = precio;
        this.costo = costo;
        this.restringeEdad = restringeEdad;
        this.ventaAGranel = ventaAGranel;
        this.categoria = categoria;
    }

    public String getSku() { return sku; }
    public String getCodigoBarras() { return codigoBarras; }
    public String getNombre() { return nombre; }
    public Money getPrecio() { return precio; }
    public Money getCosto() { return costo; }
    public boolean isRestringeEdad() { return restringeEdad; }
    public boolean isVentaAGranel() { return ventaAGranel; }
    public Categoria getCategoria() { return categoria; }
    public List<Lote> getLotes() { return lotes; }

    public void agregarLote(Lote lote) {
        lotes.add(lote);
    }

    public double calcularMargen() {
        double precioVal = precio.getMonto();
        double costoVal = costo.getMonto();
        if (costoVal == 0) {
            throw new ArithmeticException("No se puede calcular el margen con costo igual a 0.");
        }
        return ((precioVal - costoVal) / costoVal) * 100;
    }

    public void actualizarPrecio(Money nuevoPrecio) {
        if (nuevoPrecio == null) {
            throw new IllegalArgumentException("El nuevo precio no puede ser nulo.");
        }
        this.precio = nuevoPrecio;
    }

    public void actualizarCosto(Money nuevoCosto) {
        if (nuevoCosto == null) {
            throw new IllegalArgumentException("El nuevo costo no puede ser nulo.");
        }
        this.costo = nuevoCosto;
    }
}