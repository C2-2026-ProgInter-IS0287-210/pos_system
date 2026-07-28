package main.java.com.pos.domain.inventario.entidades;
public class VarianteProducto extends Producto {

    private String talla;
    private String color;
    private String skuPadre;

    public VarianteProducto(String sku, String codigoBarras, String nombre, Money precio, Money costo,
                             boolean restringeEdad, boolean ventaAGranel,
                             String talla, String color, String skuPadre) {
        super(sku, codigoBarras, nombre, precio, costo, restringeEdad, ventaAGranel);
        this.talla = talla;
        this.color = color;
        this.skuPadre = skuPadre;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSkuPadre() {
        return skuPadre;
    }

    public void setSkuPadre(String skuPadre) {
        this.skuPadre = skuPadre;
    }

    @Override
    public String toString() {
        return "VarianteProducto{" +
                "sku='" + getSku() + '\'' +
                ", talla='" + talla + '\'' +
                ", color='" + color + '\'' +
                ", skuPadre='" + skuPadre + '\'' +
                '}';
    }
}