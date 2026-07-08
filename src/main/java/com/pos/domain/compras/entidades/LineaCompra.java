public class LineaCompra{
    private int cantidad;
    private Money precioUnitario;
    private Money descuento;

    public Money calcularSubtotal(){
        return precioUnitario;
    }
}