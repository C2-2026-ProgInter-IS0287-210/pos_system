package main.java.com.pos.domain.inventario.entidades;
import java.time.LocalDateTime;

public class MovimientoInventario {

    private TipoMovimiento tipo;
    private int cantidad;
    private String motivo;
    private LocalDateTime fecha;
    private Stock stock;

    public MovimientoInventario(TipoMovimiento tipo, int cantidad, String motivo, Stock stock) {
        this.tipo = tipo;
        this.cantidad = cantidad;
        this.motivo = motivo;
        this.stock = stock;
        this.fecha = LocalDateTime.now();
    }

    public void registrar() {
        int cantidadAjuste;
        switch (tipo) {
            case ENTRADA:
            case DEVOLUCION:
                cantidadAjuste = cantidad;
                break;
            case SALIDA:
            case TRASLADO:
                cantidadAjuste = -cantidad;
                break;
            case AJUSTE:
                cantidadAjuste = cantidad;
                break;
            default:
                throw new IllegalStateException("Tipo de movimiento no soportado: " + tipo);
        }
        stock.ajustarStock(cantidadAjuste, motivo);
    }

    public TipoMovimiento getTipo() {
        return tipo;
    }

    public void setTipo(TipoMovimiento tipo) {
        this.tipo = tipo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "MovimientoInventario{" +
                "tipo=" + tipo +
                ", cantidad=" + cantidad +
                ", motivo='" + motivo + '\'' +
                ", fecha=" + fecha +
                '}';
    }
}