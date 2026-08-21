package com.pos.domain.compras.entidades;
import java.util.concurrent.atomic.DoubleAccumulator;
import com.pos.domain.ventas.valueobjets.*;

public class LineaCompra{
    private int cantidad;
    private Money precioUnitario;
    private Money descuento;
    private Double subtotal;

    public LineaCompra(int cantidad, Money precioUnitario, Money descuento) {
            this.cantidad = cantidad;
            this.precioUnitario = precioUnitario;
            this.descuento = descuento;
        }
    
    public Money calcularSubtotal(){
        Money subtotal = precioUnitario.multiplicar(cantidad);
        subtotal = subtotal.restar(descuento);
        //subtotal = cantidad * precioUnitario - descuento
        return subtotal;
    }
}


