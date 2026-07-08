public class LineaCompra{
    private int cantidad;
    private Money precioUnitario;
    private Money descuento;
    private Money subtotal;

    public Money calcularSubtotal(){
       this.subtotal = cantidad*precioUnitario;
        return precioUnitario;
    }
}