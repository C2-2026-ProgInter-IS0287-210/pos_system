import java.util.List;
import java.util.ArrayList;

public class KitProducto extends Producto {

    private List<Producto> componentes;
    private Money descuentoKit;

    public KitProducto(String sku, String codigoBarras, String nombre, Money precio, Money costo,
                        boolean restringeEdad, boolean ventaAGranel,
                        List<Producto> componentes, Money descuentoKit) {
        super(sku, codigoBarras, nombre, precio, costo, restringeEdad, ventaAGranel);
        this.componentes = componentes;
        this.descuentoKit = descuentoKit;
    }

    public void agregarComponente(Producto producto) {
        componentes.add(producto);
    }

    public void eliminarComponente(Producto producto) {
        componentes.remove(producto);
    }

    public List<Producto> getComponentes() {
        return componentes;
    }

    public void setComponentes(List<Producto> componentes) {
        this.componentes = componentes;
    }

    public Money getDescuentoKit() {
        return descuentoKit;
    }

    public void setDescuentoKit(Money descuentoKit) {
        this.descuentoKit = descuentoKit;
    }

    @Override
    public String toString() {
        return "KitProducto{" +
                "sku='" + getSku() + '\'' +
                ", componentes=" + componentes.size() +
                ", descuentoKit=" + descuentoKit +
                '}';
    }
}