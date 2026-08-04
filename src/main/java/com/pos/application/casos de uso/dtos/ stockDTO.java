package main.java.com.pos.application.inventario.dtos;

public class StockDTO {

    private String skuProducto;
    private int cantidadActual;
    private int nivelMinimo;
    private int nivelMaximo;
    private String ubicacion;

    public StockDTO(String skuProducto, int cantidadActual, int nivelMinimo, int nivelMaximo, String ubicacion) {
        this.skuProducto = skuProducto;
        this.cantidadActual = cantidadActual;
        this.nivelMinimo = nivelMinimo;
        this.nivelMaximo = nivelMaximo;
        this.ubicacion = ubicacion;
    }

    public String getSkuProducto() {
        return skuProducto;
    }

    public int getCantidadActual() {
        return cantidadActual;
    }

    public int getNivelMinimo() {
        return nivelMinimo;
    }

    public int getNivelMaximo() {
        return nivelMaximo;
    }

    public String getUbicacion() {
        return ubicacion;
    }
}