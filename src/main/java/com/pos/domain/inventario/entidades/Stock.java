package main.java.com.pos.domain.inventario.entidades;
class Stock {

    private int cantidadActual;
    private int nivelMinimo;
    private int nivelMaximo;
    private String ubicacion;
    private Producto producto;

    public Stock(int cantidadActual, int nivelMinimo, int nivelMaximo, String ubicacion, Producto producto) {
        this.cantidadActual = cantidadActual;
        this.nivelMinimo = nivelMinimo;
        this.nivelMaximo = nivelMaximo;
        this.ubicacion = ubicacion;
        this.producto = producto;
    }

    public int getCantidadActual() { return cantidadActual; }
    public int getNivelMinimo() { return nivelMinimo; }
    public int getNivelMaximo() { return nivelMaximo; }
    public String getUbicacion() { return ubicacion; }
    public Producto getProducto() { return producto; }

    public boolean verificarPuntoReorden() {
        return cantidadActual <= nivelMinimo;
    }

    public void ajustarStock(int cantidad, String motivo) {
        int nuevaCantidad = cantidadActual + cantidad;
        if (nuevaCantidad < 0) {
            throw new IllegalArgumentException("El stock no puede quedar en negativo.");
        }
        if (nuevaCantidad > nivelMaximo) {
            throw new IllegalArgumentException("El ajuste supera el nivel máximo permitido.");
        }
        if (motivo == null || motivo.isBlank()) {
            throw new IllegalArgumentException("Debe indicar un motivo para el ajuste.");
        }
        this.cantidadActual = nuevaCantidad;
    }
}