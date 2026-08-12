package com.pos.domain.inventario.entidades;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;
import com.pos.domain.ventas.valueobjects.Money;

 public class Producto { 

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

    public BigDecimal calcularMargen() {
        BigDecimal precioVal = precio.getValor();
        BigDecimal costoVal = costo.getValor();
        if (costoVal == BigDecimal.ZERO) {
            throw new ArithmeticException("No se puede calcular el margen con costo igual a 0.");
        }
        return precioVal.subtract(costoVal)
        .divide(costoVal, 4, RoundingMode.HALF_UP)
        .multiply(BigDecimal.valueOf(100));
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